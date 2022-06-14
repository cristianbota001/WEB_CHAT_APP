from django.http import HttpResponse, HttpResponseForbidden, JsonResponse
from .form import RegistrationForm, LoginForm
from django.middleware.csrf import get_token
from django.db import connection
from django.contrib.auth import authenticate
import os
import base64
import hashlib

def Registration(request):
    context = {}
    context["form"] = RegistrationForm(request.POST or None)
    if request.method == "POST":
        if context["form"].is_valid():
            
            username = context["form"].cleaned_data["username"]
            password = context["form"].cleaned_data["password1"]

            if not MakeQuery("SELECT * FROM profilo WHERE username = '{}'".format(username)):
                user_id = GetNewID("SELECT profilo.user_id from profilo", 50, "user_id")
                ws_auth_id = GetNewID("SELECT profilo.ws_auth_id from profilo", 80, "ws_auth_id")
                MakeQuery("INSERT INTO profilo VALUES ('{}', '{}', '{}', '{}', '{}')".format(username, hashlib.sha256(password.encode()).hexdigest(), "NULL", user_id, ws_auth_id))
                request.session["logged"] = {}
                request.session["logged"]["username"] = username
                request.session["logged"]["user_id"] = user_id
                request.session["logged"]["ws_auth_id"] = ws_auth_id
                return JsonResponse({"ok":"/"})
            else:
                return JsonResponse({"errors":{"username":"Username already exists"}})
        else:
            context["errors"] = context["form"].errors
            return JsonResponse({"errors":context["errors"]})
    elif request.method == "GET":
        get_token(request)
        return HttpResponse("Ok")
    else:
        return HttpResponseForbidden(request)

def GetNewID(query, size, value):
    ris = MakeQuery(query)
    id_list = [x[value] for x in ris]
    while True:
        new_id = base64.urlsafe_b64encode(os.urandom(size)).decode()
        if new_id not in id_list:
            return new_id

def dictfetchall(cursor):
    columns = [col[0] for col in cursor.description]
    return [
        dict(zip(columns, row))
        for row in cursor.fetchall()
    ]

def MakeQuery(query):
    cursor = connection.cursor()
    cursor.execute(query)
    return dictfetchall(cursor) if cursor.description != None else None

def CheckSession(request):
    if request.method == "GET":
        if "logged" in request.session:
            return JsonResponse({"username":request.session["logged"]["username"], "user_id":request.session["logged"]["user_id"], "ws_auth_id":request.session["logged"]["ws_auth_id"]})
        else:
            return JsonResponse({"no_session":"/"})
    else:
        return HttpResponseForbidden(request)

def AuthCheck(request):
    if request.method == "GET":
        get_token(request)
        return HttpResponse("OK")
    elif request.method == "POST":
        ws_auth_id = request.POST["ws_auth_id"]
        user_id = request.POST["user_id"]
        wb_socket = request.POST["WB_SOCKET"]
        if authenticate(username = "WS_SERVER", password = wb_socket):
            if MakeQuery("SELECT * FROM profilo WHERE ws_auth_id = '{}' AND user_id = '{}'".format(ws_auth_id, user_id)):
                return JsonResponse({"authenticated":"/"})
            else: 
                return JsonResponse({"not_authenticated":"/"})
        else:
            return HttpResponseForbidden(request)
    else:
        return HttpResponseForbidden(request)

def Login(request):
    context = {}
    context["form"] = LoginForm(request.POST or None)
    if request.method == "POST":
        if context["form"].is_valid():
            username = context["form"].cleaned_data["username"]
            password1 = context["form"].cleaned_data["password1"]
            user = MakeQuery("SELECT * FROM profilo WHERE username = '{}' AND password = '{}'".format(username, hashlib.sha256(password1.encode()).hexdigest()))
            if user:
                request.session["logged"] = {}
                request.session["logged"]["username"] = username
                request.session["logged"]["user_id"] = user[0]["user_id"]
                request.session["logged"]["ws_auth_id"] = user[0]["ws_auth_id"]
                return JsonResponse({"ok":"/"})
            else:
                return JsonResponse({"errors":{"username":"Wrong username or password"}})
        else:
            context["errors"] = context["form"].errors
            return JsonResponse({"errors":context["errors"]})
    elif request.method == "GET":
        get_token(request)
        return HttpResponse("Ok")
    else:
        return HttpResponseForbidden(request)

