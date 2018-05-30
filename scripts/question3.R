library(dplyr)
library(ggplot2)
load("./movie_data.Rda")


ggplot(data = movie_data_new) +
  geom_point(mapping = aes(x = movie_data$title_year, y = movie_data$gross))

%in%  

