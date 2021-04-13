import statistics

L1 = [x for x in range(1,1001)]  # all integers between 1 and 1000, inclusive
N1 = len(L1)  # check that the list contains 1000 elements
M1 = statistics.median(L1)  # calculate the median, M1 = 500.5
print(N1, M1)

L2 = [x for x in L1 if x % 28 != 0]  # remove all multiples of 28
N2 = len(L2)  # check that the list contains 965 elements fewer (965=1000-35)
M2 = statistics.median(L2)  # calculate the new median, M2 = 500
print(N2, M2)

L3 = [x for x in range(1,1001) if x % 28 == 0]  # keep multiples of 28 in range
N3 = len(L3)  # check that the list contains 35 elements
M3 = statistics.median(L3)  # calculate the new median, M3 = 504
print(N3, M3)
