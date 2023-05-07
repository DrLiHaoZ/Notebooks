library(tidyverse)
library(nycflights13)

# nycflights13 has 3 database

# airlines
# airport
# planes
# weather
View(airlines)
View(weather)
View(planes)
View(flights)

# 判断是否主键
planes %>%
    count(tailnum) %>%
    filter(n > 1)

# 显然，飞机的制造商不会是planes数据表中观测值的主键
planes %>%
    group_by(manufacturer) %>%
    count() %>%
    arrange(desc(n))

# 同时 主键可能不是一个变量，而是多个变量的组合
weather %>%
    count(year, month, day, hour, origin) %>%
    count()

# left-join
flights %>%
    left_join(airlines, by = "carrier")