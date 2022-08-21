// 08. 볼링공 고르기 - p. 315

import java.util.*;

public class main {
    static Scanner s = new Scanner(System.in);

    public static void main(String[] args) {
        int n = Integer.parseInt(s.next());
        int m = Integer.parseInt(s.next());
        
        int[] data = new int[n];
        int[] array = new int[11];
        for(int i=0; i<data.length; i++) {
            data[i] = Integer.parseInt(s.next());
            array[data[i]]++;
        }

        int result = 0;
        for(int i=1; i<m; i++) {
            n -= array[i];
            result += array[i] * n;
        }

        System.out.println(result);
    }
}
