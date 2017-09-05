

#1Setting WD and Importing Data Set
setwd("C:/Users/Nikki/Desktop/James/Data Science Internship/Assignments/Week 3/Day 5")
Airline.df <- read.csv(paste("SixAirlinesDataV2.csv", sep=""))


attach(Airline.df)


#2 Summany Stats
summary(Airline.df)

library(psych)
describe(Airline.df)

View(Airline.df)

#3 Individual Box Plots
par(mfrow=c(17, 1))

boxplot(Airline.df$Airline , horizontal=TRUE, las=1)
boxplot(Airline.df$Aircraft , horizontal=TRUE, las=1)
boxplot(Airline.df$FlightDuration , horizontal=TRUE, las=1)
boxplot(Airline.df$TravelMonth , horizontal=TRUE, las=1)
boxplot(Airline.df$IsInternational , horizontal=TRUE, las=1)
boxplot(Airline.df$SeatsEconomy , horizontal=TRUE, las=1)
boxplot(Airline.df$SeatsPremium , horizontal=TRUE, las=1)
boxplot(Airline.df$PitchEconomy , horizontal=TRUE, las=1)
boxplot(Airline.df$PitchPremium , horizontal=TRUE, las=1)
boxplot(Airline.df$WidthEconomy , horizontal=TRUE, las=1)
boxplot(Airline.df$WidthPremium , horizontal=TRUE, las=1)
boxplot(Airline.df$PriceEconomy , horizontal=TRUE, las=1)
boxplot(Airline.df$PricePremium , horizontal=TRUE, las=1)
boxplot(Airline.df$PriceRelative , horizontal=TRUE, las=1)
boxplot(Airline.df$SeatsTotal , horizontal=TRUE, las=1)
boxplot(Airline.df$PitchDifference , horizontal=TRUE, las=1)
boxplot(Airline.df$WidthDifference , horizontal=TRUE, las=1)
boxplot(Airline.df$PercentPremiumSeats , horizontal=TRUE, las=1)

par(mfrow=c(1, 1))

#4 Scatter Plot Matrix
library(car)
scatterplotMatrix(formula = ~ Airline+Aircraft+FlightDuration+TravelMonth+FlightDuration+IsInternational+SeatsEconomy
                  +SeatsPremium+PitchEconomy+PitchPremium+WidthEconomy+WidthPremium+PriceEconomy+PricePremium, cex=0.6,
                  data=Airline.df) #, diagonal="histogram"
#Many variables are normally, bimodally distributed, or are an approximation of norma such as t, chi-square etc.



#5 correlation matrix
library(corrgram)  # install if needed
corrgram(Airline.df, order=FALSE, lower.panel=panel.shade,
         upper.panel=panel.pie, text.panel=panel.txt,
         main="Corrgram of Airline.DF")



########################
###Hypothesis Testing###
########################



#Hypothesis 1: Is there a difference between the average price of premium and ecnonomy
#between different aeroplane manufactuerers?
boxplot(Airline.df$PricePremium~Airline.df$Aircraft,main = "PremiumEcon Price", xlab = "Aircraft,"
        ,col = (c("green","blue")), ylab = "PrimEcon Price(USD)")
boxplot(Airline.df$PriceEconomy~Airline.df$Aircraft,main = "Econ Price", xlab = "Aircraft,"
        ,col = (c("green","blue")), ylab = "Econ Price(USD)")

t.test(Airline.df$PricePremium~Airline.df$Aircraft)
t.test(Airline.df$PriceEconomy~Airline.df$Aircraft)

#According to the T-test there is a difference in prices in both Economy and Premium Economy classes
#based on the manufaturer. The boxplots and the t-tests indicate an higher average price for Airbus
#in both the categories




#Hypothesis 2: Does Airbus have bigger seats, more leg room etc. That Justifies its higher price?

#Checking for Pitch
par(mfrow=c(1, 1))
boxplot(Airline.df$PitchPremium~Airline.df$Aircraft,main = "PremiumEcon Pitch(Distance between
        two consecutive Premium Economy Seats", xlab = "Aircraft,"
        ,col = (c("green","blue")), ylab = "Pitch(Inches))")
boxplot(Airline.df$PitchEconomy~Airline.df$Aircraft,main = "Econ Pitch(Distance between
        two consecutive Economy Seats)", xlab = "Aircraft,"
        ,col = (c("green","blue")), ylab = "Pitch(Inches)")
t.test(Airline.df$PitchPremium~Airline.df$Aircraft)
t.test(Airline.df$PitchEconomy~Airline.df$Aircraft)
#There is no difference in Pitch for the Premium Economy Class between the brands as well as within the brands.
#There is a difference in Pitch for the Economy class within the brands but they are both equally well Distributed
#The P value is extremely small for the PitchEconomy~Aircraft. This indicates a very strong correlation for the fact 
#that the Average Pitch in the Economy classes greatly differs between the Boeing and Airbus brands.


