import java.util.*;
import java.io.InputStream;

public class GreedyLab {

  public static class TernaryTrieNode implements Comparable<TernaryTrieNode> {
    TernaryTrieNode zero, one, two;
    String identity;
    int frequency;
    TernaryTrieNode(String s, int f) {
      identity = s;
      frequency = f;
    }
    TernaryTrieNode(char c, int f) {
      identity = Character.toString(c);
      frequency = f;
    }
    TernaryTrieNode(TernaryTrieNode z, TernaryTrieNode o, TernaryTrieNode t) {
      zero = z;
      one = o;
      two = t;
      identity = "";
      frequency = 0;
      if (z != null) {
        identity += z.identity;
        frequency += z.frequency;
      }
      if (o != null) {
        identity += o.identity;
        frequency += o.frequency;
      }
      if (t != null) {
        identity += t.identity;
        frequency += t.frequency;
      }
    }
    public int compareTo(TernaryTrieNode t) {
      return this.frequency - t.frequency;
    }
    public String toString() {
      return identity + " " + frequency;
    }
    public void print() {
      System.out.println(this.toString());
    }
  }

  public static class TernaryTrieTree {
    PriorityQueue<TernaryTrieNode> freqTable;
    TernaryTrieTree(char letters[], int frequencies[]) {
      int n = letters.length;
      if (n != frequencies.length) {
        System.err.println("Each letter needs a matching frequency.");
        return;
      }
      freqTable = new PriorityQueue<TernaryTrieNode>();
      for (int i = 0; i < n; i++) {
        freqTable.add(new TernaryTrieNode(letters[i], frequencies[i]));
      }
    }
    public void makeHuffmanTrie() {
      while (!freqTable.isEmpty() && freqTable.size() != 1) {
        TernaryTrieNode bigParent = new TernaryTrieNode(
        freqTable.poll(), freqTable.poll(), freqTable.poll()
        );
        freqTable.offer(bigParent);
      }
    }
    public void inOrderHuffCode(TernaryTrieNode n, String code) {
      if (n.zero != null)
        inOrderHuffCode(n.zero, code + "0");
      if (n.one != null)
        inOrderHuffCode(n.one, code + "1");
      if (n.two != null)
        inOrderHuffCode(n.two, code + "2");
      if (n.zero == null && n.one == null && n.two == null)
        System.out.println(n.identity + ": " + code);
    }
    public void inOrder(TernaryTrieNode n) {
      n.print();
      if (n.zero != null)
        inOrder(n.zero);
      if (n.one != null)
        inOrder(n.one);
      if (n.two != null)
        inOrder(n.two);
    }
    public void print() {
      if (freqTable.size() == 0) {
        System.out.println("The trie is empty.");
        return;
      }
      else if (freqTable.size() == 1) {
        inOrder(freqTable.peek());
        return;
      } else {
        for (TernaryTrieNode n : freqTable) {
          n.print();
        }
      }
    }
    public void getHuffCodes() {
      makeHuffmanTrie();
      TernaryTrieNode root = freqTable.peek();
      inOrderHuffCode(root, "");
    }
  } // Everything below this except for main() is for the office hours problem.


  // Simple interval object
  public static class Interval implements Comparable<Interval>{
    int start, duration, end;
    Interval(int st, int dur) {
      start = st;
      duration = dur;
      end = st + dur;
    }

    public int compareTo(Interval i) {
      return this.end - i.end;
    }
    // Checks for every 5-min interval where there could be an overlap
    // If there's any places with overlaps, that's a spot only that student
    // can use, which guarantees they can be taught.
    public boolean anyNonOverlaps(PriorityQueue<Interval> intervals) {
      for (int i = 0; i < duration; i += 5) {
        boolean anyOverlaps = false;
        for (Interval in : intervals) {
          if (in.start <= (duration + i) && in.end >= (duration + i + 5)) {
            anyOverlaps = true;
          }
        }
        if (!anyOverlaps)
          return true;
      }
      return false;
    }
  }
  // Modified simple bubble sort to finish slightly faster, and also to work
  // for a 2d array
  public static void quickBubbleSort(int [][] times, int n) {
    for (int i = 0; i < n-1; i++) {
      boolean isValid = true;
      for (int j = 0; j < n-i-1; j++)
      if (times[j][0] + times[j][1] > times[j+1][0] + times[j+1][1])
      {
        isValid = false;
        int swap[] = times[j];
        times[j] = times[j+1];
        times[j+1] = swap;
      }
      if (isValid)
        return;
    }
  }

  public static int getMaxStudents(int [][] times, int n) {
    quickBubbleSort(times, n);
    PriorityQueue<Interval> intervals = new PriorityQueue<Interval>();
    int numOfStudents = 0;
    for (int i = 0; i < n; i++) {
      Interval current = new Interval(times[i][0], times[i][1]);
      if ((current.duration % 5)> intervals.size() || current.anyNonOverlaps(intervals)) {
        intervals.add(current);
        numOfStudents++;
      }
    }
    return numOfStudents;
  }

  public static void main(String [] args) {
    System.out.println("\nOffice Hours Problem Solution: ");
    int times[][] = {{5, 15}, {10, 30}, {30, 10}, {15, 15}, {20, 15}, {10, 5}, {0, 20}, {30, 20}};
    System.out.println(getMaxStudents(times, 8));

    System.out.println("\nTernary Huffman Extension Problem: ");
    //System.out.println("I'm hardcoding the values for my Huffman ternary trie.");
    //System.out.println("If you need to change the parameters for whatever reason,");
    //System.out.println("you can change it in the code.");
    char letters[] = { 'A', 'B', 'C', 'D', 'E', 'F', 'G' };
    int frequencies[] = { 384, 67, 109, 212, 581, 125, 94 };
    TernaryTrieTree huffmanTrie = new TernaryTrieTree(letters, frequencies);
    huffmanTrie.getHuffCodes();
  }
}
