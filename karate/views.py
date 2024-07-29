from urllib import request
from django.shortcuts import render

def main(request):
    context = {

    }
    return render(request, "karate/main.html", context)