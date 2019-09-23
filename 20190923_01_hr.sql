SELECT USER
FROM DUAL;
--==>> HR

--���� ����ȭ(Normalization) ����--

--�� ����ȭ��?
--   �� ����� �����ͺ��̽� ������ �޸� ���� ���� ����
--   � �ϳ��� ���̺�... �ĺ��ڸ� ������ ���� ���� ���̺��
--   ������ ������ ���Ѵ�.


-- EX) �����̰�... �������� �Ǹ��Ѵ�.
--     ������Ʈ -> �ŷ�ó���� ����� �����ִ� ��ø�� ������
--     �����ͺ��̽�ȭ �Ϸ��� �Ѵ�.

-- ���̺�� : �ŷ�ó����
/*
  10Byte       10Byte      10Byte        10Byte  10Byte  10Byte  10Byte
-------------------------------------------------------------------------
�ŷ�óȸ���  ȸ���ּ�    ȸ����ȭ    �ŷ�ó������  ����  �̸���   �޴���
-------------------------------------------------------------------------
    LG      ���� ���ǵ�  02-345-6789     ��â��    ����  CCH@NA.. 010-...
    LG      ���� ���ǵ�  02-345-6789     ������    ����  HHS@NA.. 010-...
    LG      ���� ���ǵ�  02-345-6789     ������    �븮  LHJ@NA.. 010-...
    LG      ���� ���ǵ�  02-345-6789     ����ȣ    ����  PJH@NA.. 010-...
    SK      ���� �Ұ���  02-987-6543     �̼���    ����  LSJ@NA.. 010-...
    LG      �λ� ������  031-123-4567    ��â��    �븮  KCK@NA.. 010-...
            
                                :
-------------------------------------------------------------------------                                

����) ���� ���ǵ� LG ��� ȸ�翡 �ٹ��ϴ� �ŷ�ó ���� �����
      �� 100�����̶�� �����Ѵ�.
      (�� ��(���ڵ�)�� 70Byte �̴�.)
      
      ��� ��...������ ���ǵ��� �� ��ġ�� LG ���簡 ����� �д硻����
      ����� �����ϰ� �Ǿ���.
      ȸ���ּҴ� �����д硻���� �ٲ��, ȸ����ȭ ��031-111-2222���� �ٲ�� �Ǿ���.
      
      �׷���... 100������ ȸ���ּҿ� ȸ����ȭ�� �����ؾ� �Ѵ�.
      
      - �� �� ����Ǿ�� �� ������ -> UPDATE
      
      UPDATE �ŷ�ó����
      SET ȸ���ּ�='���д�', ȸ����ȭ = '031-1111-2222'
      WHERE �ŷ�óȸ�� = 'LG' AND ȸ���ּ� = '���￩�ǵ�';
      
      --> 100�� �� ���� �ϵ��ũ�󿡼� �о�ٰ�
          �޸𸮿� �ε���� �־�� �Ѵ�.
          ��, 100�� *70 Byte �� ���
          �ϵ��ũ�� �о�ٰ� �޸𸮿� �ε���� �־�� �Ѵٴ� ���̴�.
          
          --> �̴� ���̺��� ���谡 �߸��Ǿ����Ƿ�
              DB ������ ������ �޸� ���� ���� DOWN �� ���̴�.
              
              --> �׷��Ƿ� ����ȭ ������ �����ؾ� �Ѵ�.
      
*/

-- �� 1 ������
--> � �ϳ��� ���̺� �ݺ��Ǵ� �÷� ������ �����Ѵٸ�
--  ������ �ݺ��Ǿ� ������ �÷��� �и��Ͽ�
--  ���ο� ���̺��� ������ش�.

--> �� 1 ����ȭ�� �����ϴ� �������� �и��� ���̺���
--  �ݵ�� �θ� ���̺�� �ڽ� ���̺��� ���踦 ���� �ȴ�.

--> �θ� ���̺� -> �����޴��÷� ->  PRIMARY KEY
--  �ڽ� ���̺� -> �����ϴ��÷� ->  FOREIGN KEY

--�� �����޴� �÷��� ���� Ư¡(�θ� ���̺�)
--   �ݵ�� ������ ��(������)�� ���;� �Ѵ�.
--   �ߺ��� ��(������)�� ����� �Ѵ�.
--   NULL�� �־�� �ȵȴ�. (NOT NULL �̾�� �Ѵ�.)

-->  �� 1 ����ȭ�� �����ϴ� �������� �θ� ���̺��� PRIMARY KEY��
--   �׻� �ڽ� ���̺��� FOREIGN KEY�� ���̵ȴ�.


