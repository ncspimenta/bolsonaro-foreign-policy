# ───────────────────────────────────────────────────────────────────────
# Script: 02-analysis-proportions-approval-weeks16to18.R
# This script tests whether approval of the Bolsonaro government (P9)
# changed significantly between Weeks 16, 17, and 18 of the IPRI survey.
# A global chi-squared test and three pairwise proportion tests are performed.
# Observations:
# - This window surrounds Events #3 and #4 (Week 17).
# Author: Natália Pimenta
# Date: 2025-04-24
# ───────────────────────────────────────────────────────────────────────

library(dplyr)

# Number of respondents who approve the government in weeks 16, 17, and 18
aprova <- opinion_by_week %>%
  filter(opinion_clean == "Approves", semana %in% c(16, 17, 18)) %>%
  arrange(semana)

# Total number of respondents per week
total_per_week <- opinion_by_week %>%
  filter(semana %in% c(16, 17, 18)) %>%
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

colnames(responses) <- paste0("Week", c(16, 17, 18))
rownames(responses) <- c("Approves", "Others")

## Chi-squared test
chisq.test(responses)

# Pairwise proportion tests

## Week 16 vs 17
prop.test(x = aprova$respondentes[1:2],
          n = total_per_week$total[1:2])

## Week 17 vs 18
prop.test(x = aprova$respondentes[2:3],
          n = total_per_week$total[2:3])

## Week 16 vs 18
prop.test(x = c(aprova$respondentes[1], aprova$respondentes[3]),
          n = c(total_per_week$total[1], total_per_week$total[3]))

# Interpretation Note:

# The global chi-squared test for approval rates across Weeks 16–18 yields a p-value of 0.4845,
# indicating no statistically significant difference in approval proportions over this period.

# Pairwise proportion tests also show:

# - Week 16 vs 17: NOT statistically significant (p = 1, 95% CI: [-0.040, 0.042])
# - Week 17 vs 18: NOT statistically significant (p = 0.307, 95% CI: [-0.062, 0.019])
# - Week 16 vs 18: NOT statistically significant (p = 0.327, 95% CI: [-0.062, 0.020])

# The confidence intervals for all comparisons include zero, and p-values are well above 0.05,
# suggesting that no meaningful change in public approval occurred across these weeks.
# This leads to the interpretation that the events of Week 17 do not correlate with an observable
# shift in approval ratings in the general public.