import numpy as np
import matplotlib.pyplot as plt

import sin_lut

N = 2**16

lut = sin_lut.sin_lut(8, 8)

x = np.linspace(0.0, (2**8)*3, N)
y = lut.moduleTF(x)

Y = np.fft.fftshift(np.fft.fft(y))
Y_pwr = 20.0*np.log10(np.abs(Y))
X = np.fft.fftshift(np.fft.fftfreq(N))

plt.plot(X, Y_pwr)
plt.show()
