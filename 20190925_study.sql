SELECT USER
FROM DUAL;

21. ������ ������ ���� ������� �� ���� ��ȸ�Ѵ�.

SELECT *
FROM EMPLOYEES_STUDY;

SELECT JOB_ID, COUNT(*)
FROM EMPLOYEES_STUDY
GROUP BY JOB_ID;
--==>>
/*
IT_PROG	5
AC_MGR	1
AC_ACCOUNT	1
ST_MAN	5
PU_MAN	1
AD_ASST	1
AD_VP	2
SH_CLERK	20
FI_ACCOUNT	5
FI_MGR	1
PU_CLERK	5
SA_MAN	5
MK_MAN	1
PR_REP	1
AD_PRES	1
SA_REP	30
MK_REP	1
ST_CLERK	20
HR_REP	1
*/


22. �Ŵ����� �ٹ��ϴ� ������� �� ���� ��ȸ�Ѵ�.
SELECT COUNT(*)
FROM
( 
    SELECT MANAGER_ID
    FROM EMPLOYEES_STUDY
    GROUP BY MANAGER_ID
    HAVING MANAGER_ID IS NOT NULL
)T;

23. �系�� �ִ� ���� �� �ּ� ������ ���̸� ��ȸ�Ѵ�.

SELECT MAX(SALARY)-MIN(SALARY)
FROM EMPLOYEES_STUDY;

--26. �� ��� �� �� 1995, 1996, 1997, 1998 �⵵ �� ���� ������� �� ���� ������ ���� ��ȸ�Ѵ�.
 

 29. ȸ�� ��ü ��� �������� �� �޴� ������� ��� �� LAST_NAME �� ��ȸ�Ѵ�.
 
SELECT EMPLOYEE_ID, LAST_NAME
FROM EMPLOYEES_STUDY
WHERE SALARY > ( SELECT AVG(SALARY)
                 FROM EMPLOYEES_STUDY
              );
--==>>
/*
100	King
101	Kochhar
102	De Haan
103	Hunold
108	Greenberg
109	Faviet
110	Chen
111	Sciarra
112	Urman
113	Popp
114	Raphaely
120	Weiss
121	Fripp
122	Kaufling
123	Vollman
145	Russell
146	Partners
147	Errazuriz
148	Cambrault
149	Zlotkey
150	Tucker
151	Bernstein
152	Hall
153	Olsen
154	Cambrault
155	Tuvault
156	King
157	Sully
158	McEwen
159	Smith
160	Doran
161	Sewall
162	Vishney
163	Greene
164	Marvins
165	Lee
168	Ozer
169	Bloom
170	Fox
171	Smith
172	Bates
174	Abel
175	Hutton
176	Taylor
177	Livingston
178	Grant
201	Hartstein
203	Mavris
204	Baer
205	Higgins
206	Gietz
*/
 30. LAST_NAME �� u �� ���ԵǴ� ������ ���� �μ��� �ٹ��ϴ� ������� ��� �� LAST_NAME �� ��ȸ�Ѵ�.
 
SELECT EMPLOYEE_ID, LAST_NAME 
FROM EMPLOYEES_STUDY
WHERE DEPARTMENT_ID IN ( SELECT DEPARTMENT_ID
                        FROM EMPLOYEES_STUDY
                        WHERE LAST_NAME LIKE '%u%'
                        );
