# ───────────────────────────────────────────────────────
# Script: 02-visualization-approval-trends.R
# This script generates a line chart showing trends in public opinion 
# about the Bolsonaro government (based on P8) between June and December 2022.
# Key foreign policy events and election weeks are visually highlighted.
# Author: Natália Pimenta
# Date: 2025-04-16
# ───────────────────────────────────────────────────────

library(ggplot2)

# Define y_max
y_top <- max(p8_by_week$prop, na.rm = TRUE)

# Custom colors

p8_colors <- c(
  "Excellent" = "#66c2a5",       
  "Good" = "#a6d854",            
  "Fair" = "#ffd92f",            
  "Poor" = "#fc8d62",            
  "Very Poor" = "#e78ac3",       
  "Didn't answer" = "#b3b3b3",   
  "Doesn't know" = "#8da0cb"     
)

# Reorder the levels of the variable to adjust the legend

p8_by_week <- p8_by_week %>%
  mutate(p8_clean = factor(
    p8_clean,
    levels = c("Excellent", "Good", "Fair", "Poor", "Very Poor", "Didn't answer", "Doesn't know"))
  )

# Final plot

grafico_p8 <- ggplot(p8_by_week, aes(x = semana, y = prop, color = p8_clean)) +
  # Highlighting the Elections (weeks 19 to 22)
  geom_rect(
    aes(xmin = 19, xmax = 22, ymin = -Inf, ymax = Inf),
    inherit.aes = FALSE,
    fill = "#cce5ff",
    alpha = 0.03
  ) +
  # Lines and points
  geom_line(size = 1) +
  geom_point(size = 2) +
  # Custom color palette
  scale_color_manual(values = p8_colors) +
  # Axis formatting
  scale_y_continuous(
    labels = scales::percent_format(accuracy = 1),
    expand = expansion(mult = c(0, 0.15))
  ) +
  scale_x_continuous(breaks = 1:29) +
  # Labels and titles
  labs(
    title = "Government Opinion Between June and December (2022), pt. 2",
    x = "Week",
    y = "Proportion of responses",
    color = "Response"
  ) +
  # Key foreign policy events
  geom_vline(xintercept = c(1, 8, 17), linetype = "dashed", color = "gray40") +
  annotate("text", x = 1, y = y_top + 0.03, label = "Event #1", angle = 90, vjust = -0.5, size = 3, fontface = "bold") +
  annotate("text", x = 8, y = y_top + 0.03, label = "Event #2", angle = 90, vjust = -0.5, size = 3, fontface = "bold") +
  annotate("text", x = 17, y = y_top + 0.03, label = "Events #3 & 4", angle = 90, vjust = -0.5, size = 3, fontface = "bold") +
  annotate("text", x = 20.5, y = y_top + 0.03, label = "Elections", fontface = "bold", size = 4.0) +
  # Theme
  theme_minimal(base_size = 14) +
  theme(legend.position = "top")

grafico_p8