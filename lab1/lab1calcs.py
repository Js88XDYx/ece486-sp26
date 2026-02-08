import numpy as np

z = [ 2, 1.5, 1, 0.8, 0.7, 0.5, 0.3, 0.2]
o = 1

for i in range(len(z)):
    print("========")
    print("zeta = ", z[i])
    if z[i] >= 1:
        Mp = 0
    else:
        Mp = np.exp(-np.pi*z[i]/np.sqrt(1-z[i]**2))
    print("Mp = ", Mp)

    if z[i]<1.2:
        t_r = (1.2 - 0.45*z[i] + 2.6*z[i]**2)/o
    else:
        t_r = (4.7*z[i]-1.2)/o
    print("t_r = ", t_r)

    if z[i] <= 0.69:
        t_s = -(0.5/z[i]/o)*np.log((1-z[i]**2)/400)
    else:
        t_s = (6.6*z[i]-1.6)/o
    print("t_s = ", t_s)