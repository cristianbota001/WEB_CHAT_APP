from django import forms

class RegistrationForm(forms.Form):

    username = forms.CharField(required=True)
    password1 = forms.CharField(required=True) 
    password2 = forms.CharField(required=True)

    def clean(self):
        credenziali = super().clean()
        
        if credenziali.get("username"):
            if credenziali.get("password1") and credenziali.get("password2"):
                if credenziali.get("password1") != credenziali.get("password2"):
                    self.add_error("password2", "Riscrivi correttamente la password")

class LoginForm(forms.Form):

    username = forms.CharField(required=True)
    password1 = forms.CharField(required=True) 

    def clean(self):
        pass