CREATE PROCEDURE DeleteOrderDetail 
(
  @OrderID int,
  @ProductID int
)
AS
BEGIN
  IF NOT EXISTS (SELECT 1 FROM Sales.OrderDetail WHERE OrderID = @OrderID AND ProductID = @ProductID)
  BEGIN
    RAISERROR ('Parameters are invalid.', 16, 1);
    RETURN;
  END

  DELETE FROM Sales.OrderDetail
  WHERE OrderID = @OrderID
  AND ProductID = @ProductID;
END;
