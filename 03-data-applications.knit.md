# Applications: Data {#data-applications}

## Case study: Passwords {#case-study-passwords}

Stop for a second and think about how many passwords you've used so far today.
You've probably used one to unlock your phone, one to check email, and probably at least one to log on to a social media account.
Made a debit purchase?
You've probably entered a password there too.

If you're reading this book, and particularly if you're reading it online, chances are you have had to create a password once or twice in your life.
And if you are diligent about your safety and privacy, you've probably chosen passwords that would be hard for others to guess, or *crack*.

In this case study we introduce a dataset on passwords.
The goal of the case study is to walk you through what a data scientist does when they first get a hold of a dataset as well as to provide some "foreshadowing" of concepts and techniques we'll introduce in the next few chapters on exploratory data analysis.

::: {.data data-latex=""}
The data can be found in the [tidytuesdayR](https://thebioengineer.github.io/tidytuesdayR/) package: [`passwords`](https://github.com/rfordatascience/tidytuesday/blob/master/data/2020/2020-01-14/readme.md).
:::

Table \@ref(tab:passwords-df-head) shows the first ten rows from the dataset, which are the ten most common passwords.
Perhaps unsurprisingly, "password" tops the list, followed by "123456".

<table class="table table-striped table-condensed" style="margin-left: auto; margin-right: auto;">
<caption>(\#tab:passwords-df-head)Top ten rows of the `passwords` dataset.</caption>
 <thead>
  <tr>
   <th style="text-align:right;"> rank </th>
   <th style="text-align:left;"> password </th>
   <th style="text-align:left;"> category </th>
   <th style="text-align:right;"> value </th>
   <th style="text-align:left;"> time_unit </th>
   <th style="text-align:right;"> offline_crack_sec </th>
   <th style="text-align:right;"> strength </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:left;"> password </td>
   <td style="text-align:left;"> password-related </td>
   <td style="text-align:right;"> 6.91 </td>
   <td style="text-align:left;"> years </td>
   <td style="text-align:right;"> 2.170 </td>
   <td style="text-align:right;"> 8 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:left;"> 123456 </td>
   <td style="text-align:left;"> simple-alphanumeric </td>
   <td style="text-align:right;"> 18.52 </td>
   <td style="text-align:left;"> minutes </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 4 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:left;"> 12345678 </td>
   <td style="text-align:left;"> simple-alphanumeric </td>
   <td style="text-align:right;"> 1.29 </td>
   <td style="text-align:left;"> days </td>
   <td style="text-align:right;"> 0.001 </td>
   <td style="text-align:right;"> 4 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:left;"> 1234 </td>
   <td style="text-align:left;"> simple-alphanumeric </td>
   <td style="text-align:right;"> 11.11 </td>
   <td style="text-align:left;"> seconds </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 4 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:left;"> qwerty </td>
   <td style="text-align:left;"> simple-alphanumeric </td>
   <td style="text-align:right;"> 3.72 </td>
   <td style="text-align:left;"> days </td>
   <td style="text-align:right;"> 0.003 </td>
   <td style="text-align:right;"> 8 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:left;"> 12345 </td>
   <td style="text-align:left;"> simple-alphanumeric </td>
   <td style="text-align:right;"> 1.85 </td>
   <td style="text-align:left;"> minutes </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 4 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:left;"> dragon </td>
   <td style="text-align:left;"> animal </td>
   <td style="text-align:right;"> 3.72 </td>
   <td style="text-align:left;"> days </td>
   <td style="text-align:right;"> 0.003 </td>
   <td style="text-align:right;"> 8 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:left;"> baseball </td>
   <td style="text-align:left;"> sport </td>
   <td style="text-align:right;"> 6.91 </td>
   <td style="text-align:left;"> years </td>
   <td style="text-align:right;"> 2.170 </td>
   <td style="text-align:right;"> 4 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 9 </td>
   <td style="text-align:left;"> football </td>
   <td style="text-align:left;"> sport </td>
   <td style="text-align:right;"> 6.91 </td>
   <td style="text-align:left;"> years </td>
   <td style="text-align:right;"> 2.170 </td>
   <td style="text-align:right;"> 7 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 10 </td>
   <td style="text-align:left;"> letmein </td>
   <td style="text-align:left;"> password-related </td>
   <td style="text-align:right;"> 3.19 </td>
   <td style="text-align:left;"> months </td>
   <td style="text-align:right;"> 0.084 </td>
   <td style="text-align:right;"> 8 </td>
  </tr>
</tbody>
</table>

When you encounter a new dataset, taking a peek at the first few rows we we did in Table \@ref(tab:passwords-df-head) is almost instinctual.
It can often be helpful to take a look at the last few rows of the data as well to get a sense of the size of the data as well as potentially discover any characteristics that may not be apparent in the top few rows.
Table \@ref(tab:passwords-df-tail) shows the bottom ten rows of the passwords dataset, which reveals that we are looking at a dataset of 500 passwords.

<table class="table table-striped table-condensed" style="margin-left: auto; margin-right: auto;">
<caption>(\#tab:passwords-df-tail)Bottom ten rows of the `passwords` dataset.</caption>
 <thead>
  <tr>
   <th style="text-align:right;"> rank </th>
   <th style="text-align:left;"> password </th>
   <th style="text-align:left;"> category </th>
   <th style="text-align:right;"> value </th>
   <th style="text-align:left;"> time_unit </th>
   <th style="text-align:right;"> offline_crack_sec </th>
   <th style="text-align:right;"> strength </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:right;"> 491 </td>
   <td style="text-align:left;"> natasha </td>
   <td style="text-align:left;"> name </td>
   <td style="text-align:right;"> 3.19 </td>
   <td style="text-align:left;"> months </td>
   <td style="text-align:right;"> 0.084 </td>
   <td style="text-align:right;"> 7 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 492 </td>
   <td style="text-align:left;"> sniper </td>
   <td style="text-align:left;"> cool-macho </td>
   <td style="text-align:right;"> 3.72 </td>
   <td style="text-align:left;"> days </td>
   <td style="text-align:right;"> 0.003 </td>
   <td style="text-align:right;"> 8 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 493 </td>
   <td style="text-align:left;"> chance </td>
   <td style="text-align:left;"> name </td>
   <td style="text-align:right;"> 3.72 </td>
   <td style="text-align:left;"> days </td>
   <td style="text-align:right;"> 0.003 </td>
   <td style="text-align:right;"> 7 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 494 </td>
   <td style="text-align:left;"> genesis </td>
   <td style="text-align:left;"> nerdy-pop </td>
   <td style="text-align:right;"> 3.19 </td>
   <td style="text-align:left;"> months </td>
   <td style="text-align:right;"> 0.084 </td>
   <td style="text-align:right;"> 7 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 495 </td>
   <td style="text-align:left;"> hotrod </td>
   <td style="text-align:left;"> cool-macho </td>
   <td style="text-align:right;"> 3.72 </td>
   <td style="text-align:left;"> days </td>
   <td style="text-align:right;"> 0.003 </td>
   <td style="text-align:right;"> 7 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 496 </td>
   <td style="text-align:left;"> reddog </td>
   <td style="text-align:left;"> cool-macho </td>
   <td style="text-align:right;"> 3.72 </td>
   <td style="text-align:left;"> days </td>
   <td style="text-align:right;"> 0.003 </td>
   <td style="text-align:right;"> 6 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 497 </td>
   <td style="text-align:left;"> alexande </td>
   <td style="text-align:left;"> name </td>
   <td style="text-align:right;"> 6.91 </td>
   <td style="text-align:left;"> years </td>
   <td style="text-align:right;"> 2.170 </td>
   <td style="text-align:right;"> 9 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 498 </td>
   <td style="text-align:left;"> college </td>
   <td style="text-align:left;"> nerdy-pop </td>
   <td style="text-align:right;"> 3.19 </td>
   <td style="text-align:left;"> months </td>
   <td style="text-align:right;"> 0.084 </td>
   <td style="text-align:right;"> 7 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 499 </td>
   <td style="text-align:left;"> jester </td>
   <td style="text-align:left;"> name </td>
   <td style="text-align:right;"> 3.72 </td>
   <td style="text-align:left;"> days </td>
   <td style="text-align:right;"> 0.003 </td>
   <td style="text-align:right;"> 7 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 500 </td>
   <td style="text-align:left;"> passw0rd </td>
   <td style="text-align:left;"> password-related </td>
   <td style="text-align:right;"> 92.27 </td>
   <td style="text-align:left;"> years </td>
   <td style="text-align:right;"> 29.020 </td>
   <td style="text-align:right;"> 28 </td>
  </tr>
</tbody>
</table>

At this stage it's also useful to think about how these data were collected, as that will inform the scope of any inference you can make based on your analysis of the data.

::: {.guidedpractice data-latex=""}
Do these data come from an observational study or an experiment?[^data-applications-1]
:::

[^data-applications-1]: This is an observational study.
    Researchers collected data on existing passwords in use and identified most common ones to put together this dataset.

::: {.guidedpractice data-latex=""}
There are 500 rows and 7 in the dataset.
What does each row and each column represent?[^data-applications-2]
:::

[^data-applications-2]: Each row represents a password and each column represents a variable which contains information on each password.

Once you've identified the rows and columns, it's useful to review the data dictionary to learn about what each column in the dataset represents.
This is provided in Table \@ref(tab:passwords-var-def).

<table class="table table-striped table-condensed" style="margin-left: auto; margin-right: auto;">
<caption>(\#tab:passwords-var-def)Variables and their descriptions for the `passwords` data set.</caption>
 <thead>
  <tr>
   <th style="text-align:left;"> variable </th>
   <th style="text-align:left;"> description </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> \ttfamily{rank} </td>
   <td style="text-align:left;"> Popularity in the database of released passwords. </td>
  </tr>
  <tr>
   <td style="text-align:left;"> \ttfamily{password} </td>
   <td style="text-align:left;"> Actual text of the password. </td>
  </tr>
  <tr>
   <td style="text-align:left;"> \ttfamily{category} </td>
   <td style="text-align:left;"> Category password falls into. </td>
  </tr>
  <tr>
   <td style="text-align:left;"> \ttfamily{value} </td>
   <td style="text-align:left;"> Time to crack by online guessing. </td>
  </tr>
  <tr>
   <td style="text-align:left;"> \ttfamily{time\_unit} </td>
   <td style="text-align:left;"> Time unit to match with value. </td>
  </tr>
  <tr>
   <td style="text-align:left;"> \ttfamily{offline\_crack\_sec} </td>
   <td style="text-align:left;"> Time to crack offline in seconds. </td>
  </tr>
  <tr>
   <td style="text-align:left;"> \ttfamily{strength} </td>
   <td style="text-align:left;"> Strength of password, relative to only to passwords in this dataset. Lower values indicate weaker passwords. </td>
  </tr>
</tbody>
</table>

We now have a better sense of what each column represents, but we don't yet know much about the characteristics of each of the variables.

::: {.workedexample data-latex=""}
Determine whether each variable in the passwords dataset is numerical or categorical.
For numerical variables, further classify them as continuous or discrete.
For categorical variables, determine if the variable is ordinal.

------------------------------------------------------------------------

The numerical variables in the dataset are `rank` (discrete), `value` (continuous), and `offline_crack_sec` (continuous).
The categorical variables are `password`, `time_unit`.
The strength variable is trickier to classify -- we can think of it as discrete numerical or as an ordinal variable as it takes on numerical values, however it's used to categorize the passwords on an ordinal scale.
One way of approaching this is thinking about whether the values the variable takes vary linearly, e.g. is the difference in strength between passwords with strength levels 8 and 9 the same as the difference with those with strength levels 9 and 10.
If this is not necessarily the case, we would classify the variable as ordinal.
Determining the classification of this variable requires understanding how `strength` values were determined, which is a very typical workflow for working with data.
Sometimes the data dictionary (presented in Table \@ref(tab:passwords-var-def) isn't sufficient, and we need to go back to the data source and try to understand the data better before we can proceed with the analysis meaningfully.
:::

Next, let's try to get to know each variable a little bit better.
For categorical variables, this involves figuring out what their levels are and how commonly represented they are in the data.
Figure \@ref(fig:passwords-cat) shows the distributions of the categorical variables in this dataset.
We can see that password strengths of 0-10 are more common than higher values.
The most common password category is name (e.g. michael, jennifer, jordan, etc.) and the least common is food (e.g. pepper, cheese, coffee, etc.).
Many passwords can be cracked in the matter of days by online cracking with some taking as little as seconds and some as long as years to break.
Each of these visualizations is a bar plot, which you will learn more about in Chapter \@ref(explore-categorical).

\begin{figure}

{\centering \includegraphics[width=1\linewidth]{03-data-applications_files/figure-latex/passwords-cat-1} 

}

\caption{Distributions of the categorical variables in the `passwords` dataset. Plot A shows the distribution of password strengths, Plot B password categories, and Plot C length of time it takes to crack the passwords by online guessing.}(\#fig:passwords-cat)
\end{figure}

Similarly, we can examine the distributions of the numerical variables as well.
We already know that rank ranges between 1 and 500 in this dataset, based on Table \@ref(tab:passwords-df-head) and Table \@ref(tab:passwords-df-tail).
The value variable is slightly more complicated to consider since the numerical values in that column are meaningless without the time unit that accompanies them.
Table \@ref(tab:passwords-online-crack-summary) shows the minimum and maximum amount of time it takes to crack a password by online guessing.
For example there are 11 passwords in the dataset that can be broken in a matter of seconds, and each of them take 11.11 seconds to break, since the minimum and the maximum of observations in this group are exactly equal to this value.
And there are 65 passwords that take years to break, ranging from 2.56 years to 92.27 years.

<table class="table table-striped table-condensed" style="margin-left: auto; margin-right: auto;">
<caption>(\#tab:passwords-online-crack-summary)Minimum and maximum amount of time it takes to crack a password by online guessing as well as the number of observations that fall into each time unit category.</caption>
 <thead>
  <tr>
   <th style="text-align:left;"> time_unit </th>
   <th style="text-align:right;"> n </th>
   <th style="text-align:right;"> min </th>
   <th style="text-align:right;"> max </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> seconds </td>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:right;"> 11.11 </td>
   <td style="text-align:right;"> 11.11 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> minutes </td>
   <td style="text-align:right;"> 51 </td>
   <td style="text-align:right;"> 1.85 </td>
   <td style="text-align:right;"> 18.52 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> hours </td>
   <td style="text-align:right;"> 43 </td>
   <td style="text-align:right;"> 3.09 </td>
   <td style="text-align:right;"> 17.28 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> days </td>
   <td style="text-align:right;"> 238 </td>
   <td style="text-align:right;"> 1.29 </td>
   <td style="text-align:right;"> 3.72 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> weeks </td>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:right;"> 1.84 </td>
   <td style="text-align:right;"> 3.70 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> months </td>
   <td style="text-align:right;"> 87 </td>
   <td style="text-align:right;"> 3.19 </td>
   <td style="text-align:right;"> 3.19 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> years </td>
   <td style="text-align:right;"> 65 </td>
   <td style="text-align:right;"> 2.56 </td>
   <td style="text-align:right;"> 92.27 </td>
  </tr>
</tbody>
</table>

Even though passwords that take a large number of years to crack can seem like good options (see Table \@ref(tab:passwords-long-crack) for a list of them), now that you've seen them here (and the fact that they are in a dataset of 500 most common passwords), you should not use them as secure passwords!

<table class="table table-striped table-condensed" style="margin-left: auto; margin-right: auto;">
<caption>(\#tab:passwords-long-crack)Passwords that take the longest amount of time to crack by online guessing.</caption>
 <thead>
  <tr>
   <th style="text-align:right;"> rank </th>
   <th style="text-align:left;"> password </th>
   <th style="text-align:left;"> category </th>
   <th style="text-align:right;"> value </th>
   <th style="text-align:left;"> time_unit </th>
   <th style="text-align:right;"> offline_crack_sec </th>
   <th style="text-align:right;"> strength </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:right;"> 26 </td>
   <td style="text-align:left;"> trustno1 </td>
   <td style="text-align:left;"> simple-alphanumeric </td>
   <td style="text-align:right;"> 92.3 </td>
   <td style="text-align:left;"> years </td>
   <td style="text-align:right;"> 29.0 </td>
   <td style="text-align:right;"> 25 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 336 </td>
   <td style="text-align:left;"> rush2112 </td>
   <td style="text-align:left;"> nerdy-pop </td>
   <td style="text-align:right;"> 92.3 </td>
   <td style="text-align:left;"> years </td>
   <td style="text-align:right;"> 29.0 </td>
   <td style="text-align:right;"> 48 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 406 </td>
   <td style="text-align:left;"> jordan23 </td>
   <td style="text-align:left;"> sport </td>
   <td style="text-align:right;"> 92.3 </td>
   <td style="text-align:left;"> years </td>
   <td style="text-align:right;"> 29.3 </td>
   <td style="text-align:right;"> 34 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 500 </td>
   <td style="text-align:left;"> passw0rd </td>
   <td style="text-align:left;"> password-related </td>
   <td style="text-align:right;"> 92.3 </td>
   <td style="text-align:left;"> years </td>
   <td style="text-align:right;"> 29.0 </td>
   <td style="text-align:right;"> 28 </td>
  </tr>
</tbody>
</table>

The last numerical variable in the dataset is `offline_crack_sec`.
Figure \@ref(fig:password-offline-crack-hist) shows the distribution of this variable, which reveals that all of these passwords can be cracked offline in under 30 seconds, with a large number of them being crackable in just a few seconds.

\begin{figure}

{\centering \includegraphics[width=0.9\linewidth]{03-data-applications_files/figure-latex/password-offline-crack-hist-1} 

}

\caption{Histogram of the length of time it takes to crack passwords offline.}(\#fig:password-offline-crack-hist)
\end{figure}

So far we examined the distributions of each individual variable, but it would be more interesting to explore relationships between multiple variables.
Figure \@ref(fig:password-strength-rank-category) shows the relationship between rank and strength of passwords by category, where more common passwords (those with higher rank) are plotted higher on the y-axis than those that are less common in this dataset.
The stronger the password, the larger text it's represented with on the plot.
While this visualization reveals some passwords that are less common, and stronger than others, we should reiterate that you should not use any of these passwords.
And if you already do, it's time to go change it!

\begin{figure}

{\centering \includegraphics[width=1\linewidth]{03-data-applications_files/figure-latex/password-strength-rank-category-1} 

}

\caption{Rank vs. strength of 500 most common passwords by category.}(\#fig:password-strength-rank-category)
\end{figure}

In this case study, we introduced you to the very first steps a data scientist takes when they start working with a new dataset.
In the next few chapters we will introduce exploratory data analysis and you'll learn more about the various types of data visualizations and summary statistics you can make to get to know your data better.

Before you move on, we encourage you to think about whether the following questions can be answered with this dataset, and if yes, how you might go about answering them.
It's okay if your answer is "I'm not sure", we simply want to get your exploratory juices flowing to prime you for what's to come!

1.  What characteristics are associated with a strong vs. a weak password?
2.  Do more popular passwords take shorter or longer to crack compared to less popular passwords?
3.  Are passwords that start with letters or numbers more common among the list of top 500 most common passwords?

## Interactive R tutorials {#data-tutorials}

Navigate the concepts you've learned in this chapter in R using the following self-paced tutorials.
All you need is your browser to get started!

::: {.todo}
Update tutorial links
:::

::: {.alltutorials}
[Tutorial 1: Getting Started with Data](https://openintrostat.github.io/ims-tutorials/01-getting-started-with-data/)
:::

::: {.singletutorial}
[Tutorial 1 - Lesson 1: Language of data](https://openintro.shinyapps.io/ims-01-getting-started-with-data-01/)
:::

::: {.singletutorial}
[Tutorial 1 - Lesson 2: Types of studies](https://openintro.shinyapps.io/ims-01-getting-started-with-data-02/)
:::

::: {.singletutorial}
[Tutorial 1 - Lesson 3: Sampling strategies and Experimental design](https://openintro.shinyapps.io/ims-01-getting-started-with-data-03/)
:::

::: {.singletutorial}
[Tutorial 1 - Lesson 4: Case study](https://openintro.shinyapps.io/ims-01-getting-started-with-data-04/)
:::

You can also access the full list of tutorials supporting this book [here](https://openintrostat.github.io/ims-tutorials/).

## R labs {#data-labs}

Further apply the concepts you've learned in this chapter in R with computational labs that walk you through a data analysis case study.

::: {.singlelab}
[Intro to R - Birth rates](http://openintrostat.github.io/oilabs-tidy/01_intro_to_r/intro_to_r.html)
:::

::: {.alllabs}
[Full list of labs supporting OpenIntro::Introduction to Modern Statistics](http://openintrostat.github.io/oilabs-tidy/)
:::
