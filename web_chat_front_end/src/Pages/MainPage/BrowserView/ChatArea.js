import React, { useRef, useEffect, useState, useCallback } from "react";
import { useSelector, useDispatch } from "react-redux";
import "./CSS/ChatArea.css"
import avatar from "./Media/account.png"
import SlideOptionWindow from "../../../Components/MainPage/BrowserView/SlideOptionWindow";
import CloudMessage from "./CloudMessage";

const ChatArea = (props) =>{

    const dispatch = useDispatch()
    const current = useSelector(state => state.current)
    const session = useSelector(state => state.session)
    const status = useSelector(state => state.status)
    const chatmessages = useSelector(state => state.chatmessages)
    const servers_ip = useSelector(state => state.servers_ip)

    const [scrollsee, setScrollSee] = useState(true)
    const [chatmessageslist, setChatMessages] = useState([])

    const ref1 = useRef()
    const ref2 = useRef()
    const ref3 = useRef()
    const ref4 = useRef()

    useEffect(() => {
        ref1.current.addEventListener("click", () => {
            ref2.current.classList.toggle("slide_option_window_toggle")
        })
        ref4.current.addEventListener("click", () => {
            ScrollSee()
        })
    }, [])

    useEffect(() => {
        if (session.set == true){
            session.websocket.send(JSON.stringify({"check_friend_status":current}))
            setScrollSee(true)
            MessagesRequest()
        }
    }, [current])

    useEffect(() => {
        if (session.set == true){
            ref3.current.innerHTML = status
        }
    }, [status])

    useEffect(() => {
        if (chatmessages.length > 0){
            let chat_mess =  chatmessages[0]
            if (chat_mess.text_name == current){
                setChatMessages([...chatmessageslist, {"text_date":chat_mess.text_date, "text_message":chat_mess.text_mess, "message_type":"message_cloud_div_main_type_1", "text_name" : chat_mess.text_name}]);
            }else{
                //qua mettere che sono arrivati altri messaggi da altri utenti
            }
            let arr = [...props.chatmessagesRef.current]
            arr = arr.slice(1)
            props.chatmessagesRef.current = [...arr]
            dispatch({type:"setChatMessages", value:[...arr]})
        }
    }, [chatmessages])

    useEffect(() => {
        ScrollSee()
        document.querySelector(".chat_area").addEventListener("scroll", ScrollMessFunc)
        return(() => {
            document.querySelector(".chat_area").removeEventListener("scroll", ScrollMessFunc)
        })
    }, [chatmessageslist])

    const MessagesRequest = async () => {
        var response = await fetch(servers_ip.httpserver + "get_rubrica_messages?username_friend="+current, {method : "GET", credentials : "include"})
        var json_response = await response.json()
        let lista_mess = []
        json_response.messages.forEach(ele => {
            let mitt = ele.mittente != session.username ? ele.mittente : "Tu"
            let mess_type = ele.mittente != session.username ? "message_cloud_div_main_type_1" : "message_cloud_div_main_type_2"
            lista_mess.push({"text_date":ele.data_invio, "text_message":ele.messaggio, "message_type":mess_type, "text_name" : mitt})
        })
        setChatMessages(lista_mess)
    }

    const SendMess = (e) => {
        if (e.key == "Enter"){
            var mess = e.target.value;
            e.target.value = "";
            if (mess.replace(/\s/g,'') != ""){
                var text_date = new Date().toLocaleString()
                session.websocket.send(JSON.stringify({"send_mess" : {"dest":current, "mess":mess, "date":text_date}}));
                setChatMessages([...chatmessageslist, {"text_date":text_date, "text_message":mess, "message_type":"message_cloud_div_main_type_2", "text_name" : "Tu"}]);
            }
        }
    }

    const ScrollSee = () => {
        let last_cloud_mess = document.querySelector(".chat_area").lastChild
        if (last_cloud_mess != null){
            if (scrollsee == true){
                last_cloud_mess.scrollIntoView()
            }else{
                ref4.current.style.display = "flex";
            }
        }
    }

    const ScrollMessFunc = () => {
        if (document.querySelector(".chat_area").lastChild){
            let varr = (document.querySelector(".chat_area").scrollHeight - document.querySelector(".chat_area").offsetHeight) - (document.querySelector(".chat_area").lastChild.offsetHeight) 
            if (varr > 0){
                if (document.querySelector(".chat_area").scrollTop >= varr){
                    setScrollSee(true)
                    ref4.current.style.display = "none"
                }else{
                    setScrollSee(false)
                }
            }else{
                setScrollSee(true)
                ref4.current.style.display = "none"
            }
        }
        
    }

    return(
        <>
            <div className="user_info_div">
                <div className="user_info_div_info">
                    <img src={avatar} alt="avatar" className="avatar_user_img"/>
                    <p className="user_name">{props.name}</p>
                    <p className="user_status" ref={ref3}></p>
                </div>
                <div className="burger_menu_user_info" ref={ref1}>
                    <div></div>
                    <div></div>
                    <div></div>
                </div>
            </div>
            <div className="chat_area_cont">
                <div className="new_messages_div" ref={ref4}>
                    <p>Nuovi messaggi</p>
                </div>
                <div className="chat_area_dec">
                    <div className="chat_area">
                        {
                            chatmessageslist.map((value, key) => {
                                return <CloudMessage key = {key} text_message = {value.text_message} text_date = {value.text_date} message_type = {value.message_type} text_name = {value.text_name}/>
                            })
                        }
                        {/* <CloudMessage text_message = "ciao mondo come va tuto bene?" message_type = "message_cloud_div_main_type_2" text_date = "17:48:34 01/04/48" text_name = "Cristian_Bota3243" /> */}                                
                    </div>  
                </div>
            </div>
            <div className="text_input_chat_div">
                <input spellCheck="false" type="text" name="text_input_chat" className="text_input_chat" onKeyDown={SendMess}/>
            </div>
            <div className="chat_area_menu_div" ref={ref2}>
            <SlideOptionWindow menu_ref = {ref2} menu_options_class_type = "option_type_2"
                        categories = {[
                            
                            ["Impostazioni", "categ"],
                            ["Nuovo gruppo", "categ"],
                            ["Messaggi importanti", "categ"],
                        
                        ]}
                        options = {[
                            
                            [["Account", "/"],["Chat","/"],["Notifiche","/"],["Aiuto","/"],["Invita un amico","/"]],
                            [["Account", "/"],["Chat","/"],["Notifiche","/"],["Aiuto","/"],["Invita un amico","/"]],
                            [["Account", "/"],["Chat","/"],["Notifiche","/"],["Aiuto","/"],["Invita un amico","/"]],
                        
                        ]}
            />
            </div>
        </>
    )  
}

export default ChatArea;