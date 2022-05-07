frow1 <- fluidRow(
  semantic.dashboard::value_box_output("value1"), 
  semantic.dashboard::value_box_output("value2"),
  semantic.dashboard::value_box_output("value3")
)

frow2 <- fluidRow(
  semantic.dashboard::box(
    title = "Top 10 Emission",
    color = "blue",
    ribbon = TRUE,   
    collapsible = TRUE,    
    width = 8,
    plotOutput("revenuebyPrd", height = "300px")
  ),
  semantic.dashboard::box(
    title = "Top 10 Emission",
    color = "blue",
    ribbon = TRUE,
    collapsible = TRUE,
    width = 8,
    plotOutput("revenuebyRegion", height = "300px")
  )
)




ui_body <- semantic.dashboard::dashboardBody(title = "UK Car Emission Analysis Dashboard",
                                             frow1,
                                             frow2)
