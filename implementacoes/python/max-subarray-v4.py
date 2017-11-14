#!/usr/bin/env python
# -*- coding: utf-8 -*-
# Algoritmo do Subvetor Máximo - Versão Iterativa Melhorada
# Autor: João Victor Nascimento
import sys
import random

argc = len(sys.argv)

if argc != 2:
    print 'Uso: ./algoritmo tam_vet\n'
    sys.exit(0)

# Tamanho do Vetor
n = int(sys.argv[1]) 

vet = []

# Seed que gera números iguais
random.seed(1)

# Preenchendo uma lista com números pseudoaleatórios
for i in range(0,n):
    vet.insert(i,random.randrange(-100,100,1)) 

soma_inicio = 0
inicio = 0
fim = 0

soma = vet[0]
max = vet[0]

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

# Imprime o Vetor Inicial
print '\n',vet

# Imprime a soma do subvetor, a posição do inicio e do fim
print max,inicio,fim



