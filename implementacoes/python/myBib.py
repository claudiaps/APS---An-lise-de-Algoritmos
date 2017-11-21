import sys

nSeed = 2048

def myRand():
	global nSeed 
	nSeed = (8253729 * nSeed + 2396403)
	return unsigned(nSeed)  % 32767

def unsigned(n):
	return n & 0xFFFFFFFF

def main():
	argc = len(sys.argv)
	if argc != 2:
		return

    # Tamanho do Vetor
	n = int(sys.argv[1])

	for i in range(n):
		print((myRand() % 200) - 100)

if __name__ == "__main__":
    # execute only if run as a script
    main()