- Instituto de Pesquisa de Reputação e Imagem (IPRI) – Raw Data

The ZIP archives contain the raw data files from weekly public opinion surveys conducted by IPRI (Instituto de Pesquisa de Reputação e Imagem) between June and December 2022.

The included datasets correspond to Week 1 and Weeks 6 to 29 only. Weeks 2 to 5 were excluded because they focused exclusively on regional samples and were not directly comparable to the national-level surveys used in this analysis. Monthly special-topic surveys were also excluded for the same reason.

The original files include weekly microdata, questionnaires, and variable dictionaries, all in their original format (.xlsx). No modifications have been made to these files.

All raw data is publicly available and was obtained through the Brazilian government's open data portal:
https://www.gov.br/secom/pt-br/composicao/orgaos-especificos-singulares/secretaria-de-publicidade-e-patrocinio/departamentos/departamento-de-pesquisa/dados-abertos-de-pesquisas-de-opiniao

The cleaned and unified dataset used in this project can be found in `/data/clean/` for reproducibility purposes.

Source: IPRI / Secretaria de Comunicação Social da Presidência da República (SECOM)



- UN General Assembly Speeches – Raw Transcripts

This folder also contains the full transcripts of speeches delivered by former Brazilian President Jair Bolsonaro at the United Nations General Assembly (UNGA) from 2019 to 2022.

The transcripts were manually extracted from official government and press sources and saved in plain text format (.txt) to enable text analysis and visualization (e.g., wordclouds). No content has been altered aside from formatting adjustments for readability and compatibility with R-based scripts.

Each file corresponds to a single year and is named accordingly (e.g., bolsonaro_un_2019.txt, bolsonaro_un_2020.txt, etc.).

These documents are used in this project to analyze recurring themes and rhetorical strategies across Bolsonaro’s appearances at the UN. Visualizations based on these texts can be found in the /figures/ directory.

Sources:

	•	2019: Agência Brasil, a public news agency run by the Brazilian government (https://agenciabrasil.ebc.com.br/politica/noticia/2019-09/presidente-jair-bolsonaro-discursa-na-assembleia-geral-da-onu)

	•	2020: Agência Brasil (https://agenciabrasil.ebc.com.br/politica/noticia/2020-09/veja-integra-do-discurso-de-bolsonaro-na-75a-assembleia-geral-da-onu)

	•	2021: Planalto, the official website from the Brazilian government (https://www.gov.br/planalto/pt-br/acompanhe-o-planalto/noticias/2021/09/discurso-do-presidente-da-republica-jair-bolsonaro-na-abertura-da-76deg-assembleia-geral-da-onu)

	•	2022: Biblioteca da Presidência da República (Library of the Presidency of the Republic) (http://www.biblioteca.presidencia.gov.br/presidencia/ex-presidentes/bolsonaro/discursos/discurso-do-presidente-da-republica-jair-bolsonaro-na-abertura-do-debate-geral-da-77a-sessao-da-assembleia-geral-das-nacoes-unidas-agnu)


Format: Plain text (.txt)



- Ambassadors Meeting Speech – Raw Transcript

This folder also includes the full transcript of the speech delivered by former Brazilian President Jair Bolsonaro on July 18, 2022, to foreign ambassadors in Brasília.

This address became a central piece of the Electoral Court’s (TSE) decision to declare Bolsonaro ineligible for promoting unfounded claims about the integrity of Brazil’s electoral system. The transcript is stored in plain text format (bolsonaro_ambassadors_2022.txt) to enable text analysis and visualization (e.g., wordclouds and keyword extraction). No alterations have been made to the content, aside from formatting adjustments for compatibility with R-based scripts.

Source: Aos Fatos, Brazilian fact-checking agency
https://www.aosfatos.org/noticias/transcricao-checagens-discurso-bolsonaro-embaixadores/

Format: Plain text (.txt)