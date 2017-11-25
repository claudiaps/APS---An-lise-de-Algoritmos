#!/usr/bin/env python
# -*- coding: utf-8 -*-
# Algoritmo do Subvetor Máximo - Versão Iterativa
# Autor: João Victor Nascimento
import sys
import myBib
import os.path
import timeit
import time

argc = len(sys.argv)

if argc != 2:
    print 'Uso: ./algoritmo tam_vet\n'
    sys.exit(0)

teste = sys.argv[1]

vet = open(teste).readlines()

n = len(vet)

max = -2147483647

# Imprime o Vetor Inicial
vet = map(int,vet)
print '\n',vet

inicio1 = timeit.default_timer()
time = time.clock()

# Encontrando o subvetor máximo
for i in range(0,n): # Inicio
    for j in range(i,n): # Fim
        soma = 0
        for k in range(i,j+1): # Soma os valores do Subvetor
            soma += vet[k]
        if soma > max: # Testa se é o Subvetor Máximo
            max = soma
            inicio = i
            fim = j

print '\n','Tempo de CPU:', time

fim1 = timeit.default_timer()

tempo = fim1-inicio1

print 'Tempo Real:', tempo


# Imprime a soma do subvetor, a posição do inicio e do fim
print'Soma maxima:',max,'\n','inicio: ', inicio,'\n','fim: ', fim





