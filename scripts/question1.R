library(dplyr)
library(plotly)

load("./movie_data.Rda")

q1_ui <- tabPanel(
  "Profit & Imdb Score",
  tags$blockquote("TODO: what I observed in this dataset"),
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
    mainPanel(plotlyOutput("q1"))
  )
)

q1_plot <- function(color_selected, rating, num_voted) {
  profit_imdb <- movie_data %>%
    filter(color == color_selected) %>%
    filter(content_rating == rating) %>%
    filter(num_voted_users > num_voted) %>%
    select(gross, imdb_score)
  p <- plot_ly(data = profit_imdb, x = ~ imdb_score, y = ~ gross)
  p
}

