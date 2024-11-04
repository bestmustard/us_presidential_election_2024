#### Preamble ####
# Purpose: Tests the missing values or data in the us presidential election
# Author: Victor Ma
# Date: 4 November 2024
# Contact: victo.ma@mail.utoronto.ca
# License: MIT
# Pre-requisites: The `tidyverse` package must be installed
# Any other information needed? Make sure you are in the `starter_folder` rproj


#### Workspace setup ####
library(tidyverse)
library(dplyr)

# Load simulated data
simulated_data <- read.csv("data/00-simulated_data/simulated_data.csv")

# Check data structure
str(simulated_data)

# Check for any missing values
if(any(is.na(simulated_data))) {
  print("There are missing values in the simulated data.")
} else {
  print("No missing values detected in simulated data.")
}

# Summarize simulated data
summary(simulated_data)
