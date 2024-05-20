# _common.R based on R4DS: https://github.com/hadley/r4ds/blob/master/_common.R
set.seed(25)
options(digits = 3)

# packages ---------------------------------------------------------------------

suppressMessages(library(MASS))
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
suppressMessages(library(measurements))
suppressMessages(library(nycflights13))
suppressMessages(library(openintro))
suppressMessages(library(patchwork))
suppressMessages(library(quantreg))
suppressMessages(library(tidyverse))
suppressMessages(library(scales))
suppressMessages(library(skimr))
suppressMessages(library(caret))
suppressMessages(library(palmerpenguins))
suppressMessages(library(survival))
suppressMessages(library(waffle))
suppressMessages(library(ggrepel))
suppressMessages(library(ggimage))
suppressMessages(library(ggpubr))
suppressMessages(library(tools))
suppressMessages(library(unvotes))
suppressMessages(library(ukbabynames))
suppressMessages(library(Stat2Data))
suppressMessages(library(GGally))
suppressMessages(library(mosaicData))

# knitr chunk options ----------------------------------------------------------

#knitr::opts_chunk$set(
  #eval = FALSE,
  #comment = "#>",
  #collapse = TRUE,
  #message = FALSE,
  #warning = FALSE,
  #cache = FALSE, # only use TRUE for quick testing!
  #echo = FALSE, # hide code unless otherwise noted in chunk options
  #fig.align = "center",
  #fig.width = 6,
  #fig.asp = 0.618,  # 1 / phi
  #fig.show = "hold",
  #dpi = 300,
  #fig.pos = "h"
#)

if (knitr::is_html_output()) {
  knitr::opts_chunk$set(out.width = "90%")
} else if (knitr::is_latex_output()) {
  knitr::opts_chunk$set(out.width = "80%")
}

# knit options -----------------------------------------------------------------

options(knitr.kable.NA = "")

# kableExtra options -----------------------------------------------------------

options(kableExtra.html.bsTable = TRUE)

# dplyr options ----------------------------------------------------------------

options(dplyr.print_min = 6, dplyr.print_max = 6)

# ggplot2 theme and colors -----------------------------------------------------

if (knitr::is_html_output()) {
  ggplot2::theme_set(ggplot2::theme_minimal(base_size = 13))
} else if (knitr::is_latex_output()) {
  ggplot2::theme_set(ggplot2::theme_minimal(base_size = 12))
}

ggplot2::update_geom_defaults("point", list(color = openintro::IMSCOL["blue","full"],
                                            fill = openintro::IMSCOL["blue","full"]))
ggplot2::update_geom_defaults("bar", list(fill = openintro::IMSCOL["blue","full"], 
                                          color = "#FFFFFF"))
ggplot2::update_geom_defaults("col", list(fill = openintro::IMSCOL["blue","full"], 
                                          color = "#FFFFFF"))
ggplot2::update_geom_defaults("boxplot", list(color = openintro::IMSCOL["blue","full"]))
ggplot2::update_geom_defaults("density", list(color = openintro::IMSCOL["blue","full"]))
ggplot2::update_geom_defaults("line", list(color = openintro::IMSCOL["gray", "full"]))
ggplot2::update_geom_defaults("smooth", list(color = openintro::IMSCOL["gray", "full"]))
ggplot2::update_geom_defaults("dotplot", list(color = openintro::IMSCOL["blue","full"], 
                                              fill = openintro::IMSCOL["blue","full"]))

# function: caption helper -----------------------------------------------------

caption_helper <- function(txt) {
  if (knitr::is_latex_output())
    stringr::str_replace_all(txt, "([^`]*)`(.*?)`", "\\1\\\\texttt{\\2}") |>
    stringr::str_replace_all("_", "\\\\_")
  else
    txt
}

# function: make terms table ---------------------------------------------------

make_terms_table <- function(x, n_cols = 3){
  x <- sort(x) |> unique()
  n_rows <- (length(x) / n_cols) |> ceiling()
  desired_length <- n_rows * n_cols
  x_updated <- c(x, rep("", (desired_length - length(x))))
  matrix(x_updated, nrow = n_rows) |>
    kbl(booktabs = TRUE, linesep = "") |>
    kable_styling(
      bootstrap_options = c("striped", "condensed"),
      latex_options = "striped",
      full_width = FALSE
    ) |>
    column_spec(1, width = "12em") |>
    column_spec(2, width = "12em") |>
    column_spec(3, width = "12em")
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
    "Can also be used to describe random sampling in an observational model or random allocation in an experiment",
  "What is it best for?", 
    "Hypothesis testing (can also be used for confidence intervals, but not covered in this text)", 
    "Confidence intervals (can also be used for bootstrap hypothesis testing for one proportion as well)", 
    "Quick analyses through, for example, calculating a Z score",
  "What physical object represents the simulation process?", 
    "Shuffling cards", 
    "Pulling marbles from a bag with replacement", 
    "Not applicable",
  "What are the technical conditions?", 
    "Independence", 
    "Independence, large n", 
    "Independence, large n"
)
