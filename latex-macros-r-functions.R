# Latex macros <-> R functions

# index ------------------------------------------------------------------------

index <- function(index_label = "subject", x) {
  paste0("\\", "index{", index_label, ",", x, "}")
}

# chapter intro ----------------------------------------------------------------

