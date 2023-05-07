library(tidyverse)
library(readxl)

df <- read_excel("Desktop/Epi.xlsx", sheet = "r")
df$ID <- as.character(df$ID)

df$result <- NA


#Q3所有问题都是2
all_q3 <- (df$Q3a == 2) & (df$Q3b1 == 2) & (df$Q3b2 == 2) &
          (df$Q3b3 == 2) & (df$Q3b4 == 2) & (df$Q3b5 == 2) &
          (df$Q3b6 == 2) & (df$Q3b7 == 2) 

#Q4所有问题都是2
all_q4 <- (df$Q42 == 2) & (df$Q4b1 == 2) & (df$Q4b2 == 2) &
          (df$Q4b3 == 2) & (df$Q4b4 == 2) & (df$Q4b5 == 2) &
          (df$Q4b7 == 2) & (df$Q4b6 == 2) 

# Result = 0
df$result[all_q3 & (df$Q1 == 2)]  <- 0


# Result = 1
df$result[(df$Q1 == 1) & (df$Q2 == 1) & (!all_q4)] <- 1
df$result[(df$Q1 == 2) & (!all_q3) & (df$Q2 == 1) & (!all_q4) ] <- 1


# Result = 2
df$result[(df$Q1 == 1) & (df$Q2 == 1) & all_q4] <- 2
df$result[(df$Q1 == 2) & (!all_q3) & (df$Q2 == 1) & (all_q4) ] <- 2

# Result = 3
df$result[(df$Q1 == 1) & (df$Q2 == 2) & (!all_q4)] <- 3
df$result[(df$Q1 == 2) & (!all_q3) & (df$Q2 == 2) & (!all_q4) ] <- 3


# Result = 4
df$result[(df$Q1 == 1) & (df$Q2 == 2) & (all_q4)] <- 4
df$result[(df$Q1 == 2) & (!all_q3) & (df$Q2 == 2) & (all_q4) ] <- 4


df %>%
  group_by(result) %>%
  summarise(n = n())



df %>%
  filter(Q1 == 1) %>%
  summarise(n = n())