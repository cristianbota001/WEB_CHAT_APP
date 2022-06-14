import React, { useEffect, useState, useRef } from "react";
import "./CSS/MainPage.css";
import UserDiv from "./UserDiv";
import avatar from "./Media/account.png"
import search from "./Media/search.png"
import ChatArea from "./ChatArea";
import SlideOptionWindow from "../../../Components/MainPage/BrowserView/SlideOptionWindow";
import { useDispatch, useSelector } from "react-redux";
import { useNavigate } from "react-router-dom";

const FirstTitle = () => {
    return (
        <>
            <div className="title_main_chat_cont">
                <div className="title_main_chat_image"/>  
            </div>
            <div className="title_main_chat">
               <p>START</p>
               <p>CHATTING</p>
               <p>NOW!</p>
            </div>
        </>
    )
}

const InputClick = () => {
    if (document.activeElement.tagName == "INPUT" && document.activeElement.className == "search_input_bar_input"){
        document.querySelector(".scroll_area").style.display = "none"
        document.querySelector(".scroll_area_users_search").style.display = "flex"
        document.querySelector(".burger_menu").style.display = "none"
        document.querySelector(".search_input_bar").style.width = "100%";
        document.querySelector(".search_input_bar").style.height = "100%";
        document.querySelector(".search_input_bar").style.borderRadius = "0%";
        document.querySelector(".search_input_bar").style.padding = "0%";
    }else{
        document.querySelector(".scroll_area").style.display = "flex"
        document.querySelector(".scroll_area_users_search").style.display = "none"
        document.querySelector(".burger_menu").style.display = "flex"
        document.querySelector(".search_input_bar").style.width = "80%";
        document.querySelector(".search_input_bar").style.height = "70%";
        document.querySelector(".search_input_bar").style.borderRadius = "10px";
    }
    
}

const SearchResult = (props) => {

    var ref1 = useRef()

    const SendFriendRequest = () => {
        props.session.websocket.send(JSON.stringify({"friend_request" : props.text_name}))
        props.setSearches([])
    }

    useEffect(() => {
        ref1.current.addEventListener("click", SendFriendRequest)
        /* return (() => {
            ref1.current.removeEventListener("click", SendFriendRequest)
        }) */
    })

    return(
        <div className="search_result_div" ref={ref1}>
            {props.text_name}
        </div>
    )
}

