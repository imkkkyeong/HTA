package Java.enum1;

public class App1 {

    public static void main(String[] args) {

        // 고객 등급별 적립포인트 계산하기

        // CustomerGrade 타입의 변수를 정의하고
        // CustomerGrade 타입의 열거 상수를 대인한다.

        CustomerGrade grade = CustomerGrade.BRONZE; // 고객 현재 등급
        int orderPrice = 1000000; // 제품가격

        if (grade == CustomerGrade.GOLD) {
            int point = (int) (orderPrice * 0.1);
            System.out.println("적립포인트  = " + point);
        } else if (grade == CustomerGrade.SILVER) {
            int point = (int) (orderPrice * 0.05);
            System.out.println("적립포인트  = " + point);
        } else if (grade == CustomerGrade.BRONZE) {
            int point = (int) (orderPrice * 0.025);
            System.out.println("적립포인트  = " + point);
        } else if (grade == CustomerGrade.GUEST) {
            int point = (int) (orderPrice * 0.0125);
            System.out.println("적립포인트  = " + point);
        }

        // 열거형의 상수들은 switch문의 case에서 사용이 가능하다
        int point = 0;
        switch (grade) {
            case GOLD:
                point = (int) (orderPrice * 0.1);
                System.out.println("적립포인트  = " + point);
                break;
            case SILVER:
                point = (int) (orderPrice * 0.05);
                System.out.println("적립포인트  = " + point);
                break;
            case BRONZE:
                point = (int) (orderPrice * 0.025);
                System.out.println("적립포인트  = " + point);
                break;
            case GUEST:
                point = (int) (orderPrice * 0.0125);
                System.out.println("적립포인트  = " + point);
                break;
        }


    }
}
