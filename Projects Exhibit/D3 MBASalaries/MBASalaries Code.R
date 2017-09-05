

#Set WD
setwd("C:/Users/Nikki/Desktop/James/Data Science Internship/Assignments/Projects/MBASalaries")

#Read CSV
MBASal.df <- read.csv(paste("MBA Starting Salaries Data.csv", sep=""))
attach(MBASal.df)
View(MBASal.df)


#Summary Stats
library(psych)
describe(MBASal.df)
summary(MBASal.df)


#BoxPlots
boxplot(MBASal.df$age , horizontal=TRUE, las=1)
boxplot(MBASal.df$sex , horizontal=TRUE, las=1)
boxplot(MBASal.df$gmat_tot , horizontal=TRUE, las=1)
boxplot(MBASal.df$gmat_qpc , horizontal=TRUE, las=1)
boxplot(MBASal.df$gmat_vpc , horizontal=TRUE, las=1)
boxplot(MBASal.df$gmat_tpc , horizontal=TRUE, las=1)
boxplot(MBASal.df$s_avg , horizontal=TRUE, las=1)
boxplot(MBASal.df$f_avg , horizontal=TRUE, las=1)
boxplot(MBASal.df$quarter , horizontal=TRUE, las=1)
boxplot(MBASal.df$work_yrs , horizontal=TRUE, las=1)
boxplot(MBASal.df$frstlang , horizontal=TRUE, las=1)
boxplot(MBASal.df$salary , horizontal=TRUE, las=1)
boxplot(MBASal.df$satis , horizontal=TRUE, las=1)





#Scatter Plot Matrix
library(car)
scatterplotMatrix(formula = ~ age+sex+gmat_tot+gmat_qpc+gmat_vpc+gmat_tpc+s_avg+f_avg+
                    quarter+work_yrs+frstlang+salary+satis, cex=0.6,
                  data=MBASal.df) 
### All variables seem to be normally distributed according to the Scatter Plot Matrix.
### Categorical data seem to be skewed or have multiple normal curves directly propotional to the 
### number of sub catergories for each category. Ex: There are 4 normal curves for the Satisfactoin Distribution
### Very few linear relationships esist according to the Scatter plot Matrix. Most of those that do exist have
### very weak correlation i.e. close to zero. The strongest corelation seems to between age and work experience
### which intiutively does make a lot of sense.



#Corrgram
library(corrgram)  # install if needed
corrgram(MBASal.df, order=FALSE, lower.panel=panel.shade,
         upper.panel=panel.pie, text.panel=panel.txt,
         main="Corrgram of MBASalaries")


#Variance-Covariance Matrix
cov(MBASal.df)
var(MBASal.df)


#Subset of those who got placed
placed.df <- MBASal.df[ which(MBASal.df$salary!= '998' & MBASal.df$salary != '999' 
                              &MBASal.df$salary != '0') , ]
head(placed.df)


#Placed BoxPlots
boxplot(placed.df$salary~placed.df$sex,main = "Placed Salaries", xlab = "Sex"
        ,col = (c("green","red")), ylab = "Salary")
boxplot(placed.df$gmat_tot~placed.df$sex,main = "Placed GMAT Total", xlab = "Sex"
        ,col = (c("green","red")), ylab = "Scores")
boxplot(placed.df$gmat_qpc~placed.df$sex,main = "Placed GMAT Quant Percentile", xlab = "Sex"
        ,col = (c("green","red")), ylab = "Scores")
boxplot(placed.df$gmat_vpc~placed.df$sex,main = "Placed GMAT Verbal Percentile", xlab = "Sex"
        ,col = (c("green","red")), ylab = "Scores")
boxplot(placed.df$gmat_tpc~placed.df$sex,main = "Placed GMAT Total Percentile", xlab = "Sex"
        ,col = (c("green","red")), ylab = "Scores")
boxplot(placed.df$age~placed.df$sex,main = "Placed Age  vs Sex", xlab = "Sex"
        ,col = (c("green","red")), ylab = "Age")
boxplot(placed.df$work_yrs~placed.df$sex,main = "Placed Work Experience", xlab = "Sex"
        ,col = (c("green","red")), ylab = "Years")
