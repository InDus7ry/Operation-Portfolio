import random

questions=open('questions.txt', 'r')
out=open('output.txt', 'a')
q = []
used = []
j=0
noDupe=True
while noDupe:
	j+=1
	try:
		for i in range(0, 9):
			q.append(questions.readline())

		while True:
			r=random.randint(0, 9)
			if r in used and len(used)==10:
				noDupe=False
				break
			elif r not in used:
				break
		used.append(r)
		if noDupe==False:
			print('Duplicate Reached, program terminating ;)')
			break
		inn = str(input(q[r]))
		out.write(q[r] + '\n')
		out.write(inn + '\n')
	except:
		print('Input a string \' \'')
out.close()
questions.close()