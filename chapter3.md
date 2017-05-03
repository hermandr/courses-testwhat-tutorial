---
title       : Control flow
description : Insert the chapter description here

--- type:NormalExercise lang:r xp:100 skills:1 key:744128343a
## for loop [TODO]


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



--- type:NormalExercise lang:r xp:100 skills:1 key:3d6180e2bc
## while loop [TODO]


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
--- type:NormalExercise lang:r xp:100 skills:1 key:923940980c
## if statement within for loop


*** =instructions

* Write an if condition is true when `ii` is greater than 2.
* When that condition is true, print the value of `ii`

*** =hint

*** =pre_exercise_code
```{r}

```

*** =sample_code
```{r}
for (ii in 1:10) {
    if ___ ___
}
```

*** =solution
```{r}
for (ii in 1:10) {
    if (ii > 2) print(ii)
}

```

*** =sct
```{r}
for_loop <- ex() %>% check_for(missing_msg = "Don't remove the for loop!")

if_else <- for_loop %>% check_body() %>% check_if_else()

if_else %>% 
    check_cond() %>%
    check_code("ii > 2", fixed=TRUE)
    
if_else %>%
    check_body() %>%
    check_function('print')

# Could check an else block using... 
# if_else %>% check_else("did you include an else?")
```

