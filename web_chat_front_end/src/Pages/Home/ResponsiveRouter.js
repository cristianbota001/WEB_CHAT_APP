import React, { useEffect } from "react";
import { useMediaQuery } from "react-responsive";
import Home from "./BrowserView/Home";
import { useNavigate } from "react-router-dom";
import {useSelector} from "react-redux"

function ResponsiveRouterHome(){
    
    const isBrowser = useMediaQuery({"query":"(min-width:768px)"})
    const servers_ip = useSelector(state => state.servers_ip)
    const navigate = useNavigate()

    const CheckSession = async () => {
        
        var response = await fetch(servers_ip.httpserver + "check_session", {method : "GET", credentials : "include"})
        var json_response = await response.json()
 
        if (!("no_session" in json_response)){
            navigate("/main_page")
        }

    }

    useEffect(() => {
        CheckSession()
    }, [])

    return (
        <>
            {isBrowser && <Home/>}
        </>
    )

}

export default ResponsiveRouterHome;