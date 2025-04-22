# ───────────────────────────────────────────────────────
# Script: 23-visualization-wordcloud-un-2019.R
# Generates a wordcloud from Bolsonaro's 2019 UNGA speech.
# Author: Natália Pimenta
# Date: 2025-04-22
# ───────────────────────────────────────────────────────

library(dplyr)
library(tidytext)
library(stringr)
library(wordcloud)
library(RColorBrewer)
library(tm)
library(readr)

# Read the text file
discurso_2019 <- read_file("data/raw/bolsonaro_un_2019.txt")

# Transform to tibble for text processing
texto <- tibble(line = 1, text = discurso_2019)

# Tokenize and clean
tokens <- texto %>%
  unnest_tokens(word, text) %>%
  filter(
    !word %in% stopwords("pt"),
    !word %in% c("outros", "anotar", "não", "respondeu", "nenhuma", "sabe", "ler", "nh", "pra", "nao", "sobre", "sao", "so", "d", "ser"),
    str_detect(word, "[a-z]")
  )

# Count word frequencies
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