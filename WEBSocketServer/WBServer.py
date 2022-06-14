from os import remove
from tkinter import ON
import websockets
import asyncio
import random
import json
import requests

SERVER_IP = "192.168.1.66"
SERVER_PORT = "1312"
SERVER_URL = "http://192.168.1.66:8000"
ALL_GROUPS = {}
SERVER_ID_AUTH = "gpYE8uOlESiNtObgTBXolJ-9I90_FGKlYqtrSvgnL7qf_8lO-qG5rDmpV5G88QHvwrnZeO7otWzxoS01qGa3fQvukSF-LWVFWC_VG6jXHvMHPm8w1Pvaupo213DrBCypx5zfJPdBvHI71J7zqOdQBIEw7tnBRp8lGnKpCIJwMEBZGJtEqom1-WjxYlQ6k1lg0WZ1kEjW"
ON_USERS = {}

def SendAPIRequest():
    pass

async def CheckJSON_Data(args, josn_data):
    contr = True
    for x in args:
        if x not in josn_data:
            contr = False
    return contr

async def FirstMessage(username, user_id, ws_auth_id, websocket):
    response = await SendPOSTRequest({"ws_auth_id":ws_auth_id, "user_id":user_id, "WB_SOCKET":SERVER_ID_AUTH}, "/auth_check")
    if await CheckJSON_Data(["authenticated"], response):
        if username not in ON_USERS:
            ON_USERS[username] = websocket
            #RUBRICA = await SendRequestRubricaAPI(user_id)
            RUBRICA = {}
            await websocket.send(json.dumps({"authenticated":"/"}))
            await SendBroadcastMessage({"user_entered":username}, username)
            return [True, RUBRICA]
    await websocket.send(json.dumps({"exit_now":"/"}))
    return [False, False]

async def SendRequestRubricaAPI(user_id):
    response = await SendPOSTRequest({"user_id":user_id, "WB_SOCKET":SERVER_ID_AUTH}, "/address_book")
    if await CheckJSON_Data(["authenticated"], response):
        return response["authenticated"]
    else:
        pass

async def SendPOSTRequest(json_data, page):
    client = requests.session()
    client.get(SERVER_URL + page)
    csrftoken = client.cookies["csrftoken"]
    json_data["csrfmiddlewaretoken"] = csrftoken
    response = client.post(SERVER_URL + page, data = json_data)
    return json.loads(response.text)

async def NewFriendHandler(username, user_id, websocket, myname):
    response = await SendPOSTRequest({"username":username, "WB_SOCKET":SERVER_ID_AUTH}, "/check_user")
    if response == "exists":
        response = await SendPOSTRequest({"username":username, "user_id":user_id, "WB_SOCKET":SERVER_ID_AUTH}, "/add_user")
        if response == "ok":
            await AddUserToNewUser(username, myname)
            await websocket.send(json.dumps({"add_new_contact":username}))
    else:
        #messaggio di erroe da mandare al client 
        pass

async def AddUserToNewUser(username, myname):
    if username in ON_USERS:
        await ON_USERS[username].send(json.dumps({"add_new_contact":myname}))

async def CheckUserStatus(username, myname):
    if username in ON_USERS:
        await ON_USERS[myname].send(json.dumps({"user_status":"online"}))
    else:
        await ON_USERS[myname].send(json.dumps({"user_status":"offline"}))

async def SendBroadcastMessage(json_message, username):
    response = await SendPOSTRequest({"username":username, "WB_SOCKET":SERVER_ID_AUTH}, "/get_all_contacts_ws")
    for us in response["rubrica"]:
        if us["username"] in ON_USERS:
            await ON_USERS[us["username"]].send(json.dumps(json_message))

async def SendMessHandler(username, json_mess):
    #ci deve essere il controllo per vedere se è amico
    dest = json_mess["dest"]
    mess = json_mess["mess"].replace("'", "\\'")

    if dest in ON_USERS:
        await ON_USERS[dest].send(json.dumps({"incoming_messages":{"text_date":json_mess["date"], "text_mess":json_mess["mess"], "text_name":username}}))
    
    await SendPOSTRequest({"username":username, "username_friend":dest, "message":mess, "mess_date":json_mess["date"], "state":0, "WB_SOCKET":SERVER_ID_AUTH}, "/save_message")
    await SendPOSTRequest({"dest":dest, "mitt":username, "WB_SOCKET":SERVER_ID_AUTH}, "/add_info_mess")

async def Exit(username):
    await SendBroadcastMessage({"user_exited":username}, username)
    del ON_USERS[username]


async def Engine(websocket, path):

    CURRENT_GROUP = None
    USER_ID = None
    USER_IS_AUTH = False
    RUBRICA = {}
    USERNAME = None
	
    try:
        async for message in websocket:
            data = json.loads(message)
            print("data la data -> ", data)
            if await CheckJSON_Data(["first_mess"], data):
                if await CheckJSON_Data(["username", "user_id", "ws_auth_id"], data["first_mess"]):
                    #forse è da togliere RUBRICA e ALL_GROUPS, quindi si fanno solo query
                    USER_IS_AUTH, RUBRICA = await FirstMessage(data["first_mess"]["username"], data["first_mess"]["user_id"], data["first_mess"]["ws_auth_id"], websocket)
                    if not USER_IS_AUTH: raise Exception(websocket, "NotAuthenticated")
                    else: 
                        USERNAME = data["first_mess"]["username"]
                        USER_ID = data["first_mess"]["user_id"]
            elif USER_IS_AUTH:
                if await CheckJSON_Data(["friend_request"], data):
                    await NewFriendHandler(data["friend_request"], USER_ID, websocket, USERNAME)
                elif await CheckJSON_Data(["check_friend_status"], data):
                    await CheckUserStatus(data["check_friend_status"], USERNAME)
                elif await CheckJSON_Data(["send_mess"], data):
                    await SendMessHandler(USERNAME, data["send_mess"])
            else:
                raise Exception(websocket, "NotAuthenticated")
    except Exception as e:
        """ if e.args[1] == "NotAuthenticated":
            await websocket.send('{"not_authenticated":"/"}') """
        print("exception =>", e)
    finally:
        if USER_IS_AUTH:
            await Exit(USERNAME)
        
        print("ON USERS => ", ON_USERS)
        


async def main():
    async with websockets.serve(Engine, SERVER_IP, SERVER_PORT):
        await asyncio.Future()  

if __name__ == "__main__":
    #prima c'è la richiesta di tutti i gruppi
    asyncio.run(main())