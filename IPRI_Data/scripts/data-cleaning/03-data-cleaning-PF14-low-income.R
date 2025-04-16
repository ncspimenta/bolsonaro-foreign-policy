# ─────────────────────────────────────────────────────────────
# Script: 03-data-cleaning-PF14-low-income.R
# This script filters the unified dataset to include only individuals
# with income up to 10 minimum wages/month (PF14) and creates a weekly 
# relative frequency table of government opinion (P9).
# Week 11 correction: PF14 is replaced by PF12 due to a labeling issue.
# Author: Natália Pimenta
# Date: 2025-04-16
# ─────────────────────────────────────────────────────────────

library(dplyr)
library(readr)

# Fix income variable in week 11

dados_unificados<- dados_unificados %>%
  mutate(
    PF14 = ifelse(semana == 11, PF12, PF14)
  )

# Note: In Week 11, the income data was mistakenly recorded in PF12 instead of PF14.
# We corrected this by replacing PF14 with PF12 exclusively for that week.

# Recode P9 into English categories

dados_unificados <- dados_unificados %>%
  mutate(
    opinion_clean = case_when(
      P9 == "Aprova" | P9 == "1" ~ "Approves",
      P9 == "Desaprova" | P9 == "2" ~ "Disapproves",
      P9 == "Não sabe (NÃO LER)" | P9 == "3" ~ "Doesn't know",  # 3 == 98
      P9 == "Não respondeu (NÃO LER)" | P9 == "4" ~ "Didn't answer", # 4 == 99
      TRUE ~ NA_character_
    )
  )

# Keep only respondents with income up to 10 SM (excluding 'sem rendimento' and other missing/refusal responses from PF14)

income_filter <- c(
  "Até R$ 1.212,00 (até 1 SM)",
  "De R$ 1.212,01 a R$ 2.424,00 (mais de 1 até 2 SM)",
  "De R$ 2.424,01 a R$ 6.060,00 (mais de 2 até 5 SM)",
  "De R$ 6.060,01 a R$ 12.120,00 (mais de 5 até 10 SM)",
  "1", "2", "3", "4"
)

dados_filtrados_renda <- dados_unificados %>%
  filter(PF14 %in% income_filter)

# Note: Respondents with no income ("Sem rendimento") were excluded due to ambiguity in interpretation:
# while this group may include poor people, it can also include students, homemakers, or others without income, which can introduce bias.

# Create weekly frequency table

opinion_by_week_income_filtered <- dados_filtrados_renda %>%
  filter(!is.na(opinion_clean)) %>%
  group_by(semana, opinion_clean) %>%
  summarise(respondentes = n(), .groups = "drop") %>%
  group_by(semana) %>%
  mutate(prop = respondentes / sum(respondentes)) %>%
  ungroup()

if (!dir.exists("data/clean")) {
  dir.create("data/clean", recursive = TRUE)
}

write_csv(opinion_by_week_income_filtered, "data/clean/opinion_by_week_income_filtered.csv")