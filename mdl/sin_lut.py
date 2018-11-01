import numpy as np

class sin_lut:
	def __init__(self, inputWidth, outputWidth):
		self.inputWidth = inputWidth;
		self.outputWidth = outputWidth;

	def moduleTF(self, inputSamples):
		x = np.float64(inputSamples) / np.float64(2**self.inputWidth - 1)
		y = np.sin(2.0*np.pi*x)
		outputSamples = np.round((2**self.outputWidth - 1)*y)
		return outputSamples    
