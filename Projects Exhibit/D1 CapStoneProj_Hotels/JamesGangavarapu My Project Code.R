

############## 1 Reading CSV file into R #################
setwd("C:/Users/Nikki/Desktop/James/Data Science Internship/Assignments/Projects/CapStoneProj_Hotels")
hotels.df <- read.csv(paste("Cities42.csv", sep=""))
attach(hotels.df)




############ 2 Summary Stats ############
summary(hotels.df)
library(psych)
describe(hotels.df)



####################  3  4  5  6 7 #############################
#See if Room rent is effected by Binary Factors such as  IsWeekend+IsNewYearEve+IsMetroCity+IsTouristDestination
# +freeWifi+freeBreakfast+hasSwimmingPool
boxplot(hotels.df$RoomRent~hotels.df$IsTouristDestination,horizontal = TRUE,main = "Room Rent vs Tourist Desti", 
        xlab = "Room Rent"
        ,col = (c("green","red")), ylab = "Tourist Desti")

#
hotels_RoomRentLessThan.df <- hotels.df[ which(hotels.df$RoomRent <= 50000*2) , ]
View(hotels_RoomRentLessThan.df)




boxplot(hotels_RoomRentLessThan.df$RoomRent~hotels_RoomRentLessThan.df$IsWeekend,horizontal = TRUE,
        main = "Room Rent vs IsWeekend",xlab = "Room Rent",col = (c("green","red")), ylab = "IsWeekend")
hist(hotels.df$IsWeekend)
plot(hotels.df$IsWeekend,hotels.df$RoomRent)



boxplot(hotels_RoomRentLessThan.df$RoomRent~hotels_RoomRentLessThan.df$IsNewYearEve,horizontal = TRUE,
        main = "Room Rent vs IsNewYearEve",xlab = "Room Rent",col = (c("green","red")), ylab = "IsNewYearEve")
hist(hotels.df$IsNewYearEve)
plot(hotels.df$IsNewYearEve,hotels.df$RoomRent)





boxplot(hotels_RoomRentLessThan.df$RoomRent~hotels_RoomRentLessThan.df$IsMetroCity,horizontal = TRUE,
        main = "Room Rent vs Metro City",xlab = "Room Rent",col = (c("green","red")), ylab = "Metro City")
hist(hotels.df$IsMetroCity)
plot(hotels.df$IsMetroCity,hotels.df$RoomRent)



boxplot(hotels_RoomRentLessThan.df$RoomRent~hotels_RoomRentLessThan.df$IsTouristDestination,horizontal = TRUE,
        main = "Room Rent vs IsTouristDestination",xlab = "Room Rent",col = (c("green","red")), ylab = "IsTouristDestination")
hist(hotels.df$IsTouristDestination)
plot(hotels.df$IsTouristDestination,hotels.df$RoomRent)




boxplot(hotels_RoomRentLessThan.df$RoomRent~hotels_RoomRentLessThan.df$FreeWifi,horizontal = TRUE,
        main = "Room Rent vs Free Wifi",xlab = "Room Rent",col = (c("green","red")), ylab = "Free Wifi")
hist(hotels.df$FreeWifi)
plot(hotels.df$FreeWifi,hotels.df$RoomRent)



boxplot(hotels_RoomRentLessThan.df$RoomRent~hotels_RoomRentLessThan.df$FreeBreakfast,horizontal = TRUE,
        main = "Room Rent vs Free Breakfast",xlab = "Room Rent",col = (c("green","red")), ylab = "Free Breakfast")
hist(hotels.df$FreeBreakfast)
plot(hotels.df$FreeBreakfast,hotels.df$RoomRent)




boxplot(hotels_RoomRentLessThan.df$RoomRent~hotels_RoomRentLessThan.df$HasSwimmingPool,horizontal = TRUE,
        main = "Room Rent vs Swimming Pool",xlab = "Room Rent",col = (c("green","red")), ylab = "Has Swimming Pool")
hist(hotels.df$HasSwimmingPool)
plot(hotels.df$HasSwimmingPool,hotels.df$RoomRent)



boxplot(hotels_RoomRentLessThan.df$RoomRent~hotels_RoomRentLessThan.df$StarRating,horizontal = TRUE,
        main = "Room Rent vs Star Rating",xlab = "Room Rent",col = (c("green","red")), ylab = "Star Rating")
