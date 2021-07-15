# Question 554
# An NBA center recently signed a seven-year contract for 121 million. 
# What is the present value of this contract, given a 9% interest rate? 
# In other words, how much must the ball club invest when the contract is signed, 
# so that it can make seven equal payments of $17,285,714.29, the first one due immediately? 

# import os
# os.chdir("~/James/James-Math/flintprep/code/")

r = 0.09
V = 121000000
P = V/7
#I = 112113736
I = 86998185

def B(n):
    if n == 1:
        return I - P
    else:
        return B(n-1) * (1+r) - P
 
print(round(B(7)))
## 28989874



'''
https://answer.ya.guru/questions/3577462-an-nba-center-recently-signed-a-seven-year-contract-for-121.html

Answer: PV= $86,998,184.72 Step-by-step explanation: Giving the following information: Annual payments= $17,285,714.29 Number of years= 7 Interest rate= 9% First, we need to determine the future value incorporating the interest rate. FV= {A*[(1+i)^n-1]}/i A= annual payment FV= {17,285,714.29* [(1.09^7) - 1]} / 0.09 FV= $159,036,085.1 Now, we can calculate the present value: PV= FV/(1+i)^n PV= 159,036,085.1/1.09^7 PV= $86,998,184.72 

Read more at Answer.Ya.Guru – https://answer.ya.guru/questions/3577462-an-nba-center-recently-signed-a-seven-year-contract-for-121.html
'''