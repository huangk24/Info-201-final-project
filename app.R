library(shiny)
library(dplyr)
library(ggplot2)
library(plotly)
library(shinythemes)
load("movie_data.Rda")
source("./scripts/overview.R")
source("./scripts/question1.R")
source("./scripts/question2.R")
source("./scripts/question3.R")

# shiny ui and server. code for individual questions are in scripts folder. 

ui <- navbarPage(theme = shinytheme("flatly"), "Movie Analysis",
                 overview, q1_ui, q2_ui, q3_ui)

server <- function(input, output, session) {
  output$q1 <- renderPlotly(q1_plot(input$color, input$rating, input$num_voted))
  output$q2 <- renderPlot(q2_plot(input$genre_vector, input$year_range))
  output$q3 <- renderPlot(q3_plot(input$review))
  observe({
    if (input$uncheck > 0) {
      updateCheckboxGroupInput(session, "genre_vector", selected = "")
    }
  })
}

shinyApp(ui = ui, server = server)
