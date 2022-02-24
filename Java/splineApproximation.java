/* Project IV - Interpolation of Polynomials 
Created by Matthew Hibbert, Andrew Hollands, Jerome Konieczka, Christopher Stephens 
The purpose of this program is to approximate a given function f(x) = 1 / (cx^2 + 1) 
for values of c = 1, 4, and 25 through construction of natural cubic splines */

import java.util.*;

public class splineApproximation {
	public static void main(String[] args) {
		int curI = 0; // Declare and initialize curI to 0
		Scanner sc = new Scanner(System.in); // Create scanner object
		int n; // Declare integer n
		double c; // Declare double c
		while (true) { // Loop while true (>=0)
			System.out.println("\nEnter value of n (-1 to exit): "); // Print message to user
			n = sc.nextInt(); // Read integer from user
			if (n == -1) // If n = -1
				break; // Exit program
			System.out.println("Enter value of c: "); // Print message to user
			c = sc.nextDouble(); // Read double from user
			double[] t = new double[n + 1]; // Declare double array t
			double[] y = new double [n + 1]; // Declare double array y
			double[] z = new double [n + 1]; // Declare double array z
			double [] u = new double [n]; // Declare double array u
			double [] v = new double [n]; // Declare double array v
			double [] h = new double [n]; // Declare double array h
			double [] b = new double [n]; // Declare double array b
			t[0] = -1; // Initilize 0-th value of t
			t[n] = 1; // Initilize n-th value of t
			y[0] = f(-1, c); // Initilize 0-th value of y
			y[n] = f(1, c); // Initilize n-th value of y
			for (int i = 1; i < n; i++)	{ // Loop until i reaches n
				t[i] = 2.0 * i / n - 1; // Calculate i-th value of t
				System.out.printf("t_%d = %.3f\n", i, t[i]); // Print message to user
				y[i] = f(t[i], c); // Calculate i-th value of y
			}
			for (int i = 0; i < n; i++)	{ // Loop until i reaches n
				h[i] = t[i + 1] - t[i]; // Calculate i-th value of h
				b[i] = (y[i + 1] - y[i]) / h[i]; // Calculate i-th value of b
			}
			u[1] = 2 * (h[0] + h[1]);  // Calculate 1-th value of u
			v[1] = 6 * (b[1] - b[0]); // Calculate 1-th value of v
			for (int i = 2; i < n; i ++)	{ // Loop until i reaches n
				u[i] = 2 * (h[i] + h[i - 1]) - Math.pow(h[i - 1], 2) / u[i - 1]; // Calculate i-th value of u
				v[i] = 6 * (b[i] - b[i - 1]) - (h[i - 1] * v[i - 1]) / u[i - 1]; // Calculate i-th value of v
			}
			z[n] = 0; // Initialize n-th value of z
			for (int i = n - 1; i > 0; i--)	{ // Loop until i reaches 0
				z[i] = (v[i] - h[i] * z[i + 1]) / u[i]; // Calculate i-th value of z
			}
			z[0] = 0; // Initialize 0-th value of z
			for (int i = 0; i <= n; i++)	{ // Loop until i reaches n
				System.out.println("z_" + i + "= " + z[i]); // Print message to user
			}
			System.out.println("S(x) = {"); // Print message to user
			for (int i = 0; i < n; i++)	{ // Loop until i reaches n
				double t1, t2; // Declare doubles t1 and t2
				System.out.printf("%.2f + (x - %.2f)(%f + (x - %.2f)(%.2f/2 + 1/(6*%.2f)(x-%.2f)(%.2f - %.2f))), ", y[i], t[i], b[i], t[i], z[i], h[i], t[i],z[i+1], z[i]);
				System.out.printf(" %.2f <= x <= %.2f\n", t[i], t[i + 1]);
			}
			System.out.printf("S_" + n +"(x) = { "); // Print message to user
			for (int i = 0; i < n; i++)	{ // Loop until i reaches n
				double t1, t2; // Declare doubles t1 and t2
				System.out.printf("y%d = {%.2f <= x <= %.2f: ", i + curI, t[i], t[i + 1]); // Print message to user
				System.out.printf("%.2f + (x - %.2f)(%f + (x - %.2f)(%.2f/2 + 1/(6*%.2f)(x-%.2f)(%.2f - %.2f)))}\n", y[i], t[i], b[i], t[i], z[i], h[i], t[i],z[i+1], z[i]);  // Print message to user
			}
			for (int i = 0; i < n; i++)	{ // Loop until i reaches n
				double t1, t2; // Declare doubles t1 and t2
				System.out.printf("%.2f <= x <= %.2f:  abs(f(x) - y%d),", t[i], t[i + 1], i + curI); // Print message to user
			}
			curI += n; // Update summation of curI, adding n
		}
	}
	public static double f(double x, double c) {
		return 1 / (c * Math.pow(x, 2) + 1); // Print value to console
	}
}
