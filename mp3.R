# Vincent Lazo
# STA 4163
# Mini project 3

library("readxl")

# Auxiliary variables:
dataset <- read_excel("STA4163 Mini Project 3 Dataset-1.xlsx")
df <- data.frame(dataset)

attach(df)

# part 1: simple linear regression

plot(df)

# model
income_model <- lm(Rating ~ Income, data = df)

# scatterplot
pdf('output/income_plot.pdf')
plot(income_model)
dev.off()

# model summary
summary(income_model)

# anova on model
anova(income_model)

# confidence interval
confint(income_model, level = 0.95)

# coefficient of correlation
cor(Income, Rating)

# part 2: multiple linear regression
multi_model <- lm(Rating ~ Income + Age + Education, data = df)

summary(multi_model)

# scatterplot
pdf('output/multi_plot.pdf')
plot(multi_model)
dev.off()

# single linear regression with education and rating
education_model <- lm(Rating ~ Education, data = df)

# scatterplot
pdf('output/education_plot.pdf')
plot(education_model)
dev.off()

# model summary
summary(education_model)


