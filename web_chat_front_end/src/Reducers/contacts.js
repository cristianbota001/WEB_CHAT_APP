
const contactsReducer = (state = [], action) => {
    switch(action.type){
        case "setContacts" : return action.value
        default: return state;
    }
}

export default contactsReducer;
