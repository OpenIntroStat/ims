# _common.R based on R4DS: https://github.com/hadley/r4ds/blob/master/_common.R
set.seed(25)
options(digits = 3)

# knitr chunk options ----------------------------------------------------------

knitr::opts_chunk$set(
  comment = "#>",
  collapse = TRUE,
  #cache = TRUE,
  echo = FALSE, # hide code unless otherwise noted in chunk options
  out.width = "70%",
  fig.align = 'center',
  fig.width = 6,
  fig.asp = 0.618,  # 1 / phi
  fig.show = "hold"
)

# packages ---------------------------------------------------------------------

#install_github("openintrostats/openintro")
library(knitr)
library(ggmosaic)
library(skimr)
library(kableExtra)
library(janitor)
library(openintro)
library(tidyverse)
library(scales)
library(infer)

# dplyr options ----------------------------------------------------------------

options(dplyr.print_min = 6, dplyr.print_max = 6)

# ggplot2 theme ----------------------------------------------------------------
# to be replaced with theme_openintro...

theme_set(theme_minimal(base_size = 14))

# function to print terms ------------------------------------------------------

make_terms_table <- function(x, n_cols = 4){
  x <- sort(x) %>% unique()
  n_rows <- (length(x) / n_cols) %>% ceiling()
  desired_length <- n_rows * n_cols
  x_updated <- c(x, rep("", (desired_length - length(x))))
  matrix(x_updated, nrow = n_rows) %>%
    kable()
}