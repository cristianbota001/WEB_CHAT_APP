import React from "react";
import "./CSS/CloudMessage.css";
import recv from "./Media/eye.png"

const CloudMessage = (props) => {
    
    return (
        <div className={"message_cloud_div_main " + props.message_type}>
            <div className="message_cloud_div">
                <div className="cloud_message_user_name_div">
                    <p className="cloud_message_user_name">
                        {props.text_name}
                    </p>
                   <img className="cloud_message_eye" src={recv} alt="recv" />
                </div>
                <p className="message_cloud_message">
                    {props.text_message}
                </p>
                <div className="date_div_message_cloud">
                    <p className="date_message_cloud">
                        {props.text_date}
                    </p>
                </div>
            </div>
        </div>
    )

}

export default CloudMessage;