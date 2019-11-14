# base image
FROM python:3.6

# updating repository
RUN apt-get update

# copying requirements.txt file
COPY requirements.txt requirements.txt

# pip install
RUN pip install --no-cache -r requirements.txt