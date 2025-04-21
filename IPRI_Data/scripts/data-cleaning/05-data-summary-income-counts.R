# ─────────────────────────────────────────────────────────────
# Script: 05-data-summary-income-counts.R
# This script calculates the number of respondents in each week 
# by income group: above or below 10 minimum wages (PF14).
# Week 11 correction: PF14 is replaced by PF12 due to a labeling issue.
# Author: Natália Pimenta
# Date: 2025-04-21
# ─────────────────────────────────────────────────────────────

library(dplyr)
library(readr)

# Fix PF14 for week 11
dados_unificados <- dados_unificados %>%
  mutate(PF14 = ifelse(semana == 11, PF12, PF14))

# Define income groups
dados_unificados <- dados_unificados %>%
  mutate(
    income_group = case_when(
      PF14 %in% c(
        "Até R$ 1.212,00 (até 1 SM)",
        "De R$ 1.212,01 a R$ 2.424,00 (mais de 1 até 2 SM)",
        "De R$ 2.424,01 a R$ 6.060,00 (mais de 2 até 5 SM)",
        "De R$ 6.060,01 a R$ 12.120,00 (mais de 5 até 10 SM)",
        "1", "2", "3", "4"
      ) ~ "Low income",
      PF14 %in% c("Mais de R$ 12.120,01 (mais de 10 SM)", "5") ~ "High income",
      TRUE ~ NA_character_
    )
  )

# Count number of respondents by week and income group
respondents_by_income <- dados_unificados %>%
  filter(!is.na(income_group)) %>%
  group_by(semana, income_group) %>%
  summarise(n = n(), .groups = "drop") %>%
  tidyr::pivot_wider(names_from = income_group, values_from = n, values_fill = 0)

# Save to CSV
if (!dir.exists("data/clean")) {
  dir.create("data/clean", recursive = TRUE)
}

readr::write_csv(respondents_by_income, "data/clean/respondents_by_income_group.csv")