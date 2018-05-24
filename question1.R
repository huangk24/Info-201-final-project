library(dplyr)
library(plotly)

load("./movie_data.Rda")

review_imdb <- movie_data %>%  
  select(imdb_score, director_facebook_likes, cast_total_facebook_likes,
         num_user_for_reviews, num_critic_for_reviews)

p <- plot_ly(data = review_imdb, x = ~imdb_score, y = ~cast_total_facebook_likes)
p

