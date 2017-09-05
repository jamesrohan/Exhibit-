



setwd("C:/Users/Nikki/Desktop/James/Data Science Internship/Assignments/Week 3/Day 2")


store.df <- read.csv(paste("Store24 (A).csv", sep=""))


summary(store.df)
library(psych)
describe(store.df)


attach(store.df)
View(store.df)
newdata <- store.df[order(-Profit),]
View(newdata[1:10,])

attach(store.df)
View(store.df)
newdata <- store.df[order(Profit),]
View(newdata[1:10,])



library(car)
scatterplotMatrix(formula = ~ Profit + MTenure, cex=0.6,
                  data=store.df) #, diagonal="histogram"


par(mfrow=c(1,1))
plot(store.df$MTenure, store.df$Profit, 
     main="Scatterplot of Profit Vs. MTenure",
     xlab="MTenure", ylab="Profit ")

abline(lm(store.df$Profit~store.df$MTenure), col ='green')



plot(store.df$CTenure, store.df$Profit, 
     main="Scatterplot of Profit Vs. CTenure",
     xlab="CTenure", ylab="Profit ")

abline(lm(store.df$Profit~store.df$CTenure), col ='green')



cor(store.df)


cor(store.df$Profit,store.df$MTenure)


cor(store.df$Profit,store.df$CTenure)



########################
library(corrplot)    # install if needed
corrplot(corr=cor(store.df, use="complete.obs"), 
         method ="shade", type = "lower")

library(corrgram)  # install if needed
corrgram(store.df, order=FALSE, lower.panel=panel.shade,
         upper.panel=panel.pie, text.panel=panel.txt,
         main="Corrgram of Store Variables")

####################



cor.test(store.df$Profit,store.df$MTenure)

cor.test(store.df$Profit,store.df$CTenure)


ProfitLM <- lm(Profit ~ MTenure+ CTenure +Comp+ Pop+
                 PedCount+ Res+ Hours24 + Visibility, data = store.df)
ProfitLM

summary(ProfitLM)

confint(ProfitLM)









