library(tidyverse)

Temp <- getwd()

setwd("./covid-19-data/")

COUNTIES <- read_csv("us-counties.csv")

setwd(Temp)
PA <- filter(COUNTIES, state=="Pennsylvania")
View(PA)

# Set n to legth of data set
n <- length(PA$date)

# Initialize new variable in data frame
PA$incr_cases <- 1
PA$incr_deaths <- 1

View(PA)

# Calculate values for other than first row using FOR loop

for (i in 2:n) {
  PA$incr_cases[i] <- (PA$cases[i]-PA$cases[i-1])
  PA$incr_deaths[i] <- (PA$deaths[i]-PA$deaths[i-1])
}

View(PA)

# Calculate and print standard deviation of incr_cases

sd_incr_cases <- sd(PA$incr_cases)
print(sd_incr_cases)


