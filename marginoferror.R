```{=html}
<!--
  #### Choosing a sample size when estimating a proportion {-}
  
  
  ::: {.important}
**Margin of error.**
  
  In a confidence interval, $z^{\star}\times SE$ is called the **margin of error**\index{margin of error}.
::: 
  
  ```{r include = FALSE}
terms_chp_6 <- c(terms_chp_6, "margin of error")
```

```f3175f2a-e8a0-4436-be12-b33925b6d220
31b8e172-b470-440e-83d8-e6b185028602:dAB5AHAAZQA6AFoAZwBBAHoAQQBEAEUAQQBOAHcAQQAxAEEARwBZAEEATQBnAEIAaABBAEMAMABBAFoAUQBBADQAQQBHAEUAQQBNAEEAQQB0AEEARABRAEEATgBBAEEAegBBAEQAWQBBAEwAUQBCAGkAQQBHAFUAQQBNAFEAQQB5AEEAQwAwAEEAWQBnAEEAegBBAEQATQBBAE8AUQBBAHkAQQBEAFUAQQBZAGcAQQAyAEEARwBRAEEATQBnAEEAeQBBAEQAQQBBAAoAcABvAHMAaQB0AGkAbwBuADoATQB3AEEAMwBBAEQAWQBBAE0AdwBBAHgAQQBBAD0APQAKAHAAcgBlAGYAaQB4ADoACgBzAG8AdQByAGMAZQA6AFkAQQBCAGcAQQBHAEEAQQBlAHcAQgB5AEEAQwBBAEEAYQBRAEIAdQBBAEcATQBBAGIAQQBCADEAQQBHAFEAQQBaAFEAQQA5AEEARQBZAEEAUQBRAEIATQBBAEYATQBBAFIAUQBCADkAQQBBAG8AQQBkAEEAQgBsAEEASABJAEEAYgBRAEIAegBBAEYAOABBAFkAdwBCAG8AQQBIAEEAQQBYAHcAQQAyAEEAQwBBAEEAUABBAEEAdABBAEMAQQBBAFkAdwBBAG8AQQBIAFEAQQBaAFEAQgB5AEEARwAwAEEAYwB3AEIAZgBBAEcATQBBAGEAQQBCAHcAQQBGADgAQQBOAGcAQQBzAEEAQwBBAEEASQBnAEIAdABBAEcARQBBAGMAZwBCAG4AQQBHAGsAQQBiAGcAQQBnAEEARwA4AEEAWgBnAEEAZwBBAEcAVQBBAGMAZwBCAHkAQQBHADgAQQBjAGcAQQBpAEEAQwBrAEEAQwBnAEIAZwBBAEcAQQBBAFkAQQBBAD0ACgBzAHUAZgBmAGkAeAA6AA==:31b8e172-b470-440e-83d8-e6b185028602
```
\index{margin of error|(}

When collecting data, we choose a sample size suitable for the purpose of the study.
You might agree that the following interval estimate would not be particularly useful: a 95% confidence interval for the proportion of liver transplants with complications is between 0 and 1.
Often times "suitable for the study" means choosing a sample size large enough that the **margin of error**\index{margin of error} -- which is the part we add and subtract from the point estimate in a confidence interval -- is sufficiently small that the result is useful.
For example, our task might be to find a sample size $n$ so that the sample proportion is within $\pm 0.04$ of the actual proportion in a 95% confidence interval.

```{=html}
<!--
  % For example, the margin of error for a point estimate using 95% confidence can be written as $1.96\times SE$. We set up a general equation to represent the problem:
  %\begin{align*}
%ME = z^{\star} \times SE \leq m
%\end{align*}
%where $ME$ represented the actual margin of error and $z^{\star}$ was chosen to correspond to the confidence level. The standard error formula is specified to correspond to the particular setting. For instance, in the case of means, the standard error was given as $\sigma / \sqrt{n}$. In the case of a single proportion, we use $\sqrt{p(1-p) / n\ }$ for the standard error.


