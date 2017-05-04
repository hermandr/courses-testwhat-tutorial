---
title       : Testing functions and packages
description : Insert the chapter description here


--- type:NormalExercise lang:r xp:100 skills:1 key:7e7c3382b0
## function call


*** =instructions

*** =hint

*** =pre_exercise_code
```{r}

```

*** =sample_code
```{r}
# include Michael's location as 'US' in the data.frame
data.frame(
    name = c('Herve', 'Michael', 'Ludo', 'Filip'), 
    location = c('BE', 'BE', 'BE')
    )
```

*** =solution
```{r}
# include Michael's location as 'US' in the data.frame
data.frame(
    name = c('Herve', 'Michael', 'Ludo', 'Filip'), 
    location = c('BE', 'US', 'BE', 'BE')
    )
```

*** =sct
```{r}
ex() %>% 
    check_function('data.frame') %>%
    check_arg('location') %>%
    check_equal()
```

--- type:NormalExercise lang:r xp:100 skills:1 key:da6627a0ea
## function call result


*** =instructions

*** =hint

*** =pre_exercise_code
```{r}

```

*** =sample_code
```{r}
# use the sum function to add the numbers 1, 2, 3

```

*** =solution
```{r}
# use the sum function to add the numbers 1, 2, 3
sum(1:3)
```

*** =sct
```{r}
# test the result of calling sum
# note that this will accept a range of answers, such as
#   * sum(1:3)
#   * sum(1,2,3)
#   * a <- 1:3; sum(a)
ex() %>% check_function('sum') %>% check_result()
```

--- type:NormalExercise lang:r xp:100 skills:1 key:1e5ff3a55d
## import library


*** =instructions

*** =hint

*** =pre_exercise_code
```{r}

```

*** =sample_code
```{r}
# load the dplyr library

```

*** =solution
```{r}
# load the dplyr library
library(dplyr)
```

*** =sct
```{r}
# This SCT has good default messages, but we customize them below
# as an example.
test_library_function('dplyr',
    not_called_msg = "Try using the `library` function",
    incorrect_msg  = "Did you use `library` with `'dplyr'`")
```




--- type:NormalExercise lang:r xp:100 skills:1 key:d866e9b1cd
## linear model w/ formula, or x and y

Some functions provide many different ways of doing the same thing.
For example, the `lm` function--which fits a linear model--allows many
different ways of specifying the model. For example, using some data.frame
named `d` with columns `x` and `y`...

* a formula: `lm(d$y ~ d$x)`
* a formula and data arg: `lm(y ~ x, data = d)`
* the with function: `with(d, lm(y ~ x))`

If all these commands produced the same output, then we use `check_result()`.
However, because the specific command used is printed in the output, the three
ways of specifying `lm` output different results to the console.

Similarly, if the exercise had students assigned the result of `lm` to a variable,
such as `fit`, then we could use something like `check_expr("coef(fit)")`.

The exercise below shows how to accept all of these variants, use `override_solution`.

*** =pre_exercise_code
```{r}
d <- data.frame(x = 1:10, y = 11:20)
```

*** =sample_code
```{r}
lm(y ~ x, data=d)
```

*** =solution
```{r}
lm(y ~ x, data=d)
```

*** =sct
```{r}
func_test <- . %>% check_function('lm') %>% check_arg('formula') %>% check_equal()

test_or(
    ex() %>% func_test(),
    ex() %>% override_solution("lm(d$y ~ d$x)") %>% func_test(),
    ex() %>% override_solution("with(d, lm(y ~ x)") %>% func_test() 
    )
    
# NOTE: another clever solution someone submitted!
test_or(
  ex() %>% check_output_expr("lm(y ~ x, data = d)"),
  ex() %>% check_output_expr("lm(d$y ~ d$x)"),
  ex() %>% check_output_expr("with(d, lm(y ~ x))")
)
```

--- type:NormalExercise lang:r xp:100 skills:1 key:ebdcbcbcf5
## function pipe


*** =instructions

*** =hint

*** =pre_exercise_code
```{r}
library(gapminder)
library(ggplot2)
library(dplyr)
gap2007 <- filter(gapminder, year == 2007)
```

*** =sample_code
```{r}
# Compute groupwise measures of spread
gap2007 %>%
  group_by(___) %>%
  summarize(___,
            ___,
            ___)

# Generate overlaid density plots
gap2007 %>%
  ggplot(aes(x = ___, fill = ___)) +
  geom_density(alpha = 0.3)
```

*** =solution
```{r}
# Compute groupwise measures of spread
gap2007 %>%
  group_by(continent) %>%
  summarize(sd(lifeExp),
            IQR(lifeExp),
            n())

# Generate overlaid density plots
gap2007 %>%
  ggplot(aes(x = lifeExp, fill = continent)) +
  geom_density(alpha = 0.3)
```

*** =sct
```{r}

ex() %>% check_function('group_by') %>% check_arg('.data') %>% check_equal()
ex() %>% check_function('summarize') %>% {
    # Note checking the .data arg for calls later down a pipe can get complex
    # and counter-intuitive...
    # check_arg(., '.data') %>% check_equal()
    
    # Checking that certain function calls were used in summarize works, though.
    # can't call check_equal() here either, because internally dplyr runs 
    # sd(lifeExpr) within the group2007 data.frame. e.g. with(group2007, sd(lifeExpr))
    check_function(., 'sd')
    # However, we can check that the student passed only lifeExp, using
    # `check_code('^lifeExpr$')`. The ^ means the start of a line of code, and
    # $ means the end of a line (so tests that lifeExp is the only code entered)
    check_function(., 'IQR') %>% check_code('^lifeExp$')
    
    check_function(., 'n')
    }

test_error()

# NOTE: Could also wrap in a test_correct. For example...

#output_code = "gap2007 %>% group_by(continent) %>% summarize(sd(lifeExp), IQR(lifeExp), n())"
#test_correct(ex() %>% check_output_expr(output_code), {
#    ex() %>% check_function('group_by') %>% check_arg('.data') %>% check_equal()
#    ex() %>% check_function('summarize')
#    #etc...
#    })

```

--- type:NormalExercise lang:r xp:100 skills:1 key:41ab735489
## plotting w/ ggplot


*** =instructions

*** =hint

*** =pre_exercise_code
```{r}
library(ggplot2)

```

*** =sample_code
```{r}
# Scatterplot with regression line
ggplot(data = ___, aes(x = ___, y = ___)) + 
  ___ + 
  ___(method = ___, se = FALSE)
```

*** =solution
```{r}
# Scatterplot with regression line
ggplot(data = mtcars, aes(x = wt, y = mpg)) + 
  geom_point() + 
  geom_smooth(method = "lm", se = FALSE)
```

*** =sct
```{r}
msg_missing <- "Did you add the `+` operator after your `ggplot()` and `geom_point()` calls?"
ex() %>% check_code("+", times = 2, fixed = TRUE, missing_msg = msg_missing)

# Note: test_ggplot is a giant SCT, designed to run a set of all-encompassing checks.
#       However, there is not a way to break it up into smaller tests, using simpler
#       check_* functions.
test_ggplot(1)

test_error()

```
