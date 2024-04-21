# Vincent Lazo
# STA 4163
# Mini project 3

library("readxl")

# Auxiliary variables:
dataset <- read_excel("STA4163 Mini Project 3 Dataset-1.xlsx")
df <- data.frame(dataset)

attach(df)

# part 1: simple linear regression

# model
income_model <- lm(Rating ~ Income, data = df)

# scatterplot
png('output/income_plot.png')
plot(income_model)
dev.off()

# model summary
summary(income_model)

# anova on model
anova(income_model)

# confidence interval
confint(income_model)