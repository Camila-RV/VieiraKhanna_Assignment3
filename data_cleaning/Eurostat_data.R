library(eurostat)
library(rvest)
library(xml2)
library(dplyr)
library(knitr)
library(readr)
library(tidyr)
library(stringr)
library(ggplot2)
library(httr)
library(htmltools)
library(rmarkdown)


#Independent variables

#5. Energy technologies patent applications to the EPO by priority year

grepEurostatTOC("patent")

id <- search_eurostat('Energy technologies patent applications to 
                      the EPO by priority year', type = 'dataset')$code[1]
print(id)

dat <- get_eurostat('pat_ep_nrgpct')

#6. 


