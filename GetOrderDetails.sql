CREATE PROCEDURE GetOrderDetails 
(
  @OrderID int
)
AS
BEGIN
  IF NOT EXISTS (SELECT 1 FROM Sales.OrderDetail WHERE OrderID = @OrderID)
  BEGIN
    PRINT 'The OrderID ' + CAST(@OrderID AS varchar(10)) + ' does not exist.';
    RETURN;
  END

  SELECT *
  FROM Sales.OrderDetail
  WHERE OrderID = @OrderID;
END;
