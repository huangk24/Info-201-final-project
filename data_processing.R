# Process the raw movie data and store the resulting dataframe in
# movie_data.Rda. To access the variable movie_data, use load("movie_data.Rda").

library(dplyr)
movie_data <- read.csv("raw_data.csv", stringsAsFactors = FALSE) %>%
  select(
    movie_title, director_name, duration, language, country,
    title_year, color, genres, plot_keywords, budget, gross, imdb_score,
    content_rating, aspect_ratio, facenumber_in_poster,
    director_facebook_likes, cast_total_facebook_likes,
    num_user_for_reviews, num_user_for_reviews, num_critic_for_reviews,
    num_voted_users, movie_imdb_link
  ) %>%
  distinct(movie_title, .keep_all = TRUE) %>%
  mutate_all(funs(replace(., is.na(.), ""))) %>%
  mutate(
    genres = ifelse(genres == "", "", strsplit(genres, "[|]")),
    plot_keywords = ifelse(plot_keywords == "", "",
      strsplit(plot_keywords, "[|]")
    )
  )
movie_data$duration <- as.numeric(movie_data$duration)
movie_data$title_year <- as.numeric(movie_data$title_year)
movie_data$gross <- as.numeric(movie_data$gross)
movie_data$imdb_score <- as.numeric(movie_data$imdb_score)
movie_data$aspect_ratio <- as.numeric(movie_data$aspect_ratio)
movie_data$title_year <- as.numeric(movie_data$title_year)
movie_data$facenumber_in_poster <- as.numeric(movie_data$facenumber_in_poster)
movie_data$director_facebook_likes <-
  as.numeric(movie_data$director_facebook_likes)
movie_data$cast_total_facebook_likes <-
  as.numeric(movie_data$cast_total_facebook_likes)
movie_data$num_user_for_reviews <- as.numeric(movie_data$num_user_for_reviews)
movie_data$num_critic_for_reviews <-
  as.numeric(movie_data$num_critic_for_reviews)
movie_data$num_voted_users <- as.numeric(movie_data$num_voted_users)
movie_data$budget <- as.integer(movie_data$budget)
movie_data$profit <- movie_data$gross - as.integer(movie_data$budget)
save(movie_data, file = "movie_data.Rda")