#boxplot(placed.df$frstlang~placed.df$sex,main = "Placed First Language", xlab = "Sex"
      #  ,col = (c("green","red")), ylab = "Years")



#Contingency Tables and Proportions
library(gmodels) # ensure that this package is installed
CrossTable(placed.df$sex, placed.df$satis)
CrossTable(placed.df$sex, placed.df$frstlang)
meanSalary.tab <- aggregate(salary~sex, data=placed.df, mean)
meanSalary.tab
meanGMAT_QPC.tab <- aggregate(gmat_qpc ~ sex, data=placed.df, mean)
meanGMAT_QPC.tab
meanGMAT_TOT.tab <- aggregate(gmat_tot ~ sex, data=placed.df, mean)
meanGMAT_TOT.tab
meanGMAT_TPC.tab <- aggregate(gmat_tpc~ sex, data=placed.df, mean)
meanGMAT_TPC.tab
meanGMAT_VPC.tab <- aggregate(gmat_vpc~ sex, data=placed.df, mean)
meanGMAT_VPC.tab
meanS_AVG.tab <- aggregate(s_avg~ sex, data=placed.df, mean)
meanS_AVG.tab
meanF_AVG.tab <- aggregate(f_avg~ sex, data=placed.df, mean)
meanF_AVG.tab


meanQuarter.tab <- aggregate(quarter~ sex, data=placed.df, mean)
meanQuarter.tab
CrossTable(placed.df$sex, placed.df$quarter)

meanWorkYrs.tab <- aggregate(work_yrs~ sex, data=placed.df, mean)
meanWorkYrs.tab

### Very few males and females who got placed and whose first language is not English.
### Men Exhibit higher levels of satistfaction in the 5,6,7 categories relative 
### to Woman in the same category, but it is due to the fact that there are more Men than
### Woman in the data set who got placed.
### Men have a much higher average starting salary than Woman.
### Men have a higher average GMAT quantitative percentile
### Both Men and Woman have about the same average GMAT Total Scores, Men having a slightly higher 
### score.
### Both Men and Woman have about the same average GMAT Total Percentile, Men having a slightly
### higher percentile score.
### Both Men and Woman have about the same GMAT Verbal Percentile, Woman having a slightly higher
### score.
### Both Men and Woman have a about the same average Spring scores, Woman having a slightly higher 
### score.
### Both Men and Woman have a about the same average Fall scores, Woman having a slightly higher 
### score.
### The proportion of 1,2,3,4 quartiles among males and females is about the same.
### Men have a higher average Work Years experience.




#LinearRegression Model. StartSal= 
StartSalLM <- lm(salary~sex+gmat_qpc+gmat_tot+gmat_tpc+gmat_vpc+s_avg+f_avg
                 +quarter+work_yrs+frstlang+satis, data = MBASal.df)
StartSalLM

### Second Linear Model(StartSalLM_2) is based on the findings from CrossTable and aggregate functions.
StartSalLM_2 <- lm(salary~sex+gmat_qpc+gmat_tot+gmat_tpc+gmat_vpc
                   +quarter+work_yrs+frstlang, data = MBASal.df)
StartSalLM_2



#Checking the Accuracy of Linear Models 1 and 2
confint(StartSalLM)
summary(StartSalLM)
confint(StartSalLM_2)
summary(StartSalLM_2)


boxplot(placed.df$salary,main = "Placed Salaries", xlab = "Sex"
        ,col = (c("green")), ylab = "Salary")
boxplot(placed.df$salary~placed.df$sex,main = "Placed Salaries", xlab = "Sex"
        ,col = (c("green","red")), ylab = "Salary")
library(psych)
describe(placed.df)




#Constructing Linear Model 3 based on the above findings
StartSalLM_3 <-lm(salary~sex+gmat_tot+gmat_tpc
                  +quarter+work_yrs+frstlang, data = MBASal.df)
StartSalLM_3

summary(StartSalLM_3)


### Since the Second Linear Model(StartSalLM_2) has the largest P-Value(0.0725) it is the most accurate. The first 
### linear model with a very small P-Value is the least accurate. Also, it 
### has been constructed on the earlier findings. Hence the dependent variables have been choosen
### as per the relavant previous findings.



fitted(StartSalLM)
fitted(StartSalLM_2)
fitted(StartSalLM_3)

