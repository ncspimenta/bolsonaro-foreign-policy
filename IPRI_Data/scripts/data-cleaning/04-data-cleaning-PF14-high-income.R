# ─────────────────────────────────────────────────────────────
# Script: 04-data-cleaning-PF14-high-income.R
# This script filters the unified dataset to include only individuals
# with income above 10 minimum wages/month (PF14) and creates a weekly 
# relative frequency table of government opinion (P9).
# Week 11 correction: PF14 is replaced by PF12 due to a labeling issue.
# Author: Natália Pimenta
# Date: 2025-04-16
# ─────────────────────────────────────────────────────────────

library(dplyr)
library(readr)
library(tidyr)

# Fix income variable in Week 11

dados_unificados <- dados_unificados %>%
  mutate(
    PF14 = ifelse(semana == 11, PF12, PF14)
  )

# Recode P9 into English categories

dados_unificados <- dados_unificados %>%
  mutate(
    opinion_clean = case_when(
      P9 == "Aprova" | P9 == "1" ~ "Approves",
      P9 == "Desaprova" | P9 == "2" ~ "Disapproves",
      P9 == "Não sabe (NÃO LER)" | P9 == "3" ~ "Doesn't know",     # 3 == 98
      P9 == "Não respondeu (NÃO LER)" | P9 == "4" ~ "Didn't answer", # 4 == 99
      TRUE ~ NA_character_
    )
  )

# Filter: Only individuals earning more than 10 minimum wages

income_high <- c("Mais de R$ 12.120,01 (mais de 10 SM)", "5")

dados_filtrados_alta_renda <- dados_unificados %>%
  filter(PF14 %in% income_high)

# Create weekly relative frequency table

opinion_by_week_income_high <- dados_filtrados_alta_renda %>%
  filter(!is.na(opinion_clean)) %>%
  group_by(semana, opinion_clean) %>%
  summarise(respondentes = n(), .groups = "drop") %>%
  complete(semana = 1:29, opinion_clean, fill = list(respondentes = 0)) %>%
  filter(semana %in% c(1, 6:29)) %>%
  group_by(semana) %>%
  mutate(prop = respondentes / sum(respondentes)) %>%
  ungroup()

write_csv(opinion_by_week_income_high, "data/clean/opinion_by_week_income_high.csv")