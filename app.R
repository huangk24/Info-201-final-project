# loading necessary libraries
library(shiny)
library(dplyr)
library(ggplot2)
library(plotly)
library(shinythemes)
# loading the data set we use
load("movie_data.Rda")
# sourcing in files for different pages
source("./scripts/overview.R")
source("./scripts/question1.R")
source("./scripts/question2.R")
source("./scripts/question3.R")
# assign pages to ui
ui <- navbarPage(
  theme = shinytheme("flatly"),
  # assing label for page
  "Movie Analysis",
  overview, q1_ui, q2_ui, q3_ui
)

# shiny ui and server. code for individual questions are in scripts folder.

# set up page menu in ui
ui <- navbarPage(
  theme = shinytheme("flatly"), "Movie Analysis",
  # calling in ui from files for each page
  overview, q1_ui, q2_ui, q3_ui
)

# build server
server <- function(input, output, session) {
  # assigning plots to outputs, one from each page with input
  output$q1 <- renderPlotly(q1_plot(input$color, input$rating, input$num_voted))
  output$q2 <- renderPlot(q2_plot(input$genre_vector, input$year_range))
  output$q3 <- renderPlot(q3_plot(input$review, input$color_choice))
  # data management for q2 plot
  observe({
    if (input$uncheck > 0) {
      updateCheckboxGroupInput(session, "genre_vector", selected = "")
    }
  })
}
# pass in ui and server to build shiny app
shinyApp(ui = ui, server = server)
