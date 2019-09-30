SELECT USER
FROM DUAL;
--==>> SCOTT

--���� BEFORE STATEMENT TRIGGER  ��Ȳ �ǽ� ����--
--�� DML �۾� ���� ���� �۾��� ���� ���� ���� Ȯ��
--   (���� ��å ���� / ���� ��Ģ ����)

--�� Ʈ���� �ۼ�(TRG_TEST1_DML)
CREATE OR REPLACE TRIGGER TRG_TEST1_DML
        BEFORE 
        INSERT OR UPDATE OR DELETE ON TBL_TEST1
BEGIN
    IF (�۾��ð��� ���� 8�� �����̰ų�.... ���� 6�� ���Ķ��....)
        THEN ����� ���� ���ܸ� �߻���Ų��.
    END IF;
END;




CREATE OR REPLACE TRIGGER TRG_TEST1_DML
        BEFORE 
        INSERT OR UPDATE OR DELETE ON TBL_TEST1
BEGIN
    IF (TO_NUMBER(TO_CHAR(SYSDATE, 'HH24')) < 8 OR TO_NUMBER(TO_CHAR(SYSDATE, 'HH24')) > 17)
        THEN RAISE_APPLICATION_ERROR(-20003,'�۾��� 08:00 ~ 18:00 ������ �����մϴ�.');
    END IF;
END;
--==>> Trigger TRG_TEST1_DML��(��) �����ϵǾ����ϴ�.



--���� BEFORE ROW TRIGGER ��Ȳ �ǽ� ����--
--�� ���� ���谡 ������ ������(�ڽ�) ������ ���� �����ϴ� ��


--�� Ʈ���� �ۼ�(TRG_TEST2_DELETE)
CREATE OR REPLACE TRIGGER TRG_TEST2_DELETE
            BEFORE
            DELETE ON TBL_TEST2
            FOR EACH ROW
BEGIN
    DELETE 
    FROM TBL_TEST3
    WHERE CODE = :OLD.CODE;
END;
--==>> Trigger TRG_TEST2_DELETE��(��) �����ϵǾ����ϴ�.



--�� ��:OLD��
-- ���� �� ���� ��
-- (INSERT : �Է��ϱ� ���� �ڷ�, DELETE : �����ϱ� ���� �ڷ� ��,������ �ڷ�)

--�� UPDATE : DELETE �׸��� INSERT �� ���յ� ����
--            UPDATE �ϱ� ������ �����ʹ� :OLD
--            UPDATE �� ���� �����ʹ� :NEW


--���� AFTER ROW TRIGGER ��Ȳ �ǽ� ����--
--�� ���� ���̺� ���� Ʈ����� ó��

-- TBL_�԰�, TBL_���, TBL_��ǰ

--�� TBL_�԰� ���̺��� ������ �Է� ��(�԰� �̺�Ʈ �߻� ��)
--   TBL_��ǰ ���̺��� ������ ���� Ʈ���� �ۼ�

CREATE OR REPLACE TRIGGER TRG_IBGO
          AFTER
          INSERT ON TBL_�԰�
          FOR EACH ROW
BEGIN
    IF (INSERTING)
        THEN UPDATE TBL_��ǰ
             SET ������ = ������ + :NEW.�԰����
             WHERE ��ǰ�ڵ� = :NEW.��ǰ�ڵ�;
    END IF;
END;
--==>> Trigger TRG_IBGO��(��) �����ϵǾ����ϴ�.

--�� TBL_�԰� ���̺� ������ �Է�, ����, ���� ��
--   TBL_��ǰ ���̺��� �������� ������ Ʈ����� ó���� �� �� �ֵ���
--   TRG_IBGO Ʈ���Ÿ� �������Ѵ�.

CREATE OR REPLACE TRIGGER TRG_IBGO
          AFTER
          INSERT OR UPDATE OR DELETE ON TBL_�԰�
          FOR EACH ROW
BEGIN
    
    IF (INSERTING)
        THEN UPDATE TBL_��ǰ
             SET ������ = ������ + :NEW.�԰����
             WHERE ��ǰ�ڵ� = :NEW.��ǰ�ڵ�;
    END IF;
    
    IF (UPDATING)
        THEN UPDATE TBL_��ǰ
             SET ������ = (������ - :OLD.�԰����) + :NEW.�԰����
             WHERE ��ǰ�ڵ� = :OLD.��ǰ�ڵ�;
    END IF;
    
    IF (DELETING)
        THEN UPDATE TBL_��ǰ
             SET ������ = ������ - :OLD.�԰����
             WHERE ��ǰ�ڵ� = :OLD.��ǰ�ڵ�;
    END IF;
