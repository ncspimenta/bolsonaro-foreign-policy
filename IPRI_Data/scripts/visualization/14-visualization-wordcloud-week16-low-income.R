# ─────────────────────────────────────────────────────────────
# Script: 14-visualization-wordcloud-week16-low-income.R
# Generates a wordcloud of responses to open-ended questions
# (P01 and P02) from Week 16 of the IPRI survey, filtered by
# respondents earning up to 10 minimum wages per month (PF14).
# Cleans and merges open-ended responses and filters out
# generic or non-substantive terms.
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

# Load Week 16 dataset
bd16 <- read_excel("data/raw/ipri_weekly_survey_data/BD 16.xlsx")

# Filter for respondents with income up to 10 minimum wages
income_filter <- c("Até R$ 1.212,00 (até 1 SM)",
                   "De R$ 1.212,01 a R$ 2.424,00 (mais de 1 até 2 SM)",
                   "De R$ 2.424,01 a R$ 6.060,00 (mais de 2 até 5 SM)",
                   "De R$ 6.060,01 a R$ 12.120,00 (mais de 5 até 10 SM)",
                   "1", "2", "3", "4")

bd16_filtrado <- bd16 %>%
  filter(PF14 %in% income_filter)

# Select open-ended response columns for P01 and P02
respostas_p16 <- bd16_filtrado %>%
  select(`P1_Out#1`, `P2_Out#1`)

# Combine into single text vector
texto_completo <- respostas_p16 %>%
  mutate_all(as.character) %>%
  unite("resposta_total", everything(), sep = " ", na.rm = TRUE)

# Tokenize and clean
tokens <- texto_completo %>%
  unnest_tokens(word, resposta_total) %>%
  filter(
    !word %in% stopwords("pt"),
    !word %in% c("outros", "anotar", "não", "respondeu", "nenhuma",
                 "sabe", "ler", "nh", "pra", "nao", "sobre",
                 "sao", "so", "d", "ser"),
    str_detect(word, "[a-z]")
  )

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
  scale = c(2.4, 0.7)
)