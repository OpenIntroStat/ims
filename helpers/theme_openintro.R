theme_openintro <- function() {
  theme_set(theme_minimal(base_size = 14)) +
    theme(
      plot.title = element_text(colour = openintro::COL["blue", "full"]),
      plot.subtitle = element_text(colour = openintro::COL["blue", "full"]),
      legend.title = element_text(colour = openintro::COL["gray", "full"]),
      legend.text = element_text(colour = openintro::COL["gray", "full"]),
    )
}

openintro_palette <- list(
  full = openintro::COL[,1],
  f1   = openintro::COL[,2],
  f2   = openintro::COL[,3],
  f3   = openintro::COL[,4],
  f4   = openintro::COL[,5],
  f5   = openintro::COL[,6],
  f6   = openintro::COL[,7],
  f7   = openintro::COL[,8],
  f8   = openintro::COL[,9],
  f9   = openintro::COL[,10],
  f10  = openintro::COL[,11],
  f11  = openintro::COL[,12],
  f12  = openintro::COL[,13]
)
