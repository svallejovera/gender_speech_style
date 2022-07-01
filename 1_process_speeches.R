## 1. Pre Process Text ##
## SVV and AGV ##

rm(list=ls(all=TRUE))

library(tidyverse)
library(tidylog)
library(tidytext)
library(quanteda)

## Load speeches ##
setwd("/Volumes/SP B75 PRO/Papers and Chapters/Gendered Speech in Gendered Institutions/Data")
load("speeches_pos_all_text.Rdata")

## Create ID ##
speeches_pos_all$text_id <- c(1:length(speeches_pos_all$doc_id))

## We keep only ID and text ##
speeches_only <- speeches_pos_all %>%
  select(text_id,speeches,legislator.x)

## Clean text ##

# Names of the person speaking
speeches_only$speeches_clean <- str_remove(speeches_only$speeches,speeches_only$legislator.x)

# Mentions of the speaker
speeches_only$speeches_clean <- str_remove_all(speeches_only$speeches_clean,'[sS]e[nñ]or [pP]residente')
speeches_only$speeches_clean <- str_remove_all(speeches_only$speeches_clean,'[sS]e[nñ]ora [pP]resident[ae]')

## Devide text into sentences (our unit of analysis) ##
speeches_corpus <- corpus(speeches_only$speeches_clean,
                          docnames = speeches_only$text_id)

speeches_sent <- corpus_segment(speeches_corpus, 
                                pattern = "\\.|\\?|\\!",
                                valuetype = "regex")

speeches_sent <- convert(speeches_sent, 
                         to = "data.frame")

# Eliminate punct and really short sentences < 5
speeches_sent$text <-  gsub('[[:punct:] ]+',' ',speeches_sent$text)
speeches_sent$text <- str_squish(speeches_sent$text)
speeches_sent$text <- tolower(speeches_sent$text)
speeches_sent <- speeches_sent[ntype(speeches_sent$text)>5,]

# New column names and save:
colnames(speeches_sent) <- c("text_id","text","pattern")

# short <- speeches_sent[c(2000000:2003000),]

# Save 
setwd("/Users/sebastian/OneDrive - University Of Houston/Papers and Chapters/Gendered Speech in Gendered Institutions/Data/data_styles")
save(speeches_pos_all, file = "speeches_id.Rdata")
save(speeches_sent, file = "speeches_sent.Rdata")

writexl::write_xlsx(speeches_sent[c(1:150000),], path = "speeches_sent_1.xlsx")
writexl::write_xlsx(speeches_sent[c(150001:300000),], path = "speeches_sent_2.xlsx")
writexl::write_xlsx(speeches_sent[c(300001:450000),], path = "speeches_sent_3.xlsx")
writexl::write_xlsx(speeches_sent[c(450001:600000),], path = "speeches_sent_4.xlsx")
writexl::write_xlsx(speeches_sent[c(600001:750000),], path = "speeches_sent_5.xlsx")
writexl::write_xlsx(speeches_sent[c(750001:900000),], path = "speeches_sent_6.xlsx")
writexl::write_xlsx(speeches_sent[c(900001:1050000),], path = "speeches_sent_7.xlsx")
writexl::write_xlsx(speeches_sent[c(1050001:1200000),], path = "speeches_sent_8.xlsx")
writexl::write_xlsx(speeches_sent[c(1200001:1350000),], path = "speeches_sent_9.xlsx")
writexl::write_xlsx(speeches_sent[c(1350001:1500000),], path = "speeches_sent_10.xlsx")
writexl::write_xlsx(speeches_sent[c(1500001:1650000),], path = "speeches_sent_11.xlsx")
writexl::write_xlsx(speeches_sent[c(1650001:1800000),], path = "speeches_sent_12.xlsx")
writexl::write_xlsx(speeches_sent[c(1800001:1950000),], path = "speeches_sent_13.xlsx")
writexl::write_xlsx(speeches_sent[c(1950000:2030096),], path = "speeches_sent_14.xlsx")


writexl::write_xlsx(speeches_sent[c(1400001:1402001),], path = "short.xlsx")



