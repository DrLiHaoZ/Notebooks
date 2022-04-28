library(tidyverse)


df <- data.frame(x = 1:10,y = 2:11)

df %>%
  rowwise() %>%
  mutate(sum = sum(c(x,y)))


df %>%
  mutate(z = x + y)


df <- tibble(id = 1:4, w = runif(4), x = runif(4), y = runif(4), z = runif(4))
df %>%
  rowwise() %>%
  mutate(
    sum = sum(c_across(w:z)),
    sd = sd(c_across(w:z))
  )