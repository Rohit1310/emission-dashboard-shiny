

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    
    #some data manipulation to derive the values of KPI boxes
    
    totalEmission <- sum(transmissionWiseEmission$totalCo2PerKm)
    sales.account <- brandWiseEmission[1,]
    prof.prod <- engineSizeWiseEmission[1,]
    #creating the valueBoxOutput content
    output$value1 <- semantic.dashboard::render_value_box({
        semantic.dashboard::value_box(
            value = formatC(sales.account$totalCo2PerKm, format="d", big.mark=','),
            subtitle = paste('Top Emission(gm/km) Manufacturer:', sales.account$manufacturer),
            icon = icon("bar chart"),
            color = "purple",
            width = 5)
    })
    output$value2 <- semantic.dashboard::render_value_box({
        semantic.dashboard::value_box(
            value = formatC(totalEmission, format = "d", big.mark = ','),
            subtitle = 'Total Emission(gm/km)',
            icon = icon("line chart"),
            color = "green",
            width = 5)
    })
    output$value3 <- semantic.dashboard::render_value_box({
        semantic.dashboard::value_box(
            value = formatC(prof.prod$totalCo2PerKm, format = "d", big.mark = ','),
            subtitle = paste('Top Emission(gm/km) Engine Size(cm3):', prof.prod$engine_size_cm3),
            icon = icon("bar chart"),
            color = "blue",
            width = 5)
    })
    #creating the plotOutput content
    output$revenuebyPrd <- renderPlot({
        ggplot(data = data.frame(transmissionWiseEmission,stringsAsFactors = F),
               aes( x= manufacturer, y = totalCo2PerKm, fill = factor(transmission))) +
            scale_fill_manual(values = as.vector(semantic_palette)) +
            geom_bar(position = "dodge", stat = "identity") + ylab(" (Emission in gm/Km)") +
            xlab("Manufacturer") + theme(legend.position="bottom",
                                    plot.title = element_text(size = 42, face = "bold")) +
            ggtitle("Emission by Manufacturer") + labs(fill = "Transmission Type")
    })
    output$revenuebyRegion <- renderPlot({
        ggplot(data = recommendation,
               aes(x = Account, y = Revenue, fill = factor(Region))) +
            scale_fill_manual(values = as.vector(semantic_palette)) +
            geom_bar(position = "dodge", stat = "identity") + ylab("Revenue (in Euros)") +
            xlab("Account") + theme(legend.position="bottom",
                                    plot.title = element_text(size = 15, face = "bold")) +
            ggtitle("Revenue by Region") + labs(fill = "Region")
    })
    
    output$dropdown <- semantic.dashboard::render_dropdown_menu({
        semantic.dashboard::dropdown_menu(messageItem("User", "Test message", color = "teal", style = "min-width: 200px"),
                     messageItem("Users", "Test message", color = "teal", icon = "users"),
                     messageItem("See this", "Another test", icon = "warning", color = "red"))
    })
})
