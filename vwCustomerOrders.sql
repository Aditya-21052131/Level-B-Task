CREATE VIEW vwCustomerOrders AS
SELECT 
  c.CompanyName,
  o.OrderID,
  p.ProductName,
  od.Quantity,
  od.UnitPrice * (1 - od.Discount) AS OrderPrice,
  pi.AvailableQuantity
FROM Sales.SalesOrderHeader o
INNER JOIN Sales.OrderDetail od ON o.SalesOrderID = od.OrderID
INNER JOIN Production.Product p ON od.ProductID = p.ProductID
INNER JOIN Person.Contact c ON o.CustomerID = c.ContactID
INNER JOIN Production.ProductInventory