/*
--���̺�� : ȸ�� -> �θ� ���̺�

  10Byte    10Byte       10Byte      10Byte        
-----------------------------------------------
ȸ��ID    �ŷ�óȸ���  ȸ���ּ�    ȸ����ȭ    
-------
(�����޴��÷� -> P.K)
-----------------------------------------------
 10         LG      ���� ���ǵ�  02-345-6789            
 20         SK      ���� �Ұ���  02-987-6543     
 30         LG      �λ� ������  031-123-4567    
            
                                :
------------------------------------------------


���̺�� : ���� -> �ڽ� ���̺�

 10Byte  10Byte  10Byte  10Byte        10Byte
---------------------------------------------------
 �ŷ�ó������  ����  �̸���   �޴���    ȸ��ID
                                     --------
                                     (�����ϴ��÷� -> F.K)
---------------------------------------------------
  ��â��    ����  CCH@NA.. 010-...       10
  ������    ����  HHS@NA.. 010-...       10
  ������    �븮  LHJ@NA.. 010-...       10
  ����ȣ    ����  PJH@NA.. 010-...       10
  �̼���    ����  LSJ@NA.. 010-...       20
  ��â��    �븮  KCK@NA.. 010-...       30
            
                                :
----------------------------------------------------

-- ���̺��� �и�(����)�Ǳ� ���� ���·� ��ȸ

SELECT A.�ŷ�óȸ���  A.ȸ���ּ�    A.ȸ����ȭ    B.�ŷ�ó������  B.����  B.�̸���   B.�޴���
FROM ȸ�� A, ���� B
WHERE A.ȸ��ID = B.ȸ��ID;


����) ���� ���ǵ� LG ��� ȸ�翡 �ٹ��ϴ� �ŷ�ó ���� �����
      �� 100�����̶�� �����Ѵ�.
      (�� ��(���ڵ�)�� 70Byte �̴�.)
      
      ��� ��...������ ���ǵ��� �� ��ġ�� LG ���簡 ����� �д硻����
      ����� �����ϰ� �Ǿ���.
      ȸ���ּҴ� �����д硻���� �ٲ��, ȸ����ȭ ��031-111-2222���� �ٲ�� �Ǿ���.
      
      �׷���... ȸ�� ���̺��� 1���� ȸ���ּҿ� ȸ����ȭ�� �����ؾ��Ѵ�.
      
      - �� �� ����Ǿ�� �� ������ -> UPDATE
      
      UPDATE ȸ��
      SET ȸ���ּ�='���д�', ȸ����ȭ='031-1111-2222;
      WHERE ȸ��ID = 10;
      
      --> 1 �� ���� �ϵ��ũ�󿡼� �о�ٰ�
          �޸𸮿� �ε���� �־�� �Ѵ�.
          ��, 1 * 40 Byte �� ���
          �ϵ��ũ�� �о�ٰ� �޸𸮿� �ε���� �־�� �Ѵٴ� ���̴�.
          
          --> �̴� ���̺� ���谡 �� �Ǿ���.
              
              --> ����ȭ �������� 100������ ó���ؾ� �� ��������
                  1�Ǹ� ó���ϸ� �Ǵ� ������ �ٲ� ��Ȳ�̱� ������
                  DB ������ �޸� ���� �Ͼ�� �ʰ� ���� ������ ó���� ���̴�.
                  
A. �ŷ�óȸ���, ȸ����ȭ

SELECT �ŷ�óȸ���, ȸ����ȭ              |   SELECT �ŷ�óȸ���, ȸ����ȭ
FROM ȸ��;                                |   FROM �ŷ�ó����;
--> 3 * 40Byte                            |   --> 200�� * 70Byte


B. �ŷ�ó������, ����

SELECT �ŷ�ó������, ����                  |  SELECT �ŷ�ó������, ����
FROM ����;                                |  FROM �ŷ�ó����;
--> 200�� * 50Byte                        | --> 200�� * 70Byte



C. �ŷ�óȸ���, �ŷ�ó������

SELECT ȸ��.�ŷ�óȸ���, ����.�ŷ�ó������       |  SELECT �ŷ�óȸ���, �ŷ�ó������
FROM ȸ�� JOIN ����                              |  FROM �ŷ�ó����;
ON ȸ��.ȸ��ID = ����.ȸ��ID;                    | 
--> (3*40Byte) + (200��*50Byte)                 |   --> 200�� * 70Byte


*/

-- �� 2 ������

/*
-- ���̺�� : �ֹ�

--------------------------------------------------------------------
    ��ID            ��ǰ�ڵ�            �ֹ�����          �ֹ�����
    ++++++++++++++++++++++++++++++++++++++++++++++
                        (P.K)
--------------------------------------------------------------------
    PJH1217(������)    P-SWK(�����)    2019-09-20 15:27:31     10
    PHJ9983(��ȣ��)    P-YPR(���ĸ�)    2019-09-20 16:10:11     20
    CKH5211(������)    P-CPI(��������)  2019-09-21 06:25:38     12
    CKH5211(������)    P-YPR(���ĸ�)    2019-09-21 09:00:13     10
    KSW5886(��ҿ�)    P-SWK(�����)    2019-09-22 13:47:09     20
                                :
--------------------------------------------------------------------
*/

--�� �ϳ��� ���̺� �����ϴ� PRIMARY KEY�� �ִ� ������ 1���̴�.
--   ������, PRIMARY KEY�� �̷��(�����ϴ�) �÷��� ������ ����(������)�� ���� �����ϴ�.
--   �÷� 1���θ� ������ PRIMARY KEY�� SINGLE PRIMARY KEY ��� �θ���.
--   (���� �����̸Ӹ�Ű)
--   �� �� �̻��� �÷����� ������ PRIMARY KEY �� COMPOSITE PRIMARY KEY ��� �θ���.
--   (���� �����̸Ӹ� Ű)

-- �� 2 ������
--> �� 1 �������� ��ģ ��������� PRIMARY KEY �� SINGLE COLUMN �̶��
--  �� 2 ����ȭ�� �������� �ʴ´�.
--  ������, PRIMARY KEY �� COMPOSITE COLUMN �̶��
--  ��.��.�� �� 2����ȭ�� �����ؾ� �Ѵ�.

--> �ĺ��ڰ� �ƴ� �÷��� �ĺ��� ��ü �÷��� ���� �������̾�� �ϴµ�
--  �ĺ��� ��ü �÷��� �ƴ� �Ϻ� �ĺ��� �÷��� ���ؼ��� �������̶��
--  �̸� �и��Ͽ� ���ο� ���̺��� ������ �ִ� ����

/*
- ���̺�� : ���� -> �θ� ���̺�
----------------------------------------------------------------------------------
�����ȣ    �����     ������ȣ   �����ڸ�    ���ǽ��ڵ�            ���ǽǼ���
++++++++              +++++++++
    (P.                    K)
----------------------------------------------------------------------------------
JAVA0101    �ڹٱ���    21        ������ó     A301       ����ǽ���3�� 30�� �Ը�
JAVA0102    �ڹ��߱�    22        �׽���       T502       ���ڰ��а�5�� 60�� �Ը�
DB0102      ����Ŭ�߱�  22        �׽���       A201       ����ǽ���2�� 30�� �Ը�
DB0103      ����Ŭ���  10        �念��       T502       ���ڰ��а�5�� 60�� �Ը�
JSP0105     JSP��ȭ     19        ���ν�Ÿ��   K101       �ι����а�1�� 90�� �Ը�
                                        :
-----------------------------------------------------------------------------------

-���̺�� : ���� -> �ڽ� ���̺�
-----------------------------------------------
�����ȣ    �����ڹ�ȣ       �й�          ����
======================
         (F.K)
++++++++                   ++++++++++
    (P.                     K)
-----------------------------------------------
DB0102          22      1912107(����ä)    80
DB0102          22      1912108(�赿��)    72
DB0102          22      1912110(������)    43
                            :
------------------------------------------------                            
*/

