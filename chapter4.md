---
title       : User defined functions
description : Insert the chapter description here
--- type:NormalExercise lang:r xp:100 skills:1 key:01de87a8ac
## simple function

**Example exercise below**

The function template is a useful way to start writing a function:

```
my_fun <- function(arg1, arg2) {
  # body
}
```

`my_fun` is the variable that you want to assign your function to, `arg1` and `arg2` are arguments to the function.  The template has two arguments, but you can specify any number of arguments, each separated by a comma.  You then replace `# body` with the R code that your function will execute, referring to the inputs by the argument names you specified.

Let's to get writing functions!


*** =instructions

- Using the function template, write a function `ratio()` that takes arguments `x` and `y` and returns their ratio, `x / y`.
- Check your function by calling it with the arguments 3 and 4.

*** =hint

*** =pre_exercise_code
```{r}

```

*** =sample_code
```{r}
# Define ratio() function
my_fun <- function(arg1, arg2) {
  # body
}

# Call ratio() with arguments 3 and 4

```

*** =solution
```{r}
# Define ratio() function
ratio <- function(x, y) {
  x / y
}

# Call ratio() with arguments 3 and 4
ratio(3, 4)
```

*** =sct
```{r}
msg = "Double check how you're defining the `ratio()` function. Does it divide the first argument by the second argument? In other words, `ratio(1, 4)` should return 0.25 not 4."
fun_def <- ex() %>% check_fun_def("ratio")
fun_def %>% check_arguments()
fun_def %>% check_call(3, 4) %>% check_result(msg)
fun_def %>% check_body() %>% check_operator('/')

# Note: index is 1 by default, but shown for illustration
#       if there were 2 calls to ratio, could get 2nd by using index = 2
ex() %>% check_function('ratio', index = 1) %>% {
    check_arg(., 'x') %>% check_equal()
    check_arg(., 'y') %>% check_equal()
}

test_error()
```
