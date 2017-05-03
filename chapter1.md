---
title       : Testing objects
description : In order to contribute, create a new branch and submit a pull request.
attachments :
  slides_link : https://s3.amazonaws.com/assets.datacamp.com/course/teach/slides_example.pdf

--- type:NormalExercise xp:100 skills:1 key:5f200ffd43
## variable assignment 

A basic concept in (statistical) programming is called a **variable**. 

A variable allows you to store a value (e.g. 4) or an object (e.g. a function description) in R. You can then later use this variable's name to easily access the value or the object that is stored within this variable. 

You can assign a value 4 to a variable `my_var` with the command

```
my_var <- 4
```

*** =instructions
Over to you: complete the code in the editor such that it assigns the value 42 to the variable `x` in the editor. Click 'Submit Answer'. Notice that when you ask R to print `x`, the value 42 appears.

*** =hint
Look at how the value 4 was assigned to `my_variable` in the exercise's assignment. Do the exact same thing in the editor, but now assign 42 to the variable `x`.

*** =pre_exercise_code
```{r}
# no pec
```

*** =sample_code
```{r}
# Assign the value 42 to x
x <- 

# Print out the value of the variable x
x
```

*** =solution
```{r}
# Assign the value 42 to x
x <- 42

# Print out the value of the variable x
x
```

*** =sct
```{r}
test_object("x", undefined_msg = "Make sure to define a variable `x`.",
            incorrect_msg = "Make sure that you assign the correct value to `x`.") 
success_msg("Good job! Have you noticed that R does not print the value of a variable to the console when you did the assignment? `x <- 42` did not generate any output, because R assumes that you will be needing this variable in the future. Otherwise you wouldn't have stored the value in a variable in the first place, right? Proceed to the next exercise!")
```

--- type:NormalExercise xp:100 skills:1 key:c5944b90eb
## variable assignment and output

Suppose you have a fruit basket with five apples. As a data analyst in training, you want to store the number of apples in a variable with the name `my_apples`. 

*** =instructions
- Type the following code in the editor: `my_apples <- 5`. This will assign the value 5 to `my_apples`.
- Type: `my_apples` below the second comment. This will print out the value of `my_apples`.
- Click 'Submit Answer', and look at the console: you see that the number 5 is printed. So R now links the variable `my_apples` to the value 5.

*** =hint
Remember that if you want to assign a number or an object to a variable in R, you can make use of the assignment operator `<-`. Alternatively, you can use `=`, but `<-` is widely preferred in the R community.

*** =pre_exercise_code
```{r}
# no pec
```

*** =sample_code
```{r}
# Assign the value 5 to the variable my_apples


# Print out the value of the variable my_apples

```

*** =solution
```{r}
# Assign the value 5 to the variable my_apples
my_apples <- 5

# Print out the value of the variable my_apples
my_apples
```

*** =sct
```{r}
test_object("my_apples", 
            undefined_msg = "Please make sure to define a variable `my_apples`.",
            incorrect_msg = "Make sure that you assign the correct value to `my_apples`.")
test_output_contains("my_apples", incorrect_msg = "Have you explicitly told R to print out the `my_apples` variable to the console?")
success_msg("Great! Continue to the next exercise!")
```

--- type:NormalExercise lang:r xp:100 skills:1 key:a77e4223ea
## data.frame

*** =instructions

- Change Michael's location to be `'US'`.

*** =hint

*** =pre_exercise_code
```{r}

```

*** =sample_code
```{r}
dat <- data.frame(
    name = c('Michael', 'Herve', 'Ludo', 'Filip'),
    location = c('BE', 'BE', 'BE', 'BE')
)
```

*** =solution
```{r}
dat <- data.frame(
    name = c('Herve', 'Michael', 'Ludo', 'Filip'),
    location = c('BE', 'US', 'BE', 'BE')
)

```

*** =sct
```{r}
test_data_frame('dat')

# alternatively
ex() %>% 
    check_object('dat') %>% 
    {
        check_column('name') %>% check_equal()
        check_column('location') %>% check_equal()
    }
```

--- type:NormalExercise lang:r xp:100 skills:1 key:75682023ce
## list


*** =instructions

- change the "rocks" entry to `TRUE`.

*** =hint

*** =pre_exercise_code
```{r}

```

*** =sample_code
```{r}
person <- list(name = "Richie", rocks = 'maybe')
```

*** =solution
```{r}
person <- list(name = "Richie", rocks = TRUE)
```

*** =sct
```{r}
ex() %>% 
    check_object('person') %>% 
    check_element('rocks') %>% check_equal()
```
