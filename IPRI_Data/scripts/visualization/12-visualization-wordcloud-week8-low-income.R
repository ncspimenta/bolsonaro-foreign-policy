# ─────────────────────────────────────────────────────────────
# Script: 12-visualization-wordcloud-week8-low-income.R
# Generates a wordcloud of responses to open-ended questions
# (P01 and P02) from Week 8 of the IPRI survey, limited to
# respondents earning up to 10 minimum wages per month (PF14).
# Cleans and merges all relevant columns and filters out
# generic or non-substantive responses.
# Author: Natália Pimenta
# Date: 2025-04-21
# ─────────────────────────────────────────────────────────────

library(readxl)
library(dplyr)
library(tidyr)
library(tidytext)
library(wordcloud)
library(RColorBrewer)
library(stringr)
library(tm)

# Load data for Week 8
bd8 <- read_excel("data/raw/ipri_weekly_survey_data/BD 8.xlsx")

# Filter only respondents with income up to 10 minimum wages
bd8 <- bd8 %>%
  filter(PF14 %in% c("Até R$ 1.212,00 (até 1 SM)",
                     "De R$ 1.212,01 a R$ 2.424,00 (mais de 1 até 2 SM)",
                     "De R$ 2.424,01 a R$ 6.060,00 (mais de 2 até 5 SM)",
                     "De R$ 6.060,01 a R$ 12.120,00 (mais de 5 até 10 SM)",
                     "1", "2", "3", "4"))

# Select open-ended response columns for P01 and P02
respostas_p8_low_income <- bd8 %>%
  select(`P1_Out#1`, `P2_Out#1`)

# Combine into single text vector
texto_completo <- respostas_p8_low_income %>%
  mutate_all(as.character) %>%
  unite("resposta_total", everything(), sep = " ", na.rm = TRUE)

# Tokenize and clean
tokens <- texto_completo %>%
  unnest_tokens(word, resposta_total) %>%
  filter(!word %in% stopwords("pt"),
         !word %in% c("outros", "anotar", "respondeu", "ler", "nenhuma", "sabe", "nao", "nr", "nh", "sobre",
                      "pra", "sao", "so", "d", "ser", "não"),
         str_detect(word, "[a-z]"))

# Count frequencies
frequencia <- tokens %>%
  count(word, sort = TRUE)

# Plot wordcloud
wordcloud(
  words = frequencia$word,
  freq = frequencia$n,
  min.freq = 3,
  max.words = 100,
  random.order = FALSE,
  colors = brewer.pal(8, "Dark2"),
  scale = c(2.5, 0.8)
)