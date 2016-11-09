library(rio)
library(plyr)
library(dplyr)
library(rvest)
library(xml2)
library(countrycode)

#Independent variables

#5. Energy technologies patent applications to the EPO by priority year

energy_patent <- import('https://raw.githubusercontent.com/Camila-RV/VieiraKhanna_Assignment3/master/data_raw/pat_ep_nrg_1_Data.csv')

#select the necessary columns
head(energy_patent)
energy_patent <- select(energy_patent, GEO, TIME, Value)
head(energy_patent)

#treat value column as numeric + clean missing values
energy_patent[,3] <- as.numeric(energy_patent[,3])
summary(energy_patent$Value)
energy_patent <- subset(x = energy_patent,!is.na(Value))
summary(energy_patent)

#arranging data - ascending
head(energy_patent)
energy_patent<- arrange(energy_patent, GEO, TIME)
head(energy_patent)

#create new column for country codes + adjusting order of columns
energy_patent["iso2c"] <- ""
energy_patent <- select(energy_patent, iso2c, GEO, TIME, Value)
energy_patent <- rename(energy_patent, year = TIME, country = GEO)
head(energy_patent)


#matching country names to codes
cnames <- c('Austria','Belgium','Bulgaria','Croatia','Cyprus',
            'Czech Republic','Denmark','Estonia','Finland','France',
            'Germany','Greece','Hungary','Ireland','Italy','Latvia',
            'Lithuania','Luxembourg','Malta','Netherlands','Poland',
            'Portugal','Romania','Slovakia','Slovenia','Spain','Sweden',
            'United Kingdom')

countrycode(cnames, "country.name", "iso2c") 
 
wiki <- "https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2"

energy_patent <- readHTMLTable(wiki, header=TRUE, which=3, stringAsFactors=FALSE)[1:2]

energy_patent$'Code'[match(energy_patent, country$cnames)]

head(energy_patent)
        
energy_patent <- if ("iso2c" == "country.name")

energy_patent$iso2c[match(codes, energy_patent$"GEO")]
head(energy_patent)
          

#6. Long term interest rates (10 year bond yields) 

interest_rates <- import('https://raw.githubusercontent.com/Camila-RV/VieiraKhanna_Assignment3/master/data_raw/interest_rates_annual.csv')

#select the necessary columns
head(interest_rates)
interest_rates <- select(interest_rates, GEO, TIME, Value)
head(energy_patent)

#treat value column as numeric + clean missing values
interest_rates[,3] <- as.numeric(interest_rates[,3])
summary(interest_rates$Value)
#interest_rates <- subset(x = interest_rates,!is.na(Value))
#summary(interest_rates)

#7. Oil price

oil_price <- import('https://raw.githubusercontent.com/Camila-RV/VieiraKhanna_Assignment3/master/data_raw/crude_opec_all countries.csv')

#treat value column as numeric + clean missing values
oil_price[,2] <- as.numeric(oil_price[,2])
summary(oil_price $Value)



