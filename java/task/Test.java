import java.util.Scanner;

class Test {
    public static void main(String[] args) {
        Scanner keyboard = new Scanner(System.in);
        System.out.println("enter an integer");
        int score = keyboard.nextInt();

        String result;

        if (score >= 70) {
            result = "合格";
        } else {
            result = "不合格";
        }

        System.out.println(result);

    }
}