
-- Query to calculate total sales revenue
SELECT
  SUM(Quantity * UnitPrice) AS TotalSales

FROM
  ecommerce
WHERE
  Quantity > 0;
  
 -- Query to calculate the average number of items per order
SELECT
  AVG(ItemsPerBasket) AS AverageBasketSize
FROM (
  SELECT
    InvoiceNo,
    SUM(Quantity) AS ItemsPerBasket
  FROM
    ecommerce
  WHERE
    Quantity > 0
  GROUP BY
    InvoiceNo
) AS BasketCounts;
-- Query to find the top 5 selling product categories
SELECT
  Description,
  SUM(Quantity) AS TotalQuantitySold
FROM
  ecommerce
WHERE
  Quantity > 0
GROUP BY
  Description
ORDER BY
  TotalQuantitySold DESC
LIMIT 5;