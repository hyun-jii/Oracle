-------------------------------------------------------------------------------------------------------------------------
-- PRC_�԰�_DELETE(�԰��ȣ)


CREATE OR REPLACE PROCEDURE PRC_�԰�_DELETE
( V_�԰��ȣ    IN      TBL_�԰�.�԰��ȣ%TYPE
)
IS
    V_��ǰ�ڵ�              TBL_��ǰ.��ǰ�ڵ�%TYPE;
    V_�԰����              TBL_�԰�.�԰����%TYPE;
    V_����������         TBL_��ǰ.������%TYPE; 
    USER_DEFINE_ERROR   EXCEPTION;
BEGIN

    SELECT ��ǰ�ڵ�, �԰����     INTO V_��ǰ�ڵ�, V_�԰����
    FROM TBL_�԰�
    WHERE �԰��ȣ = V_�԰��ȣ;
    
    SELECT ������     INTO    V_����������
    FROM TBL_��ǰ
    WHERE ��ǰ�ڵ� =  V_��ǰ�ڵ�;
    
    -- TBL_�԰� ���̺��� �ش� �԰��ȣ ����
    DELETE
    FROM TBL_�԰�
    WHERE �԰��ȣ = V_�԰��ȣ;
    
    -- ������������ V_�԰�������� ������ ���� �߻�
    IF ( V_���������� < V_�԰����)
        THEN RAISE USER_DEFINE_ERROR;
    END IF;
    
    -- TBL_��ǰ ���̺��� ������ UPDATE
    UPDATE TBL_��ǰ
    SET ������ = ������ - V_�԰����
    WHERE ��ǰ�ڵ� = V_��ǰ�ڵ�;
    
    
    -- ����ó��
    EXCEPTION
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20002,'������');
            ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;
            
    -- Ŀ��
    COMMIT;
    
    
END;
--==>> Procedure PRC_�԰�_DELETE��(��) �����ϵǾ����ϴ�.

-------------------------------------------------------------------------------------------------------------------------------
-- PRC_���_DELETE(����ȣ)

CREATE OR REPLACE PROCEDURE PRC_���_DELETE
( V_����ȣ    IN      TBL_���.����ȣ%TYPE
)
IS 
    V_��ǰ�ڵ�  TBL_���.��ǰ�ڵ�%TYPE;
    V_������  TBL_���.������%TYPE;
BEGIN
    
    -- TBL_����� ��ǰ�ڵ�� �������� V_��ǰ�ڵ�, V_�������� ����
    SELECT ��ǰ�ڵ�, ������     INTO    V_��ǰ�ڵ�, V_������
    FROM TBL_���
    WHERE ����ȣ = V_����ȣ;
    
    -- TBL_��� ���̺��� �ش� ����ȣ ����
    DELETE
    FROM TBL_���
    WHERE ����ȣ = V_����ȣ;
    
    -- TBL_��ǰ ���̺��� ������ UPDATE
    UPDATE TBL_��ǰ
    SET ������ = ������ + V_������
    WHERE ��ǰ�ڵ� = V_��ǰ�ڵ�;
    
    -- Ŀ��
    COMMIT;
    
END;
--==>> Procedure PRC_���_DELETE��(��) �����ϵǾ����ϴ�.