def AddressBookRequest(request):
    if request.method == "GET":
        get_token(request)
        return HttpResponse("OK")
    elif request.method == "POST":
        user_id = request.POST["user_id"]
        wb_socket = request.POST["WB_SOCKET"]
        if authenticate(username = "WS_SERVER", password = wb_socket):
            user = MakeQuery("SELECT * FROM profilo WHERE user_id = '{}'".format(user_id))
            if user:
                ser = MakeQuery("SELECT rubrica_id, profilo.username FROM profilo NATURAL JOIN rubrica_utenti WHERE rubrica_utenti.user_id NOT IN (SELECT user_id FROM profilo NATURAL JOIN rubrica_utenti WHERE rubrica_utenti.user_id = '{}' )".format(user_id))
                return JsonResponse({"authenticated":ser})
            else:
                return JsonResponse({"not_authenticated":"/"})
        else:
            return HttpResponseForbidden(request)
    else:
        return HttpResponseForbidden(request)

def KeyUserSearch(request):
    if request.method == "GET" and "logged" in request.session:
        value = request.GET["value"]
        if value != "":
            users = []
            user = MakeQuery("SELECT profilo.username FROM profilo WHERE profilo.username LIKE '{}' AND profilo.username != '{}' ".format(value + "%", request.session["logged"]["username"]))
            if user:
                for us in user:
                    if not CheckIfIsAlreadyFriend(request.session["logged"]["user_id"], us["username"]):
                        users.append(us)
                return JsonResponse({"user_exist":users})
        return JsonResponse({"user_no_exist":"/"})
    else:
        return HttpResponseForbidden(request)

def CheckIfUserExists(request):
    if request.method == "GET":
        get_token(request)
        return HttpResponse("OK")
    elif request.method == "POST":
        wb_socket = request.POST["WB_SOCKET"]
        if authenticate(username = "WS_SERVER", password = wb_socket):
            username = request.POST["username"]
            if MakeQuery("SELECT * FROM profilo WHERE profilo.username = '{}'".format(username)):
                return JsonResponse("exists", safe = False)
            else:
                return JsonResponse("not_exists", safe = False)
    return HttpResponseForbidden(request)

def CheckIfIsAlreadyFriend(user_id, username):
    return MakeQuery("SELECT * FROM profilo NATURAL JOIN rubrica_utenti WHERE profilo.username = '{}' AND rubrica_utenti.rubrica_id = ANY (SELECT rubrica_utenti.rubrica_id FROM profilo NATURAL JOIN rubrica_utenti WHERE profilo.user_id = '{}')".format(username, user_id))

def GetUsername(user_id):
    return MakeQuery("SELECT profilo.username FROM profilo where profilo.user_id = '{}'".format(user_id))

def GetUserID(username):
    return MakeQuery("SELECT profilo.user_id FROM profilo where profilo.username = '{}'".format(username))

def AddUsersInRubrica(user_id, username):
    MakeQuery("INSERT INTO rubrica VALUES ()")
    last_id = MakeQuery("SELECT LAST_INSERT_ID() as rubrica_id")
    MakeQuery("INSERT INTO rubrica_utenti VALUES ('{}', '{}')".format(GetUserID(username)[0]["user_id"], last_id[0]["rubrica_id"]))
    MakeQuery("INSERT INTO rubrica_utenti VALUES ('{}', '{}')".format(user_id, last_id[0]["rubrica_id"]))

def AddNewUser(request):
    if request.method == "GET":
        get_token(request)
        return HttpResponse("OK")
    elif request.method == "POST":
        wb_socket = request.POST["WB_SOCKET"]
        if authenticate(username = "WS_SERVER", password = wb_socket):
            username = request.POST["username"]
            user_id = request.POST["user_id"]
            if not CheckIfIsAlreadyFriend(user_id, username):
                AddUsersInRubrica(user_id, username)
                return JsonResponse("ok", safe = False)
            else:
                return JsonResponse("no_ok", safe = False) 
    return HttpResponseForbidden(request)

def GetAllContacts(request):
    if request.method == "GET" and "logged" in request.session:
        con = {"rubrica": MakeQuery("SELECT profilo.username FROM profilo NATURAL JOIN rubrica_utenti WHERE profilo.user_id != '{}' AND rubrica_utenti.rubrica_id IN (SELECT rubrica_utenti.rubrica_id FROM profilo NATURAL JOIN rubrica_utenti WHERE profilo.user_id = '{}')".format(request.session["logged"]["user_id"],request.session["logged"]["user_id"]))}
        return JsonResponse(con, safe = False)
    else:
        return HttpResponseForbidden(request)

def GetAllContactsWS(request):
    if request.method == "GET":
        get_token(request)
        return HttpResponse("OK")
    elif request.method == "POST":
        wb_socket = request.POST["WB_SOCKET"]
        username = request.POST["username"]
        if authenticate(username = "WS_SERVER", password = wb_socket):
            con = {"rubrica": MakeQuery("SELECT profilo.username FROM profilo NATURAL JOIN rubrica_utenti WHERE profilo.user_id != '{}' AND rubrica_utenti.rubrica_id IN (SELECT rubrica_utenti.rubrica_id FROM profilo NATURAL JOIN rubrica_utenti WHERE profilo.user_id = '{}')".format(GetUserID(username)[0]["user_id"], GetUserID(username)[0]["user_id"]))}
            return JsonResponse(con ,safe = False)
    return HttpResponseForbidden(request)

