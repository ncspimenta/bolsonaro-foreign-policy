# ─────────────────────────────────────────────────────────────
# Script: 27-visualization-wordcloud-un-19to22.R
# Generates a wordcloud combining all four UN General Assembly
# speeches delivered by Jair Bolsonaro from 2019 to 2022.
# Preprocessing includes text cleaning and removal of stopwords.
# Author: Natália Pimenta
# Date: 2025-04-22
# ─────────────────────────────────────────────────────────────

library(readr)
library(dplyr)
library(tidytext)
library(wordcloud)
library(RColorBrewer)
library(stringr)
library(tm)

# Load all four speeches
disc_2019 <- read_file("data/raw/bolsonaro_un_2019.txt")
disc_2020 <- read_file("data/raw/bolsonaro_un_2020.txt")
disc_2021 <- read_file("data/raw/bolsonaro_un_2021.txt")
disc_2022 <- read_file("data/raw/bolsonaro_un_2022.txt")

# Combine speeches into one text
all_text <- paste(disc_2019, disc_2020, disc_2021, disc_2022, sep = " ")

# Create data frame
df_all <- tibble(text = all_text)

# Tokenize, clean, and filter
tokens_all <- df_all %>%
  unnest_tokens(word, text) %>%
  filter(
    !word %in% stopwords("pt"),
    !word %in% c("outros", "anotar", "não", "respondeu", "nenhuma", "sabe", "ler", "nh", 
                 "pra", "nao", "sobre", "sao", "so", "d", "ser"),
    str_detect(word, "[a-z]")
  )

# Count word frequencies
freq_all <- tokens_all %>%
  count(word, sort = TRUE)

# Plot wordcloud
wordcloud(
  words = freq_all$word,
  freq = freq_all$n,
  min.freq = 3,
  max.words = 100,
  random.order = FALSE,
  colors = brewer.pal(8, "Dark2"),
  scale = c(2.5, 0.7)
)