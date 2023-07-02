# syntax=docker/dockerfile:1
FROM ubuntu:22.04
LABEL org.opencontainers.image.source="https://github.com/freeloader09/hello_flask"
# install app dependencies
RUN apt-get update && apt-get install -y python3.10 python3-pip
COPY requirements.txt /
RUN pip install -r requirements.txt

# install app
COPY hello_flask.py /

# final configuration
ENV FLASK_APP=hello_flask
EXPOSE 8000
CMD flask run --host 0.0.0.0 --port 8000