def GetRubricaID(username1, username2):
    ris = MakeQuery("SELECT rubrica_utenti.rubrica_id FROM rubrica_utenti NATURAL JOIN profilo WHERE profilo.username = '{}' AND rubrica_utenti.rubrica_id = ANY (SELECT rubrica_utenti.rubrica_id FROM rubrica_utenti NATURAL JOIN profilo WHERE profilo.username = '{}')".format(username1, username2))
    if ris:
        return ris[0]["rubrica_id"]
    else:
        return False

def SaveMessage(request):
    if request.method == "GET":
        get_token(request)
        return HttpResponse("OK")
    elif request.method == "POST":
        wb_socket = request.POST["WB_SOCKET"]
        username = request.POST["username"]
        username_friend = request.POST["username_friend"]
        message = request.POST["message"]
        mess_date = request.POST["mess_date"]
        state = request.POST["state"]
        if authenticate(username = "WS_SERVER", password = wb_socket):
            rubrica_id = GetRubricaID(username, username_friend)
            MakeQuery("INSERT INTO rubrica_messaggi(rubrica_id, messaggio, data_invio, mittente, stato) VALUES('{}', '{}', '{}', '{}', '{}')".format(rubrica_id, message, mess_date, username, state))
            return JsonResponse({"ok":"/"}, safe = False)
    return HttpResponseForbidden(request)

def GetAllRubricaMessages(request):
    if request.method == "GET" and "logged" in request.session:
        username_friend = request.GET["username_friend"]
        rubrica_id = GetRubricaID(request.session["logged"]["username"], username_friend)
        if rubrica_id:
            messages = MakeQuery("SELECT rubrica_messaggi.messaggio, rubrica_messaggi.data_invio, rubrica_messaggi.mittente FROM rubrica_messaggi WHERE rubrica_id = '{}'".format(rubrica_id))
            return JsonResponse({"messages":messages}, safe = False)
        else:
            return HttpResponseForbidden(request)
    else:
        return HttpResponseForbidden(request)

def PostInfoMess(request):
    if request.method == "GET":
        get_token(request)
        return HttpResponse("OK")
    elif request.method == "POST":
        wb_socket = request.POST["WB_SOCKET"]
        user_id = GetUserID(request.POST["dest"])[0]["user_id"]
        mitt = request.POST["mitt"]
        if authenticate(username = "WS_SERVER", password = wb_socket):
            ris = MakeQuery("SELECT info_mess.user_id FROM info_mess WHERE info_mess.user_id = '{}' AND info_mess.mitt = '{}' ".format(user_id, mitt))
            if ris:
                MakeQuery("UPDATE info_mess SET info_mess.num = info_mess.num + 1 WHERE info_mess.user_id = '{}' AND info_mess.mitt = '{}' ".format(user_id, mitt))
            else:
                MakeQuery("INSERT INTO info_mess VALUES ('{}', '{}', 1)".format(user_id, mitt))
            return JsonResponse({"ok":"/"}, safe = False)
        else:
            return HttpResponseForbidden(request)
    else:
        return HttpResponseForbidden(request)

def UpdateInfoMess(request):
    if request.method == "GET":
        get_token(request)
        return HttpResponse("OK")
    elif request.method == "POST":
        wb_socket = request.POST["WB_SOCKET"]
        user_id = request.POST["user_id"]
        mitt = request.POST["mitt"]
        if authenticate(username = "WS_SERVER", password = wb_socket):
            ris = MakeQuery("SELECT info_mess.user_id FROM info_mess WHERE info_mess.user_id = '{}' AND info_mess.mitt = '{}' ".format(user_id, mitt))
            if ris:
                MakeQuery("UPDATE info_mess SET info_mess.num = info_mess.num - 1 WHERE info_mess.user_id = '{}' AND info_mess.mitt = '{}' ".format(user_id, mitt))
                ris2 = MakeQuery("SELECT IF(info_mess.num <= 0, 'true', 'false') as ris FROM info_mess WHERE info_mess.user_id = '' AND info_mess.mitt = '{}' ".format(user_id, mitt))
                if ris2[0]["ris"] == "true":
                    MakeQuery("DELETE FROM info_mess WHERE info_mess.user_id = '{}' AND info_mess.mitt = '{}' ".format(user_id, mitt))
            return JsonResponse({"ok":"/"}, safe = False) #da rivedere
        else:
            return HttpResponseForbidden(request)
    else:
        return HttpResponseForbidden(request)
                
                    