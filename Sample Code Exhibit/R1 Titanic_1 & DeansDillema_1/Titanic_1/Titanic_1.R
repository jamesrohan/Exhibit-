setwd("C:/Users/Nikki/Desktop/James/Data Science Internship/Assignments/Week 1/Day 5 Titanic")

#Load the Titanic dataset
# ==========
Titanic.df <- read.csv(paste("Titanic Data.csv", sep=""))
View(Titanic.df)
#Total # of passengers
str(Titanic.df)


library(psych)
#2A
#Total # of passengers
describe(Titanic.df)



#2B
#Survivors
#table(Titanic.df$Survived == 1)
mytable <- with(Titanic.df,table(Survived))
mytable
#2C
#Percentage of Survivors
prop.table(mytable)


#2D
#FirstClass + Survived
mytable <- xtabs(~ Pclass + Survived, data=Titanic.df)
mytable
#2E
#Percentage of FirstClass + Survived
prop.table(mytable)


#2F
#Female 1 st class survived
mytable <- xtabs(~ Pclass+ Sex + Survived, data=Titanic.df)
mytable

#2G
#Percentage of  Survived that are female
library(gmodels)
CrossTable(Titanic.df$Sex,Titanic.df$Survived)


#2H Percent of Females on board who Survived
CrossTable(Titanic.df$Sex,Titanic.df$Survived)

#2I
mytable <- xtabs(~ Sex + Survived, data=Titanic.df)
chisq.test(mytable)
#Reject the Null Hypo since it is much smaller than 0.05 or 0.01