const MainPage = (props) => {
  
    const navigate = useNavigate()
    const dispatch = useDispatch()
    const session = useSelector(state => state.session)
    const current = useSelector(state => state.current)
    const servers_ip = useSelector(state => state.servers_ip)
    const contacts = useSelector(state => state.contacts)

    const [page, setPage] = useState(<FirstTitle/>)
    const [search_user, setSearches] = useState([])
    //const [contacts, setContacts] = useState([])

    const ref1 = useRef()
    const ref2 = useRef() 
    const currentRef = useRef()
    const contactsRef = useRef()
    const chatmessagesRef = useRef([])

    var websocket; 

    
    //const messages = useSelector(state => state.messages)
    //const [pp, setPP] = useState([])

    useEffect(() => {
        
        ref1.current.addEventListener("click", () => {
            ref2.current.classList.toggle("slide_option_window_toggle") // per il menu a sinistra
        })

        document.querySelector("body").addEventListener("click", InputClick) // per l'effetto della search bar

        FirstOptions()

        return (() => {
            document.querySelector("body").removeEventListener("click", InputClick)
        })

    }, [])

    useEffect(() => {
        currentRef.current = current
    }, [current])
    
    const CheckSession = async () => {
        
        var response = await fetch(servers_ip.httpserver + "check_session", {method : "GET", credentials : "include"})
        var json_response = await response.json()
        
        if ("no_session" in json_response){
            navigate("/")
        } else{
            Authentication(json_response.username, json_response.user_id, json_response.ws_auth_id)
            GetAllContacts()
        }
    }

    const GetAllContacts = async () => {
        var response = await fetch(servers_ip.httpserver + "get_all_contacts", {method : "GET", credentials : "include"})
        var json_response = await response.json()
        var list = []
        json_response.rubrica.forEach(ele => {
            list.push(ele.username)
        })
        //anche per i gruppi
        //setContacts(prev => [...prev, ...list])
        contactsRef.current = [...list]
        dispatch({type : "setContacts", value : [...list]})
        //setContacts([...list])
    }
    
    const FirstOptions = () => {
        if (session.set == false){
            CheckSession()
        }else{
            IsAuthenticated()
        }
    }
    
    function Authentication (username, user_id, ws_auth_id){
        websocket = new WebSocket(servers_ip.websocketserver)
        websocket.onopen = () => {
            websocket.onmessage = MessagesEvent
            websocket.send(JSON.stringify({"first_mess": {"username":username, "user_id":user_id, "ws_auth_id":ws_auth_id}}))
            dispatch({type : "setSession", value : {"username":username, "user_id":user_id, "ws_auth_id":ws_auth_id, "set":true, "websocket":websocket}})
        }
    }

    const IsAuthenticated = () => {
        document.querySelector(".main_page").style.filter = "none"
        document.querySelector(".lds-ring").style.display = "none"
    }

    const addNew = (data) => {
        //setContacts(prev => [...prev, data["add_new_contact"]])
        contactsRef.current = [...contactsRef.current, data["add_new_contact"]]
        dispatch({type : "setContacts", value : [...contactsRef.current]})
        //setContacts([...contactsRef.current])
    }   

    const MessagesEvent = (event) => {
        
        var data = JSON.parse(event.data)
        console.log("data => ", data)
        
        if ("authenticated" in data){
            IsAuthenticated()
        }

        else if ("exit_now" in data){
            navigate("/")
        }

        else if ("add_new_contact" in data){
            addNew(data)
        }

        else if ("user_status" in data){
            dispatch({type : "setStatus", value : data.user_status})
        }

        else if ("user_exited" in data){
            CheckTheExitedUser(data.user_exited)
        }

        else if ("user_entered" in data){
            CheckTheEnteredUser(data.user_entered)
        }

        else if ("incoming_messages" in data){
            chatmessagesRef.current = [...chatmessagesRef.current, data.incoming_messages]
            dispatch({type:"setChatMessages", value:[...chatmessagesRef.current]})
        }

    }

    const SendSearchUserKeyRequest = async (text_name) => {
        var response = await fetch(servers_ip.httpserver + "key_search?value="+text_name, {method : "GET", credentials:"include"})
        var json_response = await response.json()
        if ("user_exist" in json_response){
            var list = []
            json_response.user_exist.forEach(ele => {
                list.push(ele.username)
            })
            setSearches(list)
        }else{
            setSearches([])
        }
    }

    const CheckTheExitedUser = (username) => {
        if (username == currentRef.current){
            dispatch({type:"setStatus", value:"offline"})
        }
    }

    const CheckTheEnteredUser = (username) => {
        if (username == currentRef.current){
            dispatch({type:"setStatus", value:"online"})
        }
    }

    const NewMess = (json_data) => {

    }

    return (
        <>
        <div className="main_page">
            <div className="scroll_div_users">
                <div className="main_user_div">
                    <div className="main_user_nav">
                        <div className="burger_menu" ref={ref1}>
                            <div></div>
                            <div></div>
                            <div></div>
                        </div>
                        <div className="search_input_bar">
                            <img src={search} alt="search" className="search_img" />
                            <input spellCheck="false" type="text" className="search_input_bar_input" onChange={(e) => {SendSearchUserKeyRequest(e.target.value)}} />
                        </div>
                    </div>
                    {/* <img src={avatar} alt="avatar" className="main_avatar_user_img"/> */}
                </div>
                <div className="scroll_area">
                    {/* <UserDiv group_id = "0001" name = "Cristian Bota" setPage = {setPage} /> */}
                    {
                        contacts.map((value, key) => {
                            return <UserDiv key = {key} name = {value} setPage = {setPage} chatmessagesRef = {chatmessagesRef} />
                        })
                    }
                </div>
                <div className="scroll_area_users_search">
                    {
                        search_user.map((value, key) => {
                            return <SearchResult text_name = {value} key = {key} session = {session} setSearches = {setSearches} />
                        })
                    }
                </div>
                <div className="menu_user_nav" ref={ref2}>
                    <SlideOptionWindow menu_ref = {ref2} menu_options_class_type = "option_type_1"
                        categories = {[
                            
                            ["Impostazioni", "categ"],
                            ["Nuovo gruppo", "categ"],
                            ["Messaggi importanti", "categ"],
                            ["Impostazioni", "categ"],
                            ["Link", "link"],
                        
                        ]}
                        options = {[
                            
                            [["Account", "/"],["Chat","/"],["Notifiche","/"],["Aiuto","/"],["Invita un amico","/"]],
                            [["Account", "/"],["Chat","/"],["Notifiche","/"],["Aiuto","/"],["Invita un amico","/"]],
                            [["Account", "/"],["Chat","/"],["Notifiche","/"],["Aiuto","/"],["Invita un amico","/"]],
                            [["Account", "/"],["Chat","/"],["Notifiche","/"],["Aiuto","/"],["Invita un amico","/"]],
                        
                        ]}
                    />
                </div>
            </div>

            <div className="chat_main_div" style={{position:"relative"}}>
                {page}
            </div>
        </div>
        <div className="lds-ring">
            <div></div>
            <div></div>
            <div></div>
            <div></div>
        </div>
        </>
    )
}

export default MainPage;