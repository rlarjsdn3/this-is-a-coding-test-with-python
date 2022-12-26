// 06. 문자열 뒤집기 - p. 313

import java.util.*;

public class main {
    static Scanner s = new Scanner(System.in);

    public static void main(String[] args) {
        String data = s.nextLine();
        
        int count0 = 0; // 전부 0으로 바꾸는 경우
        int count1 = 0; // 전부 1로 바꾸는 경우
        if(data.charAt(0)=='0') 
            count1 += 1;
        else
            count0 += 1;

        for(int i=0; i<data.length()-1; i++) {
            if(data.charAt(i) != data.charAt(i+1)) {
                if(data.charAt(i+1)=='0') {
                    count1 += 1;
                } else {
                    count0 += 1;
                }
            }
        }

        System.out.println(count0<count1 ? count0 : count1);
    }
}
