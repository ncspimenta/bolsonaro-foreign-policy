# ───────────────────────────────────────────────────────────────────────
# Script: 01-analysis-proportions-approval-weeks7to9.R
# This script tests whether approval of the Bolsonaro government (P9)
# changed significantly between Weeks 7, 8, and 9 of the IPRI survey.
# A global chi-squared test and three pairwise proportion tests are performed.
# Observations:
# - This window surrounds Event #2 (Week 8).
# Author: Natália Pimenta
# Date: 2025-04-24
# ───────────────────────────────────────────────────────────────────────

library(dplyr)

# Number of respondents who approve the government in weeks 7, 8, and 9
aprova <- opinion_by_week %>%
  filter(opinion_clean == "Approves", semana %in% c(7, 8, 9)) %>%
  arrange(semana)

# Total number of respondents per week
total_per_week <- opinion_by_week %>%
  filter(semana %in% c(7, 8, 9)) %>%
  group_by(semana) %>%
  summarise(total = sum(respondentes), .groups = "drop") %>%
  arrange(semana)

# View data
cbind(aprova, total = total_per_week$total)

# Global chi-squared test

## Matrix
responses<- matrix(c(aprova$respondentes,
                     total_per_week$total - aprova$respondentes),
                   nrow = 2, byrow = TRUE)

colnames(responses) <- paste0("Week", c(7, 8, 9))
rownames(responses) <- c("Approves", "Others")

## Chi-squared test
chisq.test(responses)

# Pairwise proportion tests

## Week 7 vs 8
prop.test(x = aprova$respondentes[1:2],
          n = total_per_week$total[1:2])

## Week 8 vs 9
prop.test(x = aprova$respondentes[2:3],
          n = total_per_week$total[2:3])

## Week 7 vs 9
prop.test(x = c(aprova$respondentes[1], aprova$respondentes[3]),
          n = c(total_per_week$total[1], total_per_week$total[3]))


# Interpretation Note:

# Pairwise proportion tests showed:

# - Week 7 vs 8: NOT statistically significant (p = 0.80, 95% CI: [-0.046, 0.035]).
# - Week 8 vs 9: Statistically significant (p = 0.0217, 95% CI: [-0.088, -0.007]).
# - Week 7 vs 9: Statistically significant (p = 0.0098, 95% CI: [-0.094, -0.013]).
#
# Since the confidence intervals for Week 8 vs 9 and Week 7 vs 9 do not include zero,
# we can be reasonably confident that these reflect real changes in approval rates.
# Compared to prior weeks, Week 9 shows a significant rise in approval.