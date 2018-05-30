# overview and introduction of our shiny app

overview <-
  tabPanel(
  "Overview",
  mainPanel(
    tags$div(
      tags$link(rel = "stylesheet", type = "text/css", href = "style.css"),
      h2("Project Overview"),
      p("Group member: Haley Buls, Kai Huang, Yuxuan Lu"),
      tags$hr()
    ),
    tags$div(
      h3("Project Description"),
      p(
        "For our project, we are using the ",
        strong("IMDB 5000 Movie Dataset"), " we found on ",
        tags$a(href = "https://www.kaggle.com", "Kaggle"),
        ". It is a static ", code("csv"), " file with information of ",
        "around 5000 movies including their titles, publish years, genres,",
        " budgets, profits and so on. Yuxuan collected this data after a ",
        "search online and brought it to the database."
      ),
      p(
        "Our target audience includes interested movie goers and ",
        "television watchers. The target audience we will hone in on is ",
        "primarily a user that is familiar with IMDB and Facebook, the ",
        "sites from which the data base was collected. They will be ",
        "familiar not only with the content analyzed (movies and ",
        "television), but familiar with further information on the ",
        "production and reception of media, such as the number of critical",
        "reviews a movie earns."
      ),
      p(
        "Three questions we intend to answer for our users:"
      ),
      p(
        "1) Does high IMDB score means the movie is good and low IMDB ",
        "score means the movie is bad? We will look at the relationship ",
        "between the IMDB score of the movie and the profit of the movie."
      ),
      p(
        "2) What types of movies are most popular? We will look at the ",
        "relationship between the movie genres and the number of movies of",
        "each genre produced."
      ),
      p(
        "3) What do people like to see in movies? We will look at the ",
        "relationship between the key words associated with a movie and ",
        "the number of likes garnered by the film in several categories ",
        "online."
      ),
      tags$hr()
    )
  )
)