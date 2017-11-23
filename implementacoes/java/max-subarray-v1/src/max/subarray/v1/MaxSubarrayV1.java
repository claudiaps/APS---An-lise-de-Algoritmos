/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
//package max.subarray.v1;

import java.io.File;
import java.io.IOException;
import static java.lang.Integer.MIN_VALUE;
import java.util.Scanner;

/**
 *
 * @author claudia
 */


public class MaxSubarrayV1 {
    
    static int nSeed = 2048;

    // public static int unsignedV(int n){
    //     int unsignedValue = n & 0xffffffffl;
    //     return unsignedValue;
    // }

    // public static int myRand(){
    //     nSeed = (8253729 * nSeed + 2396403); 
    //     return unsignedV(nSeed) % 32767;
    // }

    /**
     * @param args the command line arguments
     * @throws java.io.IOException
     */
    public static void main(String[] args) throws IOException {
        
        Scanner keyboard = new Scanner(System.in);
        System.out.println("Digite o tamanho do vetor");
        int n = keyboard.nextInt();
        
        int i =0;
  
        int array[]; 
        array = new int[n];

        Scanner scan = new Scanner(new File("array_1000.txt"));
        while(scan.hasNextLine()){
            String line = scan.nextLine();
                    array[i] = Integer.parseInt(line);
                    i++;
        }
                      
      
       long startTime = System.currentTimeMillis();
         
       int soma, maxSoma = MIN_VALUE;
       int inicio = 0;
       int fim = 0;
        
        //subvetor máximo:
        for( i=0; i< n; i++)
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
        
        long stopTime = System.currentTimeMillis();
        long elapsedTime = stopTime - startTime;

        
        //mostrando resultados
        for( i=0; i<n; i++){
            System.out.print(array[i]+"  ");
        }
        System.out.print("\nTempo Gasto: " + elapsedTime);
        System.out.print("\nSoma máxima: " + maxSoma + "\nInicio: " + inicio + "\nFim: " + fim);
    }
    
}
