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
  tabPanel(
    "Overview",
    mainPanel(
      tags$div(
        tags$link(rel = "stylesheet", type = "text/css", href = "style.css"),
        h2("Project Overview"),
        p("Group memers: Haley Buls, Kai Huang, Yuxuan Lu"),
        tags$hr()
      ),
      tags$div(
        h1("Project Description"),
        p(
          "For our project, we are using the ",
          strong("IMDB 5000 Movie Dataset"), " we found on ",
          tags$a(href = "https://www.kaggle.com", "Kaggle"),
          ". It is a static ", code("csv"), " file with information of ",
          "around 5000 movies including their titles, publish years, genres,",
          " budgets, profits and so on. Yuxuan collected this data after a ",
          "search online and brought it to the database."
        ),
        p(
          "Our target audience includes interested movie goers and ",
          "television watchers. The target audience we will hone in on is ",
          "primarily a user that is familiar with IMDB and Facebook, the ",
          "sites from which the data base was collected. They will be ",
          "familiar not only with the content analyzed (movies and ",
          "television), but familiar with further information on the ",
          "production and reception of media, such as the number of critical",
          "reviews a movie earns."
        ),
        p("Three questions we intend to answer for our users:"),
        p(
          strong("1)"), "Does high IMDB score means the movie is good and low IMDB ",
          "score means the movie is bad? We will look at the relationship ",
          "between the IMDB score of the movie and the profit of the movie."
        ),
        p(
          strong("2)"), "What types of movies are most popular? We will look at the ",
          "relationship between the movie genres and the number of movies of",
          "each genre produced."
        ),
        p(
          strong("3)"), "What do people like to see in movies? We will look at the ",
          "relationship between the key words associated with a movie and ",
          "the number of likes garnered by the film in several categories ",
          "online."
        ),
        tags$hr()
      )
    )
  ), q1_ui, q2_ui, q3_ui
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
