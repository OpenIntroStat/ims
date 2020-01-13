--- 
title: ""
author: "Mine Çetinkaya-Rundel, Johanna Hardin, David Diez, others..."
date: "2020-01-13"
site: bookdown::bookdown_site
documentclass: book
bibliography: [book.bib, packages.bib]
biblio-style: apalike
link-citations: yes
description: "This is ISRS2!"
---


```r
setwd("~/gitRepos/DataCamp/randomization-and-simulation")
bookdown::render_book("index.Rmd", output_dir = "_book")
```


```r
#install_github("openintrostats/openintro-r-package")
library(openintro)
```

```
## Please visit openintro.org for free statistics materials
```

```
## 
## Attaching package: 'openintro'
```

```
## The following object is masked from 'package:datasets':
## 
##     cars
```

```r
library(tidyverse)
```

```
## ── Attaching packages ────────────────── tidyverse 1.3.0 ──
```

```
## ✓ ggplot2 3.2.1     ✓ purrr   0.3.3
## ✓ tibble  2.1.3     ✓ dplyr   0.8.3
## ✓ tidyr   1.0.0     ✓ stringr 1.4.0
## ✓ readr   1.3.1     ✓ forcats 0.4.0
```

```
## ── Conflicts ───────────────────── tidyverse_conflicts() ──
## x dplyr::filter() masks stats::filter()
## x dplyr::lag()    masks stats::lag()
```

```r
library(knitr)
```


```r
# move to _common.R based on R4DS: https://github.com/hadley/r4ds/blob/master/_common.R
set.seed(25)
options(digits = 3)

knitr::opts_chunk$set(
  comment = "#>",
  collapse = TRUE,
  cache = TRUE,
  echo = FALSE, # hide code unless otherwise noted in chunk options
  out.width = "70%",
  fig.align = 'center',
  fig.width = 6,
  fig.asp = 0.618,  # 1 / phi
  fig.show = "hold"
)

options(dplyr.print_min = 6, dplyr.print_max = 6)
```

# Welcome {-}

