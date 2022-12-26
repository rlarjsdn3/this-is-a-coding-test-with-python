// 04. 모험가 길드 - p. 311

import java.util.*;

public class main {
    static Scanner s = new Scanner(System.in);

    public static void main(String[] args) {
        int n = s.nextInt();
        int[] data = new int[n];

        for(int i=0; i<data.length; i++)
            data[i] = Integer.parseInt(s.next());
        
        int result = 0; // 총 그룹의 수
        int count = 0; // 현재 그룹에 포함된 모험가의 수
      
        for(int i=0; i<data.length; i++) {
            count += 1;
            if(count>=data[i]) {
                result += 1;
                count = 0;
            }
        }

        System.out.println(result);
    }
}