hist(hotels.df$StarRating)
plot(hotels.df$StarRating,hotels.df$RoomRent)




boxplot(hotels_RoomRentLessThan.df$RoomRent~hotels_RoomRentLessThan.df$Airport,horizontal = TRUE,
        main = "Room Rent vs Star Rating",xlab = "Room Rent",col = (c("green","red")), ylab = "Airport Dist")
hist(hotels.df$Airport)


boxplot(hotels_RoomRentLessThan.df$RoomRent~hotels_RoomRentLessThan.df$CityName,horizontal = TRUE,
        main = "Room Rent vs City",xlab = "Room Rent",col = (c("green","red")), ylab = "City")
plot(hotels.df$CityName)

boxplot(hotels_RoomRentLessThan.df$RoomRent~hotels_RoomRentLessThan.df$CityRank,horizontal = TRUE,
        main = "Room Rent vs CityRank",xlab = "Room Rent",col = (c("green","red")), ylab = "CityRank")
hist(hotels.df$CityRank)








plot(hotels.df$Airport,hotels.df$RoomRent)
plot(hotels.df$Airport,hotels.df$RoomRent,log = 'xy')


plot(hotels.df$StarRating,hotels.df$RoomRent)
plot(hotels.df$StarRating,hotels.df$RoomRent,log = 'xy')





IsWeekend.df <- aggregate(RoomRent ~ IsWeekend, data=hotels.df, mean)
IsWeekend.df
plot(IsWeekend.df)
IsNewYearEve.df <- aggregate(RoomRent ~ IsNewYearEve, data=hotels.df, mean)
IsNewYearEve.df
IsMetroCity.df <-aggregate(RoomRent ~ IsMetroCity, data=hotels.df, mean)
IsMetroCity.df
IsTouristDestination.df <-  aggregate(RoomRent ~ IsTouristDestination, data=hotels.df, mean)
IsTouristDestination.df
FreeWifi.df <- aggregate(RoomRent ~ FreeWifi, data=hotels.df, mean)
FreeWifi.df
HasSwimmingPool.df <-aggregate(RoomRent ~ HasSwimmingPool, data=hotels.df, mean)
HasSwimmingPool.df
StarRating.df <- aggregate(RoomRent ~ hotels.df$StarRating, data=hotels.df, mean)
StarRating.df
#AirpotDist.df <- aggregate(RoomRent ~ hotels.df$Airport, data=hotels.df, mean)
#AirpotDist.df
CityName.df <- aggregate(RoomRent, list(CityName),data= hotels.df,mean)
CityName.df
CityRank.df <- aggregate(RoomRent, list(CityRank),data= hotels.df,mean)
CityRank.df











  
library(car)
scatterplotMatrix(formula = ~ FreeWifi+HasSwimmingPool+CityRank,
                  cex=0.6,data=hotels.df) 




#RoomRent+IsWeekend+IsNewYearEve+Population+CityRank+IsMetroCity+IsTouristDestination




############ 8 Corrgram ##################
library(corrgram)  # install if needed
corrgram(hotels.df, order=FALSE, lower.panel=panel.shade,
         upper.panel=panel.pie, text.panel=panel.txt,
         main="Corrgram of MBASalaries")



################ 9 Variance-Covariance Matrix ###################3

cov(hotels.df)
var(hotels.df)





######################################################################
######################################################################
######################################################################
######################################################################
######################## Final Report Code ###########################
######################################################################
######################################################################
######################################################################
######################################################################

#######                           ######                                        #####                       
#       # #    #   ##   #         #     # ###### #####   ####  #####  #####    #     #  ####  #####  ###### 
#       # ##   #  #  #  #         #     # #      #    # #    # #    #   #      #       #    # #    # #      
#####   # # #  # #    # #         ######  #####  #    # #    # #    #   #      #       #    # #    # #####  
#       # #  # # ###### #         #   #   #      #####  #    # #####    #      #       #    # #    # #      
#       # #   ## #    # #         #    #  #      #      #    # #   #    #      #     # #    # #    # #      
#       # #    # #    # ######    #     # ###### #       ####  #    #   #       #####   ####  #####  ###### 