-- �� 3 ������
--> �ĺ��ڰ� �ƴ� �÷��� �ĺ��ڰ� �ƴ� �÷��� �������� ��Ȳ�̶��
--  �̸� �и��Ͽ� ���ο� ���̺��� ������ �־�� �Ѵ�.


--�� ����(Relation)�� ����

-- 1:1 ����
--> ����, ���������� ������ �� �ִ� �����̱� ������
--  �������̸� ���ؾ� �� ����
--  EX) ȸ������ ���̺�� �α��� ���̺�
--  -> �̰��� ���� �ε����� ���� ������ �ذ��ϴ� ���� �ٶ����ϴ�.


-- 1:many ����
--> �� 1 �������� �����Ͽ� ������ ��ģ ��������� ��Ÿ���� �ٶ����� ����
--  ������ �����ͺ��̽��� Ȱ���ϴ� �������� �߱��ؾ� �ϴ� ����.

-- many:many ����
--> ������ �𵨸������� ������ �� ������
--  ���� �������� �𵨸������� ������ �� ���� ����.


/*
���̺�� : ��                                           ���̺�� : ��ǰ
-----------------------------------------------------    ---------------------------------------------------------
����ȣ    ����     �̸���     ��ȭ��ȣ...               ��ǰ��ȣ   ��ǰ��   ��ǰ�ܰ�         ��ǰ����...
+++++++++                                                 +++++++++
-----------------------------------------------------    ---------------------------------------------------------
1001        Ȳ����      HYB@NA..  010....                  P-SWK      �����      700         ���찡 ���...
1002        ������      HHS@NA..  010....                  P-YPR      ���ĸ�      900         ���İ� ���...
1003        ��â��      CCH@NA..  010....                  C-JKC      �ڰ�ġ      600         �ڰ��� ���...
                    :                                                           :
-----------------------------------------------------    ---------------------------------------------------------    

                                            ���̺�� : �ֹ����(�Ǹ�)
                                            ------------------------------------------------
                                            ����ȣ    ��ǰ��ȣ    �ֹ�����      �ֹ�����
                                            ------------------------------------------------
                                            1001         P-SWK      2019-09-23..  10
                                            1001         P-YPR      2019-09-24... 10
                                            1001         C-JKC      2019-09-25... 10
                                            1002         P-SWK      2019-09-26....10
                                            1003         P-SWK      2019-09-27....10
                                                            :
                                            ------------------------------------------------
*/

-- �� 4 ������
--> ������ Ȯ���� ����� ���� ��:�� ���踦 1:�� ����� ���߸��� ������
--  �ٷ� �� 4 ������ ���� �����̴�.
--  -> �Ļ� ���̺� ���� -> ��:�� ���踦 1:�� ����� ���߸��� ���� ����



-- �� ������(��������)
/*
-- A ��� -> ���������� �����ϴ� ���� �ٶ������� ���� ���~!!!

-- ���̺�� : �μ�                        -- ���̺�� : ���
  10Byte    10Byte     10Byte                   10        10    10     10    10       10            10
-------------------------------             --------------------------------------------------  -----------
�μ���ȣ    �μ���     �ּ�                  �����ȣ    �����   ����  �޿�  �Ի���  �μ���ȣ      +�μ���
++++++++                                    +++++++                                ==========
(p.k)                                        (P.K)                                   (F.K)
-------------------------------             --------------------------------------------------  ------------
         10�� ��                                              1,000,000�� ��
-------------------------------             --------------------------------------------------

>> ��ȸ �����
--------------------------------
�μ���  �����   ����    �޿�
--------------------------------
�μ�     ���    ���    ���
--------------------------------

--> ���μ��� ���̺�� ������� ���̺��� JOIN ���� ���� ũ��
    (10 * 30Byte) + ( 1,000,000 * 60Byte) = 300 + 60000000 = 60000300Byte

--> ������� ���̺��� ������ȭ �� �� �� ���̺� �о�� ���� ũ��
--  (��, �μ� ���̺��� �μ��� �÷��� ��� ���̺� �߰��� ���)
     1,000,000 * 70Byte = 70000000Byte


-- B ��� -> ���������� �����ϴ� ���� �ٶ����ϴ�~!!!


-- ���̺�� : �μ�                        -- ���̺�� : ���
  10Byte    10Byte     10Byte                   10        10    10     10    10       10            10
-------------------------------             --------------------------------------------------  -----------
�μ���ȣ    �μ���     �ּ�                  �����ȣ    �����   ����  �޿�  �Ի���  �μ���ȣ      +�μ���
++++++++                                    +++++++                                ==========
(p.k)                                        (P.K)                                   (F.K)
-------------------------------             --------------------------------------------------  ------------
         500,000�� ��                                              1,000,000�� ��
-------------------------------             --------------------------------------------------

>> ��ȸ �����
--------------------------------
�μ���  �����   ����    �޿�
--------------------------------
�μ�     ���    ���    ���
--------------------------------

--> ���μ��� ���̺�� ������� ���̺��� JOIN ���� ���� ũ��
    (500000 * 30Byte) + ( 1,000,000 * 60Byte) = 15000000 + 60000000 = 75000000Byte

--> ������� ���̺��� ������ȭ �� �� �� ���̺� �о�� ���� ũ��
--  (��, �μ� ���̺��� �μ��� �÷��� ��� ���̺� �߰��� ���)
     1,000,000 * 70Byte = 70000000Byte

*/


--�� ����

