FROM rocker/rstudio:3.6.1

# install required R packages
RUN install2.r --error \
    pROC
	
# copying the data 
COPY dataset_diabetes.zip /home/rstudio/data/dataset_diabetes.zip
RUN cd /home/rstudio/data && unzip dataset_diabetes.zip && rm dataset_diabetes.zip && cd /