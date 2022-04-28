

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    
    #some data manipulation to derive the values of KPI boxes
    
    totalEmission <- sum(transmissionWiseEmission$totalCo2PerKm)
    sales.account <- recommendation %>% group_by(Account) %>%
        summarise(value = sum(Revenue)) %>% filter(value == max(value))
    prof.prod <- recommendation %>% group_by(Product) %>%
        summarise(value = sum(Revenue)) %>% filter(value == max(value))
    #creating the valueBoxOutput content
    output$value1 <- semantic.dashboard::render_value_box({
        semantic.dashboard::value_box(
            value = formatC(sales.account$value, format="d", big.mark=','),
            subtitle = paste('Top Account:', sales.account$Account),
            icon = icon("bar chart"),
            color = "purple",
            width = 5)
    })
    output$value2 <- semantic.dashboard::render_value_box({
        semantic.dashboard::value_box(
            value = formatC(totalEmission, format = "d", big.mark = ','),
            subtitle = 'Total Emission',
            icon = icon("line chart"),
            color = "green",
            width = 5)
    })
    output$value3 <- semantic.dashboard::render_value_box({
        semantic.dashboard::value_box(
            value = formatC(prof.prod$value, format = "d", big.mark = ','),
            subtitle = paste('Top Product:', prof.prod$Product),
            icon = icon("bar chart"),
            color = "blue",
            width = 5)
    })
    #creating the plotOutput content
    output$revenuebyPrd <- renderPlot({
        ggplot(data = recommendation,
               aes( x= Product, y = Revenue, fill = factor(Region))) +
            scale_fill_manual(values = as.vector(semantic_palette)) +
            geom_bar(position = "dodge", stat = "identity") + ylab("Revenue (in Euros)") +
            xlab("Product") + theme(legend.position="bottom",
                                    plot.title = element_text(size = 15, face = "bold")) +
            ggtitle("Revenue by Product") + labs(fill = "Region")
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
