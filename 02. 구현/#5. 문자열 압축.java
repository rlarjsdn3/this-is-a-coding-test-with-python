//5. 문자열 압축 - p. 323

import java.util.*;

public class main {
    static Scanner sc = new Scanner(System.in);

    public static int solution(String s) {
        String compressed;
        String prev;
        int count, result = s.length();
        int i, j;
        
        for(i=1; i<=s.length()/2; i++) {
            compressed = "";
            prev = s.substring(0, i);
            count = 1;

            for(j=i; j<s.length(); j+=i) {
                try {
                    if(prev.equals(s.substring(j, j+i))) {
                        count += 1;
                    } else {
                        if(count>=2) {
                            compressed += String.valueOf(count)+prev;
                        } else {
                            compressed += prev;
                        }
                        prev = s.substring(j, j+i);
                        count = 1;
                    }
                  // 예외가 발생하면 글자 수가 달라 비교가 의미가 없으므로 
                  // prev 변수에 그대로 나머지 문자열 이어붙이고 for문 탈출하기
                } catch(StringIndexOutOfBoundsException sie) {
                    prev += s.substring(j);
                }
            }

            if(count>=2) {
                compressed += String.valueOf(count)+prev;
            } else {
                compressed += prev;
            }

            System.out.println(compressed + " " + i);
            result = Math.min(result, compressed.length());
        }

        return result;
    }

    public static void main(String[] args) {
        String data = sc.nextLine();
        System.out.println(solution(data));
    }
}
