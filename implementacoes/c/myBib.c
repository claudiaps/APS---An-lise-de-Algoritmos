#include <stdio.h>
#include "myBib.h"

unsigned int myRand()
{
    // seed é 2048
    static unsigned int nSeed = 2048;

    // Usa a seed para gerar um novo valor,
    // É uma constante muito grande e com overflow, deixando bem dificil de prever o proximo numero
    nSeed = (8253729 * nSeed + 2396403); 

    return nSeed  % 32767;
}