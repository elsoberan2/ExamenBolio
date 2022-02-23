FROM python:3.8
LABEL WILLIAN CACHON

ENV PYTHONUNBUFFERED 1 

COPY ./requirements.txt /requirements.txt 
RUN pip install -r /requirements.txt

RUN mkdir /app
WORKDIR /app
COPY ./app /app
#COPY ./.env /app/apirest/.env
#COPY ./debug /app/debug.log
#RUN chmod +777 /app/debug.log

RUN useradd -ms /bin/bash newuser
USER newuser