# James homework. Question 260.

# R Code:

y <- function(x)
    -0.016 * x^2 + 0.5 * x + 4.5
y(0)
y(28)

x = -1:40
plot(x, y(x))



# Python Code:

def y(x):
    return -0.016 * x**2 + 0.5 * x + 4.5
print(y(0))
print(y(28))

