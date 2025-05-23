# ───────────────────────────────────────────────────────
# Script: 25-visualization-wordcloud-un-2021.R
# Generates a wordcloud from Bolsonaro's 2021 UNGA speech.
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
discurso_2021 <- read_file("data/raw/bolsonaro_un_2021.txt")

# Transform to tibble for text processing
texto <- tibble(line = 1, text = discurso_2021)

# Tokenize and clean
tokens <- texto %>%
  unnest_tokens(word, text) %>%
  filter(
    !word %in% stopwords("pt"),
    !word %in% c("senhores", "senhor", "senhoras", "apenas", "todo", "qualquer", "onde", "ainda", "ser", "quase", "alguns", "outras", "deve", "aqui", "pode", "cada", "agora", "toda", "todas", "us", "tudo"),
    str_detect(word, "[a-z]")
  )

# Count word frequencies
frequencia <- tokens %>%
  count(word, sort = TRUE)

# Plot wordcloud
wordcloud(
  words = frequencia$word,
  freq = frequencia$n,
  min.freq = 2,
  max.words = 100,
  random.order = FALSE,
  colors = brewer.pal(8, "Dark2"),
  scale = c(2.4, 0.7)
)