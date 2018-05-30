library(dplyr)
library(ggplot2)
load("./movie_data.Rda")

q3_ui <- tabPanel(
  "Budget",
  sidebarLayout(
    sidebarPanel(
      selectInput("review",
                  label = "review",
                  choices = c("num_voted_users", "num_user_for_reviews")
      )
    ),
    mainPanel(
      plotOutput("q3"),
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
  imdb <- movie_data %>% 
   select("num_critics" = num_critic_for_reviews, "reviews" = review)
  p <- ggplot(data = imdb) +
    geom_point(mapping = aes(x = num_critics, y = reviews))
    return(p)
}

ggplot(data = movie_data) +
  geom_point(mapping = aes(x = num_critic_for_reviews, y = num_voted_users))


