library(tidyverse)


df <- data.frame(n = 1:10)

for (i in 1:10){
 df[paste("x",i,sep = "")]  = rnorm(n = 10)
}


df %>%
  select(starts_with("x")) %>%
  select(x1:x3) %>%
  select(ends_with(c('2','3')))


df %>%
  select(x1:x3) %>%
  mutate(across(x1:x2,~10^(.x)))
