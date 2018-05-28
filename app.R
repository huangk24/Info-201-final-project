library(shiny)
library(dplyr)
library(ggplot2)
library(plotly)
library(shinythemes)
load("movie_data.Rda")
source("./scripts/question1.R")
source("./scripts/question2.R")

ui <- navbarPage(
  theme = shinytheme("flatly"),
  "Movie Analysis",
  tabPanel(
    "Overview",
      mainPanel(
        tags$div(
          tags$link(rel = "stylesheet", type = "text/css", href = "style.css"),
          h2("Project Overview"),
          p("Group menber: Haley Buls, Kai Huang, Yuxuan Lu"),
          tags$hr()
        ),
        tags$div(
          h3("Project Description"),
          p(
            "For our project, we are using the ",
            strong("IMDB 5000 Movie Dataset"), " we found on ",
            tags$a(href = "https://www.kaggle.com", "Kaggle"),
            ". It is a static ", code("csv"), " file with information of ",
            "around 5000 movies including their titles, publish years, genres,",
            " budgets, profits and so on. Bill collected this data after a ",
            "search online and brought it to the database."
          ),
          p(
            "Our target audience includes interested movie goers and ",
            "television watchers. The target audience we will hone in on is ",
            "primarily a user that is familiar with IMDb and Facebook, the ",
            "sites from which the data base was collected. They will be ",
            "familiar not only with the content analyzed (movies and ",
            "television), but familiar with further information on the ",
            "production and reception of media, such as the number of critical",
            "reviews a movie earns."
          ),
          p(
            "Three questions we intend to answer for our users:"
          ),
          p(
            "1) Does high Imdb score means the movie is good and low Imdb ",
            "score means the movie is bad? We will look at the relationship ",
            "between the Imdb score of the movie and the profit of the movie."
          ),
          p(
            "2) What types of movies are most popular? We will look at the ,",
            "relationship between the movie genres and the number of movies of",
            "each genre produced."
          ),
          p(
            "3) What do people like to see in movies? We will look at the ",
            "relationship between the key words associated with a movie and ",
            "the number of likes garnered by the film in several categories ",
            "online."
          ),
          tags$hr()
        ),
        tags$div(
          h3("Technical Description"),
          p(
            "We read in the static ", code(".csv"), " file to read in our ",
            "data. To reformat the data so it's more friendly, we first ",
            "checked the accuracy of the data, and ",
            em("left out columns that are not accurate"), "(eg. actors and ",
            "actors Facebook likes). Then, we ", em("rearranged the columns"),
            " for convenience so that relevant columns are next to each other.",
            "Finally, we ", em("converted '|' seperated list into vectors"),
            ", which makes the subsequent data wrangling easier. While doing ",
            "analysis, what is left to do is", strong("slicing data"), "and ",
            strong("remove empty string values"), " indicating data that is ",
            "not available. The processed movie data is stored in ",
            code("movie_data.Rda"), " which contains a dataframe of cleaned ",
            "movie data."
            ),
          p(
            "The major libraries we are going to use includes ", code("kabble"),
            "for rendering table in R markdown, ", code("ggplot2"), " and ",
            code("plotly"), " for charts and data ploting, and ", code("shiny"),
            "package for creating a dynamic website."
          ),
          p(
            "The challenge we will be facing is how to plot data so that it is",
            "intuitive and effective. Organizing the shiny app page content is",
            "also a major challenge for us."
          )
        )
      )
  ), q1_ui, q2_ui)

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
