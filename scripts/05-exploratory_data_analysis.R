#### Preamble ####
# Purpose: Performs exploratory data analysis on the cleaned polling data for US presidential election prediction
# Author: Victor Ma
# Date: 4 November 2024
# Contact: victo.ma@mail.utoronto.ca
# License: MIT
# Pre-requisites: The `tidyverse` package must be installed
###################

library(ggplot2)
library(dplyr)

# Load cleaned data
polls_data <- read.csv("data/02-analysis_data/cleaned_polls_data.csv")

# Summary statistics
polls_summary <- polls_data %>%
  group_by(candidate_name) %>%
  summarise(avg_support = mean(pct, na.rm = TRUE))

print(polls_summary)

# Plot support trends for each candidate
ggplot(polls_data, aes(x = candidate_name, y = pct, fill = candidate_name)) +
  geom_boxplot() +
  labs(title = "Candidate Support Distribution", x = "Candidate", y = "Support Percentage") +
  theme_minimal()
