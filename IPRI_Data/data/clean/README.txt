This folder contains cleaned data used in the analysis.

- opinion_by_week.csv: proportion of responses to question P9 (approval of the federal government) by week.

Data cleaning performed using the script: 01-data-cleaning-P9.R

- p8_by_week.csv: proportion of responses to question P9 (evaluation of the federal government) by week.

Data cleaning performed using the script: 02-data-cleaning-P8.R

- opinion_by_week_income_filtered.csv: proportion of responses to question P9 (approval of the federal government) by week, considering only individuals with monthly income up to 10 minimum wages. Respondents with no income, missing data, or refusal to answer were excluded.

Data cleaning and filtering performed using the script: 03-data-cleaning-PF14-low-income.R

- opinion_by_week_income_high.csv: proportion of responses to question P9 (approval of the federal government) by week, considering only individuals with monthly income greater than 10 minimum wages.

Data cleaning and filtering performed using the script: 04-data-cleaning-PF14-high-income.R