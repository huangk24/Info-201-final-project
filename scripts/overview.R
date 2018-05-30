# overview and introduction of our shiny app
overview <-
  tabPanel(
    # assign title to page
    "Project Description",
    mainPanel(
      # placing divide in text for style
      tags$div(
        # source to style sheet
        tags$link(rel = "stylesheet", type = "text/css", href = "style.css"),
        h2("Project Overview"),
        p("Group members: Haley Buls, Kai Huang, Yuxuan Lu"),
        tags$hr()
      ),
      # placing divide in text for style
      tags$div(
        # writing text for project description
        h3("The Data"),
        p(
          "For our project, we are using the ",
          strong("IMDB 5000 Movie Dataset"), " we found on ",
          tags$a(href = "https://www.kaggle.com", "Kaggle"),
          ". It is a static ", code("csv"), " file with information for ",
          "around 5000 movies including their titles, years of release, ",
          "genres, budgets, profits and so on. Yuxuan collected this data ",
          "after a search online and brought it to the database."
        ),
        tags$hr(),
        h3("Our Users"),
        p(
          "Our target audience includes interested movie goers and ",
          "television watchers. The target audience we will hone in on is ",
          "primarily a user that is familiar with the Imdb website, the ",
          "site from which the data base was collected. They will be ",
          "familiar not only with the content analyzed (movies and ",
          "television), but with further information on the ",
          "production and reception of media, such as the number of critical ",
          "reviews a movie earns, and typical features on the Imdb website ",
          "such as ", em("Imdb Score"), ". To explore the site for yourself, ",
          "visit ", tags$a(href = "https://www.imdb.com/", "Imdb.com"), "."
        ),
        tags$hr(),
        h3(
          "Three questions we intend to answer for our users:"
        ),
        p(
          strong("1)"),
          "Does a high Imdb score mean the movie is good and a low Imdb ",
          "score means the movie is bad? We will look at the relationship ",
          "between the Imdb score and profit of the movie."
        ),
        p(
          strong("2)"),
          "What types of movies are most popular? We will look at the ",
          "relationship between movie genres and the number of movies of",
          "each genre produced."
        ),
        p(
          strong("3)"),
          "Can critics make a movie more poular? We will look at the ",
          "relationship between the number of critical reviews a movie has and",
          " how popular that film is with Imdb users on the site."
        ),
        tags$hr()
      )
    )
  )
