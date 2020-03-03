# Exercise 8
# (a)
# Set dir and grab data
setwd("~/Desktop/stanford-statistical-learning/ch2-overview-of-statistical-learning/2.4-exercises/")
college = read.csv("../../data/College.csv")

# (b)
# Fix rownames for first column 
rownames(college) = college[,1]
# Eliminate first column
college = college[,-1]

# (c)
# i. Show summary of variables in data
summary(college)

# ii. Produce scatterplot of first ten columns with pairs()
pairs(college[,1:10])

# iii. Create boxplot of Private vs Out of state
boxplot(Outstate~Private, data=college, xlab="Private", ylab="Outstate")

# iv. Create boxplot of Elite vs Out of state
Elite=rep("No",nrow(college))
Elite[college$Top10perc >50]="Yes"
Elite=as.factor(Elite)
college=data.frame(college ,Elite)
boxplot(Outstate~Elite, data=college, xlab="Elite", ylab="Outstate")

# v. Create histograms
par(mfrow=c(2,2))
hist(college$Apps, breaks=50, xlim=c(0,25000), main="Apps")
hist(college$Enroll, breaks=25, main="Enroll")
hist(college$Expend, breaks=25, main="Expend")
hist(college$Outstate, main="Outstate")

