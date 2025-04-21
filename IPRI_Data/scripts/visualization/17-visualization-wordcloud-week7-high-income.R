# ──────────────────────────────────────────────────────────────────
# Script: 17-visualization-wordcloud-week7-high-income.R
# Generates a wordcloud of responses to open-ended questions
# (P01 and P02) from Week 7 of the IPRI survey, filtered to 
# include only respondents earning more than 10 minimum wages (PF14).
# Cleans and merges all relevant columns and filters out 
# generic or non-substantive responses.
# Author: Natália Pimenta
# Date: 2025-04-21
# ──────────────────────────────────────────────────────────────────

library(readxl)
library(dplyr)
library(tidyr)
library(tidytext)
library(wordcloud)
library(RColorBrewer)
library(stringr)
library(tm)

# Load Week 7 data
bd7 <- read_excel("data/raw/ipri_weekly_survey_data/BD 7.xlsx")

# Fix income variable (PF14 may need harmonization if issues arise)
# Select only high-income respondents (more than 10 SM)
high_income_values <- c("Mais de R$ 12.120,01 (mais de 10 SM)", "5")
bd7_high_income <- bd7 %>%
  filter(PF14 %in% high_income_values)

# Select open-ended response columns for P01 and P02
respostas_p7_high <- bd7_high_income %>%
  select(`P1_Out#1`, `P2_Out#1`)

# Combine into single text vector
texto_completo <- respostas_p7_high %>%
  mutate_all(as.character) %>%
  unite("resposta_total", everything(), sep = " ", na.rm = TRUE)

# Tokenize and clean
tokens <- texto_completo %>%
  unnest_tokens(word, resposta_total) %>%
  filter(
    !word %in% stopwords("pt"),
    !word %in% c("outros", "anotar", "respondeu", "ler", "nenhuma", "sabe",
                 "nao", "nr", "nh", "sobre", "pra", "sao", "so", "d", "ser"),
    str_detect(word, "[a-z]")
  )

# Count frequencies
frequencia <- tokens %>%
  count(word, sort = TRUE)

# Plot wordcloud
wordcloud(
  words = frequencia$word,
  freq = frequencia$n,
  min.freq = 1,
  max.words = 100,
  random.order = FALSE,
  colors = brewer.pal(8, "Dark2"),
  scale = c(2.4, 0.8)
)