import numpy as np
import matplotlib.pyplot as plt

import sin_lut
import phase_acc

paWidth = 16
N       = 2**paWidth
fBin    = 13
fSin    = float(fBin)/float(N);

phase_acc = phase_acc.phase_acc(fBin, paWidth)
lut = sin_lut.sin_lut(paWidth, 8)

x = np.linspace(0.0, N, N)
y = phase_acc.moduleTF(x)
y = lut.moduleTF(y)

Y = np.fft.rfft(y)
Y_pwr = 20.0*np.log10(np.abs(Y))
X = np.fft.rfftfreq(N)


print(np.amax(Y_pwr))
print(np.argmax(Y_pwr))
print(Y_pwr)

plt.plot(X, Y_pwr)
plt.show()
