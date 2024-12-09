""" Yukie Group Theory (v1) p90 4.1.15

Note that  a,b in a group G, ab in Yukie = b*a in SageMath 

e.g. (1 2)(1 3) in Yukie is G([(1,3)])*G([(1,2)])

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
x = [x1,x2,x3]

#value_to_index = {k + 1: i for i, lst in enumerate(G_over_H) for k in lst}
def find_index(k):
    for index, values in enumerate(G_over_H):
        if k in values:  
            return index+1
    return None  


def rho(g):
    """
    Args:
        g: element in SymetricGroup G

    Return: 
        element in permutation representation in SymetricGroup 

    """
    permutation = []
    for xi in x:
        xirho = g*xi
        j = find_index(xirho)
        permutation.append(j)
    return G(permutation)

g = G([(1,2)])
print("rho:",g,"->",rho(g))

g = G([(1,2,3)])
print("rho:",g,"->",rho(g))

print( G([(1,2)])*G([(1,3)]) )
print( G([(1,3)])*G([(1,2)]) )