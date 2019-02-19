import math
class Sphere:
	def __init__(self, r):
		self.r=r
	def getVolume(self):
		return (((self.r ** 3) * math.pi * 4)/3)
	def getSurf(self):
		return ((self.r ** 2) * math.pi * 4)
	def getCircum(self):
		return (2 * math.pi * self.r)