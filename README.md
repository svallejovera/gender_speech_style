# Speech Styles

The repository contains the required code to estimate speech styles in (political) text. The current approach is a generalized version of [Hargrave and Blumenau (2022)](https://www.cambridge.org/core/journals/british-journal-of-political-science/article/abs/no-longer-conforming-to-stereotypes-gender-political-style-and-parliamentary-debate-in-the-uk/90A859B95E11AF370728DC29B778891F). It uses a cross-lingual, Transformer-based approach to estimate word embeddings and relate each word in a speech to a series of words in a seed dictionary containing various characteristics of speech. See working paper.

Each file is numbered according to the order of execution and thoroughly annotated. Depending on the size of the corpus, the code can take long time to run. For WP, the corpus contains XX speeches (after removing YY), and ZZ tokens. We used [description of computer] and the code took around WWW to run. 
