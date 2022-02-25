package lcs;
/* Name:
 * Andrew Hollands
 * COP3503 Fall 2021
 * Programming Assignment 3
 */

public class LCS {

    private String str1;
    private String str2;
    private int lenStr1 = str1.length(); // m = X.length
    private int lenStr2 = str2.length(); // n = Y.length

    // Constructor for LCS
    public LCS(String str1, String str2)    {
        setStr1(str1);
        setStr2(str2);
    }

    // Getters and setters for LCS variables
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

    // Computing the length of LCS
    public int[][] lcsDynamicSol(String str1, String str2) {

        int lcsCGrid[][] = null; // initialize empty grid for LCS solution C
        int lcsBGrid[][] = null; // initialize empty grid for LCS solution B

        for (int i = 0; i <= lenStr1; i++)  { // iterate through first (0-th) column
            lcsCGrid[i][0] = 0; // fill first (0-th) column with zeros
        }
        for (int j = 0; j <= lenStr2; j++) { // iterate through first (0-th) row
            lcsCGrid[0][j] = 0; // fill first (0-th) row with zeros
        }
        for (int i = 0; i <= lenStr1; i++)  {
            for (int j = 0; j <= lenStr2; j++)  {
                if (str1.charAt(i) == str2.charAt(j)) {
                    lcsCGrid[i][j] = lcsCGrid[i - 1][j - 1] + 1;
                    lcsBGrid[i][j] = 0;
                }
                else if (lcsCGrid[i - 1][j] >= lcsCGrid[i][j - 1])  {
                    lcsCGrid[i][j] = lcsCGrid[i - 1][j];
                    lcsBGrid[i][j] = 1;
                }
                else    {
                    lcsCGrid[i][j] = lcsCGrid[i][j - 1];
                    lcsBGrid[i][j] = 2;
                }
            }
        }
        return lcsCGrid;
    }

    // Constructing the LCS
    public void getLCS(lcsBGrid, str1, lenStr1, lenStr2)    {

        if (lenStr1 == 0 || lenStr2 == 0)
            return;
        if (lcsBGrid[lenStr1][lenStr2] == 0) {
            getLCS(lcsBGrid, str1, lenStr1 - 1, lenStr2 - 1);
            System.out.println(str1.charAt(lenStr1));
        }
        else if (lcsBGrid[lenStr1][lenStr2] == 1)   {
            getLCS(lcsBGrid, str1, lenStr1 - 1, lenStr2);
        }
        else
            getLCS(lcsBGrid, str1, lenStr1, lenStr2 - 1);
    }
}
