library(dplyr)
library(plotly)

load("./movie_data.Rda")

q1_ui <- tabPanel(
  "Profit & Imdb Score",
  tags$div(
  class = "header1",
  tags$blockquote("Does imdb score has relationship with the profit of the
                  movie?")),
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
    mainPanel(
      plotlyOutput("q1"),
      tags$div(
        tags$link(rel = "stylesheet", type = "text/css", href = "style.css"),
        tags$hr(),
        class = "summary",
        p(
          "From the scatter plot above we can tell there is ",
          strong("NO"), " real relationship between the Imdb score and",
          "profit. However, we can conclude that the movie with low ",
          "Imdb score does less profit."
        )
      )
    )
  )
)

q1_plot <- function(color_selected, rating, num_voted) {
  profit_imdb <- movie_data %>%
    filter(color == color_selected) %>%
    filter(content_rating == rating) %>%
    filter(num_voted_users > num_voted) %>%
    select(profit, imdb_score)
  p <- plot_ly(data = profit_imdb, x = ~ imdb_score, y = ~ profit)
  p
}
