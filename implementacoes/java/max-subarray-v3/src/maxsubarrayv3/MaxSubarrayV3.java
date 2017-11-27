/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
//package maxsubarrayv3;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;
/**
 *
 * @author claudia
 */
public class MaxSubarrayV3 {

    /**
     * @param args the command line arguments
     * @throws java.io.FileNotFoundException
     */
    public static void main(String[] args) throws FileNotFoundException {
        Scanner keyboard = new Scanner(System.in);
        System.out.println("Digite o tamanho do vetor");
        int n = keyboard.nextInt();
        
        int i =0;
  
        int array[] = null; 
        
        array = new int[n];

        Scanner scan = new Scanner(new File("array_1000.txt"));
        while(scan.hasNextLine()){
            String line = scan.nextLine();
                    array[i] = Integer.parseInt(line);
                    i++;
        }
        
         for(i=0; i<n; i++){
            System.out.print(array[i]+"  ");
        }
        
        
        long startTime = System.currentTimeMillis();

        Subvetor maxSubvetor = new Subvetor();
        maxSubvetor = Subvetor.subvetor_maximo(array, 0, n-1);
        
        long stopTime = System.currentTimeMillis();
        long elapsedTime = stopTime - startTime;
        
//        for(i=0; i<n; i++){
//            System.out.print(array[i]+"  ");
//        }
        System.out.print("\nTempo Gasto: " + elapsedTime);
        System.out.print("\nSoma máxima: " + maxSubvetor.soma + "\nInicio: " + maxSubvetor.inicio + "\nFim: " + maxSubvetor.fim);
         
    }

    
}
