import math
class Pyramid:
    'Calculates square Pyramid attributes'
    def __init__(self, l, w, h):
    		self.l = l
    		self.w = w
    		self.h = h
    def getVolume(self):
    	return ((self.l * self.w * self.h) / 3)
    def getSurf(self):
    	return self.l*self.w + self.l*math.sqrt((self.w/2)**2+(self.h)**2) + self.w*math.sqrt((self.l/2)**2+(self.h)**2)
