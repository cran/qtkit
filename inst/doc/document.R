## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup, message=FALSE, warning=FALSE--------------------------------------
library(qtkit)
library(fs)
library(tibble)
library(dplyr)
library(glue)
library(readr)

## -----------------------------------------------------------------------------
# Create a temporary file for our documentation
origin_file <- file_temp(ext = "csv")

# Create the origin documentation template
origin_doc <- create_data_origin(
  file_path = origin_file,
  return = TRUE
)

# View the template
origin_doc |>
  glimpse()

## -----------------------------------------------------------------------------
origin_doc |>
  mutate(description = c(
    "Motor Trend Car Road Tests",
    "Henderson and Velleman (1981), Building multiple regression models interactively. Biometrics, 37, 391–411.",
    "US automobile market, passenger vehicles",
    "1973-74",
    "Built-in R dataset (.rda)",
    "Single data frame with 32 observations of 11 variables",
    "Public Domain",
    "Citation: Henderson and Velleman (1981)"
  )) |>
  write_csv(origin_file)

## -----------------------------------------------------------------------------
create_data_origin(
  file_path = origin_file,
  force = TRUE
)

## -----------------------------------------------------------------------------
# Create a temporary file for our dictionary
dict_file <- file_temp(ext = "csv")

# Generate dictionary for iris dataset
iris_dict <- create_data_dictionary(
  data = iris,
  file_path = dict_file
)

# View the results
iris_dict |>
  glimpse()

## ----eval=FALSE---------------------------------------------------------------
#  # Not run - requires API key
#  Sys.setenv(OPENAI_API_KEY = "your-api-key")
#  
#  iris_dict_ai <- create_data_dictionary(
#    data = iris,
#    file_path = dict_file,
#    model = "gpt-4",
#    sample_n = 5
#  )

## ----echo=FALSE---------------------------------------------------------------
# Simulated AI output
tibble(
  variable = c("Sepal.Length", "Sepal.Width"),
  name = c("Sepal Length", "Sepal Width"),
  type = c("numeric", "numeric"),
  description = c(
    "Length of the sepal in centimeters",
    "Width of the sepal in centimeters"
  )
)

## ----eval=FALSE---------------------------------------------------------------
#  diamonds_dict <- diamonds |>
#    create_data_dictionary(
#      file_path = "diamonds_dict.csv",
#      model = "gpt-4",
#      sample_n = 3,
#      grouping = "cut" # Sample across different cut categories
#    )

