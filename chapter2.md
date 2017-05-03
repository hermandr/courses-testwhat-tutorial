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
# MC-NOTE: almost everyone ran into a puzzling issue w/test_function_definition not running body_test
#          apparently test_function_definition only runs body_test IF function_test fails
#          see https://github.com/datacamp/testwhat/wiki/test_function_definition

f <- ex() %>% check_fun_def('f')

f %>% check_arguments()   # "missing third arg"

body <- f %>% check_body() %>% {
        check_function(., 'sum', index = 1, "no sum call")
        check_operator(., '+', index = 1, "no + operator")
    }

f %>% check_call(1, 2, 3)
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
## import library [TODO]


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
## function pipe [TODO]


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

--- type:NormalExercise lang:r xp:100 skills:1 key:41ab735489
## plotting w/ ggplot [TODO]


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
