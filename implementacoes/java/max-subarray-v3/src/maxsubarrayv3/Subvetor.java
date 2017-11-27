/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
//package maxsubarrayv3;

import static java.lang.Byte.MIN_VALUE;

/**
 *
 * @author claudia
 */
public class Subvetor {

    public int inicio;
    public int fim;
    public int soma;
    
    Subvetor() {
        
    }
    
    public static Subvetor max_cross(int[] array, int inicio, int meio, int fim) {
        
        int e_soma = MIN_VALUE;
        int d_soma = MIN_VALUE;
        int soma2;
	Subvetor maxSubvetor;
        maxSubvetor = new Subvetor();
	int e_max = 0, d_max = 0;
        
        soma2=0;
        for (int i = meio; i >= inicio; i--) // inicia no meio e vai até o inicio
	{
            soma2 += array[i];
            if (e_soma < soma2){ // encontra a maior soma do meio indo para o lado esquerdo
                    e_soma = soma2;
                    e_max = i;
            }
	}
        soma2 = 0;
	for (int i = meio+1; i <= fim; i++) // inicia no meio e vai até o fim
	{
            soma2 += array[i];
            if(soma2 > d_soma){ // encontra a maior soma do meio indo para o lado direito
                    d_soma = soma2;
                    d_max = i;
            }
	}
       
        maxSubvetor.inicio = e_max;
	maxSubvetor.fim = d_max;
	maxSubvetor.soma = (e_soma + d_soma);
        
        return maxSubvetor;

    }
    
    public static Subvetor subvetor_maximo(int[] array, int inicio, int fim) {
        Subvetor maxSubvetor = new Subvetor();
	Subvetor e_maxSubVetor = new Subvetor();
	Subvetor m_maxSubVetor = new Subvetor();
	Subvetor d_maxSubVetor = new Subvetor();
        
        if (inicio == fim){
            // cria o subvetor de retorno
            maxSubvetor.inicio = inicio;
            maxSubvetor.fim = fim;
            maxSubvetor.soma = array[inicio];

            return maxSubvetor;
	}
        
        int meio = (inicio + fim)/2;
	System.out.print("inicio = "+inicio+ "fim = "+fim+ "meio= "+meio+"\n");
	e_maxSubVetor = subvetor_maximo(array, inicio, meio); // testa se o subvetor está a esquerda
	d_maxSubVetor = subvetor_maximo(array, meio+1, fim); // testa se o subvetor está a direita
	m_maxSubVetor = max_cross(array, inicio, meio, fim); // testa se o subvetor está no meio

        if(e_maxSubVetor.soma >= d_maxSubVetor.soma && e_maxSubVetor.soma >= m_maxSubVetor.soma){ // testa se o maior subvetor é o da esquerda
		return e_maxSubVetor;
	} else if (d_maxSubVetor.soma >= e_maxSubVetor.soma && d_maxSubVetor.soma >= m_maxSubVetor.soma){ // testa se o maior subvetor é o da direita
		return d_maxSubVetor;
	} else { // se não.. retorna o subvetor do meio
		return m_maxSubVetor;
	}
            
    }
    
    
    
    
}
    