residuals(StartSalLM)
residuals(StartSalLM_2)
residuals(StartSalLM_3)

mean(residuals(StartSalLM))
mean(residuals(StartSalLM_2))
mean(residuals(StartSalLM_3))


### The Second Linear Model(StartSalLM_2) also has the samllest mean error value of the Three linear models.

### There is strong evidence to suggest sex, gmat_qpc, gmat_tot, gmat_tpc, gmat_vpc,
### quarter, work_yrs, frstlang are important predictors for the starting salary. 
### The higher wages for Men can be explained by the fact that men in this data set on average are 
### older than woman and as result also have higher average work experience, all else equal(almost equal)
### men end up earning higher higher due to their higher average work experience.

t.test(placed.df$salary~placed.df$sex)
t.test(placed.df$age~placed.df$sex)
t.test(placed.df$work_yrs~placed.df$sex)


### According to the t-Tests on lines 201-203 there is evidence to suggest, the means of salary, age and work 
### experience differ between men and woman.




######################
######Not Placed######
######################




#Subset of those who got placed
NotPlaced.df <- MBASal.df[ which(MBASal.df$salary!= '998' & MBASal.df$salary != '999' 
                              & MBASal.df$salary == '0') , ]
head(NotPlaced.df)


boxplot(NotPlaced.df$salary~NotPlaced.df$sex,main = "Not Placed Salaries", xlab = "Sex"
        ,col = (c("green","red")), ylab = "Salary")
boxplot(NotPlaced.df$gmat_tot~NotPlaced.df$sex,main = "Not Placed GMAT Total", xlab = "Sex"
        ,col = (c("green","red")), ylab = "Scores")
boxplot(NotPlaced.df$gmat_qpc~NotPlaced.df$sex,main = "Not Placed GMAT Quant Percentile", xlab = "Sex"
        ,col = (c("green","red")), ylab = "Scores")
boxplot(NotPlaced.df$gmat_vpc~NotPlaced.df$sex,main = "Not Placed GMAT Verbal Percentile", xlab = "Sex"
        ,col = (c("green","red")), ylab = "Scores")
boxplot(NotPlaced.df$gmat_tpc~NotPlaced.df$sex,main = "Not Placed GMAT Total Percentile", xlab = "Sex"
        ,col = (c("green","red")), ylab = "Scores")
boxplot(NotPlaced.df$age~NotPlaced.df$sex,main = "Not Placed Age  vs Sex", xlab = "Sex"
        ,col = (c("green","red")), ylab = "Age")
boxplot(NotPlaced.df$work_yrs~NotPlaced.df$sex,main = "Not Placed Work Experience", xlab = "Sex"
        ,col = (c("green","red")), ylab = "Years")




### Comparing the box plots of work experience between men and woman between those who were placed 
### and thos who were not, one can conluded work experience is not a that big of a determining factor.



#Check to see if English plays a determining factor btw placed and not placed.

library(lattice)
histogram(~frstlang | sex, data=NotPlaced.df)
histogram(~frstlang | sex, data=placed.df)

### This data set does not allow us to investigate what role the first language plays since an overwhelming
### majority in this data set have English as their first language. Hence this is data set is biased.



#Chi Square Test
mytable <- xtabs(~ sex, data=NotPlaced.df)
mytable
chisq.test(mytable)

mytable <- xtabs(~ sex, data=placed.df)
mytable
chisq.test(mytable)


### According to Chi Quare Tests on lines 262-268 we reject the Null Hypothesis that sex is an 
### independent factor for both being placed and not being placed.




# Scatter Plots
plot(x=placed.df$age,y=placed.df$salary)
plot(x=placed.df$sex,y=placed.df$salary)
plot(x=placed.df$gmat_tot,y=placed.df$salary)
plot(x=placed.df$gmat_qpc,y=placed.df$salary)
plot(x=placed.df$gmat_vpc,y=placed.df$salary)
plot(x=placed.df$gmat_tpc,y=placed.df$salary)
plot(x=placed.df$s_avg,y=placed.df$salary)
plot(x=placed.df$f_avg,y=placed.df$salary)
plot(x=placed.df$quarter,y=placed.df$salary)
plot(x=placed.df$work_yrs,y=placed.df$salary)
plot(x=placed.df$frstlang,y=placed.df$salary)












