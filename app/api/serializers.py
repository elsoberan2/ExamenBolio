from .models import *
from rest_framework import serializers

class MovieSerializers(serializers.ModelSerializer):
    class Meta:
        model = Movie
        fields = ['id', 'name', 'description', 'ranking', 'category']

    def to_representation(self, instance):
        ret = super().to_representation(instance)
        return {
             'id': ret['id'],
            'name': ret['name'],
            'ranking': ret['ranking'],
            'description': ret['description'],
            'category_id': ret['category'],
        }
        

class MovieCategoriesSerializers(serializers.ModelSerializer):
    class Meta:
        model = MovieCategories
        fields = ['id', 'name']

class ActorsSerializers(serializers.ModelSerializer):
    class Meta:
        model = MovieCategories
        fields = ['firstname', 'lastname','age']

class FilmDirectorSerializers(serializers.ModelSerializer):
    class Meta:
        model = MovieCategories
        fields = ['name']


        