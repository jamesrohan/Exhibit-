

#set Working Dir
setwd("C:/Users/Nikki/Desktop/James/Data Science Internship/Assignments/Week 2/Day 1")


#Import CSV
DeansDilemma.df <- read.csv(paste("Data - Deans Dilemma.csv", sep=""))
head(DeansDilemma.df)


#Subset of DeansDilemma.df containing only those students that were placed
placed.df <- DeansDilemma.df[ which(DeansDilemma.df$Placement == 'Placed') , ]
View(placed.df)

#Check to see if average salary of Male vs Female differ
means.tab <-aggregate(Salary ~ Gender, data=placed.df, mean)
means.tab

attach(placed.df)




Placed.MaleSal.df <- DeansDilemma.df[ which(DeansDilemma.df$Placement == 'Placed' 
                                            & DeansDilemma.df$Gender == 'M') , ]
Placed.FemaleSal.df <- DeansDilemma.df[ which(DeansDilemma.df$Placement == 'Placed' 
                                              & DeansDilemma.df$Gender == 'F') , ]

placed.df$Male <- placed.df[]
  
log.Salary<- log(placed.df$Salary)

par(mfrow=c(1,2))
boxplot(log.Salary ~ Gender, data=placed.df, 
        xlab="Gender (M, F)", ylab="Log Salary")
boxplot(Salary ~ Gender, data=placed.df, 
        xlab="Gender (M, F)", ylab="Salary")
par(mfrow=c(1,1))



aggregate(log.salary~Gender, FUN = mean)
t.test(log.Salary ~ Gender, alternative = c("greater"), var.equal = TRUE )
