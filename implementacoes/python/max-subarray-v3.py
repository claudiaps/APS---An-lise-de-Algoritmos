#!/usr/bin/env python
# -*- coding: utf-8 -*-
# Algoritmo do Subvetor Máximo - Versão Iterativa Melhorada
# Autor: João Victor Nascimento
import sys
import myBib
import os.path
import timeit
import time

def max_cross(vet, inicio, meio, fim):
    e_soma = -2147483647
    d_soma = -2147483647
    soma = 0
    for i in range(meio,inicio-1,-1):
        soma += vet[i]
        if e_soma < soma :
            e_soma = soma
            e_max = i
    
    soma = 0
    for i in range(meio+1,fim+1):
        soma = soma + vet[i]
        if soma > d_soma:
            d_soma = soma
            d_max = i
    
    return e_max, d_max, (e_soma + d_soma)

def subvetor_maximo(vet, inicio, fim):
    if inicio == fim:
        return inicio, fim, vet[inicio]

    meio = (inicio + fim)/2
    #print 'inicio:',inicio, 'fim:',fim, 'meio:',meio

    e_inicio, e_fim, e_soma = subvetor_maximo(vet, inicio, meio)
    d_inicio, d_fim, d_soma = subvetor_maximo(vet, meio+1, fim)
    m_inicio, m_fim, m_soma = max_cross(vet, inicio, meio, fim)

    if e_soma >= d_soma and e_soma >= m_soma :
        return e_inicio, e_fim, e_soma
    elif d_soma >= e_soma and d_soma >= m_soma :
        return d_inicio, d_fim, d_soma
    else:
        return m_inicio, m_fim, m_soma


def main():
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
    
    global inicio_cpu

    inicio_cpu = time.clock()
    inicio_real = time.time()

    inicio, fim, soma = subvetor_maximo(vet, 0, n-1)

    global fim_cpu

    fim_cpu = time.clock()
    fim_real = time.time()

    tempo_real = fim_real - inicio_real

    tempo_cpu = fim_cpu - inicio_cpu

    print '\n','Tempo de CPU:', tempo_cpu

    print 'Tempo Real:', tempo_real   
   
    # Imprime a soma do subvetor, a posição do inicio e do fim
    print'Soma maxima:',soma,'\n','inicio: ', inicio,'\n','fim: ', fim


main()