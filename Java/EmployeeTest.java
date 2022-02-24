public class EmployeeTest
{
    public static void main(String[] args)
    {
        Employee employee1 = new Employee("Andrew ", "Hollands' ", 500);
        Employee employee2 = new Employee("Grace ", "Song's ", 1000);

        System.out.println("\n" + employee1.getFirstName() + employee1.getLastName() + "annual salary is: " + (12 * employee1.getMonthlySalary()));
        System.out.println(employee2.getFirstName() + employee2.getLastName() + "annual salary is: " + (12 * employee2.getMonthlySalary()));

        double newMonthlySalary1 = employee1.getMonthlySalary() * 1.10;
        employee1.setMonthlySalary(newMonthlySalary1);
        double newMonthlySalary2 = employee2.getMonthlySalary() * 1.10;
        employee2.setMonthlySalary(newMonthlySalary2);

        System.out.println(employee1.getFirstName() + employee1.getLastName() + "annual salary is: " + (12 * employee1.getMonthlySalary()));
        System.out.println(employee2.getFirstName() + employee2.getLastName() + "annual salary is: " + (12 * employee2.getMonthlySalary()));
    }
}
class Employee
{
    private String firstName;
    private String lastName;
    private double monthlySalary;

    public Employee(String firstName, String lastName, double monthlySalary)
    {
        this.firstName = firstName;
        this.lastName = lastName;
        if (monthlySalary > 0)
        {
            this.monthlySalary = monthlySalary;
        }
    }

    public String getFirstName()
    {
        return firstName;
    }

    public void setFirstName(String firstName)
    {
        this.firstName = firstName;
    }

    public String getLastName()
    {
        return lastName;
    }

    public void setLastName(String lastName)
    {
        this.lastName = lastName;
    }

    public double getMonthlySalary()
    {
        return monthlySalary;
    }

    public void setMonthlySalary(double monthlySalary)
    {
        if (monthlySalary > 0)
        {
            this.monthlySalary = monthlySalary;
        }
    }
}
