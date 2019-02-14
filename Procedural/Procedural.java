//Ejemplo de programacion procedural en java
//Probado en https://www.tutorialspoint.com/compile_java_online.php

import java.util.*;
import java.lang.*;

public class Procedural
{  
    public static void main(String args[])
    {
        int a,b;
        double s;

        Scanner entrada = new Scanner(System.in);
        do {
            System.out.println("Limite Inferior:");
            a=entrada.nextInt();
            if(a<0) System.out.println("El numero no puede ser negativo"); 
        } while (a<0);

        do {
            System.out.println("Limite Superior:");
            b=entrada.nextInt();
            if(b<a) System.out.println("No puede ser menor que:" + a+"\n");
        } while (b<a);

        s=0.0;
        for (int i = a; i <=b; i++) {s+=Math.sqrt(i);}

        System.out.println("Sumatoria de raices de " + a + " a " +b +" = " +s);
    }
}