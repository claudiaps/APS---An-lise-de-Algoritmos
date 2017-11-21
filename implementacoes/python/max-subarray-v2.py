#!/usr/bin/env python
# -*- coding: utf-8 -*-
# Algoritmo do Subvetor Máximo - Versão Iterativa Melhorada
# Autor: João Victor Nascimento
import sys
import myBib

argc = len(sys.argv)

if argc != 2:
    print 'Uso: ./algoritmo tam_vet\n'
    sys.exit(0)

# Tamanho do Vetor
n = int(sys.argv[1]) 

vet = []

# Preenchendo uma lista com números pseudoaleatórios
for i in range(0,n):
    vet.insert(i, (myBib.myRand() % 200) - 100)

max = -2147483647

# Encontrando o subvetor máximo
for i in range(0,n): # Inicio
    soma = 0
    for j in range(i,n): # Fim
        soma += vet[j]    
        if soma > max: # Testa se é o Subvetor Máximo
            max = soma
            inicio = i
            fim = j

# Imprime o Vetor Inicial

vet = map(int,vet)
print '\n',vet

# Imprime a soma do subvetor, a posição do inicio e do fim
print'Soma maxima:',max,'\n','inicio: ', inicio,'\n','fim: ', fim



