library(shiny)
library(semantic.dashboard,lib.loc = "lib")
library(ggplot2,lib.loc = "lib")
library(DBI,lib.loc = "lib")
library(RSQLite,lib.loc = "lib")
library(dplyr,lib.loc = "lib")

source(paste0(getwd(),"/uiComponent/body.R"))
source(paste0(getwd(),"/uiComponent/header.R"))
source(paste0(getwd(),"/uiComponent/sidebar.R"))


mydb <- dbConnect(RSQLite::SQLite(),'my-db.sqlite')
rawdf <- DBI::dbGetQuery(conn = mydb,statement = 'Select * from cartable')
recommendation <- DBI::dbGetQuery(conn = mydb,statement = 'Select * from recom1')
transmissionWiseEmission <- rawdf %>%
  group_by(manufacturer,
           transmission) %>%
  summarise(n = n(),
            totalCo2PerKm = sum(co2_emissions_gPERkm),
            avgCo2PerKm = mean(co2_emissions_gPERkm)) %>% 
  dplyr::arrange(desc(totalCo2PerKm),
                 .group_by = T)