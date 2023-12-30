library(tidyverse)
library(janitor)
library(scales)

# Turn scientific numbers off
options(scipen = 999)

# Data Loading ----

data_raw <- read_csv("data/data.csv")

# Data Cleaning ----


# select columns for analysis
data_selected <- data_raw |>
  clean_names() |>
  select(job_title, 
         search_keyword,
         category_1,
         category_2,
         payment_situation,
         client_country,
         new_connects_num,
         applicants_num,
         payment_type,
         job_cost,
         start_rate,
         end_rate)

# correct data types
data_selected$search_keyword <- factor(data_selected$search_keyword)

# Data cleaning ---

# Remove Fixed price Jobs where NAs are there
# Remove Hourly Jobs where NAs are there 
data_cleaned <- data_selected |>
  filter((!is.na(job_cost) & job_cost < 5000) | !is.na(end_rate))


# write cleaned data
write.csv(x = data_cleaned, file = "data/data_cleaned.csv")


