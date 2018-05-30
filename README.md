# Info-201-final-project

## Project Description

### The Data

For our project, we are using the **IMDB 5000 Movie Dataset** we found on [Kaggle](https://www.kaggle.com). It is a static `csv` file with information of around 5000 movies including their titles, publish years, genres, budgets, profits and so on. Yuxuan collected this data after a search online and brought it to the database.

### Our Users

Our target audience includes interested movie goers and television watchers. The target audience we will hone in on is primarily a user that is familiar with the Imdb (_Internet Movie Data Base_) website, the site from which the data base was collected. They will be familiar not only with the content analyzed (movies and television), but with further information on the production and reception of media, such as the number of critical reviews a movie earns and typical features on the Imdb website such as *'Imdb Score'*. To explore the site for yourself, visit [Imdb.com](https://www.imdb.com/).

### Three questions we intend to answer for our users:

**1)** Does a high Imdb score mean the movie is good and a low Imdb score mean the movie is bad? We will look at the relationship between the Imdb score and the profit of the movie.

**2)** What types of movies are most popular? We will look at the relationship between the movie genres and the number of movies of each genre produced.

**3)** Can critics make a movie more popular? We will look at the relationship between the number of critical reviews a movie has and how popular that film is with Imdb users on the site.

## Technical Description

We read in the static `.csv` file to read in our data. To reformat the data so it's more friendly, we first checked the accuracy of the data, and *left out columns that are not accurate* (eg. actors and actors Facebook likes). Then, we *rearranged the columns* for convenience so that relevant columns are next to each other. Finally, we *converted "|" separated list into vectors*, which makes the subsequent data wrangling easier. While doing analysis, what is left to do is **slicing data** and **remove empty string values** indicating data that is not available. The processed movie data is stored in `movie_data.Rda` which contains a data frame of cleaned movie data.

The major libraries we are going to use includes `kabble` for rendering table in R markdown, `ggplot2` and `plotly` for charts and data plotting, and `shiny` package for creating a dynamic website.

The challenge we will be facing is how to plot data so that it is intuitive and effective. Organizing the shiny app page content is also a major challenge for us.


The link to our app can be found [*here*](https://yuxuan-bill.shinyapps.io/Info-201-final-project/).
