library(dplyr)
library(plotly)

load("./movie_data.Rda")

language_option <- movie_data %>% 
  group_by(language) %>% 
  count() %>% 
  select(language)
language_option <- language_option[-1,]

year_option <- movie_data %>% 
  group_by(title_year) %>% 
  count() %>% 
  select(title_year)
year_option <- year_option[-92,]

category_option <- movie_data %>% 
  select(director_facebook_likes, cast_total_facebook_likes,
         num_user_for_reviews, num_critic_for_reviews) %>% 
  colnames()


q1_ui <- tabPanel("Reviews Vs. Imdb Score",
                  tags$blockquote("TODO: what I observed in this dataset"),
                  sidebarLayout(
                    sidebarPanel(
                      selectInput("language", label = "Language of the movie", 
                                  choices = language_option),
                      selectInput("year", label = "Year of the movie", 
                                  choices = year_option)
                      #selectInput("category", label = "Review type", 
                       #           choices = category_option)
                    ),
                    mainPanel(plotlyOutput("q1"))
                  ))

q1_plot <- function(language_select, year) {
  review_imdb <- movie_data %>%  
    filter(language == language_select) %>% 
    filter(title_year == year) %>% 
    select(imdb_score, director_facebook_likes, cast_total_facebook_likes,
           num_user_for_reviews, num_critic_for_reviews)
  p <- plot_ly(data = review_imdb, x = ~imdb_score, y = ~cast_total_facebook_likes)
  p
}

#q1_plot("English", 2016)
