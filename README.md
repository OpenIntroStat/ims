# Introduction to Statistics with Randomization and Simulation

**THIS IS A WORK IN PROGRESS!!!**

## Where did the 1st edition files go?

We're currently working on 2nd edition of OpenIntro - Introduction to Statistics with Randomization and Simulation. If you're looking for the source files for the 1st edition of the book, please download the zipped release [here](https://github.com/OpenIntroStat/randomization-and-simulation/releases).

## What's planned for the 2nd edition?

Some restructuring, some reordering, and some new content with better treatment of randomization and simulation throughout the book.

Tentative outline:

### Chp 1. Introduction to data

- Case Study (capable of extending to MLR or 2 by 2 table)
- Taxonomy of Data
- Overview of data collection principles
- Observational studies and sampling strategies
- Experimental design and causality
- Revisit case study with new terminology we learned

### Chp 2. Exploratory Data Analysis - Visual summaries and summary statistics

- Cat vs. cat - segmented plots / contingency tables
	- Conditional probability from contingency tables
	- Bayes Theorem (law of total probability?)
- Num vs. cat - side-by-side box plots / comparing distributions 
	- Mention univariate - center, skew, shape, spread
	- Mention conditional probabilities as well

### Chp 3. Correlation and Regression (descriptive)

- Visual summaries of data: scatterplot, side-by-side boxplots, histogram, density plot, box plot (lead out with multivariate, follow with univariate)
- Describing distributions: correlation, central tendency, variability, skew, modality
- Num vs. num - SLR
	- correlation
	- Line fitting, residuals, and correlation
	- Fitting a line by least squares regression
	- Types of outliers in linear regression

### Chp 4. Multiple Regression (descriptive)

- Num vs. whatever - MLR
	- Introduction to multiple regression
- Parallel slopes
- Hint at interaction, planes, and parallel planes but not quantify
	- Visualization of higher-dimensional models (rgl demo)
- Logistic regression
	- Binary vs. num/whatever
	- Three scales interpretation (e.g. probability, odds, log-odds)
	- “parallel” logistic curves? 

### Chp 5. Foundations of Inference

- Understanding inference through simulation
- Randomization case study: gender discrimination
- Randomization case study: opportunity cost
- Hypothesis testing
- Confidence intervals
- Simulation case studies

### Chp 6. Inference for categorical data

- Inference for a single proportion
	- Simulation
	- Exact (if we include course on probability)
	- CLT and Normal approximation
- Difference of two proportions
- Testing for goodness of fit using chi-square (special topic, include simulation version)
- Testing for independence in two-way tables (special topic)

### Chp 7. Inference for numerical data

- One-sample means
	- Bootstrap (for means, medians)
	- t-distribution
- Paired data
- Difference of two means
- Comparing many means with ANOVA (special topic, include simulation version)

### Chp 8. Inference for regression

- Inference for linear regression
	- Bootstrap for regression coefficients
	- t-distribution for regression coefficients
	- Model Comparison: Occam’s Razor and R^2 > R^2_adj
- Checking model assumptions using graphs
	- L-I-N-E
- Inference for multiple regression
	- residuals vs. fitted instead of residuals vs. x
- Inference for logistic regression

### Appendix: Probability

(Keep same content as before, minus the bit of probability that got moved to categorical EDA)
