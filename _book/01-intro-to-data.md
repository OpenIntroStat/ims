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
