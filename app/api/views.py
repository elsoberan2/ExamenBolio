from django.http import HttpResponse
from django.shortcuts import render

from .models import *
from rest_framework import viewsets
#from rest_framework import serializers
from rest_framework import permissions
from rest_framework import filters
from .serializers import *
#from api.serializers import MovieSerializer, MovieCategoriesSerializers

# Create your views here.

#def index(request):
#    return HttpResponse("Hola clase")

class MovieViewSet(viewsets.ModelViewSet):
    search_fields = ['name','description']
    filter_backends = [filters.SearchFilter,]
    queryset = Movie.objects.all()
    serializer_class = MovieSerializers

class MovieCategoriesViewSet(viewsets.ModelViewSet):
    search_fields = ['name']
    filter_backends = [filters.SearchFilter,]
    queryset = MovieCategories.objects.all()
    serializer_class = MovieCategoriesSerializers


class FilmDirectorViewSet(viewsets.ModelViewSet):
    search_fields = ['name']
    filter_backends = [filters.SearchFilter,]
    queryset = MovieCategories.objects.all()
    serializer_class = MovieCategoriesSerializers

class ActorsViewSet(viewsets.ModelViewSet):
    search_fields = ['firstname','lastname']
    filter_backends = [filters.SearchFilter,]
    queryset = MovieCategories.objects.all()
    serializer_class = MovieCategoriesSerializers