<!--
This book may be downloaded as a free PDF at [openintro.org](http://www.openintro.org).
-->

We hope readers will take away three ideas from this book in addition to forming a foundation of statistical thinking and methods.

1. Statistics is an applied field with a wide range of practical applications.
2. You don't have to be a math guru to learn from interesting, real data.
3. Data are messy, and statistical tools are imperfect. However, when you understand the strengths and weaknesses of these tools, you can use them to learn interesting things about the~world.

**IMPORTANT NOTE:** This book is currently in active development, and is planned for launch in late 2020 as the 2nd edition of OpenIntro Statistics - Introduction to Statistics with Randomization and Simulation. The 1st edition of the book can be accessed at [openintro.org/book/isrs/](https://www.openintro.org/book/isrs/).

## Textbook overview {-}

1. **Introduction to data.** Data structures, variables, summaries, graphics, and basic data collection techniques.
2. **Exploratory data analysis.** Data visualization and summarisation.
3. **Correlation and regression.** Visualising relationships between many variables and descriptive summaries for quantifying the relationship between two variables.
4. **Multiple regression.** Descriptive summaries for quantifying the relationship between two variables.
5. **Foundations for inference.** Case studies are used to introduce the ideas of statistical inference with randomization and simulations. 
6. **Inference for categorical data.** Inference for proportions using simulation and randomization techniques as well as the normal and chi-square distributions.
7. **Inference for numerical data.** Inference for one or two sample means using simulation and randomization techniques as well as the normal and F distributions.
8. **Inference for regression.** Extending inference techniques presented thus-far to regression settings.
7. **Appendix: Probability.** An introduction to probability is provided as an optional reference. Exercises and additional probability content may be found in Chapter~3 of OpenIntro Statistics at [openintro.org/book/os](https://www.openintro.org/book/os/).

## Examples, exercises, and additional appendices {-}

Examples and guided practice exercises throughout the textbook may be identified by their distinctive bullets:

[MCR-TODO: Need to update language below]

<!--
\begin{example}{Large filled bullets signal the start of an example.}
Full solutions to examples are provided and often include an accompanying table or figure.
 \end{example}

\begin{exercise}
Large empty bullets signal to readers that an exercise has been inserted into the text for additional practice and guidance. Solutions for all guided practice exercises are provided in footnotes.\footnote{Full solutions are located down here in the footnote!}
\end{exercise}

Exercises at the end of each chapter are useful for practice or homework assignments. Many of these questions have multiple parts, and solutions to odd-numbered exercises can be found in Appendix~\ref{eoceSolutions}. %These end-of-chapter exercises are also available online in a public question bank at \textbf{openintro.org}, and the available selection is constantly growing based on teacher contributions. Numbered citations in end-of-chapter exercises may be found in Appendix~B.

Probability tables for the normal, $t$, and chi-square distributions are in Appendix~\ref{distributionTables}, and PDF copies of these tables are also available from \href{http://www.openintro.org}{\color{black}\textbf{openintro.org}}.

-->

## OpenIntro, online resources, and getting involved {-}

OpenIntro is an organization focused on developing free and affordable education materials.

We encourage anyone learning or teaching statistics to visit [openintro.org] (http://www.openintro.org) and get involved. We also provide many free online resources, including free course software. Students can test their knowledge with practice quizzes for each chapter or try an application of concepts learned using real data. 

Data sets for this textbook are available on the website and through a companion R package, [**openintro**](http://openintrostat.github.io/openintro-r-package/).^[Mine Çetinkaya-Rundel, David Diez, Andrew Bray, Albert Kim, Ben Baumer, Chester Ismay and Christopher Barr (2019). openintro: Data Sets and Supplemental Functions from 'OpenIntro' Textbooks and Labs. R package version 2.0.1. https://github.com/OpenIntroStat/openintro-r-package.] All of these resources are free, and we want to be clear that anyone is welcome to use these online tools and resources with or without this textbook as a companion.

We value your feedback. If there is a part of the project you especially like or think needs improvement, we want to hear from you. You may find our contact form at [openintro.org](https://www.openintro.org/form/?f=contact).

## Acknowledgements {-}

[MCR-TODO: Will need to update language and people mentioned here.]

This project would not be possible without the dedication and volunteer hours of all those involved. No one has received any monetary compensation from this project, and we hope you will join us in extending a *thank you* to all those who volunteer with OpenIntro.

The authors would especially like to thank Andrew Bray and Meenal Patel for their involvement and contributions to this textbook. We are also grateful to Andrew Bray, Ben Baumer, and David Laffie for providing us with valuable feedback based on their experiences while teaching with this textbook, and to the many teachers, students, and other readers who have helped improve OpenIntro resources through their feedback.

The authors would like to specially thank George Cobb of Mount Holyoke College and Chris Malone of Winona State University. George has spent a good part of his career supporting the use of nonparametric techniques in introductory statistics, and Chris was helpful in discussing practical considerations for the ordering of inference used in this textbook. Thank you, George and Chris!


<!--chapter:end:index.Rmd-->

# About the authors {-}

Mine Çetinkaya-Rundel <br>
mine@openintro.org <br>
University of Edinburgh, Duke University, RStudio <br>

<br>

Johanna Hardin <br>
jo@openintro.org <br>
Pomona College <br>

<br>

David Diez <br>
david@openintro.org <br>
Google/YouTube <br>

<br>

others...

<!--chapter:end:00a-authors.Rmd-->

# Copyright {-}

Copyright &copy; 2020. Second Edition.

This textbook is available under a Creative Commons license. Visit [openintro.org](https://www.openintro.org/book/isrs/) for a free PDF, to download the textbook's source files, or for more information about the license.

<!--chapter:end:00b-copyright.Rmd-->

# Introduction to data {#intro-to-data}

Scientists seek to answer questions using rigorous methods and careful observations. 
These observations -- collected from the likes of field notes, surveys, and experiments -- form the backbone of a statistical investigation and are called \index{data}. 
Statistics is the study of how best to collect, analyze, and draw conclusions from data, and in this first chapter, we focus on both the properties of data and on the collection of data.

## Case Study: using stents to prevent strokes

Section [INSERT REFERENCE] introduces a classic challenge in statistics: evaluating the efficacy of a medical treatment. 
Terms in this section, and indeed much of this chapter, will all be revisited later in the text. 
The plan for now is simply to get a sense of the role statistics can play in practice.

In this section we will consider an experiment that studies effectiveness of stents in treating patients at risk of stroke.
Stents are devices put inside blood vessels that assist in patient recovery after cardiac events and reduce the risk of an additional heart attack or death. 
Many doctors have hoped that there would be similar benefits for patients at risk of stroke. We start by writing the principal question the researchers hope to answer:

> Does the use of stents reduce the risk of stroke?

The researchers who asked this question conducted an experiment with 451 at-risk patients. Each volunteer patient was randomly assigned to one of two groups:

- **Treatment group**. Patients in the treatment group received a stent and medical management. 
The medical management included medications, management of risk factors, and help in lifestyle modification.
- **Control group**. Patients in the control group received the same medical management as the treatment group, but they did not receive stents.

Researchers randomly assigned 224 patients to the treatment group and 227 to the control group. 
In this study, the control group provides a reference point against which we can measure the medical impact of stents in the treatment group.

Researchers studied the effect of stents at two time points: 30~days after enrollment and 365~days after enrollment. The results of 5 patients are summarized in Figure \@ref(fig:stent-study-results-df). 
Patient outcomes are recorded as `stroke` or `no event`, representing whether or not the patient had a stroke at the end of a time period.


```r
library(openintro)
```

```
## Please visit openintro.org for free statistics materials
```

```
## 
## Attaching package: 'openintro'
```

```
## The following object is masked from 'package:datasets':
## 
##     cars
```

```r
library(tidyverse)
```

```
## ── Attaching packages ────────────────── tidyverse 1.3.0 ──
```

```
## ✓ ggplot2 3.2.1     ✓ purrr   0.3.3
## ✓ tibble  2.1.3     ✓ dplyr   0.8.3
## ✓ tidyr   1.0.0     ✓ stringr 1.4.0
## ✓ readr   1.3.1     ✓ forcats 0.4.0
```

```
## ── Conflicts ───────────────────── tidyverse_conflicts() ──
## x dplyr::filter() masks stats::filter()
## x dplyr::lag()    masks stats::lag()
```

```r
library(knitr)
stent30_renamed <- stent30 %>% rename(`0-30 days` = outcome)
stent365_renamed <- stent365 %>% rename(`0-365 days` = outcome)
stent <- bind_cols(stent30_renamed, stent365_renamed) %>% select(-group1)
set.seed(1256)
stent %>%
  sample_n(5) %>% 
  arrange(desc(group)) %>%
  mutate(patient = 1:n()) %>%
  select(patient, everything()) %>%
  kable()
```



 patient  group       0-30 days   0-365 days 
--------  ----------  ----------  -----------
       1  treatment   no event    no event   
       2  control     no event    stroke     
       3  control     no event    no event   
       4  control     no event    stroke     
       5  control     no event    no event   

Considering data from each patient individually would be a long, cumbersome path towards answering the original research question. Instead, performing a statistical data analysis allows us to consider all of the data at once. Figure \@ref(fig:stent-study-results-df) summarizes the raw data in a more helpful way. In this table, we can quickly see what happened over the entire study. For instance, to identify the number of patients in the treatment group who had a stroke within 30 days, we look on the left-side of the table at the intersection of the treatment and stroke: 33.

\begin{figure}[h]
\centering
\begin{tabular}{l cc c cc}
& \multicolumn{2}{c}{0-30 days} &\hspace{5mm}\ & \multicolumn{2}{c}{0-365 days} \\
  \cline{2-3} \cline{5-6}
	& 	stroke 	& no event && 	stroke 	& no event \\
  \hline
treatment 	& 33		& 191	&&	45 	& 179 \\
control 		& 13		& 214	&& 	28	& 199 \\
  \hline
Total				& 46		& 405	&&	73	& 378 \\
  \hline
\end{tabular}
\caption{Descriptive statistics for the stent study.}
\label{stentStudyResults}
\end{figure}

\begin{exercisewrap}
\begin{nexercise}
Of the 224 patients in the treatment group, 45 had a stroke by the end of the first year. Using these two numbers, compute the proportion of patients in the treatment group who had a stroke by the end of their first year. (Please note: answers to all Guided Practice exercises are provided using footnotes.)\footnotemark
\end{nexercise}
\end{exercisewrap}\footnotetext{The proportion of the 224 patients who had a stroke within 365 days: $45/224 = 0.20$.}

We can compute summary statistics from the table.
A \term{summary statistic}%
\index{statistic|seealso{summary statistic}}
is a single number summarizing
a large amount of data.
For instance, the primary results of the study after 1~year
could be described by two summary statistics:
the proportion of people who had a stroke in the treatment
and control groups.
\begin{itemize}
\setlength{\itemsep}{0mm}
\item[] Proportion who had a stroke in the treatment (stent) group: $45/224 = 0.20 = 20\%$.
\item[] Proportion who had a stroke in the control group: $28/227 = 0.12 = 12\%$.
\end{itemize}
These two summary statistics are useful in looking for differences in the groups, and we are in for a surprise: an additional 8\% of patients in the treatment group had a stroke! This is important for two reasons. First, it is contrary to what doctors expected, which was that stents would \emph{reduce} the rate of strokes. Second, it leads to a statistical question: do the data show a ``real'' difference between the groups?

This second question is subtle. Suppose you flip a coin 100 times. While the chance a coin lands heads in any given coin flip is 50\%, we probably won't observe exactly 50 heads. This type of fluctuation is part of almost any type of data generating process. It is possible that the 8\% difference in the stent study is due to this natural variation. However, the larger the difference we observe (for a particular sample size), the less believable it is that the difference is due to chance. So what we are really asking is the following: is the difference so large that we should reject the notion that it was due to chance?

While we don't yet have our statistical tools to fully address this question on our own, we can comprehend the conclusions of the published analysis: there was compelling evidence of harm by stents in this study of stroke patients.

\textbf{Be careful:}
Do not generalize the results of this study to all patients
and all stents.
This study looked at patients with very specific characteristics
who volunteered to be a part of this study and who may not be
representative of all stroke patients.
In addition, there are many types of stents and this study only
considered the self-expanding Wingspan stent (Boston Scientific).
However, this study does leave us with an important lesson:
we should keep our eyes open for surprises.

## Taxonomy of Data

## Overview of data collection principles

## Observational studies and sampling strategies

## Experimental design and causality

## Revisit case study with new terminology we learned

<!--chapter:end:01-intro-to-data.Rmd-->

# Exploratory Data Analysis {#eda}

## Cat vs. cat - segmented plots / contingency tables

- Conditional probability from contingency tables
- Bayes Theorem (law of total probability?)
	
## Num vs. cat - side-by-side box plots / comparing distributions 

- Mention univariate - center, skew, shape, spread
- Mention conditional probabilities as well

<!--chapter:end:02-eda.Rmd-->

# Correlation and Regression {#cor-reg}

## Visual summaries of data: scatterplot, side-by-side boxplots, histogram, density plot, box plot (lead out with multivariate, follow with univariate)

## Describing distributions: correlation, central tendency, variability, skew, modality

## Num vs. num - SLR

- correlation
- Line fitting, residuals, and correlation
- Fitting a line by least squares regression
- Types of outliers in linear regression
	

<!--chapter:end:03-cor-reg.Rmd-->

# Multiple Regression {#mult-reg}

## Num vs. whatever - MLR

- Introduction to multiple regression

## Parallel slopes

## Hint at interaction, planes, and parallel planes but not quantify

- Visualization of higher-dimensional models (rgl demo)

## Logistic regression

- Binary vs. num/whatever
- Three scales interpretation (e.g. probability, odds, log-odds)
- “parallel” logistic curves? 

<!--chapter:end:04-mult-reg.Rmd-->

# Foundations of inference {#inference-foundations}

## Understanding inference through simulation

## Randomization case study: gender discrimination

## Randomization case study: opportunity cost

## Hypothesis testing

## Confidence intervals

## Simulation case studies

<!--chapter:end:05-inference-foundations.Rmd-->

# Inference for categorical data {#inference-cat}

## Inference for a single proportion
	
- Simulation
- Exact (if we include course on probability)
- CLT and Normal approximation

## Difference of two proportions

## Testing for goodness of fit using chi-square (special topic, include simulation version)

## Testing for independence in two-way tables (special topic)

<!--chapter:end:06-inference-cat.Rmd-->

# Inference for numerical data {#inference-num}

## One-sample means

- Bootstrap (for means, medians)
- t-distribution

## Paired data

## Difference of two means

## Comparing many means with ANOVA (special topic, include simulation version)

<!--chapter:end:07-inference-num.Rmd-->

# Inference for regression {#inference-reg}

## Inference for linear regression

- Bootstrap for regression coefficients
- t-distribution for regression coefficients
- Model Comparison: Occam’s Razor and R^2 > R^2_adj

## Checking model assumptions using graphs

- L-I-N-E

## Inference for multiple regression

- residuals vs. fitted instead of residuals vs. x

## Inference for logistic regression

<!--chapter:end:08-inference-reg.Rmd-->

# Appendix: Probability {#probability}

(Keep same content as before, minus the bit of probability that got moved to categorical EDA)

<!--chapter:end:09-appendix.Rmd-->


# References {-}


<!--chapter:end:10-references.Rmd-->

--- 
title: ""
author: "Mine Çetinkaya-Rundel, Johanna Hardin, David Diez, others..."
date: "2020-01-13"
site: bookdown::bookdown_site
documentclass: book
bibliography: [book.bib, packages.bib]
biblio-style: apalike
link-citations: yes
description: "This is ISRS2!"
---


```r
setwd("~/gitRepos/DataCamp/randomization-and-simulation")
bookdown::render_book("index.Rmd", output_dir = "_book")
```


```r
#install_github("openintrostats/openintro-r-package")
library(openintro)
```

```
## Please visit openintro.org for free statistics materials
```

```
## 
## Attaching package: 'openintro'
```

```
## The following object is masked from 'package:datasets':
## 
##     cars
```

```r
library(tidyverse)
```

```
## ── Attaching packages ────────────────── tidyverse 1.3.0 ──
```

```
## ✓ ggplot2 3.2.1     ✓ purrr   0.3.3
## ✓ tibble  2.1.3     ✓ dplyr   0.8.3
## ✓ tidyr   1.0.0     ✓ stringr 1.4.0
## ✓ readr   1.3.1     ✓ forcats 0.4.0
```

```
## ── Conflicts ───────────────────── tidyverse_conflicts() ──
## x dplyr::filter() masks stats::filter()
## x dplyr::lag()    masks stats::lag()
```

```r
library(knitr)

# hide code unless otherwise stated
knitr::opts_chunk$set(echo = FALSE)
```



# Welcome {-}

<!--
This book may be downloaded as a free PDF at [openintro.org](http://www.openintro.org).
-->

We hope readers will take away three ideas from this book in addition to forming a foundation of statistical thinking and methods.

1. Statistics is an applied field with a wide range of practical applications.
2. You don't have to be a math guru to learn from interesting, real data.
3. Data are messy, and statistical tools are imperfect. However, when you understand the strengths and weaknesses of these tools, you can use them to learn interesting things about the~world.

**IMPORTANT NOTE:** This book is currently in active development, and is planned for launch in late 2020 as the 2nd edition of OpenIntro Statistics - Introduction to Statistics with Randomization and Simulation. The 1st edition of the book can be accessed at [openintro.org/book/isrs/](https://www.openintro.org/book/isrs/).

## Textbook overview {-}

1. **Introduction to data.** Data structures, variables, summaries, graphics, and basic data collection techniques.
2. **Exploratory data analysis.** Data visualization and summarisation.
3. **Correlation and regression.** Visualising relationships between many variables and descriptive summaries for quantifying the relationship between two variables.
4. **Multiple regression.** Descriptive summaries for quantifying the relationship between two variables.
5. **Foundations for inference.** Case studies are used to introduce the ideas of statistical inference with randomization and simulations. 
6. **Inference for categorical data.** Inference for proportions using simulation and randomization techniques as well as the normal and chi-square distributions.
7. **Inference for numerical data.** Inference for one or two sample means using simulation and randomization techniques as well as the normal and F distributions.
8. **Inference for regression.** Extending inference techniques presented thus-far to regression settings.
7. **Appendix: Probability.** An introduction to probability is provided as an optional reference. Exercises and additional probability content may be found in Chapter~3 of OpenIntro Statistics at [openintro.org/book/os](https://www.openintro.org/book/os/).

## Examples, exercises, and additional appendices {-}

Examples and guided practice exercises throughout the textbook may be identified by their distinctive bullets:

[MCR-TODO: Need to update language below]

<!--
\begin{example}{Large filled bullets signal the start of an example.}
Full solutions to examples are provided and often include an accompanying table or figure.
 \end{example}

\begin{exercise}
Large empty bullets signal to readers that an exercise has been inserted into the text for additional practice and guidance. Solutions for all guided practice exercises are provided in footnotes.\footnote{Full solutions are located down here in the footnote!}
\end{exercise}

Exercises at the end of each chapter are useful for practice or homework assignments. Many of these questions have multiple parts, and solutions to odd-numbered exercises can be found in Appendix~\ref{eoceSolutions}. %These end-of-chapter exercises are also available online in a public question bank at \textbf{openintro.org}, and the available selection is constantly growing based on teacher contributions. Numbered citations in end-of-chapter exercises may be found in Appendix~B.

Probability tables for the normal, $t$, and chi-square distributions are in Appendix~\ref{distributionTables}, and PDF copies of these tables are also available from \href{http://www.openintro.org}{\color{black}\textbf{openintro.org}}.

-->

## OpenIntro, online resources, and getting involved {-}

OpenIntro is an organization focused on developing free and affordable education materials.

We encourage anyone learning or teaching statistics to visit [openintro.org] (http://www.openintro.org) and get involved. We also provide many free online resources, including free course software. Students can test their knowledge with practice quizzes for each chapter or try an application of concepts learned using real data. 

Data sets for this textbook are available on the website and through a companion R package, [**openintro**](http://openintrostat.github.io/openintro-r-package/).^[Mine Çetinkaya-Rundel, David Diez, Andrew Bray, Albert Kim, Ben Baumer, Chester Ismay and Christopher Barr (2019). openintro: Data Sets and Supplemental Functions from 'OpenIntro' Textbooks and Labs. R package version 2.0.1. https://github.com/OpenIntroStat/openintro-r-package.] All of these resources are free, and we want to be clear that anyone is welcome to use these online tools and resources with or without this textbook as a companion.

We value your feedback. If there is a part of the project you especially like or think needs improvement, we want to hear from you. You may find our contact form at [openintro.org](https://www.openintro.org/form/?f=contact).

## Acknowledgements {-}

[MCR-TODO: Will need to update language and people mentioned here.]

This project would not be possible without the dedication and volunteer hours of all those involved. No one has received any monetary compensation from this project, and we hope you will join us in extending a *thank you* to all those who volunteer with OpenIntro.

The authors would especially like to thank Andrew Bray and Meenal Patel for their involvement and contributions to this textbook. We are also grateful to Andrew Bray, Ben Baumer, and David Laffie for providing us with valuable feedback based on their experiences while teaching with this textbook, and to the many teachers, students, and other readers who have helped improve OpenIntro resources through their feedback.

The authors would like to specially thank George Cobb of Mount Holyoke College and Chris Malone of Winona State University. George has spent a good part of his career supporting the use of nonparametric techniques in introductory statistics, and Chris was helpful in discussing practical considerations for the ordering of inference used in this textbook. Thank you, George and Chris!


<!--chapter:end:index.Rmd-->

# About the authors {-}

Mine Çetinkaya-Rundel <br>
mine@openintro.org <br>
University of Edinburgh, Duke University, RStudio <br>

<br>

Johanna Hardin <br>
jo@openintro.org <br>
Pomona College <br>

<br>

David Diez <br>
david@openintro.org <br>
Google/YouTube <br>

<br>

others...

<!--chapter:end:00a-authors.Rmd-->

# Copyright {-}

Copyright &copy; 2020. Second Edition.

This textbook is available under a Creative Commons license. Visit [openintro.org](https://www.openintro.org/book/isrs/) for a free PDF, to download the textbook's source files, or for more information about the license.

<!--chapter:end:00b-copyright.Rmd-->

# Introduction to data {#intro-to-data}

Scientists seek to answer questions using rigorous methods and careful observations. 
These observations -- collected from the likes of field notes, surveys, and experiments -- form the backbone of a statistical investigation and are called \index{data}. 
Statistics is the study of how best to collect, analyze, and draw conclusions from data, and in this first chapter, we focus on both the properties of data and on the collection of data.

## Case Study: using stents to prevent strokes

Section [INSERT REFERENCE] introduces a classic challenge in statistics: evaluating the efficacy of a medical treatment. 
Terms in this section, and indeed much of this chapter, will all be revisited later in the text. 
The plan for now is simply to get a sense of the role statistics can play in practice.

In this section we will consider an experiment that studies effectiveness of stents in treating patients at risk of stroke.
Stents are devices put inside blood vessels that assist in patient recovery after cardiac events and reduce the risk of an additional heart attack or death. 
Many doctors have hoped that there would be similar benefits for patients at risk of stroke. We start by writing the principal question the researchers hope to answer:

> Does the use of stents reduce the risk of stroke?

The researchers who asked this question conducted an experiment with 451 at-risk patients. Each volunteer patient was randomly assigned to one of two groups:

- **Treatment group**. Patients in the treatment group received a stent and medical management. 
The medical management included medications, management of risk factors, and help in lifestyle modification.
- **Control group**. Patients in the control group received the same medical management as the treatment group, but they did not receive stents.

Researchers randomly assigned 224 patients to the treatment group and 227 to the control group. 
In this study, the control group provides a reference point against which we can measure the medical impact of stents in the treatment group.

Researchers studied the effect of stents at two time points: 30~days after enrollment and 365~days after enrollment. The results of 5 patients are summarized in Figure \@ref(fig:stent-study-results-df). 
Patient outcomes are recorded as `stroke` or `no event`, representing whether or not the patient had a stroke at the end of a time period.


 patient  group       0-30 days   0-365 days 
--------  ----------  ----------  -----------
       1  treatment   no event    no event   
       2  control     no event    stroke     
       3  control     no event    no event   
       4  control     no event    stroke     
       5  control     no event    no event   

Considering data from each patient individually would be a long, cumbersome path towards answering the original research question. Instead, performing a statistical data analysis allows us to consider all of the data at once. Figure \@ref(fig:stent-study-results-df) summarizes the raw data in a more helpful way. In this table, we can quickly see what happened over the entire study. For instance, to identify the number of patients in the treatment group who had a stroke within 30 days, we look on the left-side of the table at the intersection of the treatment and stroke: 33.

\begin{figure}[h]
\centering
\begin{tabular}{l cc c cc}
& \multicolumn{2}{c}{0-30 days} &\hspace{5mm}\ & \multicolumn{2}{c}{0-365 days} \\
  \cline{2-3} \cline{5-6}
	& 	stroke 	& no event && 	stroke 	& no event \\
  \hline
treatment 	& 33		& 191	&&	45 	& 179 \\
control 		& 13		& 214	&& 	28	& 199 \\
  \hline
Total				& 46		& 405	&&	73	& 378 \\
  \hline
\end{tabular}
\caption{Descriptive statistics for the stent study.}
\label{stentStudyResults}
\end{figure}

\begin{exercisewrap}
\begin{nexercise}
Of the 224 patients in the treatment group, 45 had a stroke by the end of the first year. Using these two numbers, compute the proportion of patients in the treatment group who had a stroke by the end of their first year. (Please note: answers to all Guided Practice exercises are provided using footnotes.)\footnotemark
\end{nexercise}
\end{exercisewrap}\footnotetext{The proportion of the 224 patients who had a stroke within 365 days: $45/224 = 0.20$.}

We can compute summary statistics from the table.
A \term{summary statistic}%
\index{statistic|seealso{summary statistic}}
is a single number summarizing
a large amount of data.
For instance, the primary results of the study after 1~year
could be described by two summary statistics:
the proportion of people who had a stroke in the treatment
and control groups.
\begin{itemize}
\setlength{\itemsep}{0mm}
\item[] Proportion who had a stroke in the treatment (stent) group: $45/224 = 0.20 = 20\%$.
\item[] Proportion who had a stroke in the control group: $28/227 = 0.12 = 12\%$.
\end{itemize}
These two summary statistics are useful in looking for differences in the groups, and we are in for a surprise: an additional 8\% of patients in the treatment group had a stroke! This is important for two reasons. First, it is contrary to what doctors expected, which was that stents would \emph{reduce} the rate of strokes. Second, it leads to a statistical question: do the data show a ``real'' difference between the groups?

This second question is subtle. Suppose you flip a coin 100 times. While the chance a coin lands heads in any given coin flip is 50\%, we probably won't observe exactly 50 heads. This type of fluctuation is part of almost any type of data generating process. It is possible that the 8\% difference in the stent study is due to this natural variation. However, the larger the difference we observe (for a particular sample size), the less believable it is that the difference is due to chance. So what we are really asking is the following: is the difference so large that we should reject the notion that it was due to chance?

While we don't yet have our statistical tools to fully address this question on our own, we can comprehend the conclusions of the published analysis: there was compelling evidence of harm by stents in this study of stroke patients.

\textbf{Be careful:}
Do not generalize the results of this study to all patients
and all stents.
This study looked at patients with very specific characteristics
who volunteered to be a part of this study and who may not be
representative of all stroke patients.
In addition, there are many types of stents and this study only
considered the self-expanding Wingspan stent (Boston Scientific).
However, this study does leave us with an important lesson:
we should keep our eyes open for surprises.

## Taxonomy of Data

## Overview of data collection principles

## Observational studies and sampling strategies

## Experimental design and causality

## Revisit case study with new terminology we learned

<!--chapter:end:01-intro-to-data.Rmd-->

# Exploratory Data Analysis {#eda}

## Cat vs. cat - segmented plots / contingency tables

- Conditional probability from contingency tables
- Bayes Theorem (law of total probability?)
	
## Num vs. cat - side-by-side box plots / comparing distributions 

- Mention univariate - center, skew, shape, spread
- Mention conditional probabilities as well

<!--chapter:end:02-eda.Rmd-->

# Correlation and Regression {#cor-reg}

## Visual summaries of data: scatterplot, side-by-side boxplots, histogram, density plot, box plot (lead out with multivariate, follow with univariate)

## Describing distributions: correlation, central tendency, variability, skew, modality

## Num vs. num - SLR

- correlation
- Line fitting, residuals, and correlation
- Fitting a line by least squares regression
- Types of outliers in linear regression
	

<!--chapter:end:03-cor-reg.Rmd-->

# Multiple Regression {#mult-reg}

## Num vs. whatever - MLR

- Introduction to multiple regression

## Parallel slopes

## Hint at interaction, planes, and parallel planes but not quantify

- Visualization of higher-dimensional models (rgl demo)

## Logistic regression

- Binary vs. num/whatever
- Three scales interpretation (e.g. probability, odds, log-odds)
- “parallel” logistic curves? 

<!--chapter:end:04-mult-reg.Rmd-->

# Foundations of inference {#inference-foundations}

## Understanding inference through simulation

## Randomization case study: gender discrimination

## Randomization case study: opportunity cost

## Hypothesis testing

## Confidence intervals

## Simulation case studies

<!--chapter:end:05-inference-foundations.Rmd-->

# Inference for categorical data {#inference-cat}

## Inference for a single proportion
	
- Simulation
- Exact (if we include course on probability)
- CLT and Normal approximation

## Difference of two proportions

## Testing for goodness of fit using chi-square (special topic, include simulation version)

## Testing for independence in two-way tables (special topic)

<!--chapter:end:06-inference-cat.Rmd-->

# Inference for numerical data {#inference-num}

## One-sample means

- Bootstrap (for means, medians)
- t-distribution

## Paired data

## Difference of two means

## Comparing many means with ANOVA (special topic, include simulation version)

<!--chapter:end:07-inference-num.Rmd-->

# Inference for regression {#inference-reg}

## Inference for linear regression

- Bootstrap for regression coefficients
- t-distribution for regression coefficients
- Model Comparison: Occam’s Razor and R^2 > R^2_adj

## Checking model assumptions using graphs

- L-I-N-E

## Inference for multiple regression

- residuals vs. fitted instead of residuals vs. x

## Inference for logistic regression

<!--chapter:end:08-inference-reg.Rmd-->

# Appendix: Probability {#probability}

(Keep same content as before, minus the bit of probability that got moved to categorical EDA)

<!--chapter:end:09-appendix.Rmd-->


# References {-}


<!--chapter:end:10-references.Rmd-->


<!--chapter:end:isrs2.Rmd-->

