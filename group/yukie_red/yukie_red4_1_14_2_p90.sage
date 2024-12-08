""" Yukie Group Theory (v1) p90 4.1.14(2) Cayley

Note that  a,b in a group G, ab in Yukie = b*a in SageMath 

"""

from sage.all import *
G = SymmetricGroup(3)
x1 = G([(1,)])
x2 = G([(1,2)])
x3 = G([(1,3)])
x4 = G([(2,3)])
x5 = G([(1,2,3)])
x6 = G([(1,3,2)])
x = [x1,x2,x3,x4,x5,x6]


H = SymmetricGroup(6)
y1 = H([()])
y2 = H([(1,2),(3,6),(4,5)])
y5 = H([(1,5,6),(2,3,4)])

print(x2*x5, y2*y5) # (1,3) (1,3)(2,5)(4,6)
y3 = y2*y5

print(x5*x2, y5*y2) # x4
y4 = y5*y2

print(x3*x4, y3*y4) # x5, y5 is already defined

print(x4*x3, y4*y3) # x6
y6 = y4*y3

y = [y1,y2,y3,y4,y5,y6]

#check injective homomorphism
for i in range(6):
    for j in range(6):
        k = x.index(x[i]*x[j])
        if y[i]*y[j] == y[k]:
            pass
        else:
            raise ValueError("is not homomorphism")

print("rho: x in Theta_3 -> y in Theta_6")
print(y)