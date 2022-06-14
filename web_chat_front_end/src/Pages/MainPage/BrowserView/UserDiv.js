import React, { useEffect } from "react";
import { useDispatch, useSelector } from "react-redux";
import "./CSS/UserDiv.css";
import avatar from "./Media/account.png"
import settings from "./Media/settings.png"
import { useRef } from "react";
import ChatArea from "./ChatArea";

const UserDiv = (props) => {

    var ref1 = useRef() 
    var ref2 = useRef() 
    var dispatch = useDispatch()

    const UserDivEnterEvent = () => {
        ref2.current.classList.toggle("user_div_button_arrow_sett_toggle")
        ref2.current.classList.add("setting_fade_in")
        ref2.current.classList.remove("setting_fade_out")
    }

    const UserDivLeaveEvent = () => {
        ref2.current.classList.toggle("user_div_button_arrow_sett_toggle")
        ref2.current.classList.add("setting_fade_out")
        ref2.current.classList.remove("setting_fade_in")
    }

    const UserDivClickEvent = () => {
        dispatch({type:"setCurrent", value:props.name})
        props.setPage(<ChatArea name ={props.name} chatmessagesRef = {props.chatmessagesRef} />)
    }

    useEffect(() => {

        ref1.current.addEventListener("mouseenter", UserDivEnterEvent)
        ref1.current.addEventListener("mouseleave", UserDivLeaveEvent)
        ref1.current.addEventListener("click", UserDivClickEvent)

    }, [])
    
    return (
        <>
            <div className="user_div_button" ref={ref1}>
                <div className="avatar_user_div">
                    <img src={avatar} alt="avatar" className="avatar_user_img"/>
                </div>
                <div className="user_div_info">
                    <p>{props.name}</p>
                </div>  
                <div className="user_div_button_arrow" ref={ref2}>
                    <img src={settings} alt="settings" className="user_div_button_arrow_sett" />
                </div>
            </div>
        </>
    )
}

export default UserDiv;