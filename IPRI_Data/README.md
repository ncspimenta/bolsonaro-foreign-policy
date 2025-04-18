# Populism on the Global Stage: Jair Bolsonaro's Foreign Policy as a Mechanism of Electoral Appeal

This project aims to investigate how Jair Bolsonaro's foreign policy actions in 2022 may have influenced public opinion. It is based on weekly survey data from the Instituto de Pesquisa de Reputação e Imagem (IPRI), encompassing 30,000 responses from June to December 2022.

## Research Questions

(1) How did Brazilian public opinion vary during weeks marked by Bolsonaro’s key foreign policy actions in 2022?
(2) Was foreign policy instrumentalized by Bolsonaro as an electoral tool in a polarized environment?

## Project Structure

- `/data/raw/`: Raw data from Weeks 1 and 6-29, as released by IPRI.
- `/data/clean`: Cleaned and unified dataset used for analysis (not yet uploaded).
- `/scripts/`: R scripts for data cleaning, descriptive analysis, and modeling (not yet uploaded).
- `/figures/`: Visual outputs, such as approval trends, wordclouds, and regression plots (not yet uploaded).
- `/output/`: Summary of main results and interpretations (not yet uploaded).
- `article.pdf`: Research article draft based on this project (not yet uploaded).

## Code and Scripts

- `01-data-cleaning-P9.R`: Merges weekly survey files and standardizes responses to question P9 (government approval). Output: `opinion_by_week.csv`.
- `01-visualization-approval-trends.R`: Generates the time-series plot of public opinion between Weeks 1–29 (based on P9), highlighting key foreign policy events and the election period. Output: `fig_1_gov_opinion.png`.
- `02-data-cleaning-P8.R`: Standardizes responses to question P8 (government evaluation). Output: `p8_by_week.csv`.
- `02-visualization-approval-trends.R`: Generates the time-series plot of public opinion between Weeks 1-29 (based on P8), highlighting key foreign policy events and the election period. Output: `fig_2_gov_opinion.png`.
- `03-data-cleaning-PF14-low-income`: Standardizes responses to question PF14 (monthly income up to 10 minimum wages). Output: `opinion_by_week_income_filtered.csv`.
- `03-visualization-approval-low-income.R`: Generates the time-series plot of government approval between Weeks 1-29 among respondents earning up to 10 minimum wages (excluding those without income), based on P9 and PF14. Key foreign policy events and the election period were highlighted. Output: `fig_3_gov_opinion_inc_1.png`.
- `04-data-cleaning-PF14-high-income.R`: Standardizes responses to question PF14 (monthly income greater than 10 minimum wages). Output: `opinion_by_week_income_high.csv`.
- `04-visualization-approval-high-income.R`: Generates the time-series plot of government approval between Weeks 1-29 among respondents earning more than 10 minimum wages, based on P9 and PF14. Key foreign policy events and the election period were highlighted. Output: `fig_4_gov_opinion_inc_2.png`.
- `05-visualization-wordcloud-week7.R`: Generates a wordcloud of responses to open-ended questions (P01 and P02) from Week 7 of the IPRI survey. Cleans and merges all relevant columns and filters out generic or non-substantive responses. Output: `fig_5_wordcloud_wk7.png`.
- `06-visualization-wordcloud-week8.R`: Generates a wordcloud of responses to open-ended questions (P01 and P02) from Week 8 of the IPRI survey. Cleans and merges all relevant columns and filters out generic or non-substantive responses. Output: `fig_6_wordcloud_wk8.png`.
- `07-visualization-wordcloud-week9.R`: Generates a wordcloud of responses to open-ended questions (P01 and P02) from Week 9 of the IPRI survey. Cleans and merges all relevant columns and filters out generic or non-substantive responses. Output: `fig_7_wordcloud_wk9.png`.
- `08-visualization-wordcloud-week16.R`: Generates a wordcloud of responses to open-ended questions (P01 and P02) from Week 16 of the IPRI survey. Cleans and merges all relevant columns and filters out generic or non-substantive responses. Output: `fig_8_wordcloud_wk16.png`.
- `09-visualization-wordcloud-week17.R`: Generates a wordcloud of responses to open-ended questions (P01 and P02) from Week 17 of the IPRI survey. Cleans and merges all relevant columns and filters out generic or non-substantive responses. Output: `fig_9_wordcloud_wk17.png`.
- `10-visualization-wordcloud-week18.R`: Generates a wordcloud of responses to open-ended questions (P01 and P02) from Week 18 of the IPRI survey. Cleans and merges all relevant columns and filters out generic or non-substantive responses. Output: `fig_10_wordcloud_wk18.png`.

All scripts are written in R and located in the `/scripts/` directory.

## Data Source

All raw data comes from the official open data repository of the Brazilian government:
[gov.br/secom](https://www.gov.br/secom/pt-br/composicao/orgaos-especificos-singulares/secretaria-de-publicidade-e-patrocinio/departamentos/departamento-de-pesquisa/dados-abertos-de-pesquisas-de-opiniao)

## Notes

- Weeks 2 to 5 were excluded because they focused exclusively on regional-level samples, whereas the analysis is based on nationally representative weekly surveys to ensure comparability across time.

- Special-topic monthly surveys were also excluded, as they did not follow the same structure, timing, or thematic focus as the regular weekly rounds. Their inclusion could introduce inconsistencies and bias the temporal analysis of public opinion dynamics during 2022.