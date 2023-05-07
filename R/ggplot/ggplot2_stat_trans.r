library(tidyverse)
View(diamonds)

ggplot(data = diamonds) +
    geom_bar(mapping = aes(x = cut))

# the default y is count if you want the proportion

ggplot(data = diamonds) +
    geom_bar(mapping = aes(x = cut, y = -..prop.., group = 1))

# you can use diff color to stroke or fill
## stroke
ggplot(data = diamonds) +
    geom_bar(mapping = aes(x = cut, color = cut))

## fill
ggplot(data = diamonds) +
    geom_bar(mapping = aes(x = cut, fill = cut))

# you can also use fill for other var
ggplot(data = diamonds) +
    geom_bar(
        mapping = aes(x = cut, fill = clarity),
        alpha = 0.7
    )

# position parameter
ggplot(data = diamonds) +
    geom_bar(
        mapping = aes(x = cut, fill = clarity),
        position = "fill"
    )

## this version dodge is by far the most satisfying
ggplot(data = diamonds) +
    geom_bar(
        mapping = aes(x = cut, fill = clarity),
        position = "dodge"
    )
