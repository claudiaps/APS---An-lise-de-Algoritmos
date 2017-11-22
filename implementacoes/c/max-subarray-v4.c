// quarta implementação do algoritmo do subvetor maximo
// programação dinamica... acho eu..

#include <stdio.h>
#include <stdlib.h>
#include <limits.h>
#include <time.h> 
#include <sys/time.h> 
#include "myBib.h"

int main( int argc, char *argv[ ] ){
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
	
	int soma_inicio = 0, inicio = 0, fim = 0, soma, maxSoma;

	// inicia as somas
	soma = vet[0];
	maxSoma = vet[0];

	struct timeval time1, time2;
    double elapsedTime;

	clock_t t1=clock();
	gettimeofday(&time1, NULL);
	// encontrar o subvetor maximo
	for(int i = 1; i < n; i++){ // inicia em 1 pois as somas já iniciam com a posição 0
		soma += vet[i];
		if(vet[i] > soma){ // testa se o vet[i] é maior que a soma.. se for.. a soma não é a maior soma.. 
			soma = vet[i]; // a maior soma então começa neste valor maior
			soma_inicio = i;
		}
		if(soma > maxSoma){ // testa se a soma é a maior soma
			maxSoma = soma;
			inicio = soma_inicio; // o inicio do subvetor é o inicio da maior soma
			fim = i; // o fim é a ultima posição.. no caso.. a posição atual
		}
	}
	clock_t t2=clock();
	gettimeofday(&time2, NULL);
	elapsedTime = (time2.tv_sec - time1.tv_sec) * 1000.0;      // sec to ms
    elapsedTime += (time2.tv_usec - time1.tv_usec) / 1000.0;   // us to ms

	// imprimir resultados
	for (int i = 0; i < n; i++){
		printf("vet[%d]: %d\n", i, vet[i]);
	}
	printf("Soma maxima: %d \ninicio: %d \nfim: %d\n", maxSoma, inicio, fim);
	printf("Tempo de CPU: %lf ms\n", ((double)(1000.0 * (t2-t1) / CLOCKS_PER_SEC)));
	printf("Tempo real: %lf ms\n", elapsedTime);

	return 0;	
}