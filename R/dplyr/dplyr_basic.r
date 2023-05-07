library(tidyverse)
library(nycflights13)


# use filter function to filter
View(flights)
View(flights %>% filter(dep_time == 517))

# you can use multiple condition to filter
# default logic relation is AND &&
View(flights %>% filter(dep_time == 517, day == 1))


# other bool operation
View(flights %>% filter(dep_time == 517 | (day == 1 & dep_time == 533)))

# arrange function: to make things in order
## to make it run faster I remain the filter function
View(flights %>% filter(month == 1, day == 1) %>%
    arrange(dep_time))

## arrange in descending order
View(flights %>% filter(month == 1, day == 1) %>%
    arrange(desc(dep_time)))


# select function
## filter is the selection of observations
## select funtion is the selection of variables
## arrange in descending order
View(flights %>% filter(month == 1, day == 1) %>%
    select(month, day, dep_time))

## select the columns other than year to day
View(flights %>% filter(month == 1, day == 1) %>%
    select(-(year:day)))

## some helper function of select
View(flights %>% filter(month == 1, day == 1) %>%
    select(starts_with("dep")))

## starts_with()   ends_with()  contain()
## numrang('x',1:3)  matches x1 x2 x3

## if you want all the vars but with some vars at the front position
View(flights %>% filter(month == 1, day == 1) %>%
    select(arr_time, everything()))


######################################################################
########################### mutate ###################################
######################################################################

# mutate funtion is king of dplyr
View(flights %>% select(year:day, ends_with("delay")))
View(flights %>%
    select(year:day, ends_with("delay")) %>%
    mutate(gain = arr_delay - dep_delay))


######################################################################
########################### summarize#################################
######################################################################

## because data has NA so you should exclude them
flights %>% summarise(mean_delay = mean(dep_delay))
flights %>% summarise(mean_delay = mean(dep_delay, na.rm = TRUE))

## use summarize together with group_by
flights %>%
    group_by(dest) %>%
    summarise(
        count = n(),
        dist = mean(distance, na.rm = TRUE),
        delay = mean(arr_delay, na.rm = TRUE),
    )