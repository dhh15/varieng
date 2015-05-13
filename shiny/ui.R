fluidPage(
    # Application title
    titlePanel("DH Hackathon"),
    
    sidebarLayout(
        # Sidebar with a slider and selection inputs
        sidebarPanel(
            selectInput("selection", "Choose a year:",
                        choices = years),
            actionButton("update", "Change"),
            hr(),
            sliderInput("freq",
                        "Minimum Frequency:",
                        min = 1,  max = 50, value = 15),
            sliderInput("max",
                        "Maximum Number of Words:",
                        min = 1,  max = 300,  value = 100)
            
        ),
        
        # Show Word Cloud
        mainPanel(
            h2("Word Cloud", align = "center"),
            plotOutput("plot")
        )
    )
)