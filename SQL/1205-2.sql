/*
���̺� �����ϱ�

CREATE TABLE ���̺�� (
�÷��� ������ Ÿ�� ��������,
�÷��� ������ Ÿ��,
�÷��� ������ Ÿ��(������),
�÷��� ������ Ÿ�� DEFAULT �⺻��
);

*/

/*
CREATE TABLE
    ���̺��� ������Ű�� SQL ��ɾ��.
    
SAMPLE_BOOKS
     ���� ������ ���̺��� �̸��̴�.
     
BOOK_NO, BOOK_TITLE, BOOK_WRITER, BOOK_PRICE,
BOOK_STOCK, BOOK_REG_DATE 
    ���� ������ ���̺��� �÷� �̸��̴�.
    
NUMBER 
    �ش� �÷��� ������Ÿ���� ���������� �����Ѵ�.
    
VARCHAR2 
    �ش� �÷��� ������Ÿ���� �������̹��������� �����Ѵ�.

DATE
    �ش� �÷��� ������Ÿ���� ��¥������ �����Ѵ�.

PRIMARY KEY
    �ش� �÷��� ���̺��� ���� �ĺ��ϱ� ���� ���� ������ �⺻Ű �÷����� �����Ѵ�.
    �ش� �÷��� NULL�� ������� ������, ���� ���̺� ��ü���� �����ϴ�

NOT NULL
    �ش� �÷��� NULL�� ���¸� ���� �� ����.

DEFAULT 10
    ���ο� ���� �߰��� �� �ش� �÷��� ���� �������� ������ 10�� �⺻������ ����ȴ�.

DEFAULT SYSDATE
    ���ο� ���� �߰��� �� �ش��÷��� ���� �������� ������ �ý����� ���� ��¥�� ����ȴ�.
*/

CREATE TABLE SAMPLE_BOOKS (
    BOOK_NO         NUMBER(6) PRIMARY KEY,
    BOOK_TITLE      VARCHAR2(255) NOT NULL,
    BOOK_WRITER     VARCHAR2(255),
    BOOK_PRICE      NUMBER(7,0) NOT NULL,
    BOOK_STOCK      NUMBER(3,0) DEFAULT 10,
    BOOK_REG_DATE   DATE        DEFAULT SYSDATE
    );

/*
���̺� �ű� �� �߰��ϱ�
INSERT INTO ���̺��( �÷���, �÷���, �÷���)
VALUES             ( ��  ,    ��,    ��  )

* �ű� ���� �߰��� �� ���� ����� �÷��� ���� �����ϴ� ����̴�.
* ������ �÷����� NULL ���� ����ǰų� �⺻���� ����ȴ�.
* ���̺��� �÷������� ������� ������ �÷��� ���� ������ ���� �����Ѵ�.
* ���� ����ȯ�濡���� �� ����� ����Ѵ�.

INSERT INTO ���̺��
VALUES ( ��, ��, ��, ��, ��)
* �ű� ���� �߰��� �� �÷����� �����ϴ� ����̴�.
* �ű� ���� ��� �÷��� ���ؼ� ���� �����ؾ� �Ѵ�.
(������ ���� ������ NULL�� ��������� ���´�.)
* ���̺��� �÷� ������ ������ ������ ���� �����ؾ��Ѵ�. 

*/

-- �ű� å ���� �߰��ϱ�
INSERT INTO SAMPLE_BOOKS
(BOOK_NO, BOOK_TITLE, BOOK_WRITER, BOOK_PRICE)
VALUES
(10, '�ڹ��� ����', '���ü�', 32000);


INSERT INTO SAMPLE_BOOKS
(BOOK_NO, BOOK_TITLE, BOOK_WRITER, BOOK_PRICE, BOOK_STOCK)
VALUES
(12,'�̰��� �ڹٴ�', '�ſ��', 35000, 25);

INSERT INTO SAMPLE_BOOKS
VALUES(14, '����Ƽ�� �ڹ�', '����ö', 18000, 10, SYSDATE);

INSERT INTO SAMPLE_BOOKS
VALUES(16, 'ȥ����', '������', 10000, 22, SYSDATE);

-- INSERT ������ �������� �����ͺ��̽��� ���������� �����Ų��.
COMMIT;

/*
������ �����ϱ�

UPDATE ���̺��
SET
    �÷��� = ��;
    �÷��� = ��;
    ...
[WHERE ���ǽ�]

* ���̺��� ������ �÷��� ���� ���氪���� �����Ų��.
* WHERE���� �����ϸ� ���̺��� ��� �࿡ ���ؼ� ������ �÷��� ���� ����ȴ�.
* WHERE���� �ִ� ��� ���ǽ��� �����ϴ� �࿡ ���ؼ��� ������ �÷��� ���� ����ȴ�.


���̺� �����ϱ�
TRUNCATE TABLE ���̺��;

* ���̺��� �����͸� ���� �����ϰ�, ����ϰ� �ִ� ������ �ݳ��Ѵ�.
* ���� ���̺� ���������� ������ ���°� �ȴ�. 

*/
    
 -- ���� ���̺��� å��ȣ�� 10�� å�� �������� 9������ �����ϱ�
UPDATE SAMPLE_BOOKS
SET
    BOOK_STOCK = 9
WHERE BOOK_NO = 10;

-- �������̺��� å��ȣ�� 12�� å�� ������ 10% �����ϰ�, �������� 1 ���� ��Ų��.
UPDATE SAMPLE_BOOKS
SET
    BOOK_PRICE = BOOK_PRICE*0.9, 
    BOOK_STOCK = BOOK_STOCK - 1
WHERE BOOK_NO = 12;

-- ���� ���̺� ���� ���� ������ �����ͺ��̽��� ���������� �ݿ��ȴ�.
COMMIT;

/*

*/

-- ���� ���̺��� å��ȣ�� 10���� å������ �����ϱ�
DELETE FROM SAMPLE_BOOKS
WHERE BOOK_NO = 10;

-- �������̺��� å������  '�ڹ��� ����'�� å������ �����ϱ�
DELETE FROM SAMPLE_BOOKS
WHERE BOOK_NAME = '�ڹ��� ����';

-- ���� ���̺��� ��� ������ �����ϱ�
TRUNCATE TABLE SAMPLE_BOOKS;



