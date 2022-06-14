from django.urls import path
from .views import Registration, CheckSession, AuthCheck, Login, AddressBookRequest, KeyUserSearch, CheckIfUserExists, AddNewUser, GetAllContacts, GetAllContactsWS, SaveMessage, GetAllRubricaMessages, PostInfoMess

urlpatterns = [
    path("sign_in", Registration, name = "sign_in"),
    path("check_session", CheckSession),
    path("auth_check", AuthCheck),
    path("login", Login, name = "login"),
    path("address_book", AddressBookRequest),
    path("key_search", KeyUserSearch),
    path("check_user", CheckIfUserExists),
    path("add_user", AddNewUser),
    path("get_all_contacts", GetAllContacts),
    path("get_all_contacts_ws", GetAllContactsWS),
    path("save_message", SaveMessage),
    path("get_rubrica_messages", GetAllRubricaMessages),
    path("add_info_mess", PostInfoMess),
    
]
