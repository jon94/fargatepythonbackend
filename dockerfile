#!/bin/sh

#Instructions to run the docker image

FROM python:3.7
USER 0
RUN mkdir -p /flask_backend
WORKDIR /flask_backend

#install dependencies first so they can be cached

COPY requirements.txt /flask_backend/requirements.txt 
#package*.json./

RUN pip3 install -r requirements.txt

COPY . .
#copies everything in the root directory to the container
#but lets say we want to ignore the env file -> .dockerignore

ENV FLASK_APP=application.py
ENV PORT=5500

EXPOSE 5500

ENTRYPOINT ["ddtrace-run"]
CMD ["ddtrace-run", "python3", "application.py"] 

#this is the command that will be executed when the container is run
