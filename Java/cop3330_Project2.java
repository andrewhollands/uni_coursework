/*
- Project 2
- Andrew Hollands
*/

import java.util.Scanner;
import java.util.ArrayList;
import java.text.DecimalFormat;

abstract class Person{

    private String fullName;
    private String ID;

    public Person(){}
    public Person(String fullName, String ID) {
        this.fullName = fullName;
        this.ID = ID;
    }

    abstract void printInformation();

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getID() {
        return ID;
    }

    public void setID(String ID) {
        this.ID = ID;
    }
}

public class cop3330_Project2 {
    public static void main(String[] args) {
        int input;
        DecimalFormat df = new DecimalFormat("0.00");
        Student student = new Student();
        Student student2 = new Student();
        Faculty faculty = new Faculty();
        Scanner scan = new Scanner(System.in);

        ArrayList<String> departmentList = new ArrayList<String>();
        departmentList.add("mathematics");
        departmentList.add("engineering");
        departmentList.add("arts");
        departmentList.add("science");

        ArrayList<String> rankList = new ArrayList<String>();
        rankList.add("professor");
        rankList.add("adjunct");

        do {
            System.out.println("\n1. Enter the information of the faculty");
            System.out.println("2. Enter the information of the two students");
            System.out.println("3. Print tuition invoice");
            System.out.println("4. Print faculty information");
            System.out.println("5. Exit Program\n");
            System.out.print("Enter your selection: ");

            input = scan.nextInt();

            if (input == 1) {
                String fName, lName, fullName = "", ID = "", department = "", rank = "";
                System.out.println("\n\tEnter faculty info: ");

                System.out.print("\tName of Faculty: ");
                fName = scan.next();
                lName = scan.next();
                fullName = fName + lName;
                System.out.print("\tID: ");
                ID = scan.next();
                System.out.print("\tRank: ");
                rank = scan.next();
                if (rankList.contains(rank.toLowerCase())) {
                    rank = scan.next();
                } else {
                    System.out.println("\t\tSorry, entered rank (" + rank + ") is invalid");
                    System.out.print("\tRank: ");
                    rank = scan.next();
                }

                System.out.print("\tDepartment: ");
                department = scan.next();
                if (departmentList.contains(department.toLowerCase())) {
                    faculty.setDepartment(department);
                } else {
                    System.out.println("\t\tSorry, entered department (" + department + ") is invalid");
                    System.out.print("\tDepartment: ");
                    faculty.setDepartment(scan.next());
                }

                System.out.println("\nThanks!\n");
            }

            if (input == 2) {
                if (student.getFirstName() != null | student.getLastName() != null) {
                    System.out.println("You already have two students filled in. Do you want to update their information?");
                    System.out.print("Yes or No: ");
                    String response = scan.next();
                    if ("Yes".equals(response)) {
                        System.out.println("\n\tEnter student 1 info:");
                        System.out.print("\tName of Student: ");
                        student.setFirstName(scan.next());
                        student.setLastName(scan.next());
                        System.out.print("\tID: ");
                        student.setID(scan.next());
                        System.out.print("\tGPA: ");
                        student.setGPA(scan.nextFloat());
                        System.out.print("\tCredit hours: ");
                        student.setHours(scan.nextInt());
                        System.out.println("Thanks!");

                        System.out.println("\n\tEnter student 2 info:");
                        System.out.print("\tName of student: ");
                        student2.setFirstName(scan.next());
                        student2.setLastName(scan.next());
                        System.out.print("\tID: ");
                        student2.setID(scan.next());
                        System.out.print("\tGPA: ");
                        student2.setGPA(scan.nextFloat());
                        System.out.print("\tCredit hours: ");
                        student2.setHours(scan.nextInt());
                        System.out.println("Thanks!");
                    }
                }
                else {
                    System.out.println("\n\tEnter student 1 info:");
                    System.out.print("\tName of Student: ");
                    student.setFirstName(scan.next());
                    student.setLastName(scan.next());
                    System.out.print("\tID: ");
                    student.setID(scan.next());
                    System.out.print("\tGPA: ");
                    student.setGPA(scan.nextFloat());
                    System.out.print("\tCredit hours: ");
                    student.setHours(scan.nextInt());
                    System.out.println("Thanks!");

                    System.out.println("\n\tEnter student 2 info:");
                    System.out.print("\tName of student: ");
                    student2.setFirstName(scan.next());
                    student2.setLastName(scan.next());
                    System.out.print("\tID: ");
                    student2.setID(scan.next());
                    System.out.print("\tGPA: ");
                    student2.setGPA(scan.nextFloat());
                    System.out.print("\tCredit hours: ");
                    student2.setHours(scan.nextInt());
                    System.out.println("Thanks!");
                }
            }

            if (input == 3) {
                System.out.print("\tWhich student? 1 " + student.getFirstName().substring(0, 1).toUpperCase() + student.getFirstName().substring(1).toLowerCase() + " " + student.getLastName().substring(0, 1).toUpperCase() + student.getLastName().substring(1).toLowerCase() + " or 2 " + student2.getFirstName().substring(0, 1).toUpperCase() + student2.getFirstName().substring(1).toLowerCase() + " " + student2.getLastName().substring(0, 1).toUpperCase() + student2.getLastName().substring(1).toLowerCase() + "? ");
                int response = scan.nextInt();
                if (response == 1)  {
                    System.out.println("\t---------------------------------------------------------------------------");
                    System.out.println("\t" + student.getFirstName().substring(0, 1).toUpperCase() + student.getFirstName().substring(1).toLowerCase() + " " + student.getLastName().substring(0, 1).toUpperCase() + student.getLastName().substring(1).toLowerCase() + "\t\t\t\t\t" + student.getID());
                    System.out.println("\tCredit hours: " + student.getHours() + " ($236.45/credit hour)");
                    System.out.println("\tFees: $52");
                    float payment = (float) (student.getHours() * 236.45 + 52);
                    float discount = payment * 25 / 100;
                    float discountedPayment = payment * 75 / 100;
                    if (student.getGPA() >= 3.84)    {
                        System.out.println("\n\tTotal payment: $" + df.format(discountedPayment) + "\t\t\t\t\t\t\t($" + df.format(discount) + " discount applied)");
                    }
                    else    {
                        System.out.println("\n\tTotal payment: $" + df.format(payment) + "\t\t\t\t\t\t\t\t ($0 discount applied)");
                    }
                    System.out.println("\t---------------------------------------------------------------------------");
                }
                if (response == 2)   {
                    System.out.println("\t---------------------------------------------------------------------------");
                    System.out.println("\t" + student2.getFirstName().substring(0, 1).toUpperCase() + student2.getFirstName().substring(1).toLowerCase() + " " + student2.getLastName().substring(0, 1).toUpperCase() + student2.getLastName().substring(1).toLowerCase() + "\t\t\t\t\t" + student2.getID());
                    System.out.println("\tCredit hours: " + student2.getHours() + " ($236.45/credit hour)");
                    System.out.println("\tFees: $52");
                    float payment2 = (float) (student2.getHours() * 236.45 + 52);
                    float discount2 = payment2 * 25 / 100;
                    float discountedPayment2 = payment2 * 75 / 100;
                    if (student2.getGPA() >= 3.85)    {
                        System.out.println("\n\tTotal payment: $" + df.format(discountedPayment2) + "\t\t\t\t\t\t\t($" + df.format(discount2) + " discount applied)");
                    }
                    else    {
                        System.out.println("\n\tTotal payment: $" + df.format(payment2) + "\t\t\t\t\t\t\t\t ($0 discount applied)");
                    }
                    System.out.println("\t---------------------------------------------------------------------------");
                }
            }

            if (input == 4) {
                System.out.println("---------------------------------------------------------------------------");
                System.out.println(faculty.getFirstName() + " " + faculty.getLastName());
                System.out.println(faculty.getDepartment().substring(0, 1).toUpperCase() + faculty.getDepartment().substring(1).toLowerCase() + " Department, " + faculty.getRank().substring(0, 1).toUpperCase() + faculty.getRank().substring(1).toLowerCase());
                System.out.println("---------------------------------------------------------------------------");
            }
        }

        while (input != 5);  {
            System.out.println("\n\nGoodbye!");
            System.exit(0);
        }
    }
}


