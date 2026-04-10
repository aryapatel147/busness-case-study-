USE RetailDB;

-- Step 2: Table Delete (if already exists)
DROP TABLE IF EXISTS RetailTransactions;

-- Step 3: Table Create
CREATE TABLE RetailTransactions (
    TransactionID VARCHAR(10),
    Date DATE,
    ProductName VARCHAR(50),
    Category VARCHAR(50),
    Region VARCHAR(20),
    SalesChannel VARCHAR(20),
    Quantity INT,
    UnitPrice INT,
    TotalAmount INT,
    PaymentMode VARCHAR(20),
    CustomerID VARCHAR(10)
);

-- Step 4: Insert Big Data
INSERT INTO RetailTransactions VALUES
('T001','2024-01-05','Necklace','Jewelry','West','Online',2,500,1000,'UPI','C001'),
('T002','2024-01-10','Ring','Jewelry','East','Offline',1,300,300,'Cash','C002'),
('T003','2024-01-12','Bracelet','Jewelry','North','Online',3,200,600,'Card','C003'),
('T004','2024-01-15','Earrings','Jewelry','South','Offline',2,150,300,'UPI','C004'),
('T005','2024-01-18','Necklace','Jewelry','West','Online',1,500,500,'Card','C005'),

('T006','2024-02-02','Ring','Jewelry','East','Online',2,300,600,'UPI','C001'),
('T007','2024-02-05','Bracelet','Jewelry','North','Offline',1,200,200,'Cash','C002'),
('T008','2024-02-08','Earrings','Jewelry','South','Online',4,150,600,'Card','C003'),
('T009','2024-02-12','Necklace','Jewelry','West','Offline',2,500,1000,'UPI','C004'),
('T010','2024-02-18','Ring','Jewelry','East','Online',3,300,900,'Card','C005'),

('T011','2024-03-01','Bracelet','Jewelry','North','Online',2,200,400,'UPI','C006'),
('T012','2024-03-05','Earrings','Jewelry','South','Offline',1,150,150,'Cash','C001'),
('T013','2024-03-10','Necklace','Jewelry','West','Online',2,500,1000,'Card','C002'),
('T014','2024-03-15','Ring','Jewelry','East','Offline',1,300,300,'UPI','C003'),
('T015','2024-03-20','Bracelet','Jewelry','North','Online',4,200,800,'Card','C004'),

('T016','2024-04-02','Earrings','Jewelry','South','Online',3,150,450,'UPI','C005'),
('T017','2024-04-05','Necklace','Jewelry','West','Offline',2,500,1000,'Cash','C006'),
('T018','2024-04-10','Ring','Jewelry','East','Online',1,300,300,'Card','C001'),
('T019','2024-04-15','Bracelet','Jewelry','North','Offline',2,200,400,'UPI','C002'),
('T020','2024-04-20','Earrings','Jewelry','South','Online',4,150,600,'Card','C003'),

('T021','2024-05-01','Necklace','Jewelry','West','Online',3,500,1500,'UPI','C004'),
('T022','2024-05-05','Ring','Jewelry','East','Offline',2,300,600,'Cash','C005'),
('T023','2024-05-10','Bracelet','Jewelry','North','Online',1,200,200,'Card','C006'),
('T024','2024-05-15','Earrings','Jewelry','South','Offline',2,150,300,'UPI','C001'),
('T025','2024-05-20','Necklace','Jewelry','West','Online',2,500,1000,'Card','C002'),

('T026','2024-06-01','Ring','Jewelry','East','Online',3,300,900,'UPI','C003'),
('T027','2024-06-05','Bracelet','Jewelry','North','Offline',2,200,400,'Cash','C004'),
('T028','2024-06-10','Earrings','Jewelry','South','Online',5,150,750,'Card','C005'),
('T029','2024-06-15','Necklace','Jewelry','West','Offline',1,500,500,'UPI','C006'),
('T030','2024-06-20','Ring','Jewelry','East','Online',2,300,600,'Card','C001');

-- =========================
-- 🔥 ANALYSIS QUERIES
-- =========================

-- 1. Region-wise Sales
SELECT Region, SUM(TotalAmount) AS TotalSales
FROM RetailTransactions
GROUP BY Region;
-- 2. Monthly Sales Trend
SELECT 
    FORMAT(Date, 'yyyy-MM') AS Month,
    SUM(TotalAmount) AS TotalSales
FROM RetailTransactions
GROUP BY FORMAT(Date, 'yyyy-MM')
ORDER BY Month;

-- 3. Top 5 Products
SELECT TOP 5 
    ProductName, 
    SUM(TotalAmount) AS Revenue
FROM RetailTransactions
GROUP BY ProductName
ORDER BY Revenue DESC;

-- 4. Online vs Offline Sales
SELECT SalesChannel, SUM(TotalAmount) AS Sales
FROM RetailTransactions
GROUP BY SalesChannel;

-- 5. Category Performance
SELECT Category, SUM(TotalAmount) AS Sales
FROM RetailTransactions
GROUP BY Category;

-- 6. Repeat Customers (more than 3 orders)
SELECT CustomerID, COUNT(*) AS Orders
FROM RetailTransactions
GROUP BY CustomerID
HAVING COUNT(*) > 3;