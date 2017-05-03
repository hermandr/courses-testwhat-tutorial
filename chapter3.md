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


--- type:NormalExercise lang:r xp:100 skills:1 key:425bbab21d
## if else if statement

In R, an `if` statement may use `else if`, in the place of `else`.
For example,

```
if (TRUE) {
    print('yay')
} else if (FALSE) {
    print('boo')
}
```

in this case there are actually 2 if statements. The second, which print 'boo'
is in the else block of the first.

*** =instructions

* Move the second `if` statement, so that it is an `else if` statement off of the first.

*** =hint

*** =pre_exercise_code
```{r}

```

*** =sample_code
```{r}
# Variables related to your last day of recordings
medium <- "LinkedIn"

# Control structure for medium
if (medium == "LinkedIn") {
  print("Showing LinkedIn information")
}

if (medium == "Facebook") {
  # Add code to print correct string when condition is TRUE

} else {
  print("Unknown medium")
}
```

*** =solution
```{r}
# Variables related to your last day of recordings
medium <- "LinkedIn"

# Control structure for medium
if (medium == "LinkedIn") {
  print("Showing LinkedIn information")
} else if (medium == "Facebook") {
  # Add code to print correct string when condition is TRUE
  print("Showing Facebook information")
} else {
  print("Unknown medium")
}
```

*** =sct
```{r}
msg = "Note that `else if` needs to be on the same line as the closing bracket, `}`, of the `if`"
#ex() %>% check_error(msg)

if_else1 <- ex() %>% check_if_else()

if_else2 <- if_else1 %>%
    check_else("Did you change the second if statement to follow `else`?") %>%
    check_if_else("Did you include the second if statement?")
```