#Checking for Width
par(mfrow=c(1, 1))
boxplot(Airline.df$WidthPremium~Airline.df$Aircraft,main = "PremiumEcon Width", xlab = "Aircraft,"
        ,col = (c("green","blue")), ylab = "Width(Inches))")
boxplot(Airline.df$WidthEconomy~Airline.df$Aircraft,main = "Econ Width", xlab = "Aircraft,"
        ,col = (c("green","blue")), ylab = "Width(Inches)")
boxplot(Airline.df$WidthDifference~Airline.df$Aircraft,main = "Pitch Difference", xlab = "Aircraft,"
        ,col = (c("green","blue")), ylab = "Width(Inches)")
t.test(Airline.df$WidthPremium~Airline.df$Aircraft)
t.test(Airline.df$WidthEconomy~Airline.df$Aircraft)
t.test(Airline.df$WidthDifference~Airline.df$Aircraft)

#The premium econ width is indeed higher than that of the regular economy class. The Premium Economy class 
#widths are identically distributed. Where as Boeing offers a higher degree of variation in the width category, aslo 
#boeing has more distribution in the lower quartile in the Economy Width class though the mean is the equal for both 
#Airbus and Boeing.
#The premium economy class's widths are identically distributed among Airbus and Boeing with same mean etc.
#According to the T-Tests the pavule for the Width in the Economy class is extremely small, a strong indication 
#the average value of width among the brands in the Economy class is not equal.






#Checking Percentage Premium Seats between the brands.
boxplot(Airline.df$PercentPremiumSeats~Airline.df$Aircraft,main = "Percent Premium Seats between Brands"
        , xlab = "Aircraft,"
        ,col = (c("green","blue")), ylab = "Percentage Premium Seats")
t.test(Airline.df$PercentPremiumSeats~Airline.df$Aircraft)
#Boeing has a higher degree of Percent Premium Seats, whereas Airbus has a lower degree of Percent Premium
#seats making them less prevalent on their aeroplanes. The P-value is very small for this t-test indicating
#that the average percentage of premium seats is not equal between the Airbus and the Boeing brands and that the 
#average population mean of Airbus is lower than Boeings.



#Building a Linear Regression Model, where the Economy class Price and the Premium Economy class prices 
#are indepedent variables and the Aircraft-brand, width, pitch, percent premium seats.
# I expect to see a week relation between these factors such as width & pitch since they are identically
# distribues across both boeing and airbus.

Boeing.df <- Airline.df[ which(Airline.df$Aircraft == 'Boeing') , ]
Airbus.df<- Boeing.df <- Airline.df[ which(Airline.df$Aircraft != 'Boeing') , ]
head(Airbus.df)
View(Airbus.df)




LinMod_Boeing_PremEconPrice <- lm(PriceEconomy~PitchPremium+PitchEconomy+WidthPremium
                                  +WidthEconomy+WidthDifference+PercentPremiumSeats, data = Boeing.df)
LinMod_Boeing_EconPrice <-lm(PriceEconomy ~ PitchPremium+PitchEconomy+WidthPremium
                      +WidthEconomy+WidthDifference+PercentPremiumSeats, data = Boeing.df)
LinMod_Boeing_PriceRelative <-lm(PriceRelative ~ PitchPremium+PitchEconomy+WidthPremium
                          +WidthEconomy+WidthDifference+PercentPremiumSeats, data = Boeing.df)



LinMod_Airbus_PremEconPrice <- lm(PriceEconomy~PitchPremium+PitchEconomy+WidthPremium
                                  +WidthEconomy+WidthDifference+PercentPremiumSeats, data = Airbus.df)
LinMod_Airbus_EconPrice <-lm(PriceEconomy ~ PitchPremium+PitchEconomy+WidthPremium
                             +WidthEconomy+WidthDifference+PercentPremiumSeats, data = Airbus.df)
LinMod_Airbus_PriceRelative <-lm(PriceRelative ~ PitchPremium+PitchEconomy+WidthPremium
                                 +WidthEconomy+WidthDifference+PercentPremiumSeats, data = Airbus.df)



summary(LinMod_Boeing_PremEconPrice)
summary(LinMod_Airbus_PremEconPrice)


summary(LinMod_Boeing_EconPrice)
summary(LinMod_Airbus_EconPrice)


summary(LinMod_Boeing_PriceRelative)
summary(LinMod_Airbus_PriceRelative)


LinMod_Boeing_PremEconPrice
LinMod_Airbus_PremEconPrice


LinMod_Boeing_EconPrice
LinMod_Airbus_EconPrice


LinMod_Boeing_PriceRelative
LinMod_Airbus_PriceRelative

#Conlusions: Pitch Premium, Pitch Economy, Width Premium, Width Economy play a very important determing role. 
# Width Premium and Width Economy playing a very important role.
# Surprisingly Percentage Premium Seats does have any affect according to the Data Set. But since, 
#especially given this effects the distribution of costs in a plane this needs to be further investigated.  






