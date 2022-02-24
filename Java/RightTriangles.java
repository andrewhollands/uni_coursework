import java.util.Scanner;

public class RightTriangles
{
    public static void main(String[] args)
    {
        Scanner sides = new Scanner(System.in);
        System.out.println("Enter the sides of a possible right triangle, separated by spaces. ");

        int a = sides.nextInt();
        int b = sides.nextInt();
        int c = sides.nextInt();
        double hypotenuseA = Math.sqrt( (int) Math.pow(b, 2) + (int) Math.pow(c, 2));
        double hypotenuseB = Math.sqrt( (int) Math.pow(a, 2) + (int) Math.pow(c, 2));
        double hypotenuseC = Math.sqrt( (int) Math.pow(a, 2) + (int) Math.pow(b, 2));

        if(a > b && a > c)
            if(a == hypotenuseA)
                System.out.println("Triangle is a right triangle.");
        if(b > a && b > c)
            if(b == hypotenuseB)
                System.out.println("Triangle is a right triangle.");
        if(c > a && c > b)
            if(c == hypotenuseC)
                System.out.println("Triangle is a right triangle.");
            else
            {
                System.out.println("Triangle is not a right triangle.");
            }
         if(a == b && a == c)
             System.out.println("Triangle is not a right triangle.");
    }
}
