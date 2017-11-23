/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import static java.lang.Integer.MIN_VALUE;
import java.util.Scanner;

/**
 *
 * @author claudia
 */
public class MaxSubarrayV2 {

    /**
     * @param args the command line arguments
     * @throws java.io.FileNotFoundException
     */
    public static void main(String[] args) throws FileNotFoundException {
        Scanner keyboard = new Scanner(System.in);
        System.out.println("Digite o tamanho do vetor");
        int n = keyboard.nextInt();
  
        int i =0;
  
        int array[] = new int[n]; 
        
        Scanner scan = new Scanner(new File("array_100.txt"));
            while(scan.hasNextLine()){
                String line = scan.nextLine();
                        array[i] = Integer.parseInt(line);
                        i++;
        }
        
       int soma, maxSoma = MIN_VALUE;
       int inicio = 0;
       int fim = 0;
       
       long startTime = System.currentTimeMillis();
         
        
       for(i=0; i<n; i++)
       {
           soma = 0;
           for(int j=i; j<n; j++)
           {
               soma += array[j];
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
        
       
        for(i=0; i<n; i++){
            System.out.print(array[i]+"  ");
        }
        
        System.out.print("\nTempo Gasto: " + elapsedTime);
        System.out.print("\nSoma máxima: " + maxSoma + "\nInicio: " + inicio + "\nFim: " + fim);
       
    }
    
}
