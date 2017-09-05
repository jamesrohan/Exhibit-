
#SEt working DIR
setwd("C:/Users/Nikki/Desktop/James/Data Science Internship/Assignments/Week 2/Day 1")


Titanic.df <- read.csv(paste("Titanic Data.csv", sep=""))

aggregate(Age ~ Survived, data=Titanic.df, mean)


log.Age <- log(Titanic.df$Age)
summary(log.Age)
aggregate(log.Age ~ Survived, data=Titanic.df, mean)
aggregate(Age ~ Survived, data=Titanic.df, var)
library(psych)
describe(log.Age)


boxplot(Age ~ Survived, data=Titanic.df, 
        xlab="Survived (yes=1, no=0)", ylab="Age in Years")


attach(Titanic.df)
log.Age <- log(Titanic.df$Age)
t.test(log.Age ~ Survived, alternative = c("less"), var.equal = TRUE )

t.test(Age ~ Survived, alternative = c("less") )
t.test(Age ~ Survived, alternative = c("greater") )
t.test(Age ~ Survived, alternative = c("two.sided") )

t.test(Age ~ Survived, alternative = c("less"), var.equal= TRUE )
t.test(Age ~ Survived, alternative = c("less") )





