🔸 주요기능

-----

+ 주문하기

    + 구매금액 만큼 자동으로 로또 발행한다

<br>

* 화면
    + 화면에서 구매금액을 입력 받는다
    + 서브시에 구매금액을 전달 , 루문객체르 ㄹ반너노' ㅡㅐㄹ

<br>

* 서비스
    + 주문번호 생성
    + 구매 금애만큼 로또번호 생성
    + 주문객체 생성해서 회차번호 주문번호 , 생성된 로또번호를 저장
    + 주문객체를 Repository에 전달해서 저장
    + 주문객체 반환

  <br>


* 번호 추첨

--------

- Lotto.java - 로또 당첨 번호를 표현하는 클래스

  회차번호 int no
  로또번호 Set<Integer> numbers
  보너스 번호 int bonus

   <br> 

- Order.java - 로또 구매정보를 표현하는 클래스

      회차번호 int lottoNo
      주문번호 long orderNo
      구매한 로또번호 List<Set<Integer>> numbers;

<br>

- LottoRepository.java - 로또 당첨 번호에 대한 CRUD 담당하는 클래스
    + lotto.csv 파일에 회차별 당첨 번호와 보너스 번호 정보를 기록한다

<br>

- OrderRepository.java - 로또 구매정보에 대한 CRUD 담당하는 클래스
    + yyyyMMdd.csv 파일에 회차별 로또구매정보를 기록한다
    + 각 파일은 회차별 (날짜) 로 관리된다

<br>

- LottoService.java - 로또 관련 서비스를 제공하는 클래스

    + 구매서비스
    + 구매 내역 조회서비스
    + 추첨서비스
    + 당첨확인 서비스

<br>

- LottoUi.java - 사용자와 상호작용을 담당하는 클래스


- lotto.csv - 당첨번호가 관리되는 파일
    + 회차번호 : 번호1 , 번호2 , 번호3....번호6 : 보너스번호


- 23231124.csv - 23231124회차 구매정보가 관리되는 파일
    + 회차번호 : 주문번호 : 번호1 번호2 번호3...번호6/번호1 번호2 번호3...번호6