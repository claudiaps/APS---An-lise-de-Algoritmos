#!/usr/bin/env python
# -*- coding: utf-8 -*-
# Algoritmo do Subvetor Máximo - Versão Iterativa Melhorada
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

# Imprime o Vetor Inicial

vet = map(int,vet)
print '\n',vet

soma_inicio = 0
inicio = 0
fim = 0

soma = vet[0]
max = vet[0]

inicio1 = timeit.default_timer()
time = time.clock()

# Encontrando o subvetor máximo
for i in range(0,n):
    soma += vet[i]
    if vet[i] > soma: 
        soma = vet[i]
        soma_inicio = i
    if soma > max:
        max = soma
        inicio = soma_inicio
        fim = i

print '\n','Tempo de CPU:', time

fim1 = timeit.default_timer()

tempo = fim1-inicio1

print 'Tempo Real:', tempo

# Imprime a soma do subvetor, a posição do inicio e do fim

print'Soma maxima:',max,'\n','inicio: ', inicio,'\n','fim: ', fim