class Student extends Person{

// Specified attributes

    private double gpa;
    private int noOfCreditHours;

    // Declaring a discount variable because we have to show it
    public double discount = 0;

// Two constructors

    public Student(double gpa, int noOfCreditHours) {
        this.gpa = gpa;
        this.noOfCreditHours = noOfCreditHours;
    }

    public Student(String fullName, String ID, double gpa, int noOfCreditHours) {
        super(fullName, ID);
        this.gpa = gpa;
        this.noOfCreditHours = noOfCreditHours;
    }

// All Getters & setters

    public double getGpa() {
        return gpa;
    }

    public void setGpa(double gpa) {
        this.gpa = gpa;
    }

    public int getNoOfCreditHours() {
        return noOfCreditHours;
    }

    public void setNoOfCreditHours(int noOfCreditHours) {
        this.noOfCreditHours = noOfCreditHours;
    }

    // Overriding all methods of Parent class
    @Override
    public String getFullName() {
        return super.getFullName();
    }

    @Override
    public void setFullName(String fullName) {
        super.setFullName(fullName);
    }

    @Override
    public String getID() {
        return super.getID();
    }

    @Override
    public void setID(String ID) {
        super.setID(ID);
    }

// A method tuition invoice for calculating total payment & return it

    public double tuitionInvoice(){
// Students pay $236.45 per credit hour in addition to a $52 administrative fee

        double totalPayment = ( noOfCreditHours * 236.45) + 52.00;

// students get a 25% off total payment if their gpa is greater or equal to 3.85

        if(this.gpa >= 3.85){

            discount = totalPayment * (25 / 100);
            totalPayment -= discount;
        }
        return totalPayment;
    }

