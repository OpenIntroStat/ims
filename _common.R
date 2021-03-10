# _common.R based on R4DS: https://github.com/hadley/r4ds/blob/master/_common.R
set.seed(25)
options(digits = 3)

# packages ---------------------------------------------------------------------

suppressMessages(library(tidymodels))
suppressMessages(library(gghighlight))
suppressMessages(library(glue))
suppressMessages(library(ggmosaic))
suppressMessages(library(ggridges))
suppressMessages(library(gridExtra))
suppressMessages(library(infer))
suppressMessages(library(janitor))
suppressMessages(library(knitr))
suppressMessages(library(kableExtra))
suppressMessages(library(maps))
suppressMessages(library(openintro))
suppressMessages(library(patchwork))
suppressMessages(library(quantreg))
suppressMessages(library(tidyverse))
suppressMessages(library(scales))
suppressMessages(library(skimr))
suppressMessages(library(caret))
suppressMessages(library(palmerpenguins))
suppressMessages(library(survival))

# knitr chunk options ----------------------------------------------------------

knitr::opts_chunk$set(
  comment = "#>",
  collapse = TRUE,
  message = FALSE,
  warning = FALSE,
  #cache = TRUE,
  echo = FALSE, # hide code unless otherwise noted in chunk options
  out.width = "90%",
  fig.align = 'center',
  fig.width = 6,
  fig.asp = 0.618,  # 1 / phi
  fig.show = "hold"
)

# knit options -----------------------------------------------------------------

options(knitr.kable.NA = "")

# kableExtra options -----------------------------------------------------------

options(kableExtra.html.bsTable = TRUE)

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

# for foundation chapters ------------------------------------------------------

inference_method_summary_table <- tribble(
  ~question, 
    ~randomization, 
    ~bootstrapping, 
    ~mathematical,
  "What does it do?", 
    "Shuffles the explanatory variable to mimic the natural variability  found in a randomized experiment", 
    "Resamples (with replacement) from the observed data to mimic the sampling variability found by collecting data from a population", 
    "Uses theory (primarily the Central Limit Theorem) to describe the hypothetical variability resulting from either repeated randomized experiments or random samples",
  "What is the random process described?", 
    "Randomized experiment", 
    "Random sampling from a population", 
    "Randomized experiment or random sampling",
  "What other random processes can be approximated?", 
    "Can also be used to describe random sampling in an observational model", 
    "Can also be used to describe random allocation in an experiment", 
    "Randomized experiment or random sampling",
  "What is it best for?", 
    "Hypothesis Testing (can be used for confidence intervals, but not covered in this text).", 
    "Confidence Intervals (bootstrap hypothesis testing for one proportion covered in Chapter 16).", 
    "Quick analyses through, for example, calculating a Z score.",
  "What physical object represents the simulation process?", 
    "Shuffling cards", 
    "Pulling marbles from a bag", 
    "Not applicable",
  "What are the technical conditions?", 
    "Independence", 
    "Independence, large n", 
    "Independence, large n"
)
