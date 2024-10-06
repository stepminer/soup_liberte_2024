#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

# Load necessary libraries
library(shiny)
library(leaflet)
library(ggplot2)
library(dplyr)
library(sf)  # Modern spatial library replacing rgdal, rgeos, and maptools

# Load the data (make sure to update the path to your CSV file if needed)
soup_data <- read.csv("soup_libete_2024_geo.csv")

# Convert soup_data to sf object using latitude and longitude
soup_data_sf <- st_as_sf(soup_data, coords = c("longitude", "latitude"), crs = 4326)

# Define UI
ui <- fluidPage(
  titlePanel("Soup Liberté Distribution Map - Haiti"),
  
  sidebarLayout(
    sidebarPanel(
      selectInput("departement", "Choose Departement:",
                  choices = c("All", unique(soup_data$departement)),
                  selected = "All"),
      uiOutput("commune_selector")
    ),
    
    mainPanel(
      tabsetPanel(
        tabPanel("Map", leafletOutput("soup_map")),
        tabPanel("Bar Graph", plotOutput("soup_bar"))
      )
    )
  )
)

# Define server logic
server <- function(input, output, session) {
  
  # Reactive commune selector based on departement
  output$commune_selector <- renderUI({
    selected_dept <- input$departement
    if (selected_dept == "All") {
      selectInput("commune", "Choose Commune:", choices = c("All"), selected = "All")
    } else {
      communes <- soup_data %>% filter(departement == selected_dept) %>% select(commune) %>% unique()
      selectInput("commune", "Choose Commune:", choices = c("All", communes$commune), selected = "All")
    }
  })
  
  # Reactive filtered data
  filtered_data <- reactive({
    data <- soup_data_sf
    if (input$departement != "All") {
      data <- data %>% filter(departement == input$departement)
    }
    if (input$commune != "All") {
      data <- data %>% filter(commune == input$commune)
    }
    data
  })
  
  # Render map using sf data
  output$soup_map <- renderLeaflet({
    data <- filtered_data()
    
    leaflet(data) %>%
      addTiles() %>%
      addCircleMarkers(radius = ~bols_soupe / 10, 
                       popup = ~paste0("Responsible: ", responsible, "<br>",
                                       "Commune: ", commune, "<br>",
                                       "Bols Soupe: ", bols_soupe, "<br>",
                                       "Maillots: ", maillots, "<br>",
                                       "Casquettes: ", casquettes),
                       color = "blue",
                       fillOpacity = 0.5)
  })
  
  # Render bar graph
  output$soup_bar <- renderPlot({
    data <- filtered_data()
    
    ggplot(data, aes(x = commune, y = bols_soupe, fill = commune)) +
      geom_bar(stat = "identity") +
      theme_minimal() +
      labs(title = "Distribution of Bols Soupe by Commune", x = "Commune", y = "Bols Soupe") +
      theme(axis.text.x = element_text(angle = 45, hjust = 1),
            legend.position = "none")
  })
}

# Run the application
shinyApp(ui = ui, server = server)
