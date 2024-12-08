## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup, message=FALSE, warning=FALSE--------------------------------------
library(qtkit)
library(ggplot2)
library(dplyr)
library(knitr)
library(kableExtra)

## ----mtcars_table, eval = FALSE-----------------------------------------------
#  # Create a basic table
#  mtcars_table <- mtcars[1:5, 1:4] |>
#    kable(format = "html") |>
#    kable_styling(bootstrap_options = "striped")
#  
#  # Save to file
#  write_kbl(
#    kbl_obj = mtcars_table,
#    file = "mtcars_table",
#    target_dir = "artifacts/",
#    device = "png"
#  )

## ----mtcars_table_styled, eval = FALSE----------------------------------------
#  mtcars_table <- mtcars[1:5, 1:4] |>
#    kable(format = "html") |>
#    kable_styling(
#      bootstrap_options = c("striped", "hover"),
#      full_width = FALSE
#    ) |>
#    row_spec(0, bold = TRUE)
#  
#  write_kbl(
#    kbl_obj = mtcars_table,
#    file = "mtcars_styled",
#    target_dir = "artifacts/",
#    device = "png",
#    bs_theme = "flatly"
#  )

## ----mtcars_plot, eval = FALSE------------------------------------------------
#  # Create a basic plot
#  p <- ggplot(mtcars, aes(wt, mpg)) +
#    geom_point() +
#    theme_minimal()
#  
#  # Save to file
#  write_gg(
#    gg_obj = p,
#    file = "mtcars_plot",
#    target_dir = "artifacts/",
#    device = "png"
#  )

## ----mtcars_plot_styled, eval = FALSE-----------------------------------------
#  p <- ggplot(mtcars, aes(wt, mpg, color = factor(cyl))) +
#    geom_point(size = 3) +
#    theme_minimal() +
#    labs(
#      title = "Car Weight vs Fuel Efficiency",
#      x = "Weight (1000 lbs)",
#      y = "Miles per Gallon",
#      color = "Cylinders"
#    )
#  
#  write_gg(
#    gg_obj = p,
#    file = "mtcars_plot_styled",
#    target_dir = "artifacts/",
#    device = "png",
#    width = 8,
#    height = 6,
#    dpi = 300
#  )

## ----mtcars_subset------------------------------------------------------------
# Create a filtered dataset
mtcars_subset <- mtcars |>
  filter(cyl == 4) |>
  select(mpg, wt, hp)

# Save to file
write_obj(
  obj = mtcars_subset,
  file = "mtcars_4cyl",
  target_dir = "artifacts/"
)

## ----mtcars_subset_restore----------------------------------------------------
# Read the saved object
restored_data <- dget("artifacts/mtcars_4cyl")

# Check the restored object
glimpse(restored_data)

