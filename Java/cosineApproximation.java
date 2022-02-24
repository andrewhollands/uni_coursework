/* Project IV - Interpolation of Polynomials 
Created by Matthew Hibbert, Andrew Hollands, Jerome Konieczka, Christopher Stephens 
The purpose of this program is to approximate a given function f(x) = 1 / (cx^2 + 1)
for values of c = 1, 4, and 25 through Newton's method of polynomial interpolation
using cosine-determined spaced nodes */

import java.util.*;

public class cosineApproximation {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in); // Create scanner object
		double c; // Declare double c
		while(true) { // Loop while true (>=0)
			System.out.println("Enter value of n (-1 to exit): "); // Print message to user
			int n = sc.nextInt(); // Declare and initialize integer n
			if (n == -1) // If n = -1
				break; // Exit program
			double[] co = new double [n]; // Declare double array co
			double[] x = new double[n]; // Declare double array x
			System.out.println("Enter value of c: ");
			c = sc.nextDouble(); // Initialize double c
			for (int i = 0; i < n; i++) { // Loop until i reaches n
				x[i] = Math.cos(((2 * (i + 1) - 1) * Math.PI) / (2 * n)); // Calculate i-th value of x
				System.out.println("x_" + i + "= " + x[i]); // Print message to user
			}
			co[0] = f(x[0], c); // Calculate 0-th value of co
			for (int a = 1; a < n; a++)	{ // Loop until a reaches n
				double temp = f(x[a], c); // Declare double temp
				for (int i = 0; i < a; i++)	{ // Loop until i reaches a
					double product = co[i]; // Declare and calculate i-th value of double co which is equal 
					for (int j = 0; j < i; j++)	{ // Loop until j reaches i
						product *= (x[a] - x[j]); // Update the product double product summation
					}
					temp -= product; // Update the temp double subtraction summation
				}
				for (int j = 0; j < a; j++)	{ // Loop until j reaches a
						temp /= x[a] - x[j]; // Update the temp double division summation
					}
				co[a] = temp; // Calculate and equate the a-th value of co to temp
			}
			for (int i = 0; i < n; i++) { // Loop until i reaches n
				System.out.println("c_" + i + " = " + co[i]); // Print message to user
			}
			System.out.println(""); // Print message to user
			System.out.println(""); // Print message to user
			System.out.print("p_"+ (n-1) + "(x) = "); // Print message to user
			for (int i = 0; i < n; i++) { // Loop until i reaches n
				System.out.printf("%.3f ", co[i]); // Print message to user
				if (i < n - 1) // If i < n - 1
					System.out.printf("+ (x - %.3f)(", x[i]); // Print message to user
			}
			for (int i = 0; i < n - 1; i++) { // Loop until i reaches n - 1
				System.out.printf(")"); // Print message to user
			}
			System.out.println(""); // Print message to user
		}
	}
	static double f(double x, double c) {
		return 1 / (c * Math.pow(x, 2) + 1); // Print function to console
	}
	static double eval(double t, double[] coArr, int size, double[] x) {
		double ans = coArr[size - 1]; // Declare double ans
		for (int i = size - 2; i >= 0; i--){ // Loop until i reaches 0
			ans = ans * (t - x[i]) + coArr[i]; // Update ans double multiplication summation
		}
		return ans; // Print value to console
	}
}
