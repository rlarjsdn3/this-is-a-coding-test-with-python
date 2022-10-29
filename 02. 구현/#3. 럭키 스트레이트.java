//3. 럭키 스트레이트 - p. 321

import java.util.*;

public class main {
    static Scanner s = new Scanner(System.in);

    public static void main(String[] args) {
        String score = s.nextLine();

        int sum = 0;
        int len = (int)(score.length()/2);
        for(int i=0; i<len; i++) {
            sum += Integer.parseInt(String.valueOf(score.charAt(i)));
            sum -= Integer.parseInt(String.valueOf(score.charAt(i+len)));
        }

        if(sum == 0) {
            System.out.println("LUCKY");
        } else {
            System.out.println("READY");
        }
    }
}
