#### Preamble ####
# Purpose: Replicates the analysis on new data or additional datasets for the US presidential election prediction
# Author: Victor Ma
# Date: 4 November 2024
# Contact: victo.ma@mail.utoronto.ca
# License: MIT
# Pre-requisites: The `tidyverse` package must be installed
###################

library(dplyr)

# Load the original GLM model
glm_model <- readRDS("models/first_model.rds")

# Load new polling data if available
new_data <- read.csv("data/00-simulated_data/simulated_data.csv")

# Prepare new data similarly to the original analysis
new_data <- new_data %>%
  mutate(votes_for = round(pct * sample_size / 100),
         votes_against = sample_size - votes_for)

# Predict using the existing model
predicted <- predict(glm_model, newdata = new_data, type = "response")

# Print predictions
print(predicted)
