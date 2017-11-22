// Primeira implementação do algoritmo do subvetor maximo
// Versão iterativa!

#include <stdio.h>
#include <stdlib.h>
#include <limits.h>
#include <time.h> 
#include <sys/time.h> 
#include "myBib.h"

int main(int argc, char *argv[])
{

	if (argc != 3)
	{
		printf("Uso: ./algoritmo tam_vet file\n");
		return 0;
	}

	FILE *fp;
	char *line = NULL;
	size_t len = 0;
	ssize_t read;
	int i = 0;

	int n = atoi(argv[1]); // tamanho do vetor
	fp = fopen(argv[2], "r");
	if (fp == NULL)
		exit(EXIT_FAILURE);

	int vet[n];

	while ((read = getline(&line, &len, fp)) != -1)
	{
		vet[i] = atoi(line);
		i++;
	}

	int soma, maxSoma = INT_MIN, inicio, fim;

	struct timeval time1, time2;
    double elapsedTime;

	clock_t t1=clock();
	gettimeofday(&time1, NULL);

	// encontrar o subvetor maximo
	for (int i = 0; i < n; i++) // valor inicial
	{
		for (int j = i; j < n; j++) // valor final
		{
			soma = 0;
			for (int k = i; k <= j; k++) // soma todos os valores entre i e j
			{
				soma += vet[k];
			}
			if (soma > maxSoma) // testa se está é a maior soma
			{
				maxSoma = soma;
				inicio = i;
				fim = j;
			}
		}
	}

	clock_t t2 = clock();
	gettimeofday(&time2, NULL);
	elapsedTime = (time2.tv_sec - time1.tv_sec) * 1000.0;	// sec to ms
	elapsedTime += (time2.tv_usec - time1.tv_usec) / 1000.0; // us to ms

	// imprimir resultados
	for (int i = 0; i < n; i++)
	{
		printf("vet[%d]: %d\n", i, vet[i]);
	}
	printf("Soma maxima: %d \ninicio: %d \nfim: %d\n", maxSoma, inicio, fim);
	printf("Tempo de CPU: %lf ms\n", ((double)(1000.0 * (t2-t1) / CLOCKS_PER_SEC)));
	printf("Tempo real: %lf ms\n", elapsedTime);

	return 0;
}