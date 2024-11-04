#### Preamble ####
# Purpose: Cleans the raw polling data for analysis in the US presidential election prediction
# Author: Victor Ma
# Date: 4 November 2024
# Contact: victo.ma@mail.utoronto.ca
# License: MIT
# Pre-requisites: The `tidyverse` package must be installed
###################

library(dplyr)
library(readr)

# Load the raw polling data
polls_data <- read_csv("data/01-raw_data/president_polls.csv")

# Filter for general election data, select relevant columns, and remove duplicates
polls_data_cleaned <- polls_data %>%
  filter(stage == "general") %>%
  select(pollster, pollster_rating_name, sample_size, candidate_name, pct) %>%
  distinct()

# Filter pct values to retain only those between 40 and 60
polls_data_cleaned <- polls_data_cleaned %>%
  filter(pct >= 40, pct <= 60)

# Handle missing values in sample_size by filling with the median
polls_data_cleaned$sample_size[is.na(polls_data_cleaned$sample_size)] <- median(polls_data_cleaned$sample_size, na.rm = TRUE)

# Save the cleaned data for analysis
write.csv(polls_data_cleaned, "data/02-analysis_data/cleaned_polls_data.csv", row.names = FALSE)
