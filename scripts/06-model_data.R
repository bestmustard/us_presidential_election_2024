#### Preamble ####
# Purpose: Builds a generalized linear model (GLM) to predict the US presidential election outcome
# Author: Victor Ma
# Date: 4 November 2024
# Contact: victo.ma@mail.utoronto.ca
# License: MIT
# Pre-requisites: The `tidyverse` package must be installed
# Any other information needed? Make sure you are in the `starter_folder` rproj
###################

library(dplyr)

# Load the cleaned data
polls_data <- read.csv("data/02-analysis_data/cleaned_polls_data.csv")

# Handle missing values in sample_size
polls_data$sample_size[is.na(polls_data$sample_size)] <- median(polls_data$sample_size, na.rm = TRUE)

# Ensure pct values are on a 0–100 scale
polls_data$pct <- ifelse(polls_data$pct == 1, 100, polls_data$pct)

# Set up response variables based on adjusted pct values
polls_data <- polls_data %>%
  mutate(votes_for = round(pct * sample_size / 100),
         votes_against = sample_size - votes_for)

# Set factor levels for pollster_rating_name to match those expected in the model
# (This step is only necessary if your model uses pollster_rating_name as a factor)
polls_data$pollster_rating_name <- as.factor(polls_data$pollster_rating_name)

# Fit the GLM model with a logit link function
glm_model <- glm(cbind(votes_for, votes_against) ~ pollster_rating_name + sample_size, 
                 data = polls_data, 
                 family = binomial(link = "logit"))

# Save the newly created model
saveRDS(glm_model, "models/first_model.rds")

# Display summary of the model
summary(glm_model)
