getwd()
dataset=read.csv('Data.csv')
setwd('C:/Users/kthakkar/Desktop/Machine_Learning_AZ_Template_Folder/Machine Learning A-Z Template Folder/Part 1 - Data Preprocessing/Data_Preprocessing/Data_Preprocessing')
dataset$Age=ifelse(is.na(dataset$Age), ave(dataset$Age, FUN = function(x) mean(x, na.rm = TRUE)),dataset$Age)
dataset$Salary=ifelse(is.na(dataset$Salary),ave(dataset$Salary, FUN = function(x)mean(x, na.rm = TRUE)),dataset$Salary)
?ave
?na.rm
#labeling
dataset$Country=factor(dataset$Country, levels = c("France","Spain","Germany"), labels = c(1,2,3))
dataset$Purchased=factor(dataset$Purchased, levels = c("Yes","No"), labels = c(1,0))

#splitting into test and training set

#install.packages('caTools')
?set.seed
?sample.split
split=sample.split(dataset$Purchased, SplitRatio = 0.8)
trainingSet=subset(dataset,split==TRUE)
testSet=subset(dataset,split==FALSE)


#feature scaling
trainingSet[,2:3]= scale(trainingSet[,2:3])
testSet[,2:3]=scale(testSet[,2:3])
