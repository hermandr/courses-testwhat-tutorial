---
title       : Testing functions and packages
description : Insert the chapter description here


--- type:NormalExercise lang:r xp:100 skills:1 key:7e7c3382b0
## function call [TODO]


*** =instructions

*** =hint

*** =pre_exercise_code
```{r}

```

*** =sample_code
```{r}
f <- function(a, b, c=1) sum(a + b, c)
```

*** =solution
```{r}
f <- function(a, b, c=1) sum(a + b, c)
```

*** =sct
```{r}
f <- ex() %>% check_fun_def('f')

f %>% check_arguments()   # e.g. will report "missing third arg"

body <- f %>% check_body() %>% {
        check_function(., 'sum', index = 1, "no sum call")
        check_operator(., '+', index = 1, "no + operator")
    }

f %>% check_call(1, 2, 3)

# NOTE: almost everyone ran into a puzzling issue w/test_function_definition not running body_test
#       apparently test_function_definition only runs body_test IF function_test fails
#       see https://github.com/datacamp/testwhat/wiki/test_function_definition


```

--- type:NormalExercise lang:r xp:100 skills:1 key:da6627a0ea
## function call result [TODO]


*** =instructions

*** =hint

*** =pre_exercise_code
```{r}

```

*** =sample_code
```{r}

```

*** =solution
```{r}

```

*** =sct
```{r}

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
## linear model w/ formula, or x and y [TODO]

#### pass 1 

```
lm(d$x ~ d$y)
```

#### pass 2

```
with(d, lm(x ~ y))
```

*** =pre_exercise_code
```{r}
d <- data.frame(x = 1:10, y = 11:20)
```

*** =sample_code
```{r}
lm(x ~ y, data=d)
```

*** =solution
```{r}
lm(x ~ y, data=d)
```

*** =sct
```{r}
func_test <- . %>% check_function('lm') %>% check_arg('formula') %>% check_equal()

test_or(
    ex() %>% func_test(),
    ex() %>% override_solution("lm(d$x ~ d$y)") %>% func_test(),
    ex() %>% override_solution("with(d, lm(x ~ y)") %>% func_test() 
    )
    
# MC-NOTE: another clever solution someone submitted!
test_or(
  test_output_contains("lm(x ~ y, data = d)"),
  test_output_contains("lm(d$x ~ d$y)"),
  test_output_contains("with(d, lm(x ~ y))")
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
