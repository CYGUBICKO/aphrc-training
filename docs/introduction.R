#### ---- Topic: Introduction ----
#### ---- Date: 2021 Nov 04 (Thur) ----

#### ---- Commenting ----

# Any line or character starting with # is a comment
1+3 # This is a comment

# This is also a comment

######################################################################
## R Basics
######################################################################

#### ---- Getting started with help ----

## Check the current working directory (folder)

getwd()

## You can also change working directory to another one
## using setwd()

# setwd("~/Desktop") # Changes directory to Desktop

## Get help

# ?mean

# help.start("mean")

# help.search("mean")

## Check function inputs

# args(mean)

## Get examples

# example("mean")


#### ---- Printing on the screen ----

x <- "This prints on the screen!"
print(x)

y <- "This prints on the \nnext line\n" # cat + \n
cat(y)

m <- 7
s <- 8
z <- c("The mean is ", m, " and sd ", s, "\n")
cat(z)


#### ---- Setting variables ----

x1 <- 1:10
x2 <- c(1, 2, 3, 4, 5, 6)
x1 <- 5

y1 = 1:10
y2 = c(1, 2, 3, 4, 5, 6)
y2 = 5

5 -> z2

x1 == y2
x1 == z2


#### ---- Listing variables ----

## List variables in the memory

ls()

#get(ls(pattern="y"))

## Include types and other details

ls.str()

#### ---- Creating vectors ----

## Create a vector of 3,6,7

v1 <- c(3,6,7)
v2 <- c("This ", "is ", "also ", "a vector ", "and a ", 2)
v2


#### ---- Creating sequences ----

## Create evenly spaced sequences

### n:m
n <- 3
m <- 10
x <- n:m
x

height <- c(2.6, 1.7, 0.5)
gender <- c("Female", "Female", "Male")
mean(height)
table(gender)

### seq
# ?seq

y <- seq(n, m)
x==y
all.equal(x, y)

## Set the spacing
y2 <- seq(1, 10, by=2)

## Set sequence length
y3 <- seq(0, 1, length.out=10)

## Repeat sequences

x1 <- rep(c("A", "B", "C"), 3)
x1
y1 <- rep(gender, 10)
x2 <- rep(c("A", "B", "C"), each=3)
x2
y2 <- rep(gender, each=3)
y2

#### ---- Basic statistics ----

age <- seq(20, 80, length.out=100)

mean(age)

sd(age)

var(age)

income <- seq(100, 1000, length.out=100)

cor(age, income)

cov(age, income)

table(x2)


#### ---- Comparing vectors ----

4 == 5
4 != 5
4 >= 5


#### ---- Selecting elements ----

## people older than 20
age_cut <- 20
age[age>age_cut]

## people older than 20 and above
age[age>=age_cut]

## people with ages between 30 and 50
age[age>30 & age<50]

## ? those earning more than 500 and are aged below 40
index <- income>100 & age < 40
table(index)

gender <- c("Male", "Male", "Female", NA, "Male", "Male")

## How many males are there?

## ? Exclude NA


#### ---- Vector arithmetic ----

## implement
### mean
### var
### sd

#### ---- Running an R script ----

# source("run_me.R")

#### ---- Packages and Package installation ----
