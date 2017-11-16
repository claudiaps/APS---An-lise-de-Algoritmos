nSeed = 2048

def myRand():
	global nSeed 
	nSeed = (8253729 * nSeed + 2396403)
	return unsigned(nSeed)  % 32767

def unsigned(n):
	return n & 0xFFFFFFFF

def main():
	for i in range(10):
		print((myRand() % 200) - 100)

if __name__ == "__main__":
    # execute only if run as a script
    main()