######################################################################
######################################################################
######################################################################
######################################################################
######################## Final Report Code ###########################
######################################################################
######################################################################
######################################################################
######################################################################


summary(hotels.df[which(hotels.df$IsTouristDestination=='1') ,])
library(psych)
describe(hotels.df)






#Comparing the Hotel Price based on City Rank
library(lattice)
bwplot(CityRank ~ RoomRent, data=hotels.df, horizontal=TRUE, 
       xlab = "Room Rent")
#Insted using data set with less than a certain room price
bwplot(CityRank ~ RoomRent, data=hotels_RoomRentLessThan.df, horizontal=TRUE, 
       xlab = "Room Rent")

#Taking the log of RoomRents
logRoomRent.df <- log2(hotels.df$RoomRent)
hotels.df$LogRoomRent <- logRoomRent.df
View(hotels.df)
bwplot(CityRank ~ LogRoomRent, data=hotels.df, horizontal=TRUE, 
       xlab = "Log Room Rent")
#Comparing the Hotel Price based on City Rank and if it is Metro City
bwplot(CityRank ~ LogRoomRent | IsMetroCity, data=hotels.df, horizontal=TRUE, 
       xlab = "LogRoom Rent")
#Comparing the Hotel Price based on City Rank and if it is Tourist Destination
bwplot(CityRank ~ LogRoomRent | IsTouristDestination , data=hotels.df, horizontal=TRUE, 
       xlab = "LogRoom Rent")
###Hypothesis H0: The average Price of Room Rents is equal for different Cities based on Rank.
###Hypothesis H1: The average Price of Room Rents is not equal for different Cities based on Rank. 









#Room Rent based on wether it is a Metro City Or Not
bwplot(IsMetroCity ~ LogRoomRent  , data=hotels.df, horizontal=TRUE, 
       xlab = "LogRoom Rent")
IsMetro.df <- xtabs(~IsMetroCity,data = hotels.df)
prop.table(IsMetro.df)*100

bwplot(FreeWifi ~ LogRoomRent | IsMetroCity , data=hotels.df, horizontal=TRUE, notch = TRUE,
       xlab = "LogRoom Rent")




#Room Rent Based on hasSwimming Pool and is MetroCity
bwplot(HasSwimmingPool ~ LogRoomRent | IsMetroCity , data=hotels.df, horizontal=TRUE, notch = TRUE,
       xlab = "Log Room Rent")




#Room Rent with Respect to Date
bwplot( LogRoomRent ~ Date  , data=hotels.df, horizontal=FALSE, 
       xlab = "Dates")
#with respecto weekend or not and new year
bwplot(IsWeekend ~ LogRoomRent  , data=hotels.df, horizontal=TRUE,
       xlab = "Log Room Rent")
#with respec to new year
bwplot(IsNewYearEve ~ LogRoomRent  , data=hotels.df, horizontal=TRUE,
       xlab = "Log Room Rent")


#with respec to new year
bwplot(IsTouristDestination ~ LogRoomRent  , data=hotels.df, horizontal=TRUE,
       xlab = "Log Room Rent")
#with respec to new year
bwplot(IsTouristDestination ~ LogRoomRent | IsMetroCity , data=hotels.df, horizontal=TRUE,
       xlab = "Log Room Rent")



#Distance to Airport vs logRoomRent
hist(hotels.df$Airport)
plot(hotels.df$Airport,hotels.df$LogRoomRent, log = 'xy')
plot(hotels.df$Airport[hotels.df$Airport<=20],hotels.df$LogRoomRent[hotels.df$Airport<=20])
airportDist.df <- aggregate(logRoomRent ~ Airport, data=hotels.df, mean)
airportDist.df
plot(airportDist.df)
abline(lm(airportDist.df$Airport~airportDist.df$logRoomRent ))
library(car)
scatterplotMatrix(formula = ~ Airport+LogRoomRent,
                  cex=0.6,data=hotels.df)


#Free Wi-Fi vs Room Rent
hist(hotels.df$FreeWifi)
HotelWithFreeWifi.df <-xtabs(~hotels.df$FreeWifi)
prop.table(HotelWithFreeWifi.df)*100
bwplot(FreeWifi ~ LogRoomRent  , data=hotels.df, horizontal=TRUE,
       xlab = "Log Room Rent")
