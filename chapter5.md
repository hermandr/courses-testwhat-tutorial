---
title       : Advanced topics
description : Insert the chapter description here
--- type:NormalExercise lang:r xp:100 skills:1 key:7bc2fc1cef
## testing and randomness

Currently, `testwhat` has the limitation that when you use the following SCTs

* `check_expr` followed by or `check_result() %>% check_equal()`
* `test_expression_output` (deprecated)
* `test_expression_result` (deprecated)

the random generator in the solution environment can get thrown out of sync with the
student environment. In order to overcome this, you can set the random seed before running `check_expr`.

This is illustrated in the exercise below.

*** =instructions

*** =hint

*** =pre_exercise_code
```{r}

```

*** =sample_code
```{r}
# sample and solution code are identical
x <- rnorm(100)
```

*** =solution
```{r}
# sample and solution code are identical
x <- rnorm(100)
```

*** =sct
```{r}
# Note remove set.seed(42) and submit to see issue--it will fail :(.
ex() %>% check_expr('set.seed(42); rnorm(100)') %>% check_result() %>% check_equal()

# Similarly with test_expression_result
# test_expression_result('set.seed(42); rnorm(100)')

```

--- type:NormalExercise lang:r xp:100 skills:1 key:252e145096
## test piece of code flexibly

When code is not stored as a variable, `testwhat` is limited in how it can evaluate that code.
For example if we have `a <- 1:10` it can be flexibly tested using `check_expr`. In this case,
if we want the max of a to be `10`, then we can use `check_expr("max(a) == 10")`.

Notice that using `check_expr` involved referring to `a`. How could we perform a similar test
if we only had `1:10`? In general, we can't. When creating an exercise sometimes it is useful
to assign something that you want to grade flexibly to a variable.

When assigning it to a variable absolutely will not work, but you still want very flexible testing,
you may be able to use `check_code` with complex regular expressions.

*** =instructions

- the sample_code shows a difficult to test exercise, where the argument `ylim` has a number
  of solutions.
- the solution code shows that by having them create an intermediate variable `y_lim`, we can
  use `check_expr` to perform a flexible test.

*** =hint

*** =pre_exercise_code
```{r}

```

*** =sample_code
```{r}
# Example of difficult to test exercise
y <- rnorm(100)
# the ylim arg below is hard to test, if you
# just want it to be anything of magnitude greater
# than 3 on either side
plot(y, ylim = c(-3, 3))
```

*** =solution
```{r}
# Example of of workaround
y <- rnorm(100)
# Have students define intermediate variable 
y_lim <- c(-3, 3)
# Pass that variable to plot
plot(y, ylim = y_lim)
```

*** =sct
```{r}
# make sure they defined y_lim
ex() %>% check_object('y_lim')

# make sure y_lim matches instructions
ex() %>% check_expr('all(abs(y_lim) >= 3)')

# make sure they specified a ylim argument
ex() %>% check_function('plot') %>% check_arg('ylim')

```
