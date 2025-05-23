# Populism on the Global Stage: Jair Bolsonaro's Foreign Policy as a Mechanism of Electoral Appeal

This project aims to investigate how Jair Bolsonaro's foreign policy actions in 2022 may have influenced public opinion. It is based on weekly survey data from the Instituto de Pesquisa de Reputação e Imagem (IPRI), encompassing 30,000 responses from June to December 2022.


## Research Questions

(1) How did Brazilian public opinion vary during weeks marked by Bolsonaro’s key foreign policy actions in 2022?

(2) Was foreign policy instrumentalized by Bolsonaro as an electoral tool in a polarized environment?


## Project Structure

- `/data/raw/`: Raw data from Weeks 1 and 6-29, as released by IPRI.
- `/data/clean`: Cleaned dataset used for analysis.
- `/scripts/`: R scripts for data cleaning, descriptive analysis, and modeling.
- `/figures/`: Visual outputs, such as approval trends, wordclouds, and bigram analyses.
- `/output/`: Summary of main results and interpretations.
- `article.pdf`: Research article draft based on this project.


## Code and Scripts

- `01-data-cleaning-P9.R`: Merges weekly survey files and standardizes responses to question P9 (government approval). Output: `opinion_by_week.csv`.

- `01-visualization-approval-trends.R`: Generates the time-series plot of public opinion between Weeks 1–29 (based on P9), highlighting key foreign policy events and the election period. Output: `fig_1_gov_opinion.png`.

- `01-analysis-proportions-approval-weeks7to9.R`: Tests wether approval of the Bolsonaro government (P9) changed significantly between Weeks 7-9. A global chi-squared test and three pairwise proportion tests are performed.

- `02-data-cleaning-P8.R`: Standardizes responses to question P8 (government evaluation). Output: `p8_by_week.csv`.

- `02-visualization-approval-trends.R`: Generates the time-series plot of public opinion between Weeks 1-29 (based on P8), highlighting key foreign policy events and the election period. Output: `fig_2_gov_opinion.png`.

- `03-data-cleaning-PF14-low-income`: Standardizes responses to question PF14 (monthly income up to 10 minimum wages). Output: `opinion_by_week_income_filtered.csv`.

- `03-visualization-approval-low-income.R`: Generates the time-series plot of government approval between Weeks 1-29 among respondents earning up to 10 minimum wages (excluding those without income), based on P9 and PF14. Key foreign policy events and the election period were highlighted. Output: `fig_3_gov_opinion_inc_1.png`.

- `04-data-cleaning-PF14-high-income.R`: Standardizes responses to question PF14 (monthly income greater than 10 minimum wages). Output: `opinion_by_week_income_high.csv`.

- `05-data-summary-income-counts.R`: Calculates the number of respondents in each week by income group: above or below 10 minimum wages (PF14). Output: `respondents_by_income_group.csv`.

- `04-visualization-approval-high-income.R`: Generates the time-series plot of government approval between Weeks 1-29 among respondents earning more than 10 minimum wages, based on P9 and PF14. Key foreign policy events and the election period were highlighted. Output: `fig_4_gov_opinion_inc_2.png`.

- `05-visualization-wordcloud-week7.R`: Generates a wordcloud of responses to open-ended questions (P01 and P02) from Week 7 of the IPRI survey. Cleans and merges all relevant columns and filters out generic or non-substantive responses. Output: `fig_5_wordcloud_wk7.png`.

- `06-visualization-wordcloud-week8.R`: Generates a wordcloud of responses to open-ended questions (P01 and P02) from Week 8 of the IPRI survey. Cleans and merges all relevant columns and filters out generic or non-substantive responses. Output: `fig_6_wordcloud_wk8.png`.

- `07-visualization-wordcloud-week9.R`: Generates a wordcloud of responses to open-ended questions (P01 and P02) from Week 9 of the IPRI survey. Cleans and merges all relevant columns and filters out generic or non-substantive responses. Output: `fig_7_wordcloud_wk9.png`.

- `08-visualization-wordcloud-week16.R`: Generates a wordcloud of responses to open-ended questions (P01 and P02) from Week 16 of the IPRI survey. Cleans and merges all relevant columns and filters out generic or non-substantive responses. Output: `fig_8_wordcloud_wk16.png`.

- `09-visualization-wordcloud-week17.R`: Generates a wordcloud of responses to open-ended questions (P01 and P02) from Week 17 of the IPRI survey. Cleans and merges all relevant columns and filters out generic or non-substantive responses. Output: `fig_9_wordcloud_wk17.png`.

- `10-visualization-wordcloud-week18.R`: Generates a wordcloud of responses to open-ended questions (P01 and P02) from Week 18 of the IPRI survey. Cleans and merges all relevant columns and filters out generic or non-substantive responses. Output: `fig_10_wordcloud_wk18.png`.

- `11-visualization-wordcloud-week7-low-income.R`: Generates a wordcloud of responses to open-ended questions (P01 and P02) from Week 7 of the IPRI survey, limited to respondents earning up to 10 minimum wages/month (PF14). Cleans and merges all relevant columns and filters out generic or non-substantive responses. Output: `fig_11_wordcloud_wk7_low_income.png`.

