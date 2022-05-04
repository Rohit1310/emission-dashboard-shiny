#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(semantic.dashboard::dashboard_page(
    title = 'Emission Dashboard',
    header = ui_header,
    sidebar = side_bar,
    body = ui_body
        )
    )
