/*
Part One - Output of original function:
The object's position after 10.0 seconds is 0.0 m.
*/
/*
Part Two - Modified Function:
*/
class GravityCalculator {
public static void main(String[] arguments) {
double acceleration = -9.81; // Earth's gravity in m/s^2
double initialVelocity = 0.0;
double time = 10.0;
double initialPosition = 0.0;
double finalPosition = 0.5 * acceleration * time * time + initialVelocity * time + initialPosition;
String finalPositionAsString = String.format("%.1f", finalPosition);
System.out.println("The object's position after " + time +
" seconds is " + finalPositionAsString + " m."); }
}
/*
Output of modified function:
The object's position after 10.0 seconds is -490.5 m.
*/
