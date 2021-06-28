# James MidTerm. Question 1.
library("ggplot2")
library("reshape2")
setwd("~/James/James-Math/flintprep/code/")

y <- function(x) -(45/1160)*x^2 + (63/29)*x + 4.5
x = seq(-4, 60, 1)
df = data.frame(x = x, y = y(x))
df = melt(df, id = "x")
ggplot(data = df, aes(x = x, y = value)) + 
    geom_point(size = 0.6, color = "blue") +
    scale_x_continuous(breaks = seq(0, 100, 10)) +
    scale_y_continuous(breaks = seq(0, 100, 10)) +
    labs(x = "x (distance from nozzle)", y = "y (height of water)") +
    theme_bw() + 
    theme(plot.margin=unit(c(1,1,1,1),"cm")) 
ggsave("flintprep-midterm-11.pdf")

y(28)
## 34.91379

y(48)
## 19.39655