/*
1. ����(relationship, relation)
   - ��� ��Ʈ��(entry)�� ���ϰ��� ������.
   - �� ��(column)�� ������ �ǹ̸� ������ ������ ���ǹ��ϴ�.
   - ���̺��� ��� ��(row=Ʃ��=tuple)�� �������� ������ ������ ���ǹ��ϴ�.

2. �Ӽ�(attribute)
   - ���̺��� ��(column)�� ��Ÿ����.
   - �ڷ��� �̸��� ���� �ּ� ���� ���� : ��ü�� ����, ���� ���
   - �Ϲ� ����(file)�� �׸�(������=item=�ʵ�=field)�� �ش��Ѵ�.
   - ��ƼƼ(entity)�� Ư���� ���¸� ���
   - �Ӽ�(attribute)�� �̸��� ��� �޶�� �Ѵ�.
   
3. Ʃ��=tuple=��ƼƼ=entity
   - ���̺��� ��(row)
   - ������ �� ���� �Ӽ����� ����
   - ���� ���� ����
   - �Ϲ� ����(file)�� ���ڵ�(record)�� �ش��Ѵ�.
   - Ʃ�� ����(tuple variable)
     : Ʃ��(tuple)�� ����Ű�� ����, ��� Ʃ�� ������ ���������� �ϴ� ����
     
4. ������(domain)
   - �� �Ӽ�(attribute)�� ���� �� �ֵ��� ���� ������ ����
   - �Ӽ� ��� ������ ���� �ݵ�� ������ �ʿ�� ����.
   - ��� �����̼ǿ��� ��� �Ӽ����� �������� ������(atomic)�̾�� ��
   - ������ ������
     : �������� ���Ұ� �� �̻� �������� �� ���� ����ü�� ���� ��Ÿ��
     
5. �����̼�(relation)
   - ���� �ý��ۿ��� ���ϰ� ���� ����
   - �ߺ��� Ʃ��(tuple=entity=��ƼƼ)�� �������� �ʴ´�. -> ��� ������(Ʃ���� ���ϼ�)
   - �����̼� = Ʃ��(��ƼƼ=entity)�� ����. ���� Ʃ���� ������ ���ǹ��ϴ�.
   - �Ӽ�(attribute)������ ������ ����.
   
*/

--------------------------------------------------------------------------------------------
/*
--���� ���Ἲ(Integrity) ����--

1. ���Ἲ���� ��ü ���Ἲ(Entity Integrity)
              ���� ���Ἲ(Relational Integrity)
              ������ ���Ἲ(Domain Integrity)�� �ִ�.
              
2. ��ü ���Ἲ
   ��ü ���Ἲ�� �����̼ǿ� ����Ǵ� Ʃ��(tuple)��
   ���ϼ��� �����ϱ� ���� ���������̴�.
   
3. ���� ���Ἲ
   ���� ���Ἲ�� �����̼� ���� ������ �ϰ�����
   �����ϱ� ���� ���������̴�.

4. ������ ���Ἲ
   ������ ���Ἥ�� ��� ������ ���� ������
   �����ϱ� ���� ���������̴�.
   
5. ���������� ����

    -PRIMARY KEY(PK:P)
     �ش� �÷��� ���� �ݵ�� �����ؾ� �ϸ�, �����ؾ� �Ѵ�.
     (NOT NULL �� UNIQUE�� ���յ� ����)
     
    -FOREIGN KEY(FK:F:R)
     �ش� �÷��� ���� �����Ǵ� ���̺��� �÷� �����͵� �� �ϳ���
     ��ġ�ϰų� NULL�� ������.
     
    -UNIQUE(UK:U)
     ���̺� ������ �ش� �÷��� ���� �׻� �����ؾ� �Ѵ�.
     
    -NOT NULL(NN:CK:C)
     �ش� �÷��� NULL�� ������ �� ����.
     
    -CHECK(CK:C)
     �ش� �÷��� ���� ������ �������� ���� ������ ������ �����Ѵ�.


*/

---------------------------------------------------------------------------

--���� PRIMARY KEY ����--

-- 1.���̺� ���� �⺻ Ű�� �����Ѵ�.

-- 2.���̺��� �� ���� �����ϰ� �ĺ��ϴ� �÷� �Ǵ� �÷��� �����̴�.
--   �⺻ Ű�� ���̺� �� �ִ� �ϳ��� �����Ѵ�.
--   �׷��� �ݵ�� �ϳ��� �÷����θ� �����Ǵ� ���� �ƴϴ�.
--   NULL�� �� ����, �̹� ���̺� �����ϰ� �ִ� �����͸�
--   �ٽ� �Է��� �� ������ ó���Ѵ�.
--   UNIQUE INDEX�� �ڵ����� �����ȴ�. (����Ŭ�� ��ü������ �����.)

-- 3. ���� �� ����

-- �� �÷� ������ ����
-- �÷��� ������Ÿ�� [CONSTRAINT COSTRAINT��] PRIMARY KEY[(�÷���, ...)]

-- �� ���̺� ������ ����
-- �÷��� ������Ÿ��,
-- �÷��� ������Ÿ��,
-- CONSTRAINT CONSTRAINT�� PRIMARY KEY(�÷���, ...)

-- 4. CONSTRAINT �߰� �� CONSTRAINT���� �����ϸ�
--    ����Ŭ ������ �ڵ������� CONSTRAINT���� �ο��ϰ� �ȴ�.
--    �Ϲ������� CONSTRAINT���� ���̺��_�÷���_CONSTRAINT ����
--    �������� ����Ѵ�.


--�� PK ���� �ǽ�(�� �÷� ������ ����)
--���̺� ����

CREATE TABLE TBL_TEST1
( COL1  NUMBER(5)       PRIMARY KEY
, COL2  VARCHAR2(30)
);
--==>> Table TBL_TEST1��(��) �����Ǿ����ϴ�.

-- ������ �Է�
INSERT INTO TBL_TEST1(COL1,COL2) VALUES(1,'TEST');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
INSERT INTO TBL_TEST1(COL1,COL2) VALUES(1,'TEST');  --> ���� �߻�
INSERT INTO TBL_TEST1(COL1,COL2) VALUES(1,'ABCD');  --> ���� �߻�
INSERT INTO TBL_TEST1(COL1,COL2) VALUES(2,'ABCD');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
INSERT INTO TBL_TEST1(COL1,COL2) VALUES(3,NULL);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
INSERT INTO TBL_TEST1(COL2) VALUES(4);              --> ���� �߻�
INSERT INTO TBL_TEST1(COL1) VALUES(4);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
INSERT INTO TBL_TEST1(COL1, COL2) VALUES(5,'ABCD');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
INSERT INTO TBL_TEST1(COL1,COL2) VALUES(NULL,NULL); --> ���� �߻�


