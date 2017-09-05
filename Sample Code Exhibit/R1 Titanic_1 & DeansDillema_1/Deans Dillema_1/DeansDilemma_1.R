#Set Working Dir
setwd("C:/Users/Nikki/Desktop/James/Data Science Internship/Assignments/Week 1/Day 6 Deans Dillema")

#Read in the CSV
DeansDilemma.df <- read.csv(paste("Data - Deans Dilemma.csv", sep=""))
View(DeansDilemma.df)

#Summary and describe
summary(DeansDilemma.df)  #3A Median Salary
library(psych)
describe(DeansDilemma.df)  #3A Median Salary


#3B Percent of Students who were placed
mytable <- with(DeansDilemma.df,table(Placement))
prop.table(mytable)*100



#3C Subset of DeansDilemma.df containing only those students that were placed
placed.df <- DeansDilemma.df[ which(DeansDilemma.df$Placement == 'Placed') , ]
View(placed.df)

#3D Median Salary of those who were placed
library(psych)
describe(placed.df)


#3E Mean Salary of Mean and Women who where placed
#mean(placed.df$Salary[placed.df$Gender == 'M'])
#mean(placed.df$Salary[placed.df$Gender == 'F'])
means.tab <- aggregate(Salary ~ Gender, data=placed.df, mean)
means.tab


#3F Histogram Showing breakup of performance of those who were palced
hist(placed.df$Percent_MBA, 
     main="MBA Performance of Placed Students",
     xlab="MBA Percentages", ylab="Count",
     breaks=3, col="grey") #, freq=FALSE



#3G Subset of DeansDilemma.df containing only those students that were not placed
NotPlaced.df <- DeansDilemma.df[ which(DeansDilemma.df$Placement == 'Not Placed') , ]
View(NotPlaced.df)

#3H Double histograms of Placed vs Not Placed Students
par(mfrow=c(1, 2))
with(placed.df, hist(placed.df$Percent_MBA, 
                     main="MBA Performance of Placed Students",
                     xlab="MBA Percentages", ylab="Count",
                     breaks=3, col="grey") )
     
with(NotPlaced.df, hist(NotPlaced.df$Percent_MBA, 
                        main="MBA Performance of Not Placed Students",
                        xlab="MBA Percentages", ylab="Count",
                        breaks=3, col="grey") )
par(mfrow=c(1, 1))






#3I Boxplot comparison of salries of Male vs Female of those who were placed
boxplot(placed.df$Salary ~ placed.df$Gender, horizontal=TRUE,
        ylab="Gender", xlab="Salary", las=1,
        main="Comparison of Salaries of Male vs Female")






#3J creatinng data frame representing students who were placed after the MBA and who also gave 
#some MBA entrance test before admission into the MBA program.  
placedET.df <- DeansDilemma.df[ which(DeansDilemma.df$Placement == 'Placed' & DeansDilemma.df$S.TEST == 1 ) , ]
View(placedET.df)



#3K Scatter Plot Matrix of  {Salary, Percent_MBA, Percentile_ET}
library(car)
scatterplotMatrix(formula = ~ Salary + Percent_MBA + Percentile_ET, cex=0.6,
                  data=placedET.df) #, diagonal="histogram"


