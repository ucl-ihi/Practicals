# base image
FROM python:3.6

# updating repository
RUN apt-get update

# copying requirements.txt file
COPY requirements.txt requirements.txt

# pip install
RUN pip install --no-cache -r requirements.txt

# copying the data 
COPY dataset_diabetes.zip /home/data/dataset_diabetes.zip
RUN cd /home/data/ && unzip dataset_diabetes.zip && rm dataset_diabetes.zip && cd /

# exposing port 8888
EXPOSE 8888

# Running jupyter notebook
# --NotebookApp.token='codeclub' is the passsword
CMD ["jupyter","notebook","--no-browser","--ip=0.0.0.0","--allow-root","--NotebookApp.token='codeclub'"]
