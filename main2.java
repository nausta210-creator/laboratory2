import java.util.Scanner;

public class Main {
    
    public static String punkt(String[][] v) {
        int n = v.length;
        
        String start = "";
        for (int i = 0; i < n; i++) {
            boolean ok = true;
            for (int j = 0; j < n; j++) {
                if (v[j][1].equals(v[i][0])) {
                    ok = false;
                    break;
                }
            }
            if (ok) {
                start = v[i][0];
                break;
            }
        }
        
        if (start.equals("")) {
            return "Ошибка";
        }
        
        String cur = start;
        for (int step = 0; step < n; step++) {
            for (int i = 0; i < n; i++) {
                if (v[i][0].equals(cur)) {
                    cur = v[i][1];
                    break;
                }
            }
        }
        
        if (cur.equals(start)) {
            return "Ошибка";
        }
        return cur;
    }
    
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        
        System.out.print("Введите количество пар: ");
        int n = scanner.nextInt();
        scanner.nextLine(); // очистка буфера
        
        String[][] pairs = new String[n][2];
        
        System.out.println("Введите пары (начало и конец):");
        for (int i = 0; i < n; i++) {
            pairs[i][0] = scanner.next();
            pairs[i][1] = scanner.next();
        }
        
        System.out.println(punkt(pairs));
        
        scanner.close();
    }
}