--==>>
/*
107	Lorentz
106	Pataballa
105	Austin
104	Ernst
103	Hunold
119	Colmenares
118	Himuro
117	Tobias
116	Baida
115	Khoo
114	Raphaely
199	Grant
198	OConnell
197	Feeney
196	Walsh
195	Jones
194	McCain
193	Everett
192	Bell
191	Perkins
190	Gates
189	Dilly
188	Chung
187	Cabrio
186	Dellinger
185	Bull
184	Sarchand
183	Geoni
182	Sullivan
181	Fleaur
180	Taylor
144	Vargas
143	Matos
142	Davies
141	Rajs
140	Patel
139	Seo
138	Stiles
137	Ladwig
136	Philtanker
135	Gee
134	Rogers
133	Mallin
132	Olson
131	Marlow
130	Atkinson
129	Bissot
128	Markle
127	Landry
126	Mikkilineni
125	Nayer
124	Mourgos
123	Vollman
122	Kaufling
121	Fripp
120	Weiss
179	Johnson
177	Livingston
176	Taylor
175	Hutton
174	Abel
173	Kumar
172	Bates
171	Smith
170	Fox
169	Bloom
168	Ozer
167	Banda
166	Ande
165	Lee
164	Marvins
163	Greene
162	Vishney
161	Sewall
160	Doran
159	Smith
158	McEwen
157	Sully
156	King
155	Tuvault
154	Cambrault
153	Olsen
152	Hall
151	Bernstein
150	Tucker
149	Zlotkey
148	Cambrault
147	Errazuriz
146	Partners
145	Russell
*/

 31. ��ġ ID �� 1700 �� �μ����� �ٹ��ϴ� ������� LAST_NAME, �μ� ��ȣ �� JOB_ID �� ��ȸ�Ѵ�.

 SELECT *
 FROM EMPLOYEES_STUDY;
 SELECT *
 FROM DEPARTMENTS;
 
 SELECT LAST_NAME, DEPARTMENT_ID, JOB_ID, SALARY, COMMISSION_PCT
 FROM EMPLOYEES_STUDY
 WHERE DEPARTMENT_ID IN ( SELECT DEPARTMENT_ID
                         FROM DEPARTMENTS
                         WHERE LOCATION_ID = 1700
                        );
 --==>>
 /*
 King	90	AD_PRES
Kochhar	90	AD_VP
De Haan	90	AD_VP
Greenberg	100	FI_MGR
Faviet	100	FI_ACCOUNT
Chen	100	FI_ACCOUNT
Sciarra	100	FI_ACCOUNT
Urman	100	FI_ACCOUNT
Popp	100	FI_ACCOUNT
Raphaely	30	PU_MAN
Khoo	30	PU_CLERK
Baida	30	PU_CLERK
Tobias	30	PU_CLERK
Himuro	30	PU_CLERK
Colmenares	30	PU_CLERK
Whalen	10	AD_ASST
Higgins	110	AC_MGR
Gietz	110	AC_ACCOUNT
 */
 

33. EXECUTIVE �μ��� �ٹ��ϴ� ��� ������� �μ� ��ȣ, LAST_NAME, JOB_ID �� ��ȸ�Ѵ�.

SELECT DEPARTMENT_ID, LAST_NAME, JOB_ID
FROM EMPLOYEES_STUDY
WHERE DEPARTMENT_ID = (  SELECT DEPARTMENT_ID
                         FROM DEPARTMENTS
                         WHERE DEPARTMENT_NAME = 'Executive'
                        );
--==>> 
/*
90	King	AD_PRES
90	Kochhar	AD_VP
90	De Haan	AD_VP
*/

 42. ��ġ ID �� 1700 �� ������� ������ Ŀ�̼��� ������ ������� 
     LAST_NAME, �μ� ��ȣ �� ������ ��ȸ�Ѵ�.
     
SELECT LAST_NAME, DEPARTMENT_ID, SALARY
FROM EMPLOYEES_STUDY
WHERE SALARY IN (
                  SELECT SALARY
                  FROM EMPLOYEES_STUDY
                  WHERE DEPARTMENT_ID IN ( SELECT DEPARTMENT_ID
                                           FROM DEPARTMENTS
                                           WHERE LOCATION_ID = 1700
                                         )
                )
                OR COMMISSION_PCT IN ( SELECT COMMISSION_PCT
                                        FROM EMPLOYEES_STUDY
                                        WHERE DEPARTMENT_ID IN ( SELECT DEPARTMENT_ID
                                                                 FROM DEPARTMENTS
                                                                 WHERE LOCATION_ID = 1700
                                                               )
                
                                      );





 45. ���� �̸��� T �� �����ϴ� ������ ��� ������� ���, LAST_NAME �� �μ� ��ȣ�� ��ȸ�Ѵ�.

SELECT *
FROM LOCATIONS;

SELECT *
FROM DEPARTMENTS;


SELECT EMPLOYEE_ID, LAST_NAME, DEPARTMENT_ID
FROM EMPLOYEES_STUDY
WHERE DEPARTMENT_ID IN (  SELECT DEPARTMENT_ID
                         FROM DEPARTMENTS
                         WHERE LOCATION_ID IN (  SELECT LOCATION_ID
                                                FROM LOCATIONS
                                                WHERE CITY LIKE 'T%'
                                                )
                        );


--==>>
/*
202	Fay	        20
201	Hartstein	20
*/







