/* Name:
 * Dr. Andrew Steinberg
 * COP3503 Fall 2021
 * Programming Assignment 3
 */
import java.io.*;

import lcs.LCS; //package name lcs... class name LCS

public class LCSRunner {
    
    
    public static void main(String args[]) throws FileNotFoundException, IOException{
        
        int pass = 0; //start with 0 pass test cases
        
        System.out.println("Beginning Test Cases...");
        System.out.println("****************************************");
        System.out.println("Starting with a simple test case...");
        
        LCS test1 = new LCS("abcbdab", "bdcaba"); //create first scenario
        
        test1.lcsDynamicSol(); //calling dynamic programming solution
        
        if(test1.getLCS().compareTo("bcba") == 0) //checking to see if solution is correct
        {
            System.out.println("Test Case 1 Passed!");
            pass = pass + 1;
        }
        
        System.out.println("****************************************");
        
        System.out.println("Starting with another simple test case...");
        
        LCS test2 = new LCS("acadb", "cbda"); //create second scenario
        
        test2.lcsDynamicSol();
        
        if(test2.getLCS().compareTo("ca") == 0)
        {
            System.out.println("Test Case 2 Passed!");
            pass = pass + 1;
        }
        
        System.out.println("****************************************");
        
        System.out.println("****************************************");
        
        System.out.println("Starting with even another simple test case..."); //create third scenario
        
        LCS test3 = new LCS("cabdcac", "acadbc");
        
        test3.lcsDynamicSol();
        
        if(test3.getLCS().compareTo("cabc") == 0)
        {
            System.out.println("Test Case 3 Passed!");
            pass = pass + 1;
        }
        
        System.out.println("****************************************");
        
        System.out.println("Now time for the big test case...");
        
        File file=new File("message.txt"); 
        FileReader fr=new FileReader(file);   //reads the file  
        BufferedReader br=new BufferedReader(fr);
         
        String line;  
        System.out.println("Scanning the file...");
        
        String s1 = br.readLine();
        String s2 = br.readLine();
 
        
        fr.close();    //closes the file!!!
        System.out.println("Scanning the file complete");
        LCS test4 = new LCS(s1, s2); //create big scenario
        
        test4.lcsDynamicSol();
        

       
        if(test4.getLCS().length() == 217) //the lcs returned is 217 characters long
        {
            System.out.println("Test Case 4 Passed!");
            pass = pass + 1;
        }
        
        System.out.println("****************************************");
        
        if(pass == 4)
            System.out.println("Yay! All test cases passed!");
        else
            System.out.println("Oh No! Some test case didn't pass!");
    }
    
}
