# ─────────────────────────────────────────────────────────────
# Script: 08-visualization-wordcloud-week16.R
# Generates a wordcloud of responses to open-ended questions
# (P01 and P02) from Week 16 of the IPRI survey.
# Cleans and merges all relevant columns and filters out
# generic or non-substantive responses.
# Author: Natália Pimenta
# Date: 2025-04-17
# ─────────────────────────────────────────────────────────────

library(readxl)
library(dplyr)
library(tidyr)
library(tidytext)
library(wordcloud)
library(RColorBrewer)
library(stringr)
library(tm)

# Load data for Week 16
bd16 <- read_excel("data/raw/ipri_weekly_survey_data/BD 16.xlsx")

# Select open-ended response columns for P01 and P02
respostas_16 <- bd16 %>%
  select(`P1_Out#1`, `P2_Out#1`)

# Combine into single text vector
texto_16 <- respostas_16 %>%
  mutate_all(as.character) %>%
  unite("resposta_total", everything(), sep = " ", na.rm = TRUE)

# Tokenize and clean
tokens_16 <- texto_16 %>%
  unnest_tokens(word, resposta_total) %>%
  filter(!word %in% stopwords("pt"),
         !word %in% c("outros", "anotar", "não", "respondeu", "nenhuma", "sabe", "ler", "sobre", "nao", "in", "nh"),
         str_detect(word, "[a-z]"))

# Count word frequencies
frequencia_16 <- tokens_16 %>%
  count(word, sort = TRUE)

# Plot wordcloud
wordcloud(
  words = frequencia_16$word,
  freq = frequencia_16$n,
  min.freq = 3,
  max.words = 100,
  random.order = FALSE,
  colors = brewer.pal(8, "Dark2"),
  scale = c(2.5, 0.8)
)