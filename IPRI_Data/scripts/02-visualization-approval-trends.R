# ───────────────────────────────────────────────────────
# Script: 02-visualization-approval-trends.R
# This script generates a line chart showing trends in public opinion 
# about the Bolsonaro government (based on P9) between June and December 2022.
# Key foreign policy events and election weeks are visually highlighted.
# Author: Natália Pimenta
# Date: 2025-04-15
# ───────────────────────────────────────────────────────

library(ggplot2)

# Recode "Rejects" to "Disapproves"
opinion_by_week <- opinion_by_week %>%
  mutate(opinion_clean = recode(opinion_clean, "Rejects" = "Disapproves"))

# Define y_max
y_top <- max(opinion_by_week$prop, na.rm = TRUE)

# Custom colors

my_colors <- c(
  "Approves" = "#66c2a5",       
  "Disapproves" = "#fc8d62",    
  "Doesn't know" = "#8da0cb",   
  "Didn't answer" = "#a6d854"   
)

# Reorder the levels of the variable to adjust the legend

opinion_by_week <- opinion_by_week %>%
  mutate(opinion_clean = factor(opinion_clean,
                                levels = c("Approves", "Disapproves", "Doesn't know", "Didn't answer")))

# Final Plot
grafico_opiniao <- ggplot(opinion_by_week, aes(x = semana, y = prop, color = opinion_clean)) +
  # Highlighting the Elections
  geom_rect(
    aes(xmin = 19, xmax = 22, ymin = -Inf, ymax = Inf),
    inherit.aes = FALSE,
    fill = "#cce5ff",
    alpha = 0.012        
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
    title = "Government Opinion Between June and December (2022)",
    x = "Week",
    y = "Proportion of responses",
    color = "Opinion"
  ) +
  geom_vline(xintercept = c(1, 8, 17), linetype = "dashed", color = "gray40") +
  annotate("text", x = 1, y = y_top + 0.03, label = "Event #1", angle = 90, vjust = -0.5, size = 3, fontface = "bold") +
  annotate("text", x = 8, y = y_top + 0.03, label = "Event #2", angle = 90, vjust = -0.5, size = 3, fontface = "bold") +
  annotate("text", x = 17, y = y_top + 0.03, label = "Events #3 & 4", angle = 90, vjust = -0.5, size = 3, fontface = "bold") +
  annotate("text", x = 20.5, y = y_top + 0.03, label = "Elections", fontface = "bold", size = 4.0) +
  theme_minimal(base_size = 14) +
  theme(legend.position = "top")

grafico_opiniao