# ───────────────────────────────────────────────────────
# Script: 01-data-cleaning-P9.R
# This script prepares the data for analysis by unifying all weekly Excel files
# and standardizing the response categories from question P9 (approval of the government)
# Author: Natália Pimenta
# Date: 2025-04-15
# ───────────────────────────────────────────────────────

# Unifying files

library(readxl)
library(dplyr)
library(stringr)
library(purrr)

caminho <- "data/raw/ipri_weekly_survey_data"

arquivos <- list.files(path = caminho, pattern = "\\.xlsx$", full.names = TRUE)
arquivos <- arquivos[grepl("BD \\d+\\.xlsx$", arquivos)]



glimpse(dados_unificados)

# Cleaning P9 ("Do you approve or disapprove of the Federal Government's performance?")

library(forcats)
library(readr)

dados_unificados <- dados_unificados %>%
  mutate(
    opinion_clean = case_when(
      # Cases where P9 appears as text (majority of the weekly files)
      P9 == "Aprova" ~ "Approves",
      P9 == "Desaprova" ~ "Rejects",
      P9 == "Não sabe (NÃO LER)" ~ "Doesn't know",
      P9 == "Não respondeu (NÃO LER)" ~ "Didn't answer",
      
      # Numeric values found especially in Week 6:
      P9 == "1" ~ "Approves",
      P9 == "2" ~ "Rejects",
      P9 == "3" ~ "Doesn't know",  # originally coded as 98
      P9 == "4" ~ "Didn't answer", # originally coded as 99
      
      TRUE ~ NA_character_
    )
  )

# Creating weekly relative frequency table

opinion_by_week <- dados_unificados %>%
  filter(!is.na(opinion_clean)) %>%
  group_by(semana, opinion_clean) %>%
  summarise(respondentes = n(), .groups = "drop") %>%
  group_by(semana) %>%
  mutate(prop = respondentes / sum(respondentes)) %>%
  ungroup()

if (!dir.exists("data/clean")) {
  dir.create("data/clean", recursive = TRUE)
}

readr::write_csv(opinion_by_week, "data/clean/opinion_by_week.csv")