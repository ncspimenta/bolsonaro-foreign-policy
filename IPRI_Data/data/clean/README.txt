This folder contains cleaned data used in the analysis.

- opinion_by_week.csv: proportion of responses to question P9 (approval of the federal government) by week.

Generated using: 01-data-cleaning-P9.R

- p8_by_week.csv: proportion of responses to question P9 (evaluation of the federal government) by week.

Generated using: 02-data-cleaning-P8.R

- opinion_by_week_income_filtered.csv: proportion of responses to question P9 (approval of the federal government) by week, considering only individuals with monthly income up to 10 minimum wages. Respondents with no income, missing data, or refusal to answer were excluded.

Generated using: 03-data-cleaning-PF14-low-income.R

- opinion_by_week_income_high.csv: proportion of responses to question P9 (approval of the federal government) by week, considering only individuals with monthly income greater than 10 minimum wages.

Generated using: 04-data-cleaning-PF14-high-income.R

- respondents_by_income_group.csv: weekly count of respondents by income group (PF14), classified as "Low income" (up to 10 minimum wages) or "High income" (more than 10 minimum wages).

Generated using: 05-data-summary-income-counts.R