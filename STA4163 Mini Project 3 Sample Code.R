#The dataset that we are using is in this library, so 
#load the library to get the dataset.
library(ISLR)

?College
#Let's say we want to predict graduation rate (Grad.Rate) using:
# Student/Faculty Ratio (S.F.Ratio)
# Out-of-stsate tuition (Outstate)
# Percentage of new students from top 10% of H.S. class (Top10perc)
# Percentage of faculty with Ph.D's (PhD)

#Using those 4 variables, we can build a multiple linear regression model.
#The general form would be something with 3 predictors:
#model <- lm(Y ~ X1 + X2 + X3, data=dataset)

#Here, replace Y with Grad.Rate and the predictors with the names 
#of the predictors we are using. Our dataset is called "College".

College_Model <- lm(Grad.Rate ~ S.F.Ratio + Outstate + Top10perc + PhD,
                    data=College)
#Run the summary function to actually see the model.
summary(College_Model)

#Run the "anova" function to see the SSE.
anova(College_Model)

plot(College_Model)
#Get 95% confidence intervals for the slopes:
confint(College_Model, level = 0.95)

#Let's say we want to predict the graduation rate of a college with
#A student faculty ratio of 29,
#Out of state tuition of 6600,
#25% of students were in the top 10% of their high school class
#80% of faculty has PhD's,
#we will use the "predict" function to get that.

#First, run the summary function on the dataset to find the min and max of every
#dataset:
summary(College)

#Now, use the prediction function to get the desired confidence and prediction intervals
predict(College_Model, newdata=data.frame(S.F.Ratio = 29, Outstate=6600,
                                          Top10perc = 25, PhD=80),
        interval="confidence", level=0.95)
#Make sure you spell all the variable names exactly.
predict(College_Model, newdata=data.frame(S.F.Ratio = 29, Outstate=6600,
                                          Top10perc = 25, PhD=80),
        interval="prediction", level=0.95)



