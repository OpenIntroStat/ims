# Introduction to data {#getting-started-with-data}

\BeginKnitrBlock{chapterintro}<div class="chapterintro">Scientists seek to answer questions using rigorous methods and careful observations. 
These observations -- collected from the likes of field notes, surveys, and experiments -- form the backbone of a statistical investigation and are called **data**. 
Statistics is the study of how best to collect, analyze, and draw conclusions from data, and in this first chapter, we focus on both the properties of data and on the collection of data.</div>\EndKnitrBlock{chapterintro}



## Case Study: using stents to prevent strokes {#basic-stents-strokes}

\index{data!stroke|(}

In this section we introduce a classic challenge in statistics: evaluating the efficacy of a medical treatment. 
Terms in this section, and indeed much of this chapter, will all be revisited later in the text. 
The plan for now is simply to get a sense of the role statistics can play in practice.

In this section we will consider an experiment that studies effectiveness of stents in treating patients at risk of stroke [@chimowitz2011stenting].
Stents are small mesh tubes that are placed inside narrow or weak arteries to assist in patient recovery after cardiac events and reduce the risk of an additional heart attack or death. 

Many doctors have hoped that there would be similar benefits for patients at risk of stroke. We start by writing the principal question the researchers hope to answer:

> Does the use of stents reduce the risk of stroke?

The researchers who asked this question conducted an experiment with 451 at-risk patients. Each volunteer patient was randomly assigned to one of two groups:

- **Treatment group**. Patients in the treatment group received a stent and medical management. 
The medical management included medications, management of risk factors, and help in lifestyle modification.
- **Control group**. Patients in the control group received the same medical management as the treatment group, but they did not receive stents.

Researchers randomly assigned 224 patients to the treatment group and 227 to the control group. 
In this study, the control group provides a reference point against which we can measure the medical impact of stents in the treatment group.

Researchers studied the effect of stents at two time points: 30 days after enrollment and 365 days after enrollment. 
The results of 5 patients are summarized in Table \@ref(tab:stentStudyResultsDF). 
Patient outcomes are recorded as `stroke` or `no event`, representing whether or not the patient had a stroke during that time period.

\BeginKnitrBlock{data}<div class="data">The data from this study can be found in the [openintro](http://openintrostat.github.io/openintro) package: [`stent30`](http://openintrostat.github.io/openintro/reference/stent30.html) and [`stent365`](http://openintrostat.github.io/openintro/reference/stent365.html).</div>\EndKnitrBlock{data}

<table>
<caption>(\#tab:stentStudyResultsDF)Results for five patients from the stent study.</caption>
 <thead>
  <tr>
   <th style="text-align:right;"> patient </th>
   <th style="text-align:left;"> group </th>
   <th style="text-align:left;"> 30 days </th>
   <th style="text-align:left;"> 365 days </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:left;"> treatment </td>
   <td style="text-align:left;"> no event </td>
   <td style="text-align:left;"> no event </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:left;"> treatment </td>
   <td style="text-align:left;"> stroke </td>
   <td style="text-align:left;"> stroke </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:left;"> treatment </td>
   <td style="text-align:left;"> no event </td>
   <td style="text-align:left;"> no event </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:left;"> treatment </td>
   <td style="text-align:left;"> no event </td>
   <td style="text-align:left;"> no event </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:left;"> control </td>
   <td style="text-align:left;"> no event </td>
   <td style="text-align:left;"> no event </td>
  </tr>
</tbody>
</table>

Considering data from each patient individually would be a long, cumbersome path towards answering the original research question. 
Instead, performing a statistical data analysis allows us to consider all of the data at once. 
Table \@ref(tab:stentStudyResultsDFsummary) summarizes the raw data in a more helpful way. 
In this table, we can quickly see what happened over the entire study. 
For instance, to identify the number of patients in the treatment group who had a stroke within 30 days after the treatment, we look in the leftmost column (30 days), at the intersection of treatment and stroke: 33.
To identify the number of control patients who did not have a stroke after 365 days after receiving treatment, we look at the rightmost column (365 days), at the intersection of control and no event: 199.

<table>
<caption>(\#tab:stentStudyResultsDFsummary)Descriptive statistics for the stent study.</caption>
 <thead>
<tr>
<th style="border-bottom:hidden" colspan="1"></th>
<th style="border-bottom:hidden; padding-bottom:0; padding-left:3px;padding-right:3px;text-align: center; border-bottom: 2px solid" colspan="2"><div style="border-bottom: 1px solid #ddd; padding-bottom: 5px; ">30 days</div></th>
<th style="border-bottom:hidden; padding-bottom:0; padding-left:3px;padding-right:3px;text-align: center; border-bottom: 2px solid" colspan="2"><div style="border-bottom: 1px solid #ddd; padding-bottom: 5px; ">365 days</div></th>
</tr>
  <tr>
   <th style="text-align:left;">  </th>
   <th style="text-align:right;"> stroke </th>
   <th style="text-align:right;"> no event </th>
   <th style="text-align:right;"> stroke </th>
   <th style="text-align:right;"> no event </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;border-top: 2px solid"> treatment </td>
   <td style="text-align:right;border-top: 2px solid"> 33 </td>
   <td style="text-align:right;border-top: 2px solid"> 191 </td>
   <td style="text-align:right;border-top: 2px solid"> 45 </td>
   <td style="text-align:right;border-top: 2px solid"> 179 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> control </td>
   <td style="text-align:right;"> 13 </td>
   <td style="text-align:right;"> 214 </td>
   <td style="text-align:right;"> 28 </td>
   <td style="text-align:right;"> 199 </td>
  </tr>
  <tr>
   <td style="text-align:left;border-top: 2px solid"> Total </td>
   <td style="text-align:right;border-top: 2px solid"> 46 </td>
   <td style="text-align:right;border-top: 2px solid"> 405 </td>
   <td style="text-align:right;border-top: 2px solid"> 73 </td>
   <td style="text-align:right;border-top: 2px solid"> 378 </td>
  </tr>
</tbody>
</table>

\BeginKnitrBlock{guidedpractice}<div class="guidedpractice">Of the 224 patients in the treatment group, 45 had a stroke by the end of the first year. 
Using these two numbers, compute the proportion of patients in the treatment group who had a stroke by the end of their first year.
(Please note: answers to all Guided Practice exercises are provided using footnotes.)^[The proportion of the 224 patients who had a stroke within 365 days: $45/224 = 0.20$.]</div>\EndKnitrBlock{guidedpractice}

We can compute summary statistics from the table to give us a better idea of  how the impact of the stent treatment differed between the two groups.
A **summary statistic** is a single number summarizing a large amount of data.
For instance, the primary results of the study after 1 year could be described by two summary statistics: the proportion of people who had a stroke in the treatment and control groups.



- Proportion who had a stroke in the treatment (stent) group: $45/224 = 0.20 = 20\%$.
- Proportion who had a stroke in the control group: $28/227 = 0.12 = 12\%$.

These two summary statistics are useful in looking for differences in the groups, and we are in for a surprise: an additional 8% of patients in the treatment group had a stroke! 
This is important for two reasons. 
First, it is contrary to what doctors expected, which was that stents would *reduce* the rate of strokes. 
Second, it leads to a statistical question: do the data show a "real" difference between the groups?

This second question is subtle. 
Suppose you flip a coin 100 times. While the chance a coin lands heads in any given coin flip is 50%, we probably won't observe exactly 50 heads. 
This type of fluctuation is part of almost any type of data generating process. 
It is possible that the 8% difference in the stent study is due to this natural variation. 
However, the larger the difference we observe (for a particular sample size), the less believable it is that the difference is due to chance. 
So what we are really asking is the following: is the difference so large that we should reject the notion that it was due to chance?

While we don't yet have our statistical tools to fully address this question on our own, we can comprehend the conclusions of the published analysis: there was compelling evidence of harm by stents in this study of stroke patients.

**Be careful:** Do not generalize the results of this study to all patients and all stents.
This study looked at patients with very specific characteristics who volunteered to be a part of this study and who may not be representative of all stroke patients.
In addition, there are many types of stents and this study only considered the self-expanding Wingspan stent (Boston Scientific).
However, this study does leave us with an important lesson: we should keep our eyes open for surprises.

\index{data!stroke|)}

### Exercises {#basic-stents-strokes-exercises}

::: {.sectionexercise}


1.  **Migraine and acupuncture, Part I** A migraine is a particularly
    painful type of headache, which patients sometimes wish to treat
    with acupuncture. To determine whether acupuncture relieves migraine
    pain, researchers conducted a randomized controlled study where 89
    females diagnosed with migraine headaches were randomly assigned to
    one of two groups: treatment or control. 43 patients in the
    treatment group received acupuncture that is specifically designed
    to treat migraines. 46 patients in the control group received
    placebo acupuncture (needle insertion at non-acupoint locations). 24
    hours after patients received acupuncture, they were asked if they
    were pain free. Results are summarized in the contingency table
    below. [@Allais:2011]

      ---------------- ----------- ----- ---- -------
                                              
                                    Yes   No   Total
                       Treatment    10    33    43
      \[0pt\]*Group*   Control       2    44    46
                       Total        12    77    89
      ---------------- ----------- ----- ---- -------

    ![](01-exercises/figures/earacupuncture.png){width="75%"}

    Figure from the original paper displaying the appropriate area (M)
    versus the inappropriate area (S) used in the treatment of migraine
    attacks.

    1.  What percent of patients in the treatment group were pain free
        24 hours after receiving acupuncture?

    2.  What percent were pain free in the control group?

    3.  In which group did a higher percent of patients become pain free
        24 hours after receiving acupuncture?

    4.  Your findings so far might suggest that acupuncture is an
        effective treatment for migraines for all people who suffer from
        migraines. However this is not the only possible conclusion that
        can be drawn based on your findings so far. What is one other
        possible explanation for the observed difference between the
        percentages of patients that are pain free 24 hours after
        receiving acupuncture in the two groups?

1.  **Sinusitis and antibiotics, Part I** Researchers studying the
    effect of antibiotic treatment for acute sinusitis compared to
    symptomatic treatments randomly assigned 166 adults diagnosed with
    acute sinusitis to one of two groups: treatment or control. Study
    participants received either a 10-day course of amoxicillin (an
    antibiotic) or a placebo similar in appearance and taste. The
    placebo consisted of symptomatic treatments such as acetaminophen,
    nasal decongestants, etc. At the end of the 10-day period, patients
    were asked if they experienced improvement in symptoms. The
    distribution of responses is summarized below. [@Garbutt:2012]

      ---------------- ----------- ----- ---- -------
                                              
                                              
                                    Yes   No   Total
                       Treatment    66    19    85
      \[0pt\]*Group*   Control      65    16    81
                       Total        131   35    166
      ---------------- ----------- ----- ---- -------

    1.  What percent of patients in the treatment group experienced
        improvement in symptoms?

    2.  What percent experienced improvement in symptoms in the control
        group?

    3.  In which group did a higher percentage of patients experience
        improvement in symptoms?

    4.  Your findings so far might suggest that a real difference in
        effectiveness of antibiotic and placebo treatments for improving
        symptoms of sinusitis. However this is not the only possible
        conclusion that can be drawn based on your findings so far. What
        is one other possible explanation for the observed difference
        between the percentages of patients that are pain free 24 hours
        after receiving acupuncture in the two groups?

:::

---

## Data basics {#data-basics}

Effective presentation and description of data is a first step in most analyses. This section introduces one structure for organizing data as well as some terminology that will be used throughout this book.

### Observations, variables, and data matrices

\index{data!loan50|(}

Table \@ref(tab:loan50DF) displays six rows of a data set for 50 randomly sampled loans offered through Lending Club, which is a peer-to-peer lending company. These observations will be referred to as the `loan50` data set.

\BeginKnitrBlock{data}<div class="data">The data can be found in the [openintro](http://openintrostat.github.io/openintro) package: [`loan50`](http://openintrostat.github.io/openintro/reference/loan50.html).</div>\EndKnitrBlock{data}

Each row in the table represents a single loan. 
The formal name for a row is a **case** or \index{unit of observation}**observational unit**.
The columns represent characteristics of each loan, where each column is referred to as a **variable**.
For example, the first row represents a loan of \$7,500 with an interest rate of 7.34\%, where the borrower is based in Maryland (MD) and has an income of \$70,000.



\BeginKnitrBlock{guidedpractice}<div class="guidedpractice">What is the grade of the first loan in Table \@ref(tab:loan50DF)?
And what is the home ownership status of the borrower for that first loan?
Reminder: for these Guided Practice questions, you can check your answer in the footnote.^[The loan's grade is A, and the borrower rents their residence.]</div>\EndKnitrBlock{guidedpractice}

In practice, it is especially important to ask clarifying questions to ensure important aspects of the data are understood.
For instance, it is always important to be sure we know what each variable means and its units of measurement.
Descriptions of the variables in the `loan50` dataset are given in Table \@ref(tab:loan50Variables).

<table>
<caption>(\#tab:loan50DF)Six rows from the `loan50` data set</caption>
 <thead>
  <tr>
   <th style="text-align:left;">   </th>
   <th style="text-align:right;"> loan_amount </th>
   <th style="text-align:right;"> interest_rate </th>
   <th style="text-align:right;"> term </th>
   <th style="text-align:left;"> grade </th>
   <th style="text-align:left;"> state </th>
   <th style="text-align:right;"> total_income </th>
   <th style="text-align:left;"> homeownership </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> 1 </td>
   <td style="text-align:right;"> 22000 </td>
   <td style="text-align:right;"> 10.90 </td>
   <td style="text-align:right;"> 60 </td>
   <td style="text-align:left;"> B </td>
   <td style="text-align:left;"> NJ </td>
   <td style="text-align:right;"> 59000 </td>
   <td style="text-align:left;"> rent </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2 </td>
   <td style="text-align:right;"> 6000 </td>
   <td style="text-align:right;"> 9.92 </td>
   <td style="text-align:right;"> 36 </td>
   <td style="text-align:left;"> B </td>
   <td style="text-align:left;"> CA </td>
   <td style="text-align:right;"> 60000 </td>
   <td style="text-align:left;"> rent </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 3 </td>
   <td style="text-align:right;"> 25000 </td>
   <td style="text-align:right;"> 26.30 </td>
   <td style="text-align:right;"> 36 </td>
   <td style="text-align:left;"> E </td>
   <td style="text-align:left;"> SC </td>
   <td style="text-align:right;"> 75000 </td>
   <td style="text-align:left;"> mortgage </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 4 </td>
   <td style="text-align:right;"> 6000 </td>
   <td style="text-align:right;"> 9.92 </td>
   <td style="text-align:right;"> 36 </td>
   <td style="text-align:left;"> B </td>
   <td style="text-align:left;"> CA </td>
   <td style="text-align:right;"> 75000 </td>
   <td style="text-align:left;"> rent </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 5 </td>
   <td style="text-align:right;"> 25000 </td>
   <td style="text-align:right;"> 9.43 </td>
   <td style="text-align:right;"> 60 </td>
   <td style="text-align:left;"> B </td>
   <td style="text-align:left;"> OH </td>
   <td style="text-align:right;"> 254000 </td>
   <td style="text-align:left;"> mortgage </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 6 </td>
   <td style="text-align:right;"> 6400 </td>
   <td style="text-align:right;"> 9.92 </td>
   <td style="text-align:right;"> 36 </td>
   <td style="text-align:left;"> B </td>
   <td style="text-align:left;"> IN </td>
   <td style="text-align:right;"> 67000 </td>
   <td style="text-align:left;"> mortgage </td>
  </tr>
</tbody>
</table>

<table>
<caption>(\#tab:loan50Variables)Variables and their descriptions for the `loan50` data set.</caption>
 <thead>
  <tr>
   <th style="text-align:left;"> variable </th>
   <th style="text-align:left;"> description </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> loan_amount </td>
   <td style="text-align:left;"> Amount of the loan received, in US dollars. </td>
  </tr>
  <tr>
   <td style="text-align:left;"> interest_rate </td>
   <td style="text-align:left;"> Interest rate on the loan, in an annual percentage. </td>
  </tr>
  <tr>
   <td style="text-align:left;"> term </td>
   <td style="text-align:left;"> The length of the loan, which is always set as a whole number of months. </td>
  </tr>
  <tr>
   <td style="text-align:left;"> grade </td>
   <td style="text-align:left;"> Loan grade, which takes a values A through G and represents the quality of the loan and its likelihood of being repaid. </td>
  </tr>
  <tr>
   <td style="text-align:left;"> state </td>
   <td style="text-align:left;"> US state where the borrower resides. </td>
  </tr>
  <tr>
   <td style="text-align:left;"> total_income </td>
   <td style="text-align:left;"> Borrower's total income, including any second income, in US dollars. </td>
  </tr>
  <tr>
   <td style="text-align:left;"> homeownership </td>
   <td style="text-align:left;"> Indicates whether the person owns, owns but has a mortgage, or rents. </td>
  </tr>
</tbody>
</table>

\index{data!loan50|)}

The data in Table \@ref(tab:loan50DF) represent a **data frame**, which is a convenient and common way to organize data, especially if collecting data in a spreadsheet.
Each row of a data frame corresponds to a unique case (observational unit), and each column corresponds to a variable.



When recording data, use a data matrix unless you have a very good reason to use a different structure.
This structure allows new cases to be added as rows or new variables as new columns.

\BeginKnitrBlock{guidedpractice}<div class="guidedpractice">The grades for assignments, quizzes, and exams in a course are often recorded in a gradebook that takes the form of a data frame. 
How might you organize a course's grade data using a data frame?^[There are multiple strategies that can be followed. One common strategy is to have each student represented by a row, and then add a column for each assignment, quiz, or exam. Under this setup, it is easy to review a single line to understand the grade history of a student. There should also be columns to include student information, such as one column to list student names.]</div>\EndKnitrBlock{guidedpractice}

\index{data!county|(}

\BeginKnitrBlock{guidedpractice}<div class="guidedpractice">We consider data for 3,142 counties in the United States,
which includes the name of each county, the state where it resides, its population in 2017, how its population changed from 2010 to 2017, poverty rate, and nine additional characteristics.
How might these data be organized in a data frame?^[Each county may be viewed as a case, and there are eleven pieces of information recorded for each case. A table with 3,142 rows and 14 columns could hold these data, where each row represents a county and each column represents a particular piece of information.]</div>\EndKnitrBlock{guidedpractice}

The data described in the Guided Practice above represents the **county** data set, which is shown as a data frame in Table \@ref(tab:countyDF).
The variables as well as the variables in the dataset that did not fit in Table \@ref(tab:countyDF) are described in Table \@ref(tab:countyVariables).

<table>
<caption>(\#tab:countyDF)Six observations and six variables from the `county` data set.</caption>
 <thead>
  <tr>
   <th style="text-align:left;"> name </th>
   <th style="text-align:left;"> state </th>
   <th style="text-align:right;"> pop2017 </th>
   <th style="text-align:right;"> pop_change </th>
   <th style="text-align:right;"> unemployment_rate </th>
   <th style="text-align:left;"> median_edu </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Autauga County </td>
   <td style="text-align:left;"> Alabama </td>
   <td style="text-align:right;"> 55504 </td>
   <td style="text-align:right;"> 1.48 </td>
   <td style="text-align:right;"> 3.86 </td>
   <td style="text-align:left;"> some_college </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Baldwin County </td>
   <td style="text-align:left;"> Alabama </td>
   <td style="text-align:right;"> 212628 </td>
   <td style="text-align:right;"> 9.19 </td>
   <td style="text-align:right;"> 3.99 </td>
   <td style="text-align:left;"> some_college </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Barbour County </td>
   <td style="text-align:left;"> Alabama </td>
   <td style="text-align:right;"> 25270 </td>
   <td style="text-align:right;"> -6.22 </td>
   <td style="text-align:right;"> 5.90 </td>
   <td style="text-align:left;"> hs_diploma </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Bibb County </td>
   <td style="text-align:left;"> Alabama </td>
   <td style="text-align:right;"> 22668 </td>
   <td style="text-align:right;"> 0.73 </td>
   <td style="text-align:right;"> 4.39 </td>
   <td style="text-align:left;"> hs_diploma </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Blount County </td>
   <td style="text-align:left;"> Alabama </td>
   <td style="text-align:right;"> 58013 </td>
   <td style="text-align:right;"> 0.68 </td>
   <td style="text-align:right;"> 4.02 </td>
   <td style="text-align:left;"> hs_diploma </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Bullock County </td>
   <td style="text-align:left;"> Alabama </td>
   <td style="text-align:right;"> 10309 </td>
   <td style="text-align:right;"> -2.28 </td>
   <td style="text-align:right;"> 4.93 </td>
   <td style="text-align:left;"> hs_diploma </td>
  </tr>
</tbody>
</table>

<table>
<caption>(\#tab:countyVariables)Variables and their descriptions for the `county` data set.</caption>
 <thead>
  <tr>
   <th style="text-align:left;"> variable </th>
   <th style="text-align:left;"> description </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> name </td>
   <td style="text-align:left;"> Name of county. </td>
  </tr>
  <tr>
   <td style="text-align:left;"> state </td>
   <td style="text-align:left;"> Name of state. </td>
  </tr>
  <tr>
   <td style="text-align:left;"> pop2000 </td>
   <td style="text-align:left;"> Population in 2000. </td>
  </tr>
  <tr>
   <td style="text-align:left;"> pop2010 </td>
   <td style="text-align:left;"> Population in 2010. </td>
  </tr>
  <tr>
   <td style="text-align:left;"> pop2017 </td>
   <td style="text-align:left;"> Population in 2017. </td>
  </tr>
  <tr>
   <td style="text-align:left;"> pop_change </td>
   <td style="text-align:left;"> Population change from 2010 to 2017. </td>
  </tr>
  <tr>
   <td style="text-align:left;"> poverty </td>
   <td style="text-align:left;"> Percent of population in poverty in 2017. </td>
  </tr>
  <tr>
   <td style="text-align:left;"> homeownership </td>
   <td style="text-align:left;"> Homeownership rate, 2006-2010. </td>
  </tr>
  <tr>
   <td style="text-align:left;"> multi_unit </td>
   <td style="text-align:left;"> Percent of housing units in multi-unit structures, 2006-2010. </td>
  </tr>
  <tr>
   <td style="text-align:left;"> unemployment_rate </td>
   <td style="text-align:left;"> Unemployment rate in 2017. </td>
  </tr>
  <tr>
   <td style="text-align:left;"> metro </td>
   <td style="text-align:left;"> Whether the county contains a metropolitan area, taking one of the values `yes` or `no`. </td>
  </tr>
  <tr>
   <td style="text-align:left;"> median_edu </td>
   <td style="text-align:left;"> Median education level (2013-2017), taking one of the values `below_hs`, `hs_diploma`, `some_college`, or `bachelors`. </td>
  </tr>
  <tr>
   <td style="text-align:left;"> per_capita_income </td>
   <td style="text-align:left;"> Per capita (per person) income (2013-2017). </td>
  </tr>
  <tr>
   <td style="text-align:left;"> median_hh_income </td>
   <td style="text-align:left;"> Median household income. </td>
  </tr>
  <tr>
   <td style="text-align:left;"> smoking_ban </td>
   <td style="text-align:left;"> Describes whether the type of county-level smoking ban in place in 2010, taking one of the values `none`, `partial`, or `comprehensive`. </td>
  </tr>
</tbody>
</table>

\BeginKnitrBlock{data}<div class="data">These data can be found in the [usdata](http://openintrostat.github.io/usdata) package: [`county`](http://openintrostat.github.io/usdata/reference/county.html).</div>\EndKnitrBlock{data}

### Types of variables {#variable-types}

Examine the `unemployment_rate`, `pop2017`, `state`, and `median_edu` variables in the `county` data set. 
Each of these variables is inherently different from the other three, yet some share certain characteristics.

First consider `unemployment_rate`, which is said to be a **numerical** variable since it can take a wide range of numerical values, and it is sensible to add, subtract, or take averages with those values.
On the other hand, we would not classify a variable reporting telephone area codes as numerical since the average, sum, and difference of area codes doesn't have any clear meaning.



The `pop2017` variable is also numerical, although it seems to be a little different than `unemployment_rate`.
This variable of the population count can only take whole non-negative numbers (0, 1, 2, ...).
For this reason, the population variable is said to be **discrete** since it can only take numerical values with jumps.
On the other hand, the unemployment rate variable is said to be **continuous**.



The variable `state` can take up to 51 values after accounting for Washington, DC: AL, AK, ..., and WY.
Because the responses themselves are categories, `state` is called a **categorical** variable, and the possible values are called the variable's **levels** .



Finally, consider the `median_edu` variable, which describes the median education level of county residents and takes values `below_hs`, `hs_diploma`, `some_college`, or `bachelors` in each county.
This variable seems to be a hybrid: it is a categorical variable but the levels have a natural ordering.
A variable with these properties is called an **ordinal** variable, while a regular categorical variable without this type of special ordering is called a **nominal** variable.
To simplify analyses, any ordinal variable in this book will be treated as a nominal (unordered) categorical variable.

























































































