COMMIT;
--==>> Ŀ�� �Ϸ�.

SELECT *
FROM TBL_TEST1;
--==>>
/*
1	TEST
2	ABCD
3	
4	
5	ABCD
*/

DESC TBL_TEST1;
--==>>
/*
�̸�   ��?       ����           
---- -------- ------------ 
COL1 NOT NULL NUMBER(5)     -> PK ���� Ȯ�� �Ұ�
COL2          VARCHAR2(30) 

*/

--�� �������� Ȯ��

SELECT *
FROM USER_CONSTRAINTS;
--==>>
/*
HR	REGION_ID_NN	C	REGIONS	"REGION_ID" IS NOT NULL				ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	USER NAME			14/05/29				
HR	REG_ID_PK	P	REGIONS					ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	USER NAME			14/05/29	HR	REG_ID_PK		
HR	COUNTRY_ID_NN	C	COUNTRIES	"COUNTRY_ID" IS NOT NULL				ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	USER NAME			14/05/29				
HR	COUNTRY_C_ID_PK	P	COUNTRIES					ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	USER NAME			14/05/29	HR	COUNTRY_C_ID_PK		
HR	COUNTR_REG_FK	R	COUNTRIES		HR	REG_ID_PK	NO ACTION	ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	USER NAME			14/05/29				
HR	LOC_CITY_NN	C	LOCATIONS	"CITY" IS NOT NULL				ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	USER NAME			14/05/29				
HR	LOC_ID_PK	P	LOCATIONS					ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	USER NAME			14/05/29	HR	LOC_ID_PK		
HR	LOC_C_ID_FK	R	LOCATIONS		HR	COUNTRY_C_ID_PK	NO ACTION	ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	USER NAME			14/05/29				
HR	DEPT_NAME_NN	C	DEPARTMENTS	"DEPARTMENT_NAME" IS NOT NULL				ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	USER NAME			14/05/29				
HR	DEPT_ID_PK	P	DEPARTMENTS					ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	USER NAME			14/05/29	HR	DEPT_ID_PK		
HR	DEPT_LOC_FK	R	DEPARTMENTS		HR	LOC_ID_PK	NO ACTION	ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	USER NAME			14/05/29				
HR	JOB_TITLE_NN	C	JOBS	"JOB_TITLE" IS NOT NULL				ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	USER NAME			14/05/29				
HR	JOB_ID_PK	P	JOBS					ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	USER NAME			14/05/29	HR	JOB_ID_PK		
HR	EMP_LAST_NAME_NN	C	EMPLOYEES	"LAST_NAME" IS NOT NULL				ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	USER NAME			14/05/29				
HR	EMP_EMAIL_NN	C	EMPLOYEES	"EMAIL" IS NOT NULL				ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	USER NAME			14/05/29				
HR	EMP_HIRE_DATE_NN	C	EMPLOYEES	"HIRE_DATE" IS NOT NULL				ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	USER NAME			14/05/29				
HR	EMP_JOB_NN	C	EMPLOYEES	"JOB_ID" IS NOT NULL				ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	USER NAME			14/05/29				
HR	EMP_SALARY_MIN	C	EMPLOYEES	salary > 0				ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	USER NAME			14/05/29				
HR	EMP_EMAIL_UK	U	EMPLOYEES					ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	USER NAME			14/05/29	HR	EMP_EMAIL_UK		
HR	EMP_EMP_ID_PK	P	EMPLOYEES					ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	USER NAME			14/05/29	HR	EMP_EMP_ID_PK		
HR	EMP_DEPT_FK	R	EMPLOYEES		HR	DEPT_ID_PK	NO ACTION	ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	USER NAME			14/05/29				
HR	EMP_JOB_FK	R	EMPLOYEES		HR	JOB_ID_PK	NO ACTION	ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	USER NAME			14/05/29				
HR	EMP_MANAGER_FK	R	EMPLOYEES		HR	EMP_EMP_ID_PK	NO ACTION	ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	USER NAME			14/05/29				
HR	DEPT_MGR_FK	R	DEPARTMENTS		HR	EMP_EMP_ID_PK	NO ACTION	ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	USER NAME			14/05/29				
HR	JHIST_EMPLOYEE_NN	C	JOB_HISTORY	"EMPLOYEE_ID" IS NOT NULL				ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	USER NAME			14/05/29				
HR	JHIST_START_DATE_NN	C	JOB_HISTORY	"START_DATE" IS NOT NULL				ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	USER NAME			14/05/29				
HR	JHIST_END_DATE_NN	C	JOB_HISTORY	"END_DATE" IS NOT NULL				ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	USER NAME			14/05/29				
HR	JHIST_JOB_NN	C	JOB_HISTORY	"JOB_ID" IS NOT NULL				ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	USER NAME			14/05/29				
HR	JHIST_DATE_INTERVAL	C	JOB_HISTORY	end_date > start_date				ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	USER NAME			14/05/29				
HR	JHIST_EMP_ID_ST_DATE_PK	P	JOB_HISTORY					ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	USER NAME			14/05/29	HR	JHIST_EMP_ID_ST_DATE_PK		
HR	JHIST_JOB_FK	R	JOB_HISTORY		HR	JOB_ID_PK	NO ACTION	ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	USER NAME			14/05/29				
HR	JHIST_EMP_FK	R	JOB_HISTORY		HR	EMP_EMP_ID_PK	NO ACTION	ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	USER NAME			14/05/29				
HR	JHIST_DEPT_FK	R	JOB_HISTORY		HR	DEPT_ID_PK	NO ACTION	ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	USER NAME			14/05/29				
HR	SYS_C004102	O	EMP_DETAILS_VIEW					ENABLED	NOT DEFERRABLE	IMMEDIATE	NOT VALIDATED	GENERATED NAME			14/05/29				
HR	SYS_C007013	P	TBL_TEST1					ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	GENERATED NAME			19/09/23	HR	SYS_C007013		
*/


SELECT *
FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'TBL_TEST1';
--==>> HR	SYS_C007013	P	TBL_TEST1					ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	GENERATED NAME			19/09/23	HR	SYS_C007013		


SELECT *
FROM USER_CONS_COLUMNS
WHERE TABLE_NAME = 'TBL_TEST1';
--==>> HR	SYS_C007013	TBL_TEST1	COL1	1



