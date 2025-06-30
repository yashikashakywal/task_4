USE `awesome chocolates`;
SELECT SPID, Amount, SaleDate
FROM sales
ORDER BY Amount DESC
LIMIT 5;


SELECT SPID, SUM(Boxes) AS TotalBoxes
FROM sales
GROUP BY SPID
ORDER BY TotalBoxes DESC;

SELECT * FROM sales
WHERE Amount > 10000;

SELECT s.SPID, p.Salesperson, s.Amount, s.SaleDate
FROM sales s
INNER JOIN people p ON s.SPID = p.SPID;

SELECT s.SPID, s.GeoID, g.Geo, g.Region, s.Amount
FROM sales s
LEFT JOIN geo g ON s.GeoID = g.GeoID;

SELECT s.PID, p.Product, s.Amount
FROM products p
RIGHT JOIN sales s ON p.PID = s.PID;

SELECT * FROM sales
WHERE Amount > (SELECT AVG(Amount) FROM sales);

SELECT SPID
FROM sales
GROUP BY SPID
HAVING SUM(Boxes) > 1000;

SELECT PID, AVG(Amount) AS AvgAmount
FROM sales
GROUP BY PID;

SELECT g.Region, SUM(s.Customers) AS TotalCustomers
FROM sales s
JOIN geo g ON s.GeoID = g.GeoID
GROUP BY g.Region;



CREATE INDEX idx_sales_spid ON sales(SPID);
CREATE INDEX idx_sales_pid ON sales(PID);
CREATE INDEX idx_sales_geoid ON sales(GeoID);
CREATE INDEX idx_sales_saledate ON sales(SaleDate);
