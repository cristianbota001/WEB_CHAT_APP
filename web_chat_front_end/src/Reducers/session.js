
const sessionReducer = (state = {"username":null, "user_id":null, "ws_auth_id":null, "set":false, "websocket":null}, action) => {
    switch(action.type){
        case "setSession" : return action.value
        default: return state;
    }
}

export default sessionReducer;
