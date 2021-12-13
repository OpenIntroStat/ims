library(tidyverse)
library(tidymodels)

# read data --------------------------------------------------------------------

df <- read_csv("duke-forest.csv")

# visualise --------------------------------------------------------------------

ggplot(df, aes(x = area, y = price)) +
  geom_point() +
  geom_vline(xintercept = 2825, color = "gray")

ggplot(df, aes(x = lot, y = price)) +
  geom_point() +
  geom_vline(xintercept = 0.52, color = "gray")

ggplot(df, aes(x = bed, y = price)) +
  geom_point() +
  geom_vline(xintercept = 3, color = "gray")

ggplot(df, aes(x = price)) +
  geom_histogram() +
  geom_vline(xintercept = 400000, color = "gray")

ggplot(df, aes(x = log10(price))) +
  geom_histogram()

# model ------------------------------------------------------------------------

set.seed(4595)

preds <- c("bed", "bath", "area", "year_built", "lot")

df <- df %>%
  select(price, all_of(preds)) %>%
  na.omit()

data_split <- initial_split(df, strata = "price", prop = 0.75)

df_train <- training(data_split)
df_test  <- testing(data_split)

rf_defaults <- rand_forest(mode = "regression")

rf_mod <- rf_defaults %>%
  set_engine("ranger")

rf_fit <- rf_mod %>%
  fit_xy(
    x = df_train[, preds],
    y = df_train$price
  )

rf_fit

# predict ----------------------------------------------------------------------

# training set predictions

rf_training_pred <-
  predict(rf_fit, df_train) %>%
  # Add the true outcome data back in
  bind_cols(df_train %>% select(price))

rf_training_pred %>%
  rmse(truth = price, .pred)

# testing set predictions

rf_testing_pred <-
  predict(rf_fit, df_test) %>%
  # Add the true outcome data back in
  bind_cols(df_test %>% select(price))

rf_testing_pred %>%
  rmse(truth = price, .pred)

harvey15 <- tibble(
  bed  = 3,
  bath = 3.5,
  area = 2825,
  year_built = 1982,
  lot  = 0.52
)

predict(rf_fit, new_data = harvey15)

# cross validation -------------------------------------------------------------

set.seed(345)
folds <- vfold_cv(df_train, v = 5)
folds

rf_wf <-
  workflow() %>%
  add_model(rf_mod) %>%
  add_formula(price ~ .)

set.seed(456)
rf_fit_rs <-
  rf_wf %>%
  fit_resamples(folds)

rf_fit_rs
collect_metrics(rf_fit_rs, summarize = FALSE)
