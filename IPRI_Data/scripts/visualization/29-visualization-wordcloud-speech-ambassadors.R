# ───────────────────────────────────────────────────────────────────────────────────────────
# Script: 29-visualization-wordcloud-speech-ambassadors.R
# Generates a wordcloud from Bolsonaro's speech to ambassadors in 2022.
# Note: In addition to standard Portuguese stopwords, a custom list of frequently used terms 
# such as "aqui", "agora", "senhor", and "repito" was excluded from the analysis. 
# These words, while common in speech, do not convey substantive meaning in the context 
# of this analysis and tend to visually dominate the wordcloud without contributing 
# to the interpretation of thematic content.
# Author: Natália Pimenta
# Date: 2025-04-22
# ───────────────────────────────────────────────────────────────────────────────────────────

library(dplyr)
library(tidytext)
library(stringr)
library(wordcloud)
library(RColorBrewer)
library(tm)
library(readr)

# Read the text file
discurso_embaixadores_2022 <- read_file("data/raw/bolsonaro_ambassadors_2022.txt")

# Transform to tibble for text processing
texto <- tibble(line = 1, text = discurso_embaixadores_2022)

# Tokenize and clean
tokens <- texto %>%
  unnest_tokens(word, text) %>%
  filter(
    !word %in% stopwords("pt"),
    !word %in% c("ser", "aí", "né", "diz", "disse", "quer", "ter", "falar", "queremos", "onde", "porque", "então", "qualquer", "vão", "dar", "faz", "coisa", "fazer", "toda", "todo", "todos", "tudo", "outro", "quê", "pra", "vou", "aqui", "nada", "senhores", "senhor", "agora", "repito", "sei", "bem", "sido", "nome"),
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
  scale = c(2.4, 0.8)
)