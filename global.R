library(shiny)
library(semantic.dashboard)
library(ggplot2)
library(dplyr,lib.loc = "lib")

source(paste0(getwd(),"/uiComponent/body.R"))
source(paste0(getwd(),"/uiComponent/header.R"))
source(paste0(getwd(),"/uiComponent/sidebar.R"))



rawdf <- read.csv("emm.csv")
recommendation <- read.csv("recommd.csv")
transmissionWiseEmission <- rawdf %>%
  group_by(manufacturer,
           transmission) %>%
  summarise(n = n(),
            totalCo2PerKm = sum(co2_emissions_gPERkm),
            avgCo2PerKm = mean(co2_emissions_gPERkm)) %>% 
  dplyr::arrange(desc(totalCo2PerKm),
                 .group_by = T)