import React, { createRef, useEffect, useState } from "react";
import "./CSS/Home.css";
import { useNavigate } from "react-router-dom";
import { useDispatch, useSelector } from "react-redux";

const Login = (props) => {

    var ref = createRef()
    let navigate = useNavigate()
    let dispatch = useDispatch()
    var servers_ip = useSelector(state => state.servers_ip)
    
    return (
        <>
        <form ref={ref}>
            <div className="input_div">
                <input type="text" name="username" className="text_input" placeholder="Username" />
                <p className="input_error" id="username"></p>
            </div>
            <div className="input_div">
                <input type="password" name="password1" className="text_input" placeholder="Password" />
                <p className="input_error" id="password1"></p>
            </div>
            <button className="login_button" onClick={(e) => SendPOST(e, ref, "login", navigate, dispatch, servers_ip.httpserver)}><span>Login</span></button>
            <div className="sign_in_message_div">
                <p>Are you new here? <span className="sign_in_link" onClick={() => {props.ele[1](1)}}>sign in</span></p>
            </div>
        </form>
        </>
    )
}

const Sign_in = (props) => {

    var ref = createRef()
    let navigate = useNavigate()
    let dispatch = useDispatch()
    var servers_ip = useSelector(state => state.servers_ip)
    
    return (
        <form name="sign_in_form" ref={ref}>
            <div className="input_div">
                <input type="text" name="username" className="text_input" placeholder="Username" id="username_input" />
                <p className="input_error" id="username"></p>
            </div>
            <div className="input_div">
                <input type="password" name="password1" className="text_input" placeholder="Password" id="password1_input"/>
                <p className="input_error" id="password1"></p>
            </div>
            <div className="input_div">
                <input type="password" name="password2" className="text_input" placeholder="Password"  id="password2_input"/>
                <p className="input_error" id="password2"></p>
            </div>
            <button className="sign_in_button" onClick={(e) => SendPOST(e, ref, "sign_in", navigate, dispatch, servers_ip.httpserver)}><span>Sign in</span></button>
            <div className="sign_in_message_div">
                <p>Old traveler? <span className="link" onClick={() => {props.ele[1](0)}}>log in</span></p>
            </div>
        </form>
    )
}

const SendPOST = async (e, ref, page, navigate, dispatch, httpserver) => {
    e.preventDefault();
    var response = await fetch(httpserver + page, {method:"GET",credentials:"include"})
    let formd = new FormData(ref.current)
    response = await fetch(httpserver + page, {
        method:"POST",
        credentials:"include",
        headers:{
            "X-CSRFToken" : document.cookie.split("=")[1],
        },
        body:formd
    })
    var json_value = await response.json()
    if ("errors" in json_value){
        for (let x of document.querySelectorAll(".input_error")){x.innerHTML = ""}
        for (const [key, value] of Object.entries(json_value.errors)){
            document.querySelector("p[id = '" + key + "']").innerHTML = value
        }
    }else{
        //dispatch({type:"setSession", value:{"hostname":json_value.username, "auth_hash":json_value.ok}})
        navigate("/main_page")
    }
}

function Home(){

    const [page, setPage] = useState(0);
    const arr = [<Login ele = {[page, setPage]} />, <Sign_in ele = {[page, setPage]} />]

    return (
        <div className="main_div">
            <div className="first_div">
                <div className="first_div_cont">
                    <h2 className="title">W E B C H A T</h2>
                    <h3 className="title" >ウェブチャット</h3>
                </div>
            </div>
            <div className="second_div">
                {arr[page]}
            </div>
        </div>
    )

}

export default Home;