library(car)
scatterplotMatrix(formula = ~ FreeWifi+LogRoomRent,
                  cex=0.6,data=hotels.df)


# Free Breakfast vs Room Rent
bwplot(FreeBreakfast ~ LogRoomRent  , data=hotels.df, horizontal=TRUE,
       xlab = "Log Room Rent")
HotelWithFreeBreakfast.df <-xtabs(~hotels.df$FreeBreakfast)
prop.table(HotelWithFreeBreakfast.df)*100
library(car)
scatterplotMatrix(formula = ~ FreeBreakfast+LogRoomRent,
                  cex=0.6,data=hotels.df)




#Hotel Capacity vs Room Rent
hotelCap.df <-  aggregate(logRoomRent ~ HotelCapacity, data=hotels.df, mean)
hotelCap.df
plot(hotelCap.df)
abline(lm(hotelCap.df$logRoomRent~hotelCap.df$HotelCapacity ))
hist(hotels.df$HotelCapacity)
library(car)
scatterplotMatrix(formula = ~ HotelCapacity+LogRoomRent,
                  cex=0.6,data=hotels.df)





#########################Hypothesis Testing#############################

#2.3.1
library(car)
scatterplotMatrix(formula = ~ CityRank+LogRoomRent,
                  cex=0.6,data=hotels.df)

t.test(hotels.df$LogRoomRent~hotels.df$CityRank, alternative = c("two.sided"), var.equal= TRUE )
RoomRent_CityRank <- xtabs(hotels.df$LogRoomRent~hotels.df$CityRank)
RoomRent_CityRank
chisq.test(RoomRent_CityRank)





#2.3.2
library(car)
scatterplotMatrix(formula = ~ IsMetroCity+LogRoomRent,
                  cex=0.6,data=hotels.df)
describe(hotels.df$IsMetroCity)
describe(hotels.df$LogRoomRent)
t.test(hotels.df$LogRoomRent~hotels.df$IsMetroCity, alternative = c("two.sided"), var.equal= FALSE)



#2.3.3
library(car)
scatterplotMatrix(formula = ~ HotelCapacity+LogRoomRent,
                  cex=0.6,data=hotels.df)
RoomRent_HotelCap <- xtabs(hotels.df$LogRoomRent~hotels.df$HotelCapacity)
RoomRent_HotelCap
chisq.test(RoomRent_HotelCap)




#2.3.4
library(car)
scatterplotMatrix(formula = ~ IsTouristDestination+LogRoomRent,
                  cex=0.6,data=hotels.df)
describe(hotels.df$LogRoomRent)
describe(hotels.df$IsTouristDestination)
t.test(hotels.df$LogRoomRent~hotels.df$IsTouristDestination, alternative = c("two.sided"), var.equal= FALSE)



############## Linear Models #######################
lm1 <- lm(LogRoomRent ~ IsWeekend+IsNewYearEve+CityRank+
            IsMetroCity+IsTouristDestination
          +Airport+FreeWifi+FreeBreakfast+HotelCapacity+
            HasSwimmingPool+StarRating,data = hotels.df)
summary(lm1)


lm2 <- lm(LogRoomRent ~ IsNewYearEve+CityRank+IsTouristDestination
          +Airport+FreeBreakfast+HotelCapacity+HasSwimmingPool
          +FreeWifi+StarRating,data = hotels.df)
summary(lm2)



confint(lm1)
confint(lm2)
var(hotels.df)
cor(hotels.df$LogRoomRent,hotels.df$Population)
cor(hotels.df$LogRoomRent, hotels.df$HotelCapacity)

library(corrgram)  
corrgram(hotels.df, order=FALSE, lower.panel=panel.shade,
         upper.panel=panel.pie, text.panel=panel.txt,
         main="Corrgram of Hotel Data")



lm3<- lm(LogRoomRent ~ HotelCapacity+HasSwimmingPool
         +StarRating,data = hotels.df)
summary(lm3)


lm4 <- lm(LogRoomRent ~ IsNewYearEve+CityRank+IsTouristDestination
          +Airport+FreeBreakfast+HasSwimmingPool
          +FreeWifi+StarRating,data = hotels.df)
summary(lm4)

