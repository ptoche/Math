# James homework. Question 293.
library("ggplot2")
library("reshape2")
setwd("~/James/James-Math/flintprep/code/")

y <- function(x) (120-2*x)*(40+x)
x = seq(0, 60, 1)
df = data.frame(x = x, y = y(x))
df = melt(df, id = "x")
ggplot(data = df, aes(x = x, y = value)) + 
    geom_point(size = 0.2, color = "blue") +
    labs(x = "x (new registrants)", y = "y (total revenue)") +
    scale_x_continuous(breaks = seq(0, 100, 20)) +
    scale_y_continuous(breaks = seq(0, 4800, 800)) +
    theme_classic() + 
    theme(plot.margin=unit(c(1,1,1,1),"cm")) +
    coord_cartesian(expand = FALSE) # origin at (0,0)
ggsave("flintprep-293.pdf")

y(5)  # check given value
## 4950
y(0:59)
[1] 4800 4838 4872 4902 4928 4950 4968 4982 4992 4998 5000 4998 4992 4982 4968
[16] 4950 4928 4902 4872 4838 4800 4758 4712 4662 4608 4550 4488 4422 4352 4278
[31] 4200 4118 4032 3942 3848 3750 3648 3542 3432 3318 3200 3078 2952 2822 2688
[46] 2550 2408 2262 2112 1958 1800 1638 1472 1302 1128  950  768  582  392  198

# roots of (120-2*x)*(40+x) = -2*x^2 + 40*x + 4800
sol = Re(polyroot(c(4800, 40, -2)))
##  60 -40

# Now re-center the function with n = 40+x => x = n-40
y <- function(n) (200-2*n)*n
x = seq(0, 100, 1)
df = data.frame(x = x, y = y(x))
df = melt(df, id = "x")
ggplot(data = df, aes(x = x, y = value)) + 
    geom_point(size = 0.2, color = "blue") +
    geom_vline(xintercept = 40, color = "gray") +
    labs(x = "x (total number of registrants)", y = "y (total revenue)") +
    scale_x_continuous(breaks = seq(0, 200, 20)) +
    scale_y_continuous(breaks = seq(0, 4800, 800)) +
    theme_classic() + 
    theme(plot.margin=unit(c(1,1,1,1),"cm")) +
    coord_cartesian(expand = FALSE) # origin at (0,0)
ggsave("flintprep-293-total.pdf")

y(45)  # check given value
## 4950
y(0:100)
[1]    0  198  392  582  768  950 1128 1302 1472 1638 1800 1958 2112 2262 2408
[16] 2550 2688 2822 2952 3078 3200 3318 3432 3542 3648 3750 3848 3942 4032 4118
[31] 4200 4278 4352 4422 4488 4550 4608 4662 4712 4758 4800 4838 4872 4902 4928
[46] 4950 4968 4982 4992 4998 5000 4998 4992 4982 4968 4950 4928 4902 4872 4838
[61] 4800 4758 4712 4662 4608 4550 4488 4422 4352 4278 4200 4118 4032 3942 3848
[76] 3750 3648 3542 3432 3318 3200 3078 2952 2822 2688 2550 2408 2262 2112 1958
[91] 1800 1638 1472 1302 1128  950  768  582  392  198    0


# VARIANT 1: ONLY THE NEW ENTRANTS RECEIVE THE DISCOUNT
y <- function(x) 4800+(120-2*x)*x
x = seq(0, 60, 1)
df = data.frame(x = x, y = y(x))
df = melt(df, id = "x")
ggplot(data = df, aes(x = x, y = value)) + 
    geom_point(size = 0.2, color = "blue") +
    geom_vline(xintercept = 0, color = "gray") +
    labs(x = "x (new registrants)", y = "y (total revenue)") +
    scale_x_continuous(breaks = seq(0, 100, 20)) +
    scale_y_continuous(breaks = seq(0, 7200, 400)) +
    theme_classic() + 
    theme(plot.margin=unit(c(1,1,1,1),"cm")) +
    coord_cartesian(expand = FALSE) # origin at (0,0)
ggsave("flintprep-293-variant-1.pdf")


# VARIANT 2: ONLY THE NEW ENTRANTS RECEIVE THE DISCOUNT, WHICH GETS BIGGER
"""
New entrants only:
x = 1: 120-2
x = 2: 120-2 + 120-2-2
x = 3: 120-2 + 120-2-2 + 120-2-2-2
generalizes to:
120*x + (-2) + (-2-2) + (-2-2-2) + ...
120*x - (2 + 4 + 6 + ... )
120*x - 2 * (1 + 2 + 3 + ... + x)
120*x - 2 * x*(x+1)/2
120*x - x*(x+1)
119*x -x^2
# All registrants n = 40 + x:
for x>0:
120 * 40 + 119*x -x^2
= -x^2 + 119*x + 4800
for n>40
-(n-40)^2 + 119*(n-40) + 120*40
-n^2 + 199*n -39*40
"""

y <- function(n) ifelse(n>40, -n^2 + 199*n -39*40, 120*n)
x = seq(0, 190, 1)
df = data.frame(x = x, y = y(x))
df = melt(df, id = "x")
ggplot(data = df, aes(x = x, y = value)) + 
    geom_point(size = 0.2, color = "blue") +
    geom_vline(xintercept = 40, color = "gray") +
    labs(x = "x (total number of registrants)", y = "y (total revenue)") +
    scale_x_continuous(breaks = seq(0, 200, 20)) +
    scale_y_continuous(breaks = seq(0, 9600, 1600)) +
    theme_classic() + 
    theme(plot.margin=unit(c(1,1,1,1),"cm")) +
    coord_cartesian(expand = FALSE) # origin at (0,0)
ggsave("flintprep-293-variant-2.pdf")