- `12-visualization-wordcloud-week8-low-income.R`: Generates a wordcloud of responses to open-ended questions (P01 and P02) from Week 8 of the IPRI survey, limited to respondents earning up to 10 minimum wages/month (PF14). Cleans and merges all relevant columns and filters out generic or non-substantive responses. Output: `fig_12_wordcloud_wk8_low_income.png`.

- `13-visualization-wordcloud-week9-low-income.R`: Generates a wordcloud of responses to open-ended questions (P01 and P02) from Week 9 of the IPRI survey, limited to respondents earning up to 10 minimum wages/month (PF14). Cleans and merges all relevant columns and filters out generic or non-substantive responses. Output: `fig_13_wordcloud_wk9_low_income.png`.

- `14-visualization-wordcloud-week16-low-income.R`: Generates a wordcloud of responses to open-ended questions (P01 and P02) from Week 16 of the IPRI survey, limited to respondents earning up to 10 minimum wages/month (PF14). Cleans and merges all relevant columns and filters out generic or non-substantive responses. Output: `fig_14_wordcloud_wk16_low_income.png`.

- `15-visualization-wordcloud-week17-low-income.R`: Generates a wordcloud of responses to open-ended questions (P01 and P02) from Week 17 of the IPRI survey, limited to respondents earning up to 10 minimum wages/month (PF14). Cleans and merges all relevant columns and filters out generic or non-substantive responses. Output: `fig_15_wordcloud_wk17_low_income.png`.

- `16-visualization-wordcloud-week18-low-income.R`: Generates a wordcloud of responses to open-ended questions (P01 and P02) from Week 18 of the IPRI survey, limited to respondents earning up to 10 minimum wages/month (PF14). Cleans and merges all relevant columns and filters out generic or non-substantive responses. Output: `fig_16_wordcloud_wk18_low_income.png`.

- `17-visualization-wordcloud-week7-high-income.R`: Generates a wordcloud of responses to open-ended questions (P01 and P02) from Week 7 of the IPRI survey, limited to respondents earning more than 10 minimum wages/month (PF14). Cleans and merges all relevant columns and filters out generic or non-substantive responses. Output: `fig_17_wordcloud_wk7_high_income.png`.

- `18-visualization-wordcloud-week8-high-income.R`: Generates a wordcloud of responses to open-ended questions (P01 and P02) from Week 8 of the IPRI survey, limited to respondents earning more than 10 minimum wages/month (PF14). Cleans and merges all relevant columns and filters out generic or non-substantive responses. Output: `fig_18_wordcloud_wk8_high_income.png`.

- `19-visualization-wordcloud-week9-high-income.R`: Generates a wordcloud of responses to open-ended questions (P01 and P02) from Week 9 of the IPRI survey, limited to respondents earning more than 10 minimum wages/month (PF14). Cleans and merges all relevant columns and filters out generic or non-substantive responses. Output: `fig_19_wordcloud_wk9_high_income.png`.

- `20-visualization-wordcloud-week16-high-income.R`: Generates a wordcloud of responses to open-ended questions (P01 and P02) from Week 16 of the IPRI survey, limited to respondents earning more than 10 minimum wages/month (PF14). Cleans and merges all relevant columns and filters out generic or non-substantive responses. Output: `fig_20_wordcloud_wk16_high_income.png`.

- `21-visualization-wordcloud-week17-high-income.R`: Generates a wordcloud of responses to open-ended questions (P01 and P02) from Week 17 of the IPRI survey, limited to respondents earning more than 10 minimum wages/month (PF14). Cleans and merges all relevant columns and filters out generic or non-substantive responses. Output: `fig_21_wordcloud_wk17_high_income.png`.

- `22-visualization-wordcloud-week18-high-income.R`: Generates a wordcloud of responses to open-ended questions (P01 and P02) from Week 18 of the IPRI survey, limited to respondents earning more than 10 minimum wages/month (PF14). Cleans and merges all relevant columns and filters out generic or non-substantive responses. Output: `fig_22_wordcloud_wk17_high_income.png`.

- `23-visualization-wordcloud-un-2019.R`: Generates a wordcloud from Bolsonaro's 2019 UNGA speech. Output: `fig_23_wordcloud_un2019.png`.

- `24-visualization-wordcloud-un-2020.R`: Generates a wordcloud from Bolsonaro's 2020 UNGA speech. Output: `fig_24_wordcloud_un2020.png`.

- `25-visualization-wordcloud-un-2021.R`: Generates a wordcloud from Bolsonaro's 2021 UNGA speech. Output: `fig_25_wordcloud_un2021.png`.

- `26-visualization-wordcloud-un-2022.R`: Generates a wordcloud from Bolsonaro's 2022 UNGA speech. Output: `fig_26_wordcloud_un2022.png`.

