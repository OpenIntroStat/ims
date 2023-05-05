# from _output.yml ------------------------------

bookdown::gitbook:
  css: css/ims-style.css
  config:
    toc:
      collapse: subsection
      before: |
        <li><a href="./">IMS</a></li>
      after: |
        <li><a href="https://github.com/rstudio/bookdown" target="blank">Published with bookdown</a></li>
    download: ["pdf"]
    sharing: no

bookdown::pdf_book:
  includes:
    in_header: latex/ims-style.tex
  latex_engine: pdflatex
  citation_package: natbib
  keep_tex: true
  template: latex/default.latex
  pandoc_args: --top-level-division=chapter
  dev: "ragg_png"

# from index.Rmd --------------------------------
---
twitter-handle: OpenIntroOrg
link-citations: yes
bibliography: [book.bib, packages.bib, eoce.bib]
biblio-style: apalike
always_allow_html: true
documentclass: book
classoption: 
  - 10pt
  - openany
---