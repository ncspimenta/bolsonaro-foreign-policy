# ─────────────────────────────────────────────────────────────
# Script: 06-visualization-wordcloud-week8.R
# Generates a wordcloud of responses to open-ended questions
# (P01 and P02) from Week 8 of the IPRI survey.
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

# Load data for Week 8
bd8 <- read_excel("data/raw/ipri_weekly_survey_data/BD 8.xlsx")

# Select open-ended response columns for P01 and P02
respostas_p8 <- bd8 %>%
  select(`P1_Out#1`, `P2_Out#1`)

# Combine into single text vector
texto_completo <- respostas_p8 %>%
  mutate_all(as.character) %>%
  unite("resposta_total", everything(), sep = " ", na.rm = TRUE)

# Tokenize and clean
tokens <- texto_completo %>%
  unnest_tokens(word, resposta_total) %>%
  filter(!word %in% stopwords("pt"),
         !word %in% c("outros", "anotar", "respondeu", "ler", "nenhuma", "sabe", "nao", "nr", "nh", "sobre"),
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
  scale = c(2.4, 0.8)
)