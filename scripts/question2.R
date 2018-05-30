load("movie_data.Rda")

# answer question 2 specified in the project description. q2_plot returns a
# plot for visualization and q2_ui stores a tab panel.

q2_plot <- function(genre_vector, year_range) {
  my_theme <- theme(plot.title = element_text(family = "Helvetica", face ="bold", size = (17), hjust = .5),
                    legend.title = element_text(family = "Helvetica", face = "italic", size = (12), color = "steelblue4"),
                    axis.title = element_text(family = "Helvetica", size = (14), color = "steelblue4"))
  df <- select(movie_data, title_year, genres) %>%
    filter(genres != "" & title_year != "") %>%
    mutate(title_year = as.integer(title_year)) %>%
    filter(title_year >= year_range[1], title_year <= year_range[2]) %>%
    select(genres)
  df <- data.frame(Genres = unlist(df$genres), stringsAsFactors = F) %>%
    group_by(Genres) %>%
    summarise(Count = n()) %>%
    filter(Genres %in% genre_vector)
  ggplot(df) +
    geom_bar(stat = "identity", mapping = aes(x = Genres, y = Count)) +
    my_theme+
    theme(axis.text.x = element_text(angle = 90, hjust = 1))
}

genres <- movie_data$genres %>%
  unlist() %>%
  data.frame(genre = ., stringsAsFactors = F) %>%
  group_by(genre) %>%
  summarise(n = n()) %>%
  filter(n > 10) %>%
  .$genre

q2_ui <- tabPanel(
  "Movies by Genre",
  tags$blockquote(paste0(
    "Popular movie genres include drama, comedy, ",
    "thrillers and action movies. They make up to about",
    " 70% of the movie produced in the last 100 years. ",
    "Also, movies are produced more and more rapidly as ",
    "time goes by. More than half of the movies in the ",
    "last 100 years are produced in the last 30 years."
  )),
  sidebarLayout(
    sidebarPanel(
      checkboxGroupInput("genre_vector", "Genre",
        choices = genres, inline = T,
        selected = c("Action", "Comedy", "Drama", "Thriller")
      ),
      sliderInput("year_range", "Production Year",
        min = 1916, max = 2016,
        step = 10, value = c(1986, 2016), sep = ""
      ),
      actionButton("uncheck", "Reset")
    ),
    mainPanel(plotOutput("q2"))
  )
)
