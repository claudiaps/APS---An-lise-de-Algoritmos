// Segunda implementação do algoritmo do subvetor maximo
// Versão iterativa melhorada!

#include <stdio.h>
#include <stdlib.h>
#include <limits.h>
#include "myBib.h"

int main( int argc, char *argv[ ] ){
	if (argc != 2){
		printf("Uso: ./algoritmo tam_vet\n");
		return 0;
	}
	int n = atoi(argv[1]); // tamanho do vetor

	int vet[n];
	srand (1); // seed para gerar numeros iguais

	// iniciar vetor com numeros pseudoaleatorios
	for (int i = 0; i < n; i++)
	{
		vet[i] = myRand()%200 - 100;
	}
	
	int soma, maxSoma = INT_MIN, inicio, fim;

	// encontrar o subvetor maximo
	for (int i = 0; i < n; i++) // valor inicial
	{
		soma = 0;
		for (int j = i; j < n; j++) // vai de i até n
		{
			soma += vet[j];
			if (soma > maxSoma){ // testa todas as somas de i até n e encontra a maior
				maxSoma = soma;
				inicio = i;
				fim = j;
			}
		}
	}

	// imprimir resultados
	for (int i = 0; i < n; i++){
		printf("vet[%d]: %d\n", i, vet[i]);
	}
	printf("Soma maxima: %d \ninicio: %d \nfim: %d", maxSoma, inicio, fim);

	return 0;	
}