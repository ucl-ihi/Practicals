#' ---
#' title: Codeclub Docker tutorial
#' author: Patrick Rockenschaub
#' date: October 29, 2019
#' output: html_document
#' ---

#' This document is a brief case study on how a data analyis can be run on a docker container. 
#' We will use data on diabetes readmissions from the UCI repository: 
#' https://archive.ics.uci.edu/ml/datasets/Diabetes+130-US+hospitals+for+years+1999-2008#
#'
#' The specification of the Docker environment, installed modules and data can be found in the 
#' Dockerfile provided with this tutorial.

# Import the libraries that we installed
library(pROC)


#' We copied the data into the container when we created the image. Now we only have to set 
#' the correct path and read the data in with pandas.
data_path <- "data/diabetic_data.csv"
data <- read.csv(data_path)


#' Our outcome is readmission to hospital within 30 days.
data['readmitted'] <- factor(ifelse(data['readmitted'] == "<30", "YES", "NO"), c("NO", "YES"))


#' For simplicities sake, we specify only a small number of predictor variables. We simply 
#' run a logistic regression using age, gender and race.
clf <- glm(readmitted ~ age + gender + race, data = data, family = binomial)


#' Unsurprisingly, this very simple prediction based on only age, sex and ethnicity does poorly. 
#' However, you now have a Docker image in which you can further explore this dataset to your 
#' heart's desire :)
pred <- predict(clf, type = "response")
roc(response = data[['readmitted']], predictor = pred)
