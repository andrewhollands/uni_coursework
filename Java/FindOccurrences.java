import java.util.ArrayList;
import java.util.Scanner;

class FindOccurrences {

    public static ArrayList<Occurrence> findOccurrences(float[] arr) {
        ArrayList<Occurrence> list = new ArrayList<>();
        for (int i = 0; i < arr.length; i++) {
            int index = -1;
            for (int j = 0; j < list.size(); j++) {
                if (list.get(j).getNumber() == arr[i])
                    index = j;
            }
            if (index == -1) {
                index = list.size();
                list.add(new Occurrence(arr[i]));
            }
            list.get(index).increaseCount();
        }
        return list;
    }

    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        System.out.print("Enter your six numbers: ");
        float[] arr = new float[6];
        for (int i = 0; i < arr.length; i++) {
            arr[i] = in.nextFloat();
        }
        System.out.println("\nThank you!");
        System.out.println("\nHere is your frequency table:");
        ArrayList<Occurrence> occurrences = findOccurrences(arr);
        for (int i = 0; i < occurrences.size(); i++) {
            System.out.println(occurrences.get(i));
        }
    }
}

class Occurrence {

    private float number;
    private short occurring;

    public Occurrence() {
    }

    public Occurrence(float number) {
        this.number = number;
    }

    public float getNumber() {
        return number;
    }

    public void setNumber(float number) {
        this.number = number;
    }

    public short getOccurring() {
        return occurring;
    }

    public void setOccurring(short occurring) {
        this.occurring = occurring;
    }

    public void increaseCount() {
        occurring++;
    }

    public String toString() {
        return "number: " + number + ", occurring: " + occurring;
    }
}
