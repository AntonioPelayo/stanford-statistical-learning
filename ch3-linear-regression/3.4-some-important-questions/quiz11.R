# Set dir, grab credit data
setwd("~/Desktop/stanford-statistical-learning/ch3-linear-regression/3.4-some-important-questions/")
credit = read.csv("../../data/Credit.csv")

# Take a quick look at the data
plot(credit$Ethnicity, credit$Balance)

# Separate data frames for Asians and African Americans
creditAsian = credit[credit$Ethnicity == 'Asian', ]
creditAA = credit[credit$Ethnicity == 'African American', ]

# Calculate predicted balance for ethnicities (mean)
AsianBalance = mean(creditAsian$Balance)
AABalance = mean(creditAA$Balance)
