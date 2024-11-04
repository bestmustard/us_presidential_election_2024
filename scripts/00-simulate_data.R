#### Preamble ####
# Purpose: Simulates a dataset of US presidential election
# Author: Victor Ma
# Date: 4 November 2024
# Contact: victo.ma@mail.utoronto.ca
# License: MIT
# Pre-requisites: The `tidyverse` package must be installed
# Any other information needed? Make sure you are in the `starter_folder` rproj


#### Workspace setup ####
library(tidyverse)

set.seed(123)

# Generate simulated polling data
simulated_data <- data.frame(
  poll_id = 1:100,
  pollster = sample(c("Pollster A", "Pollster B", "Pollster C"), 100, replace = TRUE),
  sample_size = sample(500:2000, 100, replace = TRUE),
  candidate_name = sample(c("Candidate A", "Candidate B"), 100, replace = TRUE),
  pct = runif(100, 40, 60)
)

# Save simulated data to CSV
write.csv(simulated_data, "data/00-simulated_data/simulated_data.csv", row.names = FALSE)
