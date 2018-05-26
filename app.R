library(shiny)
library(dplyr)
library(ggplot2)
library(plotly)
library(shiny)
library(shinythemes)
load("movie_data.Rda")
source("./scripts/question1.R")
source("./scripts/question2.R")


ui <- navbarPage("Movie Analysis", theme = "style.css", q1_ui, q2_ui)

#ui <- navbarPage(theme = shinytheme("flatly"), tags$link(rel="stylesheet", type = "text/css", href = "style.css"), "Movie Analysis", q1_ui, q2_ui)

server <- function(input, output, session) {
  output$q1 <- renderPlotly(q1_plot(input$color, input$rating, input$num_voted))
  output$q2 <- renderPlot(q2_plot(input$genre_vector, input$year_range))
  observe({
    if (input$uncheck > 0) {
      updateCheckboxGroupInput(session, "genre_vector", selected = "")
    }
  })
}

shinyApp(ui = ui, server = server)
