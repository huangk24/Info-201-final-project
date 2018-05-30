library(dplyr)
library(ggplot2)
load("./movie_data.Rda")

# answer question 3 specified in the project description. q3_plot returns a
# plot for visualization and q3_ui stores a tab panel. 

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
        p("blah")# TODO: description, graph title, code style
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