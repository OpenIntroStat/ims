## Data in `R`

`R` is a powerful and open source software tool for working with data. 
Throughout this text, we provide some guidance on how to use `R` within the
context of the statistical content that is being covered.  

As educators, we see the value of teaching with modern software to
empower students to take optimal advantage of the concepts they are learning.
However, we understand the limitations of some educational structures, and we
know that not every classroom will be able to implement `R` alongside the 
statistical concepts. Generally, we will present the `R` techniques at the end
of each chapter. There are times in the text when the concepts are not
distinguishable from the software, and in those cases, we have have provided the
`R` code within the main body of the chapter.

We start with an introduction to `R`, focused on how datasets are structured in
`R` and how the user can work with a data object in `R`.

### Dataframes in `R`

Throughout the text, we will work with many different datasets. Some datasets
are pre-loaded into `R`, some get loaded through `R` packages, and some datasets
will be created by the student. Datasets can be viewed through the RStudio
environment, but the data can also be investigated through the notebook features
of an RMarkdown file.

Consider the \data{email50} data that was described previously in this chapter.  
We can use the `glimpse()` function to see the variables included in the dataset
and their data type. Or, we could use the `head()` function to see the first
few rows of the dataset.

```{r echo=TRUE}
data(email50)
glimpse(email50)
```

```{r echo = TRUE}
head(email50) 
```

Sometimes it is necessary to extract a column or a row from a data set. 
In `R`, the `$` operator can be used to extract a column from a dataset. 
For example, `data$variable` would extract the `variable` column from the `data` dataframe.
When extracted, these columns can be thought of as vectors. With these vectors, if you desired to pull off a specific entry, you could use square brackets (`[ ]`), with the index (number) of the entry you wish to extract in the brackets. 
For example, `data$variable[2]` would extract the second entry (row) of the `variable` column. 

