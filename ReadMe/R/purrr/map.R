library(tidyverse)

fun1 = function(x){x+1}
x = c(1:10)
map_dbl(x,fun1)


fun2 = function(x,y){x+y}
x = c(1:3)
y = c(2:4)
map2_dbl(x,y,fun2)


formula <- ~.x + 1
map(x,formula)


mtcars %>%
  split(.$cyl) %>%
  map(~ lm(mpg ~ wt, data = .x)) 


df <- data.frame(x = c(1:3),
                 y = c(2:4))

mtcars %>% 
  filter(cyl == 4) %>%
  lm(mpg ~ wt, data = .) %>% 
  summary() %>%
  .$"r.squared"


mtcars %>%
  split(.$cyl) %>%
  map(~ lm(mpg ~ wt, data = .)) %>%
  map(summary) %>%
  map_dbl("r.squared")


a <- mtcars %>%
  lm(formula = mpg~cyl,data = .) %>%
  summary() 