\index{data!Student football stadium|(}


::: {.workedexample}
A university newspaper is conducting
a survey to determine what fraction of students
support a $200 per year increase in fees to pay
for a new football stadium.
How big of a sample is required to ensure the
margin of error is smaller than 0.04 using a
95% confidence level?
  
  ---
  
  The margin of error for a sample proportion is
\begin{align*}
z^{\star} \sqrt{\frac{p (1 - p)}{n}}
\end{align*}
Our goal is to find the smallest sample size $n$
  so that this margin of error is smaller than $0.04$.
For a 95% confidence level, the value $z^{\star}$
  corresponds to 1.96:
  \begin{align*}
1.96\times \sqrt{\frac{p(1-p)}{n}} \ < \ 0.04
\end{align*}
There are two unknowns in the equation: $p$ and $n$.
If we have an estimate of $p$, perhaps from a prior
survey, we could enter in that value and solve for $n$.
If we have no such estimate, we must use some other
value for $p$.
It turns out that the margin of error is largest
when $p$ is 0.5, so we typically use this
\emph{worst case value} if no estimate of the
proportion is available:
  \begin{align*}
1.96\times \sqrt{\frac{0.5(1-0.5)}{n}} &\ < \ 0.04 \\
1.96^2\times \frac{0.5(1-0.5)}{n} &\ < \ 0.04^2 \\
1.96^2\times \frac{0.5(1-0.5)}{0.04^2} &\ < \ n \\
600.25 &\ < \  n
\end{align*}
We would need over 600.25 participants, which means
we need 601 participants or more, to ensure the
sample proportion is within 0.04 of the true proportion
with 95% confidence.
::: 
  
  
  \index{data!Student football stadium|)}

When an estimate of the proportion is available, we use it in place of the worst case proportion value, 0.5.


\index{data!Tire failure rate|(}


::: {.guidedpractice}
A manager is about to oversee the mass
production of a new tire model in her factory,
and she would like to estimate what proportion of
these tires will be rejected through quality control.
The quality control team has monitored the last three
tire models produced by the factory,
failing 1.7% of tires in the first model,
6.2% of the second model,
and 1.3% of the third model.
The manager would like to examine enough tires
to estimate the failure rate of the new tire model
to within about 1% with a 90% confidence level.
There are three different failure rates to choose from.
Perform the sample size computation for each separately,
and identify three sample sizes to consider.^[For a 90% confidence interval, $z^{\star} = 1.65$,
                                              and since an estimate of the proportion 0.017 is available,
                                              we'll use it in the margin of error formula:
  \begin{align*}
  1.65\times \sqrt{\frac{0.017(1-0.017)}{n}} &\ < \ 0.01
    \qquad\to\qquad
      \frac{0.017(1-0.017)}{n} \ < \ 
          \left(\frac{0.01}{1.65}\right)^2
    \qquad\to\qquad
      454.96 \ < \ n
  \end{align*}
  For sample size calculations, we always round up,
  so the first tire model suggests 455 tires would
  be sufficient.  
  A similar computation can be accomplished using 0.062
  and 0.013 for $p$, and you should verify that using these
  proportions results in minimum sample sizes of 1584
  and 350 tires, respectively.]
::: 


::: {.workedexample}
The sample sizes vary widely in the previous
    Guided Practice.
    Which of the three would you suggest using?
    What would influence your choice?

---
      
  We could examine which of the old models is most
  like the new model, then choose the corresponding sample
  size.
  Or if two of the previous estimates are based on small
  samples while the other is based on a larger sample,
  we might consider the value corresponding to the larger
  sample.
  There are also other reasonable approaches.

  Also observe that the success-failure
  condition would need to be checked in the final sample.
  For instance, if we sampled $n = 1584$ tires and found
  a failure rate of 0.5%, the normal approximation would
  not be reasonable, and we would require more advanced
  statistical methods for creating the confidence interval.
::: 


\index{data!Tire failure rate|)}
\index{data!Payday regulation poll|(}


::: {.guidedpractice}
Suppose we want to continually track the support
of payday borrowers for regulation on lenders,
where we would conduct a new poll every month.
Running such frequent polls is expensive, so we decide
a wider margin of error of 5% for each individual survey
would be acceptable.
Based on a previous sample of borrowers where
70% supported some form of regulation,
how big should our monthly sample be for a margin
of error of 0.04 with 95% confidence?^[We complete the same computations as before,
   except now we use $0.70$ instead of $0.5$
   for $p$:
   \begin{align*}
   1.96\times \sqrt{\frac{p(1-p)}{n}}
       \approx 1.96\times
           \sqrt{\frac{0.70(1-0.70)}
               {n}}
       &\leq 0.05
     \qquad\to\qquad
       n \geq 322.7
  \end{align*}
  A sample size of 323 or more would be reasonable.
  (Reminder: always round up for sample size calculations!)
  Given that we plan to track this poll over time,
  we also may want to periodically repeat these calculations
  to ensure that we're being thoughtful in our sample
size recommendations in case the baseline rate fluctuates.]
::: 
  
  
  \index{data!Payday regulation poll|)}
\index{margin of error|)}

{\input{ch_inference_for_props/TeX/inference_for_a_single_proportion.tex}}
-->
```
