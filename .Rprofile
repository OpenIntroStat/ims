# Post processing for end of chapter exercise numbering ------------------------

options(bookdown.post.latex = function(x) {
  x <- paste(x, collapse = "\n")
  x <- gsub("\\\\begin\\{exercises\\}\n\n\\\\begin\\{enumerate\\}\n\\\\def\\\\labelenumi\\{\\\\arabic\\{enumi\\}\\.\\}\n", "\\\\begin{exercises}\n\n\\\\begin{enumerate}\n", x)
  #x <- gsub(x, "hello", x)
  x
})
