/* Project IV - Interpolation of Polynomials 
Created by Matthew Hibbert, Andrew Hollands, Jerome Konieczka, ChrXistopher Stephens 
The purpose of this program is to approximate a given function f(x) = 1 / (cx^2 + 1)
for values of c = 1, 4, and 25 through Newton's method of polynomial interpolation
using equally-distanced nodes */

import java.util.*;

public class equidistantApproximation {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in); // Create scanner object
		double c; // Declare double c
		System.out.println("Enter value of n: "); // Print message to user
		int n = sc.nextInt(); // Read integer from user
		double[] co = new double [n]; // Declare double array
		double[] x = new double[n]; // Declare double array
		System.out.println("Enter value of c: "); // Print message to user
		c = sc.nextDouble(); // Read double from user
		for(int i = 0; i < n; i++) { // Loop until i reaches n
			x[i] = ((double) 2 * i) / n - 1; // Calculate i-th value of x_n
		}
		co[0] = f(x[0], c);  // Initialize co array
		for (int a = 1; a < n; a++)	{ // Loop until a reaches n
			double temp = f(x[a], c); // Declare temp double
			for (int i = 0; i < a; i++){ // Loop until i reaches a
				double product = co[i]; // Declare and calculate i-th value of co array
				for (int j = 0; j < i; j++){ // Loop until j reaches i
					product *= (x[a] - x[j]); // Calculate j-th product
				}
				temp -= product; // Calculate i-th subtraction summation of product values
			}
			for (int j = 0; j < a; j++){ // Loop until j reaches a
					temp /= x[a] - x[j]; // Calculate j-th division summation of x values
				}
			co[a] = temp; // Initialize a-th value of co array
		}
		for (int i = 0; i < n; i++)	{ // Loop until i reaches n
			System.out.println("c_" + i + " = " + co[i]); // Print message to user
		}
		System.out.println(""); // Print message to user
		System.out.println(""); // Print message to user
		System.out.print("p_"+ (n-1) + "(x) = "); // Print message to user
		for (int i = 0; i < n; i++) { // Loop until i reaches n
			System.out.printf("%.3f ", co[i] ); // Print message to user
			if (i < n - 1) // If i < n - 1
				System.out.printf("+ (x - %.3f)(", x[i]); // Print message to user
		}
		for (int i = 0; i < n - 1; i++) { // Loop until i reaches n - 1
			System.out.printf(")"); // Print message to user
		}
	}
	static double f(double x, double c) {
		return 1 / (c * Math.pow(x, 2) + 1); // Print result to console
	}
	static double eval(double t, double[] coArr, int size, double[] x) {
		// This function evaluates the interpolated polynomial p(t)
		// This function implements the nested Newton method of evaluation
		// x is the array of values used for interpolation
		double ans = coArr[size - 1]; // Declare ans
		for (int i = size - 2; i >= 0; i--)	{
			ans = ans * (t - x[i]) + coArr[i]; // Update ans to satsify i-th addition of the succeding product
		}
		return ans; // Print ans to console
	}
}