Because a dataframe can be (roughly) thought of as a set of many different vectors, you can extract rows and columns from a dataframe using familiar matrix notation (e.g., `[row, column]`. 
For example `data[i,j]` will extract the $(i,j)^{th}$ entry of data, `data[i, ]` will extract the $i^{th}$ row, and `data[ , j]` will extract the $j^{th}$ column. Notice, when extracting an  entire row (or column), you do not need to specify the columns (or rows) you would like, which is why the second entry does not contain a number. 

```{r echo=TRUE}
email50$num_char
email50[47,3]
```

```{r echo = FALSE, ca}
email[47,] %>% 
  kable(caption = "Data from the 47th row of the email dataset.")
```

### Tidy Structure of Data {#datastruc}

For plotting, analyses, model building, etc., the data should be structured according to certain principles.   
Hadley Wickham provides a thorough discussion and advice for cleaning up the data in @Wickham2014.

* *Tidy Data*: rows (cases/observational units) and columns (variables).  
The key is that *every* row is a case and *every* column is a variable.  
No exceptions.
* Creating tidy data is often not trivial.


Within `R` (really within any type of computing language, Python, SQL, Java, etc.), it is important to understand how to build data using the patterns of the language.  
Some things to consider:

* `object_name <- anything` is a way of assigning `anything` to the new `object_name`.
* `object_name <- function_name(data_table, arguments)` is a way of using a function to create a new object.
* `object_name <- data_table %>% function_name(arguments)` uses chaining syntax as an extension of the ideas of functions.  
In chaining, the value on the left side of `%>%` becomes the *first argument* to the function on the right side.

``` 
object_name <- data_table %>%
                    function_name(arguments) %>% 
                    another_function_name(other_arguments)
```

is extended chaining.  `%>%` is never at the front of the line, it is always connecting one idea with the continuation of that idea on the next line.
* In `R`, all functions take arguments in round parentheses (as opposed to subsetting observations or variables from data objects which happen with square parentheses).  Additionally, the spot to the left of `%>%` is always a data table.
* The pipe syntax should be read as *then*, `%>%`.

### Using the pipe to chain

The pipe syntax (`%>%`) takes a data frame (or data table) and sends it to the argument of a function.  The mapping goes to the first available argument in the function.  
For example:

`x %>% f(y)` is the same as `f(x, y)`

` y %>% f(x, ., z)` is the same as `f(x,y,z)`

Pipes are used commonly with functions in the `dplyr` package (see `R` examples in Chapter \@ref(eda)) and they allow us to sequentially build data wrangling operations. 
We’ll start with short pipes and throughout the course build up to longer pipes that perform multiple operations.

Consider the \data{hsb2} data, High School and Beyond survey.  
Two hundred observations were randomly sampled from the High School and Beyond survey, a survey conducted on high school seniors by the National Center of Education Statistics.
Of interest is the proportion of students at each of the two types of school, `public` and `privaate`.

We use the `table` command to tabulate how many of each type of school are in the dataset.  Notice that the same result is produced by the `$` command with `table` and the chaining syntax done with `%>%`.

<div style="float: left; width: 49.5%;">
```{r echo=TRUE}
data(hsb2)
table(hsb2$schtyp)  
```
</div>

<div style="float: left; width: 49.5%;">
```{r echo=TRUE}
hsb2 %>% 
  select(schtyp) %>%
  table()
```
</div>


What if we are interested only in `public` schools?  
First, we should take note of another piece of `R` syntax: the double equal sign. 
This is the logical test for “is equal to”. 
In other words, we first determine if school type is equal to public for each of the observations in the dataset and filter for those where this is true.

```{r echo=TRUE}
# Filter for public schools
hsb2_public <- hsb2 %>%
  filter(schtyp == "public")
```
  
We can read this as: “take the `hsb2` data frame and `pipe` it into the `filter` function. Filter the data for `cases where school type is equal to public`. Then, `assign` the resulting data frame to a new object called `hsb2 underscore public`.”  
  
Suppose we are not interested in the actual reading score of students, but instead whether their reading score is below average or at or above average. 
First, we need to calculate the average reading score with the mean function. 
This will give us the mean value, 52.23. 
However, in order to be able to refer back to this value later on, we might want to store it as an object that we can refer to by name.

```{r echo=TRUE}
# Calculate average reading score and show the value
mean(hsb2$read)
```

So instead of just printing the result, let’s save it as a new object called `avg_read`.

```{r echo=TRUE}
# Calculate average reading score and store as avg_read
avg_read <- mean(hsb2$read)
```

Before we more on, a quick tip: most often you’ll want to do both; see the value and also store it for later use. The approach we used here, running the mean function twice, is redundant.

Instead, you can simply wrap your assignment code in parentheses so that `R` will not only assign the average value of reading test scores to avg read, but it will also print out its value.

```{r echo=TRUE}
# Do both
(avg_read <- mean(hsb2$read))
```

Next we need to determine whether each student is below or at or above average. For example, a reading score of 57 is above average, so is 68, but 44 is below. 
Obviously, going through each record like this would be tedious and error prone.

Instead we can create this new variable with the mutate function from the `dplyr` package.

We start with the data frame, `hsb2`, and pipe it into `mutate`, to create a new variable called `read_cat` (`cat` for `cat`egorical). 
Note that we are using a new variable name here in order to not overwrite the existing reading score variable.
The new variable `read_cat` will be a column in the existing data frame `hsb2`.
To indicate that the `mutate` function came from the `dplyr` package, we use the `pacakge::function` syntax.
It is not usually necessary to provide the package name (unless there is ambiguity about where the function came from).


```{r echo=TRUE}
hsb2 <- hsb2 %>% dplyr::mutate(read_cat = ifelse(read < avg_read, 
                                                 "below average", "at or above average"))
```

The decision criteria for this new variable is based on a TRUE/FALSE question: if the reading score of the student is below the average reading score, label “below average”, otherwise, label “at or above average”.

This can be accomplished using the `ifelse` function in `R`.

The first argument of the function is the logical test.

The second argument is what to do if the result of the logical test is TRUE, in other words, if the student’s score is below the average score, and the last argument is what to do if the result is FALSE.

The `ifelse` function can be used for more complicated discretization rules as well, by nesting many `ifelse` statements within each other. 
This is not necessary for this example, but it will come up later in the course.

<!--
# droplevels()  #???

# SRS using sample_n
# stratified sampling using group_by then sample_n
# R code for blocking???

# add case_when?
-->