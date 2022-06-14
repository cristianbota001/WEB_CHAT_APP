import React, { useRef, useEffect, useState } from "react";
import "./CSS/SlideOptionWindow.css";
import close from "./Media/close.png";
import undo from "./Media/undo.png";
import categ from "./Media/categ.png"

const MenuLinks = (props) => {

    var ref1 = useRef()
    var ref2 = useRef()

    useEffect(() => {
        ref2.current.addEventListener("mouseenter", () => {
           ref1.current.classList.toggle("slide_option_window_option_toggle")
        })
        ref2.current.addEventListener("mouseleave", () => {
           ref1.current.classList.toggle("slide_option_window_option_toggle")
        })
        ref2.current.addEventListener("click", () => {
            if (props.button_type == "1"){
                props.ref_main_window.current.classList.toggle("slide_option_window_main_toggle")
                props.setOptionList(props.options)
                props.title_ref.current.innerText = props.text
            } else if (props.button_type == "2"){
                //
            }
        })
    }, [])
    
    return (
        <div className= {"slide_option_window_option_div " + props.menu_options_class_type} ref={ref2}>
            <p className="slide_option_window_option" ref={ref1}>
                {props.text}
            </p>
            {props.button_type == "1" ? <img src={categ} alt="arrow" className="categ_arrow"/> : <></>}
        </div>
    )
}



const SlideOptionWindow = (props) => {

    const ref1 = useRef()
    const ref2 = useRef()
    const ref3 = useRef()
    const ref4 = useRef()

    const [optionsList, setOptionList] = useState([])
    
    useEffect(() => {
        
        ref1.current.addEventListener("click", () => {
            props.menu_ref.current.classList.toggle("slide_option_window_toggle")
        })
        ref2.current.addEventListener("click", () => {
            ref3.current.classList.toggle("slide_option_window_main_toggle")
        })
 
     }, [])

    return (
    
        <div className="slide_option_window_main" ref={ref3}>
            <div className="slide_option_window_1">
                <div className="slide_option_window_close_nav" >
                    <img src={close} alt="close" ref={ref1} />
                </div>
                <div className="slide_option_window_scroll_div">
                    {
                        props.categories.map((value, key) => {
                            return (
                                <MenuLinks key = {key} text = {value[0]} menu_options_class_type = {props.menu_options_class_type} setOptionList = {setOptionList} options = {props.options[key]} ref_main_window = {ref3} button_type = {value[1] == "categ" ? "1" : "2"} title_ref = {ref4} />
                            )
                        })
                    }
                </div>
            </div>
            <div className="slide_option_window_2">
                <div className="slide_option_window_close_nav_sub_menu" >
                    <p className="slide_option_window_title_sub_menu" ref={ref4} ></p>
                    <img src={undo} alt="close" ref={ref2}/>
                </div>
                <div className="slide_option_window_scroll_div">
                    {   
                        optionsList.map((value, key) => {
                            return <MenuLinks key = {key} text = {value[0]} menu_options_class_type = {props.menu_options_class_type} setOptionList = {setOptionList} ref_main_window = {ref3} button_type = "2"/>
                        })
                    }
                </div>
            </div>
        </div>
        
    )

}

export default SlideOptionWindow;