library(dplyr)
library(ggplot2)
load("./movie_data.Rda")

q3_ui <- tabPanel(
  "Budget",
  sidebarLayout(
    sidebarPanel(
      selectInput("review",
                  label = "Review",
                  choices = c("num_voted_users", "num_critic_for_reviews")
      )
    ),
    mainPanel(
      plotlyOutput("q3"),
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

q3_plot <- function(review) {
  review <- review
  review_imdb <- movie_data %>%
    select(budget, review)
  p <- plot_ly(data = review_imdb, x = ~ budget, y = ~ review)
  p
}


ggplot(data = movie_data_new) +
  geom_point(mapping = aes(x = movie_data$title_year, y = movie_data$gross))
