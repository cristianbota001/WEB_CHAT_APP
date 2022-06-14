
const chatmessagesReducer = (state = [], action) => {
    switch(action.type){
        case "setChatMessages" : return action.value
        default: return state;
    }
}

export default chatmessagesReducer;
