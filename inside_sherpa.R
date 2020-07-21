library(caTools)
getwd()
setwd("C:\\Users\\gaura\\Desktop\\insidesherpa")
data <- read.csv("data.csv")
summary(data)
head(data)
set.seed(125)
data$Gender = factor(data$Gender,
                         levels = c('M','F'),
                         labels = c(0, 1))

data$Favourite.Cookie = factor(data$Favourite.Cookie,
                     levels = c("Choc chip","Macadamia","Triple choc","Granola","Mint","Salted caramel"),
                     labels = c(1, 2,3,4,5,6))

data$Age.Group = factor(data$Age.Group,
                        levels = c("60_69","50_59","20_29","30_39","40_49","10_19"),
                        labels = c(1,2,3,4,5,6))



model <- lm(Cookies.bought.each.week  ~ ., data = data)
model
summary(model)

install.packages("relaimpo")
library(relaimpo)
relImportance <- calc.relimp(model, type = "lmg", rela = TRUE)
sort(relImportance$lmg, decreasing=TRUE)


install.packages("earth")
library(earth)
marsModel <- earth(model, data=inputData) 