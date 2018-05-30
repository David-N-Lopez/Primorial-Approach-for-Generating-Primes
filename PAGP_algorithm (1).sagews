################# Primorial Approach for Generating Primes###################

bitArray = [] #array that stores bit values of primes
primorialArray = [] #array that stores primorial values
prime = Primes() #Primes() is the set of all primes - defined by sage
primorial = 1

#calculate up to the 100th primorial and retrieving primorial bit size. To check for bigger primes, make the arrange larger
for i in range(100):
    primorial = primorial*prime[i]
    primorialArray.append(primorial)
    bitArray.append(len(primorial.str(2)))
#function to find the prime near a primorial where index is the last prime of the primorial
def findPrimeWithPrimorial(primorial, index):
    num = index+1
    #check if the primorial +/- 1 is a prime if it is return the prime
    if (is_prime((primorial+1))):
        return primorial+1
    if (is_prime((primorial-1))):
        return primorial-1

#If primorial +/-1 is not the prime then continue to add primes >=index until new prime is found
    while (True):
        if is_prime(primorial+prime[num]):
            return primorial+prime[num]
        num = num + 1

#MOST important function, returns the prime given a number of bits
def findPrimeWithBits(n):
    for i in range(100):
        if bitArray[i]==n: #if ith primorial bit size equals the input, then return the prime with the prime bits
            return (findPrimeWithPrimorial(primorialArray[i],i))

        #if bit size of the ith primorial is greater than the input then look at the previous primorial and multiply it by 2^k until input bit size matches
        if bitArray[i]>n:
            index = i-1
            newPrimorial = primorialArray[index]
            exponent = n - bitArray[index]
            newPrimorial = newPrimorial*(2**exponent)
            return (findPrimeWithPrimorial(newPrimorial,i))

#################################################FUNCTIONS TO MEASURE PERFORMANCE#########################################################################

#function to find the number of primality calls of a prime near a primorial
def findPrimeWithPrimorial_count(primorial, index):
    num = index+1
    count = 0

    #check if the primorial +/- 1 is a prime if it is return the prime calls
    if (is_prime((primorial+1))):
        return 1
    if (is_prime((primorial-1))):
        return 1

#If primorial +/-1 is not the prime then continue to add primes >=index until new prime is found
    while (True):
        count = count +1
        if is_prime(primorial+prime[num]):
            return count+2
        num = num + 1

#function to return the number of primality calls based on bits
def findPrimeWithBits_count(n):
    for i in range(100):
        if bitArray[i]==n: #if ith primorial bit size equals the input, then return the primality calls for the primorial
            return (findPrimeWithPrimorial_count(primorialArray[i],i))

        #if bit size of the ith primorial is greater than the input then look at the previous primorial and multiply it by 2^k until input bit size matches
        if bitArray[i]>n:
            index = i-1
            newPrimorial = primorialArray[index]
            exponent = n - bitArray[index]
            newPrimorial = newPrimorial*(2**exponent)
            return (findPrimeWithPrimorial_count(newPrimorial,i))
#END










