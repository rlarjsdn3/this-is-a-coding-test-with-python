import java.util.*;

public class main {
    static Scanner sc = new Scanner(System.in);
    public static void main(String[] args) {
        int n = Integer.parseInt(sc.next());
        int m = Integer.parseInt(sc.next());
        int c, min = Integer.MAX_VALUE, max = Integer.MIN_VALUE;

        for(int i=0; i<n; i++) {
            min = Integer.MAX_VALUE;
            for(int j=0; j<m; j++) {
                c = Integer.parseInt(sc.next());
                min = Math.min(min, c);
            }
            
            max = Math.max(min, max);
        }
        
        System.out.println(max);
    }
}
