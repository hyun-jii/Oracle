SELECT USER
FROM DUAL;
--==>> SCOTT



--�� SELF JOIN(�ڱ� ����)

-- EMP ���̺��� �����͸� ������ ���� ��ȸ�� �� �ֵ���
-- �������� �����Ѵ�.
---------------------------------------------------------------
--  �����ȣ  �����  ������  �����ڹ�ȣ  �����ڸ�  ������������
---------------------------------------------------------------
--  7369     SMITH   CLERK    7902        FORD      ANALYST  


SELECT E.EMPNO"�����ȣ", E.ENAME"�����", E.JOB"������", E.MGR"�����ڹ�ȣ", EMP.ENAME"�����ڸ�", EMP.JOB"������������"
FROM EMP E LEFT JOIN EMP
ON  E.MGR = EMP.EMPNO
ORDER BY 1;



SELECT E.EMPNO"�����ȣ", E.ENAME"�����", E.JOB"������", EMP.EMPNO"�����ڹ�ȣ", EMP.ENAME"�����ڸ�", EMP.JOB"������������"
FROM EMP E LEFT JOIN EMP
ON  E.MGR = EMP.EMPNO
ORDER BY 1;