- `27-visualization-wordcloud-un-19to22.R`: Generates a wordcloud from Bolsonaro's UNGA speeches from 2019 to 2022. Output: `fig_27_wordcloud_un19to22.png`.

- `28-visualization-bigrams-un-19to22.R`: Extracts and visualizes the 15 most frequent bigrams from Bolsonaro's UNGA speeches (2019-2022). Output: `fig_28_bigram_un19to22.png`.

- `29-visualization-wordcloud-speech-ambassadors.R`: Generates a wordcloud from Bolsonaro's 2022 speech to ambassadors. Output: `fig_29_wordcloud_ambassadors.png`.

- `30-visualization-bigrams-ambassadors.R`: Extracts and visualizes the 15 most frequent bigrams from Bolsonaro's speech to ambassadors (2022). Output: `fig_30_bigram_ambassadors.png`.


All scripts are written in R and located in the `/scripts/` directory.


## Data Sources

- **IPRI Survey Data**  
  All raw data from the IPRI (Instituto de Pesquisa de Reputação e Imagem) surveys comes from the official open data repository of the Brazilian government:  
  [gov.br/secom](https://www.gov.br/secom/pt-br/composicao/orgaos-especificos-singulares/secretaria-de-publicidade-e-patrocinio/departamentos/departamento-de-pesquisa/dados-abertos-de-pesquisas-de-opiniao)

- **UN General Assembly Speeches by Jair Bolsonaro**  
  Transcripts of Bolsonaro’s speeches at the UN General Assembly from 2019 to 2022 were manually extracted from official sources:
  - [2019 – Agência Brasil](https://agenciabrasil.ebc.com.br/politica/noticia/2019-09/presidente-jair-bolsonaro-discursa-na-assembleia-geral-da-onu)
  - [2020 – Agência Brasil](https://agenciabrasil.ebc.com.br/politica/noticia/2020-09/veja-integra-do-discurso-de-bolsonaro-na-75a-assembleia-geral-da-onu)
  - [2021 – Planalto (Official Government Website)](https://www.gov.br/planalto/pt-br/acompanhe-o-planalto/noticias/2021/09/discurso-do-presidente-da-republica-jair-bolsonaro-na-abertura-da-76deg-assembleia-geral-da-onu)
  - [2022 – Library of the Presidency of the Republic](http://www.biblioteca.presidencia.gov.br/presidencia/ex-presidentes/bolsonaro/discursos/discurso-do-presidente-da-republica-jair-bolsonaro-na-abertura-do-debate-geral-da-77a-sessao-da-assembleia-geral-das-nacoes-unidas-agnu)

- **Speech to Ambassadors (2022)**  
  The transcript of Bolsonaro’s July 2022 speech to foreign ambassadors—an event that later contributed to his ineligibility ruling by Brazil’s Electoral Court—was obtained from:  
  [Aos Fatos](https://www.aosfatos.org/noticias/transcricao-checagens-discurso-bolsonaro-embaixadores/)


## Notes

- Weeks 2 to 5 were excluded because they focused exclusively on regional-level samples, whereas the analysis is based on nationally representative weekly surveys to ensure comparability across time.

- Special-topic monthly surveys were also excluded, as they did not follow the same structure, timing, or thematic focus as the regular weekly rounds. Their inclusion could introduce inconsistencies and bias the temporal analysis of public opinion dynamics during 2022.

- We created weekly approval trend graphs segmented by income groups (≤10 and >10 minimum wages) across the weeks included in the analysis. However, since these trends are not directly related to our core research question, we opted not to include them in the final version of the article. For transparency, the corresponding scripts remain available in the project repository.

- Based on the previous analysis, we also explored stratified wordclouds based on respondents’ income (PF14), separating those earning more than and less than or equal to 10 minimum wages. This approach aimed to assess whether foreign policy was recalled differently across social classes, as there is a common perception that higher-income groups are more attuned to international affairs than lower-income groups. However, due to a substantial imbalance in sample sizes — with high-income respondents representing only a small fraction of the full sample — we chose not to include these figures in the main analysis. Still, the responses related to foreign policy events appeared fairly consistent across the sample. The scripts remain available in the repository for transparency, but the figures were excluded from the article to maintain analytical focus and avoid misleading visual comparisons.

- As the IPRI surveys were commissioned by the Federal Government, the framing or focus of certain questions may have been influenced by institutional interests, potentially affecting the neutrality of the data.

- The reliance on telephone-based data collection may have introduced an income-related bias, as individuals without access to telephones—typically from lower-income backgrounds—were likely excluded. This limitation is particularly relevant given that lower-income groups strongly supported Lula in the 2022 elections, which may affect the representativeness of public opinion reflected in the study.

- Despite these limitations, the dataset remains a valuable resource for analyzing public opinion in Brazil during a period of intense political and diplomatic activity. The surveys offer rare insight into how the general public perceives foreign policy and high-profile international events. While caution is warranted when interpreting the results, the data nonetheless allow for meaningful reflection on the domestic resonance of presidential diplomacy and the role of foreign affairs in shaping public sentiment.