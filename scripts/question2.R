load("movie_data.Rda")

q2_plot <- function(genre_vector, year_range) {
  df <- select(movie_data, title_year, genres) %>%
    filter(genres != "" & title_year != "") %>%
    mutate(title_year = as.integer(title_year)) %>%
    filter(title_year >= year_range[1], title_year <= year_range[2]) %>%
    select(genres)
  df <- data.frame(Genres = unlist(df$genres), stringsAsFactors = F) %>%
    group_by(Genres) %>% summarise(Count = n()) %>%
    filter(Genres %in% genre_vector)
  ggplot(df) +
    geom_bar(stat = "identity", mapping = aes(x = Genres, y = Count)) +
    theme(axis.text.x = element_text(angle = 90, hjust = 1))
}

genres <- movie_data$genres %>% unlist() %>%
  data.frame(genre = ., stringsAsFactors = F) %>% group_by(genre) %>%
  summarise(n = n()) %>% filter(n > 10) %>% .$genre
  
q2_ui <- tabPanel("Movies by Genre",
  tags$blockquote("TODO: what I observed in this dataset"),
  sidebarLayout(
    sidebarPanel(
      checkboxGroupInput("genre_vector", "Genre", choices = genres, inline = T),
      sliderInput("year_range", "Production Year", min = 1916, max = 2016,
                  step = 10, value = c(1916, 2016)),
      actionButton("uncheck", "Reset")
    ),
    mainPanel(plotOutput("q2"))
  ))