END;
--==>> Trigger TRG_IBGO��(��) �����ϵǾ����ϴ�.

--�� TBL_��� ���̺� ������ �Է�, ����, ���� ��
--   TBL_��ǰ ���̺��� �������� ������ Ʈ����� ó���� �� �� �ֶǷ�
--   TRG_CHULGO Ʈ���Ÿ� �����Ѵ�.

CREATE OR REPLACE TRIGGER TRG_CHULGO
            AFTER  
            INSERT OR UPDATE OR DELETE ON TBL_���
            FOR EACH ROW
BEGIN
    IF (INSERTING)
        THEN UPDATE TBL_��ǰ
             SET ������ = ������ - :NEW.������
             WHERE ��ǰ�ڵ� = :NEW.��ǰ�ڵ�;
             
    ELSIF (UPDATING)
        THEN UPDATE TBL_��ǰ
             SET ������ = (������ + :OLD.������) - :NEW.������
             WHERE ��ǰ�ڵ� = :NEW.��ǰ�ڵ�;
    
    ELSIF(DELETING)
        THEN UPDATE TBL_��ǰ
             SET ������ = ������ + :OLD.������
             WHERE ��ǰ�ڵ� = :OLD.��ǰ�ڵ�;
    END IF;
END;
--==>> Trigger TRG_CHULGO��(��) �����ϵǾ����ϴ�.


-------------------------------------------------------------------------------------------------------------

--���� PACKAGE(��Ű��) ����--

-- 1. PL/SQL �� ��Ű���� ����Ǵ� Ÿ��, ���α׷� ��ü,
--    ���� ���α׷�(PROCEDURE, FUNCTION ��)��
--    �������� ������� ������
--    ����Ŭ���� �����ϴ� ��Ű�� �� �ϳ��� �ٷ� ��DBMS_OUTPUT�� �̴�.

-- 2. ��Ű���� ���� ������ ������ ���Ǵ� ���� ���� ���ν����� �Լ���
-- �ϳ��� ��Ű���� ����� ���������ν� ���� ���������� ���ϰ�
-- ��ü ���α׷��� ���ȭ �� �� �ִ� ������ �ִ�.

-- 3. ��Ű���� ����(PACKAGE SPECIFICATION)�� 
--    ��ü��(PACKAGE BODY)�� �����Ǿ� ������
--    �� �κп��� TYPE, CONSTRAINT, VARIABLE, EXCEPTION, CURSOR, SUBPROGRAM�� ����ǰ�
--    ��ü �κп��� �̵��� ���� ������ �����Ѵ�.
--    �׸��� ȣ���� ������ ����Ű����.���ν����� ������ ������ �̿��ؾ� �Ѵ�.

-- 4. ���� �� ����(����)
/*
CREATE [OR REPLACE] PACKAGE ��Ű����
IS
    �������� ����;
    Ŀ�� ����;
    ���� ����;
    �Լ� ����;
    ���ν��� ����;
      :
END ��Ű����;
*/

-- 5. ���� �� ����(��ü��)
/*
CREATE [OR REPLACE] PACKAGE BODY ��Ű����
IS
    FUNCTION �Լ���[(�μ�, ...)]
    RETURN �ڷ���
    IS  
        ���� ����;
    BEGIN
        �Լ� ��ü ���� �ڵ�;
        RETURN ��;
    END;
    
    PROCEDURE ���ν�����[(�μ�,...)]
    IS
        ���� ����;
    BEGIN
        ���ν��� ��ü ���� �ڵ�;
    END;
    
    
END ��Ű����;
*/

-- ��Ű�� ���

-- 1. ���� �ۼ�
CREATE OR REPLACE PACKAGE INSA_PACK
IS
    FUNCTION FN_GENDER(V_SSN VARCHAR2)
    RETURN VARCHAR2;
    
END INSA_PACK;
--==>> Package INSA_PACK��(��) �����ϵǾ����ϴ�.


-- 2. ��ü�� �ۼ�
CREATE OR REPLACE PACKAGE BODY INSA_PACK
IS
    FUNCTION FN_GENDER(V_SSN VARCHAR2)
    RETURN VARCHAR2
    IS
        V_RESULT    VARCHAR2(20);
    BEGIN
        IF (SUBSTR(V_SSN,8,1) IN ('1','3'))
            THEN V_RESULT := '����';
        ELSIF (SUBSTR(V_SSN,8,1) IN ('2','4'))
            THEN V_RESULT := '����';
        ELSE
            V_RESULT := 'Ȯ�κҰ�';
        END IF;
        
        RETURN V_RESULT;
    END;
    
END INSA_PACK;
--==>> Package Body INSA_PACK��(��) �����ϵǾ����ϴ�.


















