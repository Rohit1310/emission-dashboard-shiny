side_bar <- semantic.dashboard::dashboard_sidebar(
  size = "wide",
  disable = T,
  semantic.dashboard::sidebar_menu(
    semantic.dashboard::menu_item(text = "Dashboard",
                                  tabName = "dashboard",
                                  icon = icon("bar chart")
                                  ),
    semantic.dashboard::menu_item(text = "Visit-us", 
                                  href = "https://www.appsilondatascience.com", icon = icon("at")
                                  )
    )
)