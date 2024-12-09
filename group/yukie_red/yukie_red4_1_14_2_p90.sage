""" Yukie Group Theory (v1) p90 4.1.14(2) Cayley

Note that  a,b in a group G, ab in Yukie = b*a in SageMath 

"""

from sage.all import *

def injective_homomorphism(G):
    """computes injective_homomorphism of Symmetric Group, G

    Args: 
        G: input SymmetricGroup

    Return:
        elements of input Symmetric Group, elements of output Symmetric Group S_n (n=G.order()), Sn

    """
    n = G.order()
    Sn = SymmetricGroup(n)
    x = G.list()
    
    def rho(g):
        permutation = []
        for j, xi in enumerate(x):
            k = x.index(xi*g) + 1
            permutation.append(k)

        return Sn(permutation)

    y = []
    for g in x:
        y.append(rho(g))

    return x, y, Sn


def check_injective_homomorphism(x, y):
    """ check homomorphism

    Args:
        x: elements of input Symmetric Group
        y: elements of output Symmetric Group S_n (n=G.order())

    Return:
        bool: True or False

    """
    order = len(x)
    for i in range(order):
        for j in range(order):
            k = x.index(x[i]*x[j])
            if y[i]*y[j] == y[k]:
                pass
            else:
                return False
    return True

if __name__ == "__main__":
    
    G = SymmetricGroup(3)
    x, y, H = injective_homomorphism(G)
    print(G,"->", H)
    print(x, "->", y)
    print(check_injective_homomorphism(x, y))
