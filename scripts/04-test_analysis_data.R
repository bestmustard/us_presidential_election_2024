#### Preamble ####
# Purpose: Tests the cleaned data for consistency and any issues in the US presidential election prediction dataset
# Author: Victor Ma
# Date: 4 November 2024
# Contact: victo.ma@mail.utoronto.ca
# License: MIT
# Pre-requisites: The `tidyverse` package must be installed
###################

library(dplyr)

# Load cleaned data
cleaned_data <- read.csv("data/02-analysis_data/cleaned_polls_data.csv")

# Basic structure check
str(cleaned_data)

# Verify no missing values
if(any(is.na(cleaned_data))) {
  print("Warning: Missing values detected in cleaned data.")
} else {
  print("Cleaned data is complete with no missing values.")
}

# Check value ranges for percentages
if(all(cleaned_data$pct >= 0 & cleaned_data$pct <= 100)) {
  print("Percentages are within valid range (0-100).")
} else {
  print("Warning: Percentages outside valid range detected.")
}
