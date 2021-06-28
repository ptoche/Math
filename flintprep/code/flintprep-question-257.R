# James homework. Question 260

#install.packages("ggplot2")
#install.packages("reshape2")
library("ggplot2")
library("reshape2")
setwd("~/James/James-Math/flintprep/code/")

y1 <- function(x) x^2 - x
y2 <- function(x) x^2 + 2 * x
y3 <- function(x) x^2 - 4 * x

x = seq(-5, 7, 0.01)
df = data.frame(x = x, y1 = y1(x), y2 = y2(x), y3 = y3(x))
library(reshape2)
df = melt(df, id = "x")
# View(df)

ggplot(data = df, aes(x = x, y = value, group = variable, color = variable)) + 
    geom_line() +
    theme_classic()
ggsave("james-flintprep-257.pdf")

plot(x, y1(x), type="l", col="blue")
par(new=TRUE)
plot(x, y2(x), type="l", col="red")
par(new=TRUE)
plot(x, y3(x), type="l", col="green")

