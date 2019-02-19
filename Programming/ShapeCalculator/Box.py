class Box:
    'Calculates rectangular prisim attributes'
    def __init__(self, l, w, h):
    		self.l = l
    		self.w = w
    		self.h = h
    def getVolume(self):
    	return self.l*self.w*self.h
    def getSurf(self):
    	return 2*(self.l*self.w+self.l*self.h+self.h*self.w)
    
