// 07. 만들 수 없는 금액 - p. 314

import java.util.*;

public class main {
    static Scanner s = new Scanner(System.in);

    public static void main(String[] args) {
        int n = s.nextInt();
        int[] data = new int[n];
        for(int i=0; i<data.length; i++) {
            data[i] = Integer.parseInt(s.next());
        }
        Arrays.sort(data);

        int target = 1;
        for(int i=0; i<data.length; i++) {
            if(target<data[i]) {
                break;
            }
            target += data[i];
        }

        System.out.println(target);
    }
}
