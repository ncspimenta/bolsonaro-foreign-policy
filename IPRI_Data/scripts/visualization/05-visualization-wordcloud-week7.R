# ───────────────────────────────────────────────────────
# Script: 05-visualization-wordcloud-week7.R
# Generates a wordcloud of responses to open-ended questions
# (P01 and P02) from Week 7 of the IPRI survey.
# Cleans and merges all relevant columns and filters out
# generic or non-substantive responses.
# Author: Natália Pimenta
# Date: 2025-04-17
# ───────────────────────────────────────────────────────

library(readxl)
library(dplyr)
library(stringi)
library(tidytext)
library(stopwords)
library(wordcloud)

# Load data for Week 7
dados_semana7 <- read_excel("data/raw/ipri_weekly_survey_data/BD 7.xlsx")

# Select open-ended response columns for P01 and P02
respostas <- dados_semana7 %>%
  select(`P1_Out#1`, `P2_Out#1`)
         
         # Combine into single text vector
         texto_completo <- respostas %>%
           mutate_all(as.character) %>%
           unlist() %>%
           na.omit()
         
         # Clean text
         texto_limpo <- texto_completo %>%
           stri_trans_general("Latin-ASCII") %>%            # remove accents
           tolower() %>%
           gsub("[[:punct:]]", " ", .) %>%
           gsub("\\s+", " ", .) %>%
           trimws()
         
         # Transform into tibble for tidytext processing
         tibble(texto = texto_limpo) %>%
           unnest_tokens(word, texto) %>%
           filter(
             !word %in% stopwords("pt"),
             !word %in% c("outros", "anotar", "respondeu", "ler", "nenhuma", "sabe", "nao", "nr", "nh", "sobre", "pra", "so", "ate")
           ) %>%
           count(word, sort = TRUE) %>%
           with(wordcloud(words = word, freq = n, min.freq = 3,
                          max.words = 100, random.order = FALSE,
                          colors = RColorBrewer::brewer.pal(8, "Dark2")))