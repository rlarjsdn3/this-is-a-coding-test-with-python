//4. 문자열 재정렬 - p. 322

import java.util.*;

public class main {
    static Scanner s = new Scanner(System.in);

    public static void main(String[] args) {
        char[] data = s.nextLine().toCharArray();
        ArrayList<Character> list = new ArrayList<Character>();

        int value = 0;
        String result = "";

        for(int i=0; i<data.length; i++) {
            if(!('0'<=data[i] && data[i]<='9')) {
                list.add(data[i]);
            } else {
                value += (int)(data[i] - '0');
            }
        }
        Collections.sort(list);
        
        Iterator it = list.iterator();
        while(it.hasNext()) {
            result += String.valueOf(it.next());
        }
        
        System.out.println(result + String.valueOf(value));
    }
}
