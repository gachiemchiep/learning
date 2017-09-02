imports String;

class TriangleOp {
    public static void main(String[] args) {

        int deep = 10;

        String row = "";

        for (int i = (-deep + 1); i < deep; i++) {
            row += " ";
        }

        System.out.println(test);

        for (int i = 1; i <= deep; i++) {
            String result = "";

            for (int j = (-i+1); j < i; j++) {
                result += "*";
            }

            System.out.println(result);

        }

    }
}