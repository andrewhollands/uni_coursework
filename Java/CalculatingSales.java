import java.util.Scanner;

public class CalculatingSales {
    public static void main(String[] args) {
        Scanner productNumber = new Scanner(System.in);
        double totalRetail = 0;
        while (true) {
            System.out.println("JavaCoffeeShop.com sells five different products and are priced as follows.");
            System.out.println("Product 1: $2.98\nProduct 2: $4.50\nProduct 3: $9.98\nProduct 4: $4.49\nProduct 5: $6.87");
            System.out.println("Enter the product number you wish to purchase.");
            int productChoice = productNumber.nextInt();
            if (productChoice < 1 | productChoice > 5) {
                break;
            }
            System.out.println("Enter quantity you wish to purchase.");
            int quantitySold = productNumber.nextInt();
            switch (productChoice) {
                case 1:
                    totalRetail += 2.98 * quantitySold;
                    break;
                case 2:
                    totalRetail += 4.50 * quantitySold;
                    break;
                case 3:
                    totalRetail += 9.98 * quantitySold;
                    break;
                case 4:
                    totalRetail += 4.49 * quantitySold;
                    break;
                case 5:
                    totalRetail += 6.87 * quantitySold;
                    break;
            }
            System.out.println("The total retail value of all the products sold is $" + totalRetail);
        }
    }
}
