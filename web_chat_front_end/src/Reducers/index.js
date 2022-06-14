import { combineReducers } from "redux";
import sessionReducer from "./session";
import contactsReducer from "./contacts";
import messagesReducer from "./messages";
import currentUserReducer from "./currentuser";
import statusReducer from "./statususer";
import chatmessagesReducer from "./chatmessages";
import serversIP from "./servers_ip";

const rootReducers = combineReducers({
    session : sessionReducer,
    contacts : contactsReducer,
    messages : messagesReducer,
    current: currentUserReducer,
    status: statusReducer,
    chatmessages : chatmessagesReducer,
    servers_ip:serversIP
})

export default rootReducers;