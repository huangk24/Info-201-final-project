# answer question 2 specified in the project description. q2_plot returns a
# plot for visualization and q2_ui stores a tab panel.
# load in data to be used
load("movie_data.Rda")
# build plot
q2_plot <- function(genre_vector, year_range) {
  # assign theme for plot
  my_theme <- theme(
    plot.title = element_text(family = "Helvetica", face = "bold", size = (17),
                              hjust = .5),
    legend.title = element_text(family = "Helvetica", face = "italic",
                                size = (12), color = "steelblue4"),
    axis.title = element_text(family = "Helvetica", size = (14),
                              color = "steelblue4")
  )
  # filter data by user input
  df <- select(movie_data, title_year, genres) %>%
    filter(genres != "" & title_year != "") %>%
    mutate(title_year = as.integer(title_year)) %>%
    filter(title_year >= year_range[1], title_year <= year_range[2]) %>%
    select(genres)
  # organize data by genre
  df <- data.frame(Genres = unlist(df$genres), stringsAsFactors = F) %>%
    group_by(Genres) %>%
    summarise(Count = n()) %>%
    filter(Genres %in% genre_vector)
  # build plot
  ggplot(df) +
    geom_bar(stat = "identity", mapping = aes(x = Genres, y = Count)) +
    my_theme +
    ggtitle("Movie Genres  vs. Count") +
    theme(axis.text.x = element_text(angle = 90, hjust = 1))
}
# unlisting 'genre' column and making it easier to work with
genres <- movie_data$genres %>%
  unlist() %>%
  data.frame(genre = ., stringsAsFactors = F) %>%
  group_by(genre) %>%
  summarise(n = n()) %>%
  filter(n > 10) %>%
  .$genre
# set up ui for question 2 page
q2_ui <- tabPanel(
  # assign title
  "Movies by Genre",
  tags$blockquote(paste0(
    "Popular movie genres include drama, comedy, ",
    "thrillers and action movies. They make up to about",
    " 70% of the movie produced in the last 100 years. ",
    "Also, movies are produced more and more rapidly as ",
    "time goes by. More than half of the movies in the ",
    "last 100 years are produced in the last 30 years."
  )),
  # build widgets for user to select input
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
    # display plot from output
    mainPanel(plotOutput("q2"))
  )
)