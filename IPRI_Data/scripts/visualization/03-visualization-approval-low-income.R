# ───────────────────────────────────────────────────────
# Script: 03-visualization-approval-low-income.R
# This script generates a line chart showing trends in public opinion 
# about the Bolsonaro government (based on P9) among respondents 
# earning up to 10 minimum wages per month (based on PF14).
# Key foreign policy events and election weeks are visually highlighted.
# Respondents with no income were excluded from the analysis.
# Author: Natália Pimenta
# Date: 2025-04-16
# ───────────────────────────────────────────────────────

library(ggplot2)
library(dplyr)
library(readr)

# Load filtered data

opinion_by_week_income_filtered <- read_csv("data/clean/opinion_by_week_income_filtered.csv")

# Define y_max

y_top_income <- max(opinion_by_week_income_filtered$prop, na.rm = TRUE)

# Custom colors

my_colors <- c(
  "Approves" = "#66c2a5",       
  "Disapproves" = "#fc8d62",    
  "Doesn't know" = "#8da0cb",   
  "Didn't answer" = "#a6d854"   
)

# Order levels to control legend order

opinion_by_week_income_filtered <- opinion_by_week_income_filtered %>%
  mutate(opinion_clean = factor(opinion_clean,
                                levels = c("Approves", "Disapproves", "Doesn't know", "Didn't answer")))

# Final plot

grafico_renda <- ggplot(opinion_by_week_income_filtered, aes(x = semana, y = prop, color = opinion_clean)) +
  # Highlight elections (weeks 19–22)
  geom_rect(
    aes(xmin = 19, xmax = 22, ymin = -Inf, ymax = Inf),
    inherit.aes = FALSE,
    fill = "#cce5ff",
    alpha = 0.04
  ) +
  geom_line(size = 1) +
  geom_point(size = 2) +
  scale_color_manual(values = my_colors) +
  scale_y_continuous(
    labels = scales::percent_format(accuracy = 1),
    expand = expansion(mult = c(0, 0.15))
  ) +
  scale_x_continuous(breaks = 1:29) +
  labs(
    title = "Government Opinion Between June and December 2022 (Income ≤ 10 Minimum Wages)",
    x = "Week",
    y = "Proportion of responses",
    color = "Opinion"
  ) +
  # Add key events
  geom_vline(xintercept = c(1, 8, 17), linetype = "dashed", color = "gray40") +
  annotate("text", x = 1, y = y_top_income + 0.03, label = "Event #1", angle = 90, vjust = -0.5, size = 3, fontface = "bold") +
  annotate("text", x = 8, y = y_top_income + 0.03, label = "Event #2", angle = 90, vjust = -0.5, size = 3, fontface = "bold") +
  annotate("text", x = 17, y = y_top_income + 0.03, label = "Events #3 & 4", angle = 90, vjust = -0.5, size = 3, fontface = "bold") +
  annotate("text", x = 20.5, y = y_top_income + 0.03, label = "Elections", fontface = "bold", size = 4) +
  theme_minimal(base_size = 14) +
  theme(
    legend.position = "top",
    plot.title = element_text(size = 13)  # ajuste o número como quiser
  )

grafico_renda