    @Override
    void printInformation() {

        System.out.println("\nHere is the tuition invoice for "+getFullName()+" :");
        System.out.println("---------------------------------------------------------------------------\n");
        System.out.println(getFullName()+"\t"+getID()+"\n"+
                "Credit Hours: "+getNoOfCreditHours()+" ($236.45/credit hour)\n"+
                "Fees: $52\nTotal Payment: $"+tuitionInvoice()+"\t"+"($"+discount+" discount applied)");
        System.out.println("---------------------------------------------------------------------------\n");
    }
}

// Staff class inheriting Person class

class Staff extends Person{

    // attributes
    private String department;
    private String rank;

// Constructors

    public Staff(String department, String rank) {
        this.department = department;
        this.rank = rank;
    }

    public Staff(String fullName, String ID, String department, String rank) {
        super(fullName, ID);
        this.department = department;
        this.rank = rank;
    }


//Getters & setters

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public String getRank() {
        return rank;
    }

    public void setRank(String rank) {
        this.rank = rank;
    }


// Overriding methods

    @Override
    public String getFullName() {
        return super.getFullName();
    }

    @Override
    public void setFullName(String fullName) {
        super.setFullName(fullName);
    }

    @Override
    public String getID() {
        return super.getID();
    }

    @Override
    public void setID(String ID) {
        super.setID(ID);
    }

    @Override
    void printInformation() {
        System.out.println("---------------------------------------------------------------------------\n");
        System.out.println(getFullName()+"\n"+getDepartment()+" Department, "+getRank());
        System.out.println("---------------------------------------------------------------------------\n");
    }
}
