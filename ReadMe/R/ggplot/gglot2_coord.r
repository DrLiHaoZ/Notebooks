library(tidyverse)

ggplot(data = mpg) +
    geom_boxplot(mapping = aes(x = class, y = hwy))

# this is the box plot,
# the problem arise when the label of x axis my be overlaped
# when it is too long

# we can flip the coodinate to solve the problem
ggplot(data = mpg) +
    geom_boxplot(mapping = aes(x = class, y = hwy)) +
    coord_flip()

