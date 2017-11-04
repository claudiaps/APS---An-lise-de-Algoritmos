/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package max.subarray.v1;

import static java.lang.Integer.MIN_VALUE;
import java.util.Random;
import java.util.Scanner;

/**
 *
 * @author claudia
 */
public class MaxSubarrayV1 {

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
        
       int soma, maxSoma = MIN_VALUE;
       int inicio = 0;
       int fim = 0;
        
        //subvetor máximo:
        for(int i=0; i< n; i++)
        {
           for( int j = i; j < n; j++)
           {
               soma = 0;
               for(int k = i; k <= j; k++)
               {
                   soma += array[k];
               }
               if(soma > maxSoma)
               {
                   maxSoma = soma;
                   inicio = i;
                   fim = j;
               }
           } 
        }
        
        //mostrando resultados
        for(int i=0; i<n; i++){
            System.out.print(array[i]+"  ");
        }
        
        System.out.print("\nSoma máxima: " + maxSoma + "\nInicio: " + inicio + "\nFim: " + fim);
    }
    
}
