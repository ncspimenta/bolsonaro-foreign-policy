# ───────────────────────────────────────────────────────
# Script: 02-data-cleaning-P8.R
# This script prepares the data for analysis by standardizing the response categories from question P8 (approval of the government, pt. 2)
# Author: Natália Pimenta
# Date: 2025-04-16
# ───────────────────────────────────────────────────────

# Cleaning P8 ("How do you evaluate the performance of the Federal Government?")

library(dplyr)
library(forcats)
library(readr)

dados_unificados <- dados_unificados %>%
  mutate(
    p8_clean = case_when(
      # Values that appear as text:
      P8 == "Ótimo" ~ "Excellent",
      P8 == "Bom" ~ "Good",
      P8 == "Regular" ~ "Fair",
      P8 == "Ruim" ~ "Poor",
      P8 == "Péssimo" ~ "Very Poor",
      P8 == "Não respondeu (NÃO LER)" ~ "Didn't answer",
      P8 == "Não sabe (NÃO LER)" ~ "Doesn't know",
      
      # Numeric values:
      P8 == "1" ~ "Excellent",
      P8 == "2" ~ "Good",
      P8 == "3" ~ "Fair",
      P8 == "4" ~ "Poor",
      P8 == "5" ~ "Very Poor",
      P8 == "6" ~ "Doesn't know",   # originally coded as 98
      P8 == "7" ~ "Didn't answer",  # originally coded as 99
      
      TRUE ~ NA_character_
    ),
    p8_clean = factor(
      p8_clean,
      levels = c("Excellent", "Good", "Fair", "Poor", "Very Poor", "Didn't answer", "Doesn't know")
    )
  )

# Creating weekly relative frequency table

p8_by_week <- dados_unificados %>%
  filter(!is.na(p8_clean)) %>%
  group_by(semana, p8_clean) %>%
  summarise(respondentes = n(), .groups = "drop") %>%
  group_by(semana) %>%
  mutate(prop = respondentes / sum(respondentes)) %>%
  ungroup()

if (!dir.exists("data/clean")) {
  dir.create("data/clean", recursive = TRUE)
}

readr::write_csv(p8_by_week, "data/clean/p8_by_week.csv")