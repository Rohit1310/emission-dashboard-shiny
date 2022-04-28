## ----setup, include = FALSE, screenshot.force = FALSE-------------------------
knitr::opts_chunk$set(
  echo = TRUE,
  collapse = TRUE,
  comment = "#>"
)
library(shiny)
library(shiny.semantic)
library(semantic.dashboard)

## ----echo=T, include = T, eval = FALSE, screenshot.force = FALSE--------------
#  library(shiny)
#  library(semantic.dashboard)
#  
#  ui <- dashboardPage(
#    dashboardHeader(),
#    dashboardSidebar(),
#    dashboardBody()
#  )
#  
#  server <- shinyServer(function(input, output, session) {
#  
#  })
#  
#  shinyApp(ui, server)

## ----echo=T, include = T, eval = FALSE, screenshot.force = FALSE--------------
#  dashboardHeader(color = "blue", title = "Dashboard Demo", inverted = TRUE)

## ----echo=T, include = T, eval = FALSE, screenshot.force = FALSE--------------
#    dashboardHeader(color = "blue", title = "Dashboard Demo", inverted = TRUE,
#                    dropdownMenu(type = "notifications",
#                                 taskItem("Project progress...", 50.777, color = "red")))

## ----echo=T, include = T, eval = FALSE, screenshot.force = FALSE--------------
#    dashboardSidebar(
#      size = "thin", color = "teal",
#      sidebarMenu(
#        menuItem(tabName = "main", "Main"),
#        menuItem(tabName = "extra", "Extra")
#      )
#    )

## ----echo=T, include = T, eval = FALSE, screenshot.force = FALSE--------------
#    dashboardBody(
#      tabItems(
#        selected = 1,
#        tabItem(
#          tabName = "main",
#          box(h1("main"), title = "A b c", width = 16, color = "orange")
#        ),
#        tabItem(
#          tabName = "extra",
#            h1("extra")
#        )
#      )
#    )

## ----echo=T, include = T, eval = FALSE, screenshot.force = FALSE--------------
#  library(shiny)
#  library(semantic.dashboard)
#  
#  ui <- dashboardPage(
#    dashboardHeader(color = "blue", title = "Dashboard Demo", inverted = TRUE,
#                    dropdownMenu(type = "notifications",
#                                 taskItem("Project progress...", 50.777, color = "red"))),
#    dashboardSidebar(
#      size = "thin", color = "teal",
#      sidebarMenu(
#        menuItem(tabName = "main", "Main"),
#        menuItem(tabName = "extra", "Extra")
#      )
#    ),
#    dashboardBody(
#      tabItems(
#        selected = 1,
#        tabItem(
#          tabName = "main",
#          box(h1("main"), title = "A b c", width = 16, color = "orange")
#        ),
#        tabItem(
#          tabName = "extra",
#            h1("extra")
#        )
#      )
#    )
#  )
#  
#  server <- function(input, output, session) {}
#  
#  shinyApp(ui, server)

