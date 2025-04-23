# ──────────────────────────────────────────────────────────────────────────────────
# Script: 30-visualization-bigrams-ambassadors.R
# This script extracts and visualizes the 15 most frequent bigrams
# from Bolsonaro's speech to ambassadors in 2022.
# Author: Natália Pimenta
# Date: 2025-04-22
# ──────────────────────────────────────────────────────────────────────────────────

library(readr)
library(dplyr)
library(tidytext)
library(ggplot2)
library(tidyr)
library(stringr)
library(forcats)

# Load speech
disc_ambassadors_2022 <- read_file("data/raw/bolsonaro_ambassadors_2022.txt")

# Transform to tibble for processing
disc_df <- tibble(text = disc_ambassadors_2022)

# Create bigrams
bigrams <- disc_df %>%
  unnest_tokens(bigram, text, token = "ngrams", n = 2)

# Separate into individual words
bigrams_separated <- bigrams %>%
  separate(bigram, into = c("word1", "word2"), sep = " ")

# Load Portuguese stopwords
stopwords_pt <- stopwords::stopwords("pt")

# Filter out stopwords and non-alphabetic terms
bigrams_filtered <- bigrams_separated %>%
  filter(
    !word1 %in% stopwords_pt,
    !word2 %in% stopwords_pt,
    str_detect(word1, "[a-z]"),
    str_detect(word2, "[a-z]")
  ) %>%
  unite(bigram, word1, word2, sep = " ")

# Count top 15 bigrams
top_bigrams <- bigrams_filtered %>%
  count(bigram, sort = TRUE) %>%
  slice_max(n, n = 15)

# Plot
ggplot(top_bigrams, aes(x = fct_reorder(bigram, n), y = n)) +
  geom_col(fill = "#3B8BBE", width = 0.6) +
  coord_flip() +
  labs(
    title = "Top 15 Most Frequent Bigrams in Bolsonaro's Speech to Ambassadors (2022)",
    x = NULL,
    y = "Frequency"
  ) +
  scale_y_continuous(
    breaks = seq(0, max(top_bigrams$n), by = 1),
    expand = expansion(mult = c(0, 0.05))
  ) +
  theme_minimal(base_size = 14) +
  theme(
    plot.title = element_text(face = "bold", size = 16, hjust = 0),
    axis.text = element_text(size = 12),
    panel.grid.major.y = element_blank()
  )