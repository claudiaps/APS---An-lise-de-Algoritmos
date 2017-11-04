/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package max.subarray.v4;

import java.util.Random;
import java.util.Scanner;

/**
 *
 * @author claudia
 */
public class MaxSubarrayV4 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Scanner keyboard = new Scanner(System.in);
        System.out.println("Digite o tamanho do vetor");
        int n = keyboard.nextInt();
  
        int array[] = new int[n]; 
        
        //gera numero aleatório
        Random rand = new Random(1);
        int max = 100;
        int min = -100;
        for(int i=0; i<n; i++){
            array[i] = rand.nextInt((max - min) + 1) + min;
        }
        
        int soma_inicio=0, inicio=0, fim=0, soma = 0, maxSoma = 0;
        
        
        //encontrar o subvetor máximo
        for(int i=0; i<n; i++)
        {
            soma += array[i];
            if (array[i] > soma)
            {
                soma = array[i];
                soma_inicio = i;
            }
            if(soma > maxSoma)
            {
                maxSoma = soma;
                inicio = soma_inicio;
                fim = i;
            }
        }
        
        //exibindo resultados
        for(int i=0; i<n; i++){
            System.out.print(array[i]+"  ");
        }
        System.out.print("\nSoma máxima: " + maxSoma + "\nInicio: " + inicio + "\nFim: " + fim);
    }
    
}
