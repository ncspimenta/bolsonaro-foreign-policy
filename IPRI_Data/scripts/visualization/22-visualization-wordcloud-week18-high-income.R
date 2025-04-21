# ─────────────────────────────────────────────────────────────────────────────
# Script: 22-visualization-wordcloud-week18-high-income.R
# Generates a wordcloud of responses to open-ended questions
# (P01 and P02) from Week 18 of the IPRI survey, filtered to include
# only respondents earning more than 10 minimum wages (PF14).
# Cleans and merges all relevant columns and filters out
# generic or non-substantive responses.
# Author: Natália Pimenta
# Date: 2025-04-21
# ─────────────────────────────────────────────────────────────────────────────

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

# Add week number
bd18 <- bd18 %>%
  mutate(semana = 18)

# Filter by high income (more than 10 minimum wages, PF14)
bd18 <- bd18 %>%
  mutate(PF14 = ifelse(semana == 11, PF12, PF14)) %>%
  filter(PF14 %in% c("Mais de R$ 12.120,01 (mais de 10 SM)", "5"))

# Select open-ended response columns for P01 and P02
respostas_p18 <- bd18 %>%
  select(`P1_Out#1`, `P2_Out#1`)
         
         # Combine into single text vector
         texto_completo <- respostas_p18 %>%
           mutate_all(as.character) %>%
           unite("resposta_total", everything(), sep = " ", na.rm = TRUE)
         
         # Tokenize and clean
         tokens <- texto_completo %>%
           unnest_tokens(word, resposta_total) %>%
           filter(
             !word %in% stopwords("pt"),
             !word %in% c("outros", "anotar", "não", "respondeu", "nenhuma", "sabe", "ler",
                          "nh", "pra", "nao", "sobre", "sao", "so", "d", "ser", "nr", "q"),
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
           scale = c(2.0, 0.6)
         )