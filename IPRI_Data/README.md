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

All scripts are written in R and located in the `/scripts/` directory.

## Data Source

All raw data comes from the official open data repository of the Brazilian government:
[gov.br/secom](https://www.gov.br/secom/pt-br/composicao/orgaos-especificos-singulares/secretaria-de-publicidade-e-patrocinio/departamentos/departamento-de-pesquisa/dados-abertos-de-pesquisas-de-opiniao)

## Notes

- Weeks 2 to 5 were excluded because they focused exclusively on regional-level samples, whereas the analysis is based on nationally representative weekly surveys to ensure comparability across time.

- Special-topic monthly surveys were also excluded, as they did not follow the same structure, timing, or thematic focus as the regular weekly rounds. Their inclusion could introduce inconsistencies and bias the temporal analysis of public opinion dynamics during 2022.