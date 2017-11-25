#!/usr/bin/env python
# -*- coding: utf-8 -*-
# Algoritmo do Subvetor Máximo - Versão Iterativa Melhorada
# Autor: João Victor Nascimento
import sys
import myBib
import os.path
import time

argc = len(sys.argv)

if argc != 2:
    print 'Uso: ./algoritmo tam_vet\n'
    sys.exit(0)

teste = sys.argv[1]

vet = open(teste).readlines()

n = len(vet)

# Imprime o Vetor Inicial

vet = map(int,vet)
print '\n',vet

max = -2147483647

inicio_cpu = time.clock()
inicio_real = time.time()

# Encontrando o subvetor máximo
for i in range(0,n): # Inicio
    soma = 0
    for j in range(i,n): # Fim
        soma += vet[j]    
        if soma > max: # Testa se é o Subvetor Máximo
            max = soma
            inicio = i
            fim = j

fim_cpu = time.clock()
fim_real = time.time()

tempo_real = fim_real - inicio_real

tempo_cpu = fim_cpu - inicio_cpu

print '\n','Tempo de CPU:', tempo_cpu

print 'Tempo Real:', tempo_real


# Imprime a soma do subvetor, a posição do inicio e do fim
print'Soma maxima:',max,'\n','inicio: ', inicio,'\n','fim: ', fim



