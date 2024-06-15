CREATE PROCEDURE UpdateOrderStatus 
(
  @OrderID int,
  @ProductID int = NULL,
  @NewQuantity int = NULL,
  @NewDiscount decimal(18,2) = NULL
)
AS
BEGIN
  DECLARE @CurrentQuantity int,
              @CurrentPrice decimal(18,2),
              @CurrentDiscount decimal(18,2);

  -- Get current values
  SELECT @CurrentQuantity = Quantity,
         @CurrentPrice = UnitPrice,
         @CurrentDiscount = Discount
  FROM Sales.OrderDetail
  WHERE OrderID = @OrderID
    AND (ProductID IS NULL OR ProductID = @ProductID);

  -- Update only non-NULL values
  UPDATE Sales.OrderDetail
  SET Quantity = ISNULL(@NewQuantity, @CurrentQuantity),
      UnitPrice = ISNULL(GetPrice(@ProductID), @CurrentPrice),
      Discount = ISNULL(@NewDiscount, @CurrentDiscount)
  WHERE OrderID = @OrderID
    AND (ProductID IS NULL OR ProductID = @ProductID);
END;
