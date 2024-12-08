""" Yukie Group Theory (v1) p90 4.1.15

Note that  a,b in a group G, ab in Yukie = b*a in SageMath 

"""

from sage.all import *
G = SymmetricGroup(3)
#x = [x1,x2,x3,x4,x5,x6]

generator = G((1,2))

H = G.subgroup([generator])

print(H.list())

# G/H
G_over_H = G.cosets(H, side="left") 

for i, cosets in enumerate(G_over_H, 1):
    print(f"cosets {i}: {cosets}")

x1 = G([(1,)])
x2 = G([(1,2,3)])
x3 = G([(1,3,2)])

# check (1 2)x1 in x1 H
print(G([(1,2)])*x1 in G_over_H[0])
print(G([(1,2)])*x2 in G_over_H[2])
print(G([(1,2)])*x3 in G_over_H[1])

print(G([(1,2,3)])*x1 in G_over_H[1])
print(G([(1,2,3)])*x2 in G_over_H[2])
print(G([(1,2,3)])*x3 in G_over_H[0])