from Box import Box
from Pyramid import Pyramid
from Sphere import Sphere
import math

class ShapeTester:
	print('Welcome to ShapeTester')
	while True:
		print('Please choose \'box\', \'pyramid\', or \'sphere\'')
		width=0
		length=0
		height=0
		radius=0
		t=input('>')
		if t=='box':
			print('You chose \'box\'!')
			width=int(input('Choose a width: '))
			length=int(input('Choose a length: '))
			height=int(input('Choose a height: '))
			b1=Box(length, width, height)
			print('Volume: %f' % b1.getVolume())
			print('Surface Area: %f' % b1.getSurf())

		elif t=='pyramid':
			print('You chose \'pyramid\'!')
			length=int(input('Choose length: '))
			width=int(input('Choose width: '))
			height=int(input('Choose height of pyramid: '))
			p1=Pyramid(length, width, height)
			print('Volume: %f' % p1.getVolume())
			print('Surface Area: %f' % p1.getSurf())

		elif t=='sphere':
			print('You chose \'sphere\'!')
			radius=int(input('Chose radius: '))
			s1=Sphere(radius)
			print('Volume: %f' % s1.getVolume())
			print('Surface Area: %f' % s1.getSurf())
			print('Circumference: %f' % s1.getCircum())
		else:
			print('Incorrect syntax, try again')

