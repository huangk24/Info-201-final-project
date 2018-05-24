library(shiny)
library(dplyr)
library(ggplot2)
library(plotly)
load("movie_data.Rda")
source("./scripts/question2.R")

ui <- navbarPage("Movie Analysis", q2_ui)

server <- function(input, output, session) {
  output$q2 <- renderPlot(q2_plot(input$genre_vector, input$year_range))
  observe({
    if (input$uncheck > 0) 
      updateCheckboxGroupInput(session, "genre_vector", selected="")
  })
}

shinyApp(ui = ui, server = server)
