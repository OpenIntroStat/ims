::: welcome
::: {.content-visible when-format="html"}
# Welcome to IMS2 {.unnumbered}
:::

\chapter*{}

\vfill

::: {.content-visible when-format="html"}
This is the website for **Introduction to Modern Statistics**, Second Edition by Mine Çetinkaya-Rundel and Johanna Hardin.
Introduction to Modern Statistics, which we'll refer to as IMS going forward, is a textbook from the [OpenIntro](https://www.openintro.org/) project.

::: underconstruction
IMS2 is currently under construction, it's planned to be released in Spring 2024. The first edition of the book is available at [openintro-ims.netlify.app](https://openintro-ims.netlify.app) with additional resources at [openintro.org/book/ims](https://www.openintro.org/book/ims/). If you have any feedback on the work-in-progress second edition or catch any typos, we would appreciate you reporting at [github.com/OpenIntroStat/ims](https://github.com/OpenIntroStat/ims).
:::
:::

```{=html}
<!--
The book will always be available for free here. It is also available in PDF (for free or for the amount you choose to contribute) on Leanpub and in black&white paperback for purchase for $20.
<br><br>
<a href="https://leanpub.com/imstat" target="_blank"><img src="images/_icons/file.png" width="30px">&nbsp;<strong>Download PDF</strong></a>
<br>
<a href="https://www.openintro.org/go?id=ims1_bw_pb&referrer=/book/ims/online"><img src="images/_icons/book.png" width="30px">&nbsp;<strong>Purchase paperback</strong></a>
<br><br>
---
<br><br>
-->
```
::: {.content-visible when-format="html"}
Copyright © 2023.
:::

::: {.content-hidden unless-format="pdf"}
Copyright $\copyright$ 2023.
:::

Second Edition.

Version date: `r format(Sys.Date(), "%B %d, %Y")`.

This textbook and its supplements, including slides, labs, and interactive tutorials, may be downloaded for free at\
[**openintro.org/book/ims**](http://openintro.org/book/ims).

This textbook is a derivative of *OpenIntro Statistics* 4th Edition and *Introduction to Statistics with Randomization and Simulation* 1st Edition by Diez, Barr, and Çetinkaya-Rundel, and it's available under a Creative Commons Attribution-ShareAlike 3.0 Unported United States License.
License details are available at the Creative Commons website:\
[**creativecommons.org**](https://www.openintro.org/go/?id=creativecommons_org&referrer=ims1_pdf).

Source files for this book can be found on GitHub at\
[github.com/OpenIntroStat/ims](https://github.com/OpenIntroStat/ims).
:::

```{r}
#| include: false

# automatically create a bib database for R packages
knitr::write_bib(c(.packages(), "knitr"), "packages.bib")
```
