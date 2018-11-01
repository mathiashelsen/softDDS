import numpy as np
import matplotlib.pyplot as plt

import sin_lut
import phase_acc

paWidth = 16
N       = 2**paWidth
fBinSig = 131
fSig    = float(fBinSig)/float(N)
fBinNoise = 311;
noiseBins = 50;
fNoise  = float(fBinNoise)/float(N)

phase_acc = phase_acc.phase_acc(fBinSig, paWidth)
lut = sin_lut.sin_lut(paWidth, 8)

x = np.linspace(0.0, N, N)
y = phase_acc.moduleTF(x)
y = lut.moduleTF(y)

Y = np.fft.rfft(y)
Y_pwr = 20.0*np.log10(np.abs(Y))
X = np.fft.rfftfreq(N)

P_Sig   = Y_pwr[fBinSig]
P_Noise = np.average(Y_pwr[fBinNoise-noiseBins/2:fBinNoise+noiseBins/2])

SNR     = P_Sig - P_Noise
print(P_Sig)
print(P_Noise)
print(SNR)

plt.plot(X, Y_pwr)
plt.show()
