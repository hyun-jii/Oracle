SELECT USER
FROM DUAL;
--==>> SCOTT

--���� PL/SQL ����--

-- 1. PL/SQL(Procedural Language extension to SQL) ��
--   ���α׷��� ����� Ư���� ������ SQL�� Ȯ���̸�,
--   ������ ���۰� ���� ������ PL/SQL ������ �ڵ� �ȿ� ���Եȴ�.
--   ����, PL/SQL�� ����Ϸ��� SQL�� �� �� ���� ������ �۾��� �����ϴ�.
--   ���⿡�� ������ �̶�� �ܾ ������ �ǹ̴�
--   � ���� � ������ ���ļ� ��� �Ϸ�Ǵ���
--   �� ����� ��Ȯ�ϰ� �ڵ忡 ����Ѵٴ� ���� �ǹ��Ѵ�.

-- 2. PL/SQL �� ���������� ǥ���ϱ� ����
--    ������ ������ �� �ִ� ���,
--    ���� ������ ������ �� �ִ� ���,
--    ���� �帧�� ��Ʈ�� �� �� �ִ� ��� ���� �����Ѵ�.

-- 3. PL/SQL �� �� ������ �Ǿ� ������
--    ���� ���� �κ�, ���� �κ�, ���� ó�� �κ���
--    �� �κ����� �����Ǿ� �ִ�.
--    ����, �ݵ�� ���� �κ��� �����ؾ� �ϸ�, ������ ������ ����.

-- 4. ���� �� ����
/*
[DECLARE]
    -- ����(DECLARATIONS)
BEGIN
    -- ���๮(STATEMENTS)
    
    [EXCEPTION]
        -- ���� ó����(EXCEPTIION HANDLERS)

END;
*/

-- 5. ���� ����
/*
DECLARE
    ������ �ڷ���;
    ������ �ڷ��� := �ʱⰪ;
BEGIN
END;
*/

SET SERVEROUTPUT ON;
--==>> �۾��� �Ϸ�Ǿ����ϴ�.
-- ��DBMS_OUTPUT.PUT_LINE()���� ����
-- ȭ�鿡 ����� ����ϱ� ���� ȯ�溯�� ����


--�� ������ ������ ���� �����ϰ� ����ϴ� ���� �ۼ�
DECLARE
    -- �����
    D1 NUMBER := 10;
    D2 VARCHAR2(30) := 'HELLO';
    D3 VARCHAR2(20) := 'Oracle';
BEGIN
    -- �����
    DBMS_OUTPUT.PUT_LINE(D1);
    DBMS_OUTPUT.PUT_LINE(D2);
    DBMS_OUTPUT.PUT_LINE(D3);
END;
--==>>
/*
10
HELLO
Oracle

PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.
*/

--�� ������ ������ ���� �����ϰ� ����ϴ� ���� �ۼ�
DECLARE
    --�����
    D1 NUMBER := 10;
    D2 VARCHAR2(30) := 'HELLO';
    D3 VARCHAR2(20) := 'Oracle';
BEGIN
    --�����
    D1 := D1 * 10;    
    D2 := D2 || '������';
    D3 := D3 || 'World';
    
    DBMS_OUTPUT.PUT_LINE(D1);
    DBMS_OUTPUT.PUT_LINE(D2);
    DBMS_OUTPUT.PUT_LINE(D3);
END;
--==>>
/*
100
HELLO������
OracleWorld
*/

--�� IF�� (���ǹ�)
-- IF ~ THEN ~ ELSE ~ END IF;

-- 1. PL/SQL �� IF ������ �ٸ� ����� IF ���ǹ��� ���� �����ϴ�.
--    ��ġ�ϴ� ���ǿ� ���� ���������� �۾��� ������ �� �ֵ��� �Ѵ�.
--    TRUE �̸� THEN�� ELSE ������ ������ �����ϰ�
--    FALSE �� NULL �̸� ELSE �� END IF; ������ ������ �����ϰ� �ȴ�.


-- 2. ���� �� ����
/*
IF ����
    THEN ó������;
ELSIF ����
    THEN ó������;
ELSIF ����
    THEN ó������;
ELSE
    ó������;
END IF;
*/


--�� ������ ����ִ� ���� ���� Excellent, Good, Fail �� �����Ͽ�
--   ����� ����ϴ� PL/SQL ������ �ۼ��Ѵ�.

DECLARE
    GRADE CHAR;
BEGIN
    GRADE := 'C';
    
    IF GRADE = 'A'
        THEN DBMS_OUTPUT.PUT_LINE('Excellent');
    ELSIF GRADE ='B'
        THEN DBMS_OUTPUT.PUT_LINE('Good');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Fail');
    END IF;
END;
--==>> Fail


DECLARE
    GRADE CHAR;
BEGIN
    GRADE := 'A';
    
    IF GRADE = 'A'
        THEN DBMS_OUTPUT.PUT_LINE('Excellent');
    ELSIF GRADE ='B'
        THEN DBMS_OUTPUT.PUT_LINE('Good');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Fail');
    END IF;
END;
--==>> Excellent

--�� CASE��(���ǹ�)
-- CASE ~ WHEN ~ THEN ~ ELSE ~ END CASE;

-- 1. ���� �� ����
/*
CASE ����
    WHEN ��1
        THEN ���๮;
    WHEN ��2
        THEN ���๮;
    ELSE
        ���๮;
END CASE;
*/

DECLARE
    GRADE CHAR;
BEGIN
    GRADE := 'A';
    CASE GRADE
        WHEN 'A'
            THEN DBMS_OUTPUT.PUT_LINE('Excellent');
        WHEN 'B'
            THEN DBMS_OUTPUT.PUT_LINE('Good');
        ELSE
            DBMS_OUTPUT.PUT_LINE('Fail');
            
    END CASE;
