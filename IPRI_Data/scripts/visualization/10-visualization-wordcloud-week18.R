# ─────────────────────────────────────────────────────────────
# Script: 10-visualization-wordcloud-week18.R
# Generates a wordcloud of responses to open-ended questions
# (P01 and P02) from Week 18 of the IPRI survey.
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

# Load data for Week 18
bd18 <- read_excel("data/raw/ipri_weekly_survey_data/BD 18.xlsx")

# Select open-ended response columns for P01 and P02
respostas_18 <- bd18 %>%
  select(`P1_Out#1`, `P2_Out#1`)

# Combine into single text vector
texto_18 <- respostas_18 %>%
  mutate_all(as.character) %>%
  unite("resposta_total", everything(), sep = " ", na.rm = TRUE)

# Tokenize and clean
tokens_18 <- texto_18 %>%
  unnest_tokens(word, resposta_total) %>%
  filter(!word %in% stopwords("pt"),
         !word %in% c("outros", "anotar", "não", "respondeu", "nenhuma", "sabe", "ler", "sobre", "nao", "in", "nh"),
         str_detect(word, "[a-z]"))

# Count word frequencies
frequencia_18 <- tokens_18 %>%
  count(word, sort = TRUE)

# Plot wordcloud
wordcloud(
  words = frequencia_18$word,
  freq = frequencia_18$n,
  min.freq = 3,
  max.words = 100,
  random.order = FALSE,
  colors = brewer.pal(8, "Dark2"),
  scale = c(2.5, 0.6)
)