--�� USER_CONSTRATINS �� USER_CONS_COLUMNS   �� �������
--   ���������� ������ ������, �������Ǹ�, ���̺��, ������������, �÷��� �׸��� ��ȸ�Ѵ�.


SELECT UC.OWNER, UC.CONSTRAINT_NAME, UC.TABLE_NAME, UC.CONSTRAINT_TYPE, UCC.COLUMN_NAME
FROM USER_CONSTRAINTS UC, USER_CONS_COLUMNS UCC
WHERE UC.CONSTRAINT_NAME = UCC.CONSTRAINT_NAME AND UC.TABLE_NAME ='TBL_TEST1';
--==>> HR	SYS_C007013	TBL_TEST1	P	COL1


--�� PK ���� �ǽ�(�� ���̺� ������ ����)

CREATE TABLE TBL_TEST2
( COL1  NUMBER(5)
, COL2  VARCHAR2(30)
, CONSTRAINT TEST2_COL1_PK PRIMARY KEY(COL1)
);
--==>> Table TBL_TEST2��(��) �����Ǿ����ϴ�.

-- ������ �Է�
INSERT INTO TBL_TEST2(COL1,COL2) VALUES(1,'TEST');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
INSERT INTO TBL_TEST2(COL1,COL2) VALUES(1,'TEST');  --> ���� �߻�
INSERT INTO TBL_TEST2(COL1,COL2) VALUES(1,'ABCD');  --> ���� �߻�
INSERT INTO TBL_TEST2(COL1,COL2) VALUES(2,'ABCD');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
INSERT INTO TBL_TEST2(COL1,COL2) VALUES(3,NULL);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
INSERT INTO TBL_TEST2(COL2) VALUES(4);              --> ���� �߻�
INSERT INTO TBL_TEST2(COL1) VALUES(4);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
INSERT INTO TBL_TEST2(COL1, COL2) VALUES(5,'ABCD');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
INSERT INTO TBL_TEST2(COL1,COL2) VALUES(NULL,NULL); --> ���� �߻�

COMMIT;
--==>> Ŀ�� �Ϸ�.


SELECT *
FROM TBL_TEST2;
--==>>
/*
1	TEST
2	ABCD
3	
4	
5	ABCD
*/

--�� ���������� ������ ������, �������Ǹ�, ���̺��, ������������, �÷��� �׸��� ��ȸ�Ѵ�.

SELECT UC.OWNER, UC.CONSTRAINT_NAME, UC.TABLE_NAME, UC.CONSTRAINT_TYPE, UCC.COLUMN_NAME
FROM USER_CONSTRAINTS UC, USER_CONS_COLUMNS UCC
WHERE UC.CONSTRAINT_NAME = UCC.CONSTRAINT_NAME AND UC.TABLE_NAME ='TBL_TEST2';
--==>> HR	TEST2_COL1_PK	TBL_TEST2	P	COL1

--�� PK ���� �ǽ�( �� ���� �÷� PK ����)

CREATE TABLE TBL_TEST3
(COL1   NUMBER(5)
,COL2   VARCHAR2(30)
,CONSTRAINT TEST3_COL1_COL2_PK PRIMARY KEY(COL1, COL2)
);

--=>> Table TBL_TEST3��(��) �����Ǿ����ϴ�.



--(X)
CREATE TABLE TBL_TEST3
(COL1   NUMBER(5)
,COL2   VARCHAR2(30)
,CONSTRAINT TEST3_COL1_PK PRIMARY KEY(COL1)
,CONSTRAINT TEST3_COL2_PK PRIMARY KEY(COL2)
);
--

-- ������ �Է�
INSERT INTO TBL_TEST3(COL1,COL2) VALUES(1,'TEST');
INSERT INTO TBL_TEST3(COL1,COL2) VALUES(1,'TEST');  --> ���� �߻�
INSERT INTO TBL_TEST3(COL1,COL2) VALUES(1,'ABCD');
INSERT INTO TBL_TEST3(COL1,COL2) VALUES(2,'ABCD');
INSERT INTO TBL_TEST3(COL1,COL2) VALUES(3,NULL);    --> ���� �߻�
INSERT INTO TBL_TEST3(COL2) VALUES(4);              --> ���� �߻�
INSERT INTO TBL_TEST3(COL1) VALUES(4);              --> ���� �߻�
INSERT INTO TBL_TEST3(COL1, COL2) VALUES(5,'ABCD');
INSERT INTO TBL_TEST3(COL1,COL2) VALUES(NULL,NULL); --> ���� �߻�


SELECT *
FROM TBL_TEST3;
--==>>
/*
1	ABCD
1	TEST
2	ABCD
5	ABCD
*/

COMMIT;
--==>> Ŀ�� �Ϸ�.

--�� PK ���� �ǽ� (�� ���̺� ���� ���� �������� �߰� -> PK ����)
-- ���̺� ����

CREATE TABLE TBL_TEST4
(COL1   NUMBER(5)
,COL2   VARCHAR2(30)
);
--==>> Table TBL_TEST4��(��) �����Ǿ����ϴ�.

--�� �̹� ������� �ִ� ���̺�
--   �ο��Ϸ��� ���������� ������ �����Ͱ� ���ԵǾ� ���� ���
--   �ش� ���̺� ���������� �߰��ϴ� ���� �Ұ����ϴ�.

-- �������� �߰�
ALTER TABLE TBL_TEST4
ADD CONSTRAINT TEST4_COL1_PK PRIMARY KEY(COL1);
--==>> Table TBL_TEST4��(��) ����Ǿ����ϴ�.

--�� ���������� ������ ������, �������Ǹ�, ���̺��, ������������, �÷��� �׸��� ��ȸ�Ѵ�.

SELECT UC.OWNER, UC.CONSTRAINT_NAME, UC.TABLE_NAME, UC.CONSTRAINT_TYPE, UCC.COLUMN_NAME
FROM USER_CONSTRAINTS UC, USER_CONS_COLUMNS UCC
WHERE UC.CONSTRAINT_NAME = UCC.CONSTRAINT_NAME AND UC.TABLE_NAME ='TBL_TEST4';
--==>> HR	TEST4_COL1_PK	TBL_TEST4	P	COL1


