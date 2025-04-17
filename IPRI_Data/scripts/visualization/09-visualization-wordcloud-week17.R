# ─────────────────────────────────────────────────────────────
# Script: 09-visualization-wordcloud-week17.R
# Generates a wordcloud of responses to open-ended questions
# (P01 and P02) from Week 17 of the IPRI survey.
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

# Load data for Week 17
bd17 <- read_excel("data/raw/ipri_weekly_survey_data/BD 17.xlsx")

# Select open-ended response columns for P01 and P02
respostas_17 <- bd17 %>%
  select(`P1_Out#1`, `P2_Out#1`)

# Combine into single text vector
texto_17 <- respostas_17 %>%
  mutate_all(as.character) %>%
  unite("resposta_total", everything(), sep = " ", na.rm = TRUE)

# Tokenize and clean
tokens_17 <- texto_17 %>%
  unnest_tokens(word, resposta_total) %>%
  filter(!word %in% stopwords("pt"),
         !word %in% c("outros", "anotar", "não", "respondeu", "nenhuma", "sabe", "ler", "sobre", "nao", "in", "nh"),
         str_detect(word, "[a-z]"))

# Count word frequencies
frequencia_17 <- tokens_17 %>%
  count(word, sort = TRUE)

# Plot wordcloud
wordcloud(
  words = frequencia_17$word,
  freq = frequencia_17$n,
  min.freq = 3,
  max.words = 100,
  random.order = FALSE,
  colors = brewer.pal(8, "Dark2"),
  scale = c(2.5, 0.8)
)