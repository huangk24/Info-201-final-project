# answer question 1 specified in the project description. q1_plot returns a
# plot for visualization and q1_ui stores a tab panel.
library(dplyr)
library(plotly)
# load in data to be read
load("./movie_data.Rda")
# set up ui for question 1 page
q1_ui <- tabPanel(
  "Profit & Imdb Score",
  tags$div(
    class = "header1",
    tags$blockquote("Does Imdb score has relationship with the profit of the
                  movie?")
  ),
  # build widgets for user to select input
  sidebarLayout(
    sidebarPanel(
      selectInput("color",
        label = "Color",
        choices = c("Color", " Black and White")
      ),
      selectInput("rating",
        label = "Content rating",
        choices = c("G", "PG", "PG-13", "R", "Not Rated")
      ),
      sliderInput("num_voted",
        label = "Minimum number of votes", min = 0,
        max = 50000, value = 0, step = 1000
      )
    ),
    # set up main panel
    # display plot from output
    mainPanel(
      plotlyOutput("q1"),
      tags$div(
        tags$link(rel = "stylesheet", type = "text/css", href = "style.css"),
        tags$hr(),
        class = "summary",
        p(
          "From the scatter plot above we can tell there is ",
          strong("NO"), " real relationship between the IMDB score and",
          "profit. However, we can conclude that the movie with low ",
          "IMDB score does have less profit. We can also conclude that Black ",
          "and White movies are generally make less profit compare to Color ",
          "movies."
        )
      )
    )
  )
)
# build plot
q1_plot <- function(color_selected, rating, num_voted) {
  # filter data set by user input
  profit_imdb <- movie_data %>%
    filter(color == color_selected) %>%
    filter(content_rating == rating) %>%
    filter(num_voted_users > num_voted) %>%
    select(profit, imdb_score)
  # build plot
  # assign plot to variable
  d <- plot_ly(data = profit_imdb, x = ~ imdb_score, y = ~ profit) %>%
    layout(
      title = "Imdb Score v. Profit from Movie", face = "bold",
      xaxis = list(title = "Imdb Score", family = "Helvetica", size = "14", color = "steelblue"),
      yaxis = list(title = "Profit", family = "Helvetica", size = "14", color = "steelblue")
    )
  # return plot
  d
}
