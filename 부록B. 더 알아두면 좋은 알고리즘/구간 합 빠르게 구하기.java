import java.util.*;

public class main {
    public static void main(String[] args) {
        int n = 5;
        int[] data = new int[]{ 10, 20, 30, 40, 50 };

        int sumValue = 0;
        int[] prefixSum = new int[n+1];
        for(int i=1; i<prefixSum.length; i++) {
            sumValue += data[i-1];
            prefixSum[i] = sumValue;
        }

        int left = 3;
        int right = 4;
        System.out.println(prefixSum[right]-prefixSum[left-1]);
    }
}
