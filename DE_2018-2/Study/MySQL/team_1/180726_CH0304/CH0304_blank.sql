#Schema 생성
CREATE SCHEMA ybigta_SQL_study;
USE ybigta_SQL_study;

#Table 생성
CREATE TABLE MyTransaction (
ID INT NOT NULL AUTO_INCREMENT,
Product_Name VARCHAR(255),
Price INT,
Quantity INT,
Discount_Rate FLOAT,
Transaction_Date DATE,
Customer VARCHAR(255),
PRIMARY KEY (ID));

#생성된 Table 확인
SHOW TABLES LIKE 'MyTransaction';
DESC MyTransaction;

#Table에 data 입력
INSERT INTO MyTransaction(ID, Product_Name, Price, Quantity, Discount_Rate, Transaction_Date, Customer) 
VALUES(1, 'Computer', 500000, 1, 0.05, '2018-05-05', 'Jihoon');

SELECT * FROM MyTransaction;

#나머지 data 입력 / Primary key를 AUTO_INCREMENT로 설정해줘서 Primary key를 뺀 나머지 column만 입력해줘도 됨. 
INSERT INTO MyTransaction(Product_Name, Price, Quantity, Discount_Rate, Transaction_Date, Customer) 
VALUES
('Pen', 300, 5, 0, '2018-09-24', 'Jihyun'),
('USB', 20000, 10, 0.3, '2018-05-05', 'Jihoon'),
('Note', 1000, 2, 0.05, '2018-01-10', 'Yura'),
('Card', 2000, 1, 0.1, '2018-01-12', 'Yura'),
('Pen', 300, 20, 0, '2018-05-06', 'Doyoung'),
('USB', 20000, 5, 0.3, '2018-05-06', 'Doyoung'),
('Card', 2000, 10, 0.1, '2018-06-12', 'Yura'),
('Note', 1000, 1, 0.05, '2018-08-30', 'Jihyun'),
('Computer', 500000, 2, 0.05, '2018-06-12', 'Yura');

#Data가 Table에 잘 들어갔는지 확인
SELECT * FROM MyTransaction;


#WHERE 조건식으로 원하는 row 검색
SELECT * FROM MYTransaction WHERE Product_Name = 'Card';
SELECT * FROM MYTransaction WHERE Price > 10000;
SELECT * FROM MYTransaction WHERE Customer <> 'Doyoung';
SELECT * FROM MYTransaction WHERE Customer != 'Doyoung';

INSERT INTO MyTransaction(Product_Name, Price, Quantity, Discount_Rate, Transaction_Date, Customer) 
VALUES ('Pen', 300, 1, 0, '2018-10-10', NULL);
SELECT * FROM MyTransaction WHERE Customer IS NULL;


#WHERE 조건 조합
SELECT * FROM MyTransaction WHERE Product_Name != 'Pen' AND Price <10000;
SELECT * FROM MyTransaction WHERE Quantity > 5 OR Discount_Rate > 0.01;

SELECT * FROM MyTransaction WHERE Product_Name = 'Pen';
SELECT * FROM MyTransaction WHERE Product_Name = 'Pen' AND Quantity < 10 OR Transaction_Date < '2018-05-07';

SELECT * FROM MyTransaction 
WHERE (Product_Name = 'Pen' AND Quantity < 10) 
	OR Transaction_Date < '2018-05-07';
    
SELECT * FROM MyTransaction 
WHERE Product_Name = 'Pen' 
	AND (Quantity < 10 OR Transaction_Date < '2018-05-07');

#WHERE LIKE    
SELECT * FROM MyTransaction WHERE Customer LIKE 'Ji%';



#ORDER BY
SELECT * FROM MyTransaction ORDER BY Price;
SELECT * FROM MyTransaction ORDER BY Price DESC;
SELECT * FROM MyTransaction ORDER BY Price DESC, Quantity DESC;