--�� �������� Ȯ�ο� ���� ��(VIEW) ����

CREATE OR REPLACE VIEW VIEW_CONSTCHECK
AS
SELECT UC.OWNER "OWNER"
    ,UC.CONSTRAINT_NAME "CONSTRAINT_NAME"
    ,UC.TABLE_NAME"TABLE_NAME"
    ,UC.CONSTRAINT_TYPE"CONSTRAINT_TYPE"
    ,UCC.COLUMN_NAME"COLUMN_NAME"
    ,UC.SEARCH_CONDITION"SEARCH_CONDITION"
    ,UC.DELETE_RULE"DELETE_RULE"
FROM USER_CONSTRAINTS UC JOIN USER_CONS_COLUMNS UCC
ON UC.CONSTRAINT_NAME = UCC.CONSTRAINT_NAME;
--==>> View VIEW_CONSTCHECK��(��) �����Ǿ����ϴ�.


--�� ������ ��(VIEW)�� ���� �������� Ȯ��

SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME = 'TBL_TEST4';
--==>> HR	TEST4_COL1_PK	TBL_TEST4	P	COL1		


------------------------------------------------------------------------

--���� UNIQUE (UK:U) ����--

-- 1.���̺��� ������ �÷��� �����Ͱ� �ߺ����� �ʰ� ������ �� �ֵ��� �����ϴ� ��������.
--   PRIMARY KEY �� ������ ��������������, NULL�� ����Ѵٴ� �������� �ִ�.
--   ���������� PRIMARY KEY �� ���������� UNIQUE INDEX �� �ڵ� �����ȴ�.
--   �ϳ��� ���̺� ������ UNIQUE ���������� ���� �� �����ϴ� ���� �����ϴ�.
--   ��, �ϳ��� ���̺� UNIQUE ���������� ���� �� ����� ���� �����ϴٴ� ���̴�.

-- 2. ���� �� ����
-- �� �÷� ������ ����
-- �÷��� ������Ÿ�� [CONSTRAINT CONSTRAING��] UNIQUE

-- �� ���̺� ������ ����
-- �÷��� ������ Ÿ��,
-- �÷��� ������ Ÿ��,
-- CONSTRAINT CONSTRAINT�� UNIQUE (�÷���,...)



--�� UK ���� �ǽ�(�� �÷� ������ ����)
CREATE TABLE TBL_TEST5
( COL1  NUMBER(5)       PRIMARY KEY
, COL2  VARCHAR2(30)    UNIQUE
);
--==>> Table TBL_TEST5��(��) �����Ǿ����ϴ�.

-- �������� ��ȸ
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME = 'TBL_TEST5';
--==>>
/*
HR	SYS_C007017	TBL_TEST5	P	COL1		
HR	SYS_C007018	TBL_TEST5	U	COL2		
*/

-- ������ �Է�
INSERT INTO TBL_TEST5(COL1,COL2) VALUES(1,'TEST');
INSERT INTO TBL_TEST5(COL1,COL2) VALUES(1,'TEST');  --> ���� �߻�
INSERT INTO TBL_TEST5(COL1,COL2) VALUES(1,'ABCD');
INSERT INTO TBL_TEST5(COL1,COL2) VALUES(2,'ABCD');
INSERT INTO TBL_TEST5(COL1,COL2) VALUES(3,NULL);    
INSERT INTO TBL_TEST5(COL2) VALUES(4);              --> ���� �߻�
INSERT INTO TBL_TEST5(COL1) VALUES(4);              
INSERT INTO TBL_TEST5(COL1, COL2) VALUES(5,'ABCD'); --> ���� �߻�
INSERT INTO TBL_TEST5(COL1,COL2) VALUES(NULL,NULL); --> ���� �߻�


SELECT *
FROM TBL_TEST5;
--==>>
/*
1	TEST
2	ABCD
3	
4	
*/
-- NULL�� ������ ������ �� ħ , ���� ���� ����

--�� UK ���� �ǽ�(�� ���̺� ������ ����)
-- ���̺� ����
CREATE TABLE TBL_TEST6
( COL1   NUMBER(5)
, COL2   VARCHAR2(30)
, CONSTRAINT TEST6_COL1_PK PRIMARY KEY(COL1)
, CONSTRAINT TEST6_COL2_UK UNIQUE(COL2)
);
--==>> Table TBL_TEST6��(��) �����Ǿ����ϴ�.

-- ���� ���� Ȯ��

SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME = 'TBL_TEST6';
--==>>
/*
HR	TEST6_COL1_PK	TBL_TEST6	P	COL1		
HR	TEST6_COL2_UK	TBL_TEST6	U	COL2		
*/


--�� UK ���� �ǽ�(�� ���̺� ���� ���� �������� �߰�)
CREATE TABLE TBL_TEST7
( COL1  NUMBER(5)
, COL2 VARCHAR2(30)
);
--==>> Table TBL_TEST7��(��) �����Ǿ����ϴ�.

-- �������� Ȯ��

SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME = 'TBL_TEST7';
--==>> ��ȸ ��� ����


-- ���� ���� �߰�
ALTER TABLE TBL_TEST7
ADD (CONSTRAINT TEST7_COL1_PK PRIMARY KEY(COL1)
    ,CONSTRAINT TEST7_COL2_UK UNIQUE(COL2) );

--==>> Table TBL_TEST7��(��) ����Ǿ����ϴ�.

-- ���� ���� �߰� ���� �ٽ� Ȯ��

SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME = 'TBL_TEST7';
--==>>
/*
HR	TEST7_COL1_PK	TBL_TEST7	P	COL1		
HR	TEST7_COL2_UK	TBL_TEST7	U	COL2		
*/


------------------------------------------------------------

--���� CHECK(CK:C) ����--
-- 1. �÷����� ��� ������ �������� ������ ������ �����ϱ� ���� ��������
--    �÷����� �ԷµǴ� �����͸� �˻��Ͽ� ���ǿ� �´� �����͸� �Էµ� �� �ֵ��� �Ѵ�.
--    ����, �÷����� �����Ǵ� �����͸� �˻��Ͽ� ���ǿ� �´� �����ͷ� �����Ǵ� �͸�
--    ����ϴ� ����� �����ϰ� �ȴ�.


