
const messagesReducer = (state = [], action) => {
    switch(action.type){
        case "setMessage" : return action.value
        default: return state;
    }
}

export default messagesReducer;
