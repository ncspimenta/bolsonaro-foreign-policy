# ─────────────────────────────────────────────────────────────
# Script: 28-visualization-bigrams-un-19to22.R
# This script extracts and visualizes the 15 most frequent bigrams
# from Bolsonaro's UN General Assembly speeches (2019–2022).
# Generic address expressions such as “senhor presidente” were manually excluded,
# as they serve a formal protocol function and offer no substantive insight.
# Author: Natália Pimenta
# Date: 2025-04-22
# ─────────────────────────────────────────────────────────────

library(readr)
library(dplyr)
library(tidytext)
library(ggplot2)
library(tidyr)
library(stringr)

# Load all speech files
disc_2019 <- read_file("data/raw/bolsonaro_un_2019.txt")
disc_2020 <- read_file("data/raw/bolsonaro_un_2020.txt")
disc_2021 <- read_file("data/raw/bolsonaro_un_2021.txt")
disc_2022 <- read_file("data/raw/bolsonaro_un_2022.txt")

# Combine into one dataframe
discursos_df <- tibble(
  year = c(2019, 2020, 2021, 2022),
  text = c(disc_2019, disc_2020, disc_2021, disc_2022)
)

# Create bigrams
bigrams <- discursos_df %>%
  unnest_tokens(bigram, text, token = "ngrams", n = 2)

# Separate words
bigrams_separated <- bigrams %>%
  separate(bigram, into = c("word1", "word2"), sep = " ")

# Load Portuguese stopwords
stopwords_pt <- stopwords::stopwords("pt")

# Filter stopwords and non-informative expressions
bigrams_filtered <- bigrams_separated %>%
  filter(
    !word1 %in% stopwords_pt,
    !word2 %in% stopwords_pt,
    str_detect(word1, "[a-z]"),
    str_detect(word2, "[a-z]")
  ) %>%
  unite(bigram, word1, word2, sep = " ") %>%
  filter(!bigram %in% c(
    "senhor presidente",
    "senhor secretário",
    "secretário geral",
    "antónio guterres",
    "senhores chefes",
    "delegação senhoras"
  ))

# Count and plot top 15 bigrams
top_bigrams <- bigrams_filtered %>%
  count(bigram, sort = TRUE) %>%
  slice_max(n, n = 15)

# Plot
ggplot(top_bigrams, aes(x = reorder(bigram, n), y = n)) +
  geom_col(fill = "#3786a6") +
  coord_flip() +
  labs(
    title = "Top 15 Most Frequent Bigrams in Bolsonaro's Speeches in the UN",
    x = "Bigram",
    y = "Frequency"
  ) +
  scale_y_continuous(breaks = seq(0, max(top_bigrams$n), by = 1))
  theme_minimal(base_size = 14)