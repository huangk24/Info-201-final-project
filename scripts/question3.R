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
        p("paragraph")
      )
    )
  )

q3_plot <- function(review) {
  imdb <- movie_data %>% 
    select(review, num_critic_for_reviews)
  imdb <- imdb[complete.cases(imdb), ]
  p <- ggplot(data = imdb) +
  geom_point(mapping = aes(x = num_critic_for_reviews, y = review))
  p
}

p <- function(yvalue){
x <- ggplot(data = movie_data) +
  geom_point(mapping = aes(x = num_critic_for_reviews, y = yvalue))
  x

}