END;

--==>> Excellent


--�� �ܺ� �Է� ó��

-- ACCEPT ����
-- ACCEPT ������ PROMPT '�޼���';
--> �ܺ� �����κ��� �Է¹��� �����͸� ���� ������ ������ ��
-- ��&�ܺκ����� ���·� �����ϰ� �ȴ�.


--�� ���� 2���� �ܺηκ���(����ڷκ���) �Է¹޾�
--   �̵��� ���� ����� ����ϴ� PL/SQL ������ �ۼ��Ѵ�.

ACCEPT N1 PROMPT 'ù ��° ������ �Է��ϼ���';
ACCEPT N2 PROMPT '�� ��° ������ �Է��ϼ���';

DECLARE
    -- �ֿ� ���� ����
    NUM1  NUMBER := &N1;
    NUM2  NUMBER := &N2;
    TOTAL NUMBER := 0;
BEGIN
    -- ���� �� ó��
    
    TOTAL := NUM1 + NUM2;
    
    --��� ���
    DBMS_OUTPUT.PUT_LINE(NUM1 || '+' || NUM2 || '=' || TOTAL);
END;
-- ���ε� ���� �Է� ��ȭâ�� ���� �Էµ� �� : 25, 47
--==>> 25+47=72

--�� ����ڷκ��� �Է¹��� �ݾ��� ȭ������� �����Ͽ� ����ϴ� ���α׷��� �ۼ��Ѵ�.
--   ��, ��ȯ �ݾ��� ���ǻ� 1õ�� �̸�, 10�� �̻� �����ϴٰ� �����Ѵ�.
/*
���� ��)
���ε� ���� �Է� ��ȭâ -> �ݾ� �Է� : 990

�Է¹��� �ݾ� �Ѿ� : 990��
ȭ����� : �����1, ���4, ���ʿ�1, �ʿ�4
*/

ACCEPT N1 PROMPT '�ݾ� �Է�';

DECLARE
    MONEY   NUMBER := &N1;
    MONEY2  NUMBER := &N1;
    N500    NUMBER := 0;
    N100    NUMBER := 0;
    N50     NUMBER := 0;
    N10     NUMBER := 0;
   
BEGIN
/*------------------���� �Ѱ�------------------------------------
    N500 := TRUNC((MONEY / 500),0);
    N100 := TRUNC(((MONEY-(N500*500))/100),0);
    N50  := TRUNC(((MONEY-(N500*500)-(N100*100)) / 50),0);
    N10  := TRUNC(((MONEY-(N500*500)-(N100*100)-(N50*50))/10),0);
----------------------------------------------------------------*/

    N500  := TRUNC(MONEY/500);
    MONEY := MOD(MONEY, 500);
    
    N100  := TRUNC(MONEY/100);
    MONEY := MOD(MONEY, 100);
    
    N50   := TRUNC(MONEY/50);
    MONEY := MOD(MONEY, 50);
    
    N10   := TRUNC(MONEY/10);
    
    DBMS_OUTPUT.PUT_LINE('�Է¹��� �ݾ� �Ѿ�' || MONEY2);
    DBMS_OUTPUT.PUT_LINE('�����' || N500 ||'���' || N100 ||'���ʿ�' || N50 || '�ʿ�' || N10);
/*
    DBMS_OUTPUT.PUT_LINE('�����' || N500);
    DBMS_OUTPUT.PUT_LINE('���' || N100);
    DBMS_OUTPUT.PUT_LINE('���ʿ�' || N50);
    DBMS_OUTPUT.PUT_LINE('�ʿ�' || N10);
*/ 
    
END;
--==>>
/*
�����1
���4
���ʿ�1
�ʿ�4

�Է¹��� �ݾ� �Ѿ�990
�����1���4���ʿ�1�ʿ�4
*/

--�� �⺻ �ݺ���
-- LOOP ~ END LOOP;

-- 1. ���ǰ� ������� ������ �ݺ��ϴ� ����.

-- 2. ���� �� ����
/*
LOOP
    -- ���๮
    EXIT WHEN ����;       -- ������ ���� ��� �ݺ����� ����������.

END LOOP;
*/

--�� 1���� 10������ �� ���(LOOP �� Ȱ��)
DECLARE
    N NUMBER;
BEGIN
    N := 1;
    LOOP
        DBMS_OUTPUT.PUT_LINE(N);
        EXIT WHEN N >= 10;
        N := N+1;
    END LOOP;
END;
--==>>
/*
1
2
3
4
5
6
7
8
9
10
*/

--�� WHILE �ݺ���
-- WHILE LOOP ~ END LOOP;

-- 1. ���� ������ TRUE�� ���� �Ϸ��� ������ �ݺ��ϱ� ����
-- WHILE LOOP ������ ����Ѵ�.
-- ������ �ݺ��� ���۵Ǵ� ������ üũ�ϰ� �Ǿ�
-- LOOP ���� ������ �� ���� ������� ���� ��쵵 �ִ�.
-- LOOP �� ������ �� ������ FALSE �̸� �ݺ� ������ Ż���ϰ� �ȴ�.


-- 2. ���� �� ����
/*
WHILE ���� LOOP   -- ������ ���� ��� �ٺ� ����
    -- ���๮;
END LOOP;
*/


--�� 1���� 10������ �� ��� (WHILE LOOP�� Ȱ��)
DECLARE
    N NUMBER;
BEGIN
    N := 0;
    WHILE N < 10 LOOP
        N := N+1;
        DBMS_OUTPUT.PUT_LINE(N);
    END LOOP;
END;
--==>>
/*
1
2
3
4
5
6
7
8
9
10
*/







