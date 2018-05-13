# Info-201-final-project
Section BD group 2

The raw data is from [IMDB 5000 Movie Dataset](https://www.kaggle.com/carolzhangdc/imdb-5000-movie-dataset). 

## Technical Description

For our project, we are using the **IMDB 5000 Movie Dataset** we found on [Kaggle](https://www.kaggle.com). It is a static `csv` file with information of around 5000 movies including their titles, publish years, genres, budgets, profits and so on. 

To reformat the data so it's more friendly, we first checked the accuracy of the data, and *left out columns that are not accurate* (eg. actors and actors facebook likes). Then, we *rearranged the columns* for convenience so that relavent columns are next to each other. Finally, we *converted "|" seperated list into vectors*, which makes the subsequent data wrangling easier. While doing analysis, what is left to do is **slicing data** and **remove empty string values** indicating data that is not available. The processed movie data is stored in `movie_data.Rda` which contains a dataframe of cleaned movie data. 

The major libraries we are going to use includes `kabble` for rendering table in R markdown, `ggplot2` and `plotly` for charts and data ploting, and `shiny` package for creating a dynamic website. 

The challenge we will be facing is how to plot data so that it is intuitive and effective. Organizing the shiny app page content is also a major challenge for us. 
