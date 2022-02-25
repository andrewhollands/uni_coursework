package sequencealignment;
/* Name:
 * Andrew Hollands
 * COP3503 Fall 2021
 * Programming Assignment 4
 */

public class SequenceAlignment {

    private String str1;
    private String str2;
    private int lenStr1 = str1.length(); // m = X.length
    private int lenStr2 = str2.length(); // n = Y.length

    // Constructor for SequenceAlignment
    public SequenceAlignment(String str1, String str2)    {
        setStr1(str1);
        setStr2(str2);
    }

    // Getters and setters for SequenceAlignment variables
    public String getStr1() {
        return str1;
    }

    public void setStr1(String str1) {
        this.str1 = str1;
    }

    public String getStr2() {
        return str2;
    }

    public void setStr2(String str2)    {
        this.str2 = str2;
    }

    public int getLenStr1() {
        return lenStr1;
    }

    public void setLenStr1(int lenStr1) {
        this.lenStr1 = lenStr1;
    }

    public int getLenStr2() {
        return lenStr2;
    }

    public void setLenStr2(int lenStr2) {
        this.lenStr2 = lenStr2;
    }

    public int[][] computeAlignment(int delta) {
        int alpha = 0; // cost variable, comparer of characters in str1 and str2
        int seqAliAGrid[][] = null; // initialize empty grid for sequence alignment solution grid A
        int seqAliBGrid[][] = null; // initialize empty grid for sequence alignment solution grid B
        int seqAliBGridVar;

        for (int i = 0; i <= lenStr1; i++)  { // iterate through first (0-th) column
            seqAliAGrid[i][0] = i * delta; // fill first (0-th) column
        }
        for (int j = 0; j <= lenStr2; j++) { // iterate through first (0-th) column
            seqAliAGrid[0][j] = j * delta; // fill first (0-th) column
        }
        for (int i = 1; i <= lenStr1; i++)  {
            for (int j = 1; j <= lenStr2; j++)  {
                if (str1.charAt(i) == str2.charAt(j)) // same letter: cost = 0
                    alpha = 0;
                else if ((str1.charAt(i) == 'a' || // vowel and different vowel: cost = 1
                         str1.charAt(i) == 'e' ||
                         str1.charAt(i) == 'i' ||
                         str1.charAt(i) == 'o' ||
                         str1.charAt(i) == 'u') &&
                                 (str2.charAt(j) == 'a' ||
                                 str2.charAt(j) == 'e' ||
                                 str2.charAt(j) == 'i' ||
                                 str2.charAt(j) == 'o' ||
                                 str2.charAt(j) == 'u'))
                    alpha = 1;
                else if ((str1.charAt(i) != 'a' || // consonant and different consonant: cost = 1
                        str1.charAt(i) != 'e' ||
                        str1.charAt(i) != 'i' ||
                        str1.charAt(i) != 'o' ||
                        str1.charAt(i) != 'u') &&
                        (str2.charAt(j) != 'a' ||
                                str2.charAt(j) != 'e' ||
                                str2.charAt(j) != 'i' ||
                                str2.charAt(j) != 'o' ||
                                str2.charAt(j) != 'u'))
                    alpha = 1;
                else // vowel and consonant: cost = 3
                    alpha = 3;
                int a = alpha + seqAliAGrid[i - 1][j - 1];
                int b = delta + seqAliAGrid[i - 1][j];
                int c = delta + seqAliAGrid[i][j - 1];
                int min = Math.min(Math.min(a, b), c);
                seqAliAGrid[i][j] = min;
                if (a == min)
                    seqAliBGridVar = 0; // diagonal arrow
                else if (b == min)
                    seqAliBGridVar = 1; // vertical arrow
                else
                    seqAliBGridVar = 2; // horizontal arrow

            }
        }
        return seqAliAGrid;
    }

    //public Comparable<String> getAlignment() {
       // return seqAliBGrid;
    //}
}
