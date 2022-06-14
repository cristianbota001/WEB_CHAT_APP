
const statusReducer = (state = "", action) => {
    switch(action.type){
        case "setStatus" : return action.value
        default: return state;
    }
}

export default statusReducer;
