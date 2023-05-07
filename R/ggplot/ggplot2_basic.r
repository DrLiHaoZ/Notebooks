library(tidyverse)

# build in data : mpg

# you can view the data through View functiom
# View(mpg)

ggplot(data = mpg) +
    geom_point(mapping = aes(x = displ, y = hwy))

ggplot(data = mpg) +
    geom_point(mapping = aes(x = displ, y = hwy, color = class))

ggplot(data = mpg) +
    geom_point(mapping = aes(x = displ, y = hwy, alpha = class))

ggplot(data = mpg) +
    geom_point(mapping = aes(x = displ, y = hwy, shape = class, color = class))


# facet
## facet_wrap function use one variable to gen the imgage
ggplot(data = mpg) +
    geom_point(mapping = aes(x = displ, y = hwy, color = class)) +
    facet_wrap(~class, nrow = 2)

## facet_grid
## this function use 2 variable to gen the subgraph
ggplot(data = mpg) +
    geom_point(mapping = aes(x = displ, y = hwy, color = class)) +
    facet_grid(drv ~ class)

# geom_smooth()  the gen the regression-like line with confidence interval
ggplot(data = mpg) +
    geom_smooth(mapping = aes(x = displ, y = hwy))

## when you you use this function you can use parameter linetype to show diff var
ggplot(data = mpg) +
    geom_smooth(mapping = aes(x = displ, y = hwy, linetype = drv))

## also you can combine the point and smooth fcuntion
ggplot(data = mpg) +
    geom_smooth(mapping = aes(x = displ, y = hwy)) +
    geom_point(mapping = aes(x = displ, y = hwy, color = class))

##  you can use diff data in diff layer
ggplot(data = mpg) +
    geom_point(mapping = aes(x = displ, y = hwy, color = class)) +
    geom_smooth(
        data = filter(mpg, class == "suv"),
        se = FALSE,
        mapping = aes(x = displ, y = hwy)
    ) +
    geom_smooth(
        data = filter(mpg, class == "compact"),
        se = FALSE,
        mapping = aes(x = displ, y = hwy)
    )