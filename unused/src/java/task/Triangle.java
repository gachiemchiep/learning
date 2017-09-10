class Triangle {
    public static void main(String[] args) {

        for (int i = 1; i <= 10; i++) {
            String result = "";

            for (int j = 1; j <= i; j++) {
                result += "*";
            }

            System.out.println(result);

        }

    }
}