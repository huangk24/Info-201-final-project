# answer question 3 specified in the project description. q3_plot returns a
# plot for visualization and q3_ui stores a tab panel.
# load in data set to be used
load("./movie_data.Rda")
# set up ui for question 3 page
q3_ui <- tabPanel(
  # assign title for menu
  "Critical Reception and Popularity",
  tags$blockquote(paste0(
    "The more attention a movie is given by critics correlates to how popular a movie is with Imdb users. ",
    "Imdb users are more likely to leave a review rank a movie or ",
    "positively rank movies with a large critical reception. In addition to this, movies with ",
    "a PG rating recieve more reviews from critics and are more popular with users as well. Click through ",
    "to see how critical attention is correlated with different types of movies too."
  )),
  # building widgets for user to select input
  sidebarLayout(
    sidebarPanel(
      selectInput("review",
        label = "Type of Review",
        choices = c(
          "Number of Imdb Film Score Rankings by Users" = "num_voted_users",
          "Number of Imdb User Reviews" = "num_user_for_reviews", "Imdb Score" = "imdb_score"
        )
      ),
      selectInput("color_choice",
        label = "Change Color by:",
        choices = c(
          "Content rating" = "content_rating", "Profit" = "profit",
          "Title Year" = "title_year"
        )
      )
    ),
    # set up main panel
    # display plot from output
    mainPanel(
      plotOutput("q3")
    )
  )
)
# build plot
q3_plot <- function(review, color_choice) {
  # assign theme
  my_theme <- theme(
    plot.title = element_text(
      family = "Helvetica", face = "bold",
      size = (17), hjust = .5
    ),
    legend.title = element_text(
      family = "Helvetica", face = "italic",
      size = (12), color = "steelblue4"
    ),
    axis.title = element_text(family = "Helvetica", size = (14), color = "steelblue4")
  )
  # filter data frame by user input
  df <- movie_data %>%
    select("num_critics" = num_critic_for_reviews, "reviews" = review, "color" = color_choice)
  # assign plot to variable
  # build plot
  d <- ggplot(data = df) +
    geom_point(mapping = aes(x = num_critics, y = reviews, color = color)) +
    my_theme +
    ggtitle("Number of Critic Reviews v. Review Type") +
    labs(x = "Number of Critic Reviews", y = "Measure of Review", color = "Color")
  # return plot
  d
}
