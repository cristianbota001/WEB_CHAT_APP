from statistics import mode
from attr import field
from rest_framework import serializers
from .models import Profile, Messages, Group, PrivateGroup

class PrivateGroupSerializer(serializers.ModelSerializer):
    class Meta:
        model = PrivateGroup
        fields = ["group_id"]

class ProfilesNamesSerializer(serializers.ModelSerializer):
    username = serializers.CharField(source = "user.username")
    class Meta:
        model = Profile
        fields = ["username"]