#LIMIT & OFFSET
SELECT * FROM MyTransaction ORDER BY Price DESC, Quantity DESC LIMIT 3;
SELECT * FROM MyTransaction ORDER BY Price DESC, Quantity DESC LIMIT 3 OFFSET 3;

#수치연산
SELECT *, Price * Quantity FROM MyTransaction;
SELECT *, Price * Quantity AS Total_Price FROM MyTransaction;
SELECT *, Price * Quantity AS Total_Price, Price * Quantity * (1-Discount_Rate) AS Total_Discounted_Price FROM MyTransaction;
SELECT * FROM MyTransaction;

#ROUND
SELECT *, Price * Quantity AS Total_Price, ROUND(Price * Quantity * (1-Discount_Rate),2) AS Total_Discounted_Price
FROM MyTransaction;

SELECT *, ROUND(Price * Quantity * (1-Discount_Rate),2) AS Total_Discounted_Price
FROM MYTransaction
WHERE ROUND(Price * Quantity * (1-Discount_Rate),2) > 5000; #Total_Discounted_Price는 Alias이기 때문에 WHERE 절에 직접 넣어서 연산 불가


SELECT *, ROUND(Price * Quantity * (1-Discount_Rate),2) AS Total_Discounted_Price
FROM MYTransaction
WHERE ROUND(Price * Quantity * (1-Discount_Rate),2) > 5000
ORDER BY ROUND(Price * Quantity * (1-Discount_Rate),2) DESC;

#문자열 연산
SELECT * FROM MyTransaction;
ALTER TABLE MyTransaction ADD Unit VARCHAR(10);
SELECT * FROM MyTransaction;

INSERT INTO MyTransaction (Unit)
VALUES ('대'), ('자루'), ('개'), ('개'), ('장'), ('자루'), ('개'), ('장'), ('개'), ('대'), ('자루');

SELECT *, IFNULL(Unit, '대') FROM MyTransaction WHERE Product_Name='Computer';
SELECT * FROM MyTransaction;

UPDATE MyTransaction SET Unit = '대' WHERE Product_Name = 'Computer';
UPDATE MyTransaction SET Unit = '자루' WHERE Product_Name = 'Pen';
UPDATE MyTransaction SET Unit = '개' WHERE Product_Name = 'USB' OR Product_Name = 'Note';
UPDATE MyTransaction SET Unit = '장' WHERE Product_Name = 'Card';

DELETE FROM MyTransaction WHERE ID>11;
SELECT * FROM MyTransaction;

SELECT *, CONCAT(Quantity, Unit) FROM MyTransaction;

ALTER TABLE MyTransaction MODIFY COLUMN Unit VARCHAR(10) AFTER Quantity;

SELECT * FROM MyTransaction WHERE SUBSTRING(Transaction_Date, 6, 2)<'06';

SELECT CURRENT_TIMESTAMP;
SELECT CURRENT_DATE + INTERVAL 1 DAY;

SELECT * FROM MyTransaction ORDER BY Transaction_Date DESC;
SELECT *, DATEDIFF(Transaction_Date, CURRENT_DATE) FROM MyTransaction WHERE Customer='Jihyun';

SELECT *, 
	CASE WHEN Customer IS NULL THEN 'Soonchan'
    ELSE Customer
    END Customer
FROM MyTransaction;

SELECT *,
	CASE WHEN Product_Name = 'Computer' OR Product_Name = 'USB' THEN '전자기기'
    WHEN Product_Name = 'Pen' OR Product_Name = 'Note' THEN '학용품'
    ELSE '기타'
    END Product_Group
FROM MyTransaction;

SELECT * FROM MyTransaction;

#Q1
#2018년 동안 Yura가 지불한 모든 금액을 계산하시오 (ROUND 소숫점 2자리)

#Q2
#Product_Group -> Product_Name -> Price 순서로 정렬하시오 (Price만 내림차순)


#Q3
#2018년 상반기에 거래된 기록들 중에서, 정가(Total_Original_Price)가 10000원 이상이거나 제품군이 전자기기인 경우를 검색하시오. 정가가 높은 순서로 정렬하시오.
