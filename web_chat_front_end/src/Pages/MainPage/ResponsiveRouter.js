import React, {useEffect} from "react";
import { useMediaQuery } from "react-responsive";
import MainPage from "./BrowserView/MainPage";
import { useSelector, useDispatch } from "react-redux";
import { useNavigate } from "react-router-dom";

function ResponsiveRouterMainPage(){
    
    const isBrowser = useMediaQuery({"query":"(min-width:768px)"})

    /* const session = useSelector(state => state.session)
    const navigate = useNavigate() */

    return (
        <>
            {isBrowser && <MainPage/>}  
        </>
        
    )

}

export default ResponsiveRouterMainPage;