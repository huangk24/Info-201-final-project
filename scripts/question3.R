library(dplyr)
library(ggplot2)
load("./movie_data.Rda")
movie_data_new <- movie_data %>%  select("plot_keywords", "movie_title", "imdb_score", "title_year", "content_rating" )

movie_data$budget <- as.integer(movie_data$budget)

movie_data$profit <- movie_data$gross - as.integer(movie_data$budget)


ggplot(data = movie_data_new) +
  geom_point(mapping = aes(x = movie_data$title_year, y = movie_data$gross))

%in%  

