
const currentUserReducer = (state = "", action) => {
    switch(action.type){
        case "setCurrent" : return action.value
        default: return state;
    }
}

export default currentUserReducer;
