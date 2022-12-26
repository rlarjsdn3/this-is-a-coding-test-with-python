// 05. 곱하기 혹은 더하기 - p. 312

import java.util.*;

public class main {
    static Scanner s = new Scanner(System.in);

    public static void main(String[] args) {
        String data = s.nextLine();
        int result = Integer.parseInt(data.substring(0, 1));

        for(int i=1; i<data.length(); i++) {
            int num = Integer.parseInt(data.substring(i, i+1));
            if(num<=1 || result <=1) {
                result += num;
            } else {
                result *= num;
            }
        }

        System.out.println(result);
    }
}