-- 2. ���� �� ����
-- �� �÷� ������ ����
-- �÷��� ������Ÿ�� [CONSTRAINT CONSTRAINT��] CHECK (�÷� ����)

-- �� ���̺� ������ ����
-- �÷��� ������Ÿ��,
-- �÷��� ������Ÿ��,
-- CONSTRAINT CONSTRAINT�� CHECK(�÷� ����)

--�� CK ���� �ǽ�(�� �÷� ������ ����)
-- ���̺� ����
CREATE TABLE TBL_TEST8
( COL1  NUMBER(5)       PRIMARY KEY
, COL2  VARCHAR2(30)    
, COL3  NUMBER(3)       CHECK(COL3 BETWEEN 0 AND 100)
);
--==>> Table TBL_TEST8��(��) �����Ǿ����ϴ�.


-- ������ �Է�
INSERT INTO TBL_TEST8(COL1,COL2,COL3) VALUES(1,'â��',100);
INSERT INTO TBL_TEST8(COL1,COL2,COL3) VALUES(2,'����',101); --> ���� �߻�
INSERT INTO TBL_TEST8(COL1,COL2,COL3) VALUES(3,'����',-1);  --> ���� �߻�
INSERT INTO TBL_TEST8(COL1,COL2,COL3) VALUES(4,'����',80);

COMMIT;
--==>> Ŀ�� �Ϸ�.

SELECT *
FROM TBL_TEST8;
--==>>
/*
1	â��	100
4	����	80
*/

-- ���� ���� Ȯ��

SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME = 'TBL_TEST8';
--==>>
/*
HR	SYS_C007023	TBL_TEST8	C	COL3	COL3 BETWEEN 0 AND 100	
HR	SYS_C007024	TBL_TEST8	P	COL1		
*/

--�� CK ���� �ǽ�(�� ���̺� ������ ����)
-- ���̺� ����
CREATE TABLE TBL_TEST9
( COL1  NUMBER(5)
, COL2  VARCHAR2(30)
, COL3  NUMBER(3)
, CONSTRAINT TEST9_COL1_PK PRIMARY KEY(COL1)
, CONSTRAINT TEST9_COL3_CK CHECK (COL3 BETWEEN 0 AND 100)
);
--==>> Table TBL_TEST9��(��) �����Ǿ����ϴ�.

-- ������ �Է�
INSERT INTO TBL_TEST9(COL1,COL2,COL3) VALUES(1,'â��',100);
INSERT INTO TBL_TEST9(COL1,COL2,COL3) VALUES(2,'����',101); --> ���� �߻�
INSERT INTO TBL_TEST9(COL1,COL2,COL3) VALUES(3,'����',-1);  --> ���� �߻�
INSERT INTO TBL_TEST9(COL1,COL2,COL3) VALUES(4,'����',80);

COMMIT;
--==>> Ŀ�� �Ϸ�.

SELECT *
FROM TBL_TEST9;
--==>>
/*
1	â��	100
4	����	80
*/

-- �������� Ȯ��

SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME = 'TBL_TEST9';
--==>>
/*
HR	TEST9_COL3_CK	TBL_TEST9	C	COL3	COL3 BETWEEN 0 AND 100	
HR	TEST9_COL1_PK	TBL_TEST9	P	COL1		
*/


--�� CK ���� �ǽ� (�� ���̺� ���� ���� �������� �߰�)
CREATE TABLE TBL_TEST10
( COL1  NUMBER(5)
, COL2  VARCHAR2(30)
, COL3  NUMBER(3)
);
--==>> Table TBL_TEST10��(��) �����Ǿ����ϴ�.

-- �������� Ȯ��

SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME = 'TBL_TEST10';
--==>> ��ȸ ��� ����

-- ���� ���� �߰�
ALTER TABLE TBL_TEST10
ADD (CONSTRAINT TEST10_COL1_PK PRIMARY KEY(COL1)
    ,CONSTRAINT TEST10_COL3_CK CHECK(COL3 BETWEEN 0 AND 100));
--==>> Table TBL_TEST10��(��) ����Ǿ����ϴ�.

-- ���� ���� Ȯ��
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME = 'TBL_TEST10';
--==>>
/*
HR	TEST10_COL1_PK	TBL_TEST10	P	COL1		
HR	TEST10_COL3_CK	TBL_TEST10	C	COL3	COL3 BETWEEN 0 AND 100	
*/


--�� �ǽ� ����
-- ������ ���� TBL_TESTMEMBER ���̺��� �����Ͽ�
-- SSN �÷�(�ֹι�ȣ �÷�)����
-- ������ �Է� �� ������ ��ȿ�� �����͸� �Էµ� �� �ֵ���
-- üũ ���������� �߰��� �� �ֵ��� �Ѵ�.
-- (-> �ֹι�ȣ Ư�� �ڸ��� �Է� ������ �����͸� 1,2,3,4 �� �����ϵ��� ó��)
-- ����, SID �÷����� PRIMARY KEY ���������� ������ �� �ֵ��� �Ѵ�.

-- ���̺� ����
CREATE TABLE TBL_TESTMEMEBER
( SID   NUMBER
, NAME  VARCHAR2(30)
, SSN   CHAR(14)        -- �Է����� -> 'YYMMDD-NNNNNNN'
, TEL   VARCHAR2(40)
);
--==>> Table TBL_TESTMEMEBER��(��) �����Ǿ����ϴ�.

ALTER TABLE TBL_TESTMEMEBER
ADD (CONSTRAINT TESTMEMEBER_SID_PK PRIMARY KEY(SID)
    ,CONSTRAINT TESTMEMEBER_SSN_CK CHECK(SUBSTR(SSN,8,1) IN ('1','2','3','4')));
--==>> Table TBL_TESTMEMEBER��(��) ����Ǿ����ϴ�.


SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME = 'TBL_TESTMEMEBER';
--==>>
/*
HR	TESTMEMEBER_SID_PK	TBL_TESTMEMEBER	P	SID		
HR	TESTMEMEBER_SSN_CK	TBL_TESTMEMEBER	C	SSN	SUBSTR(SSN,8,1) IN (1,2,3,4)	
*/










