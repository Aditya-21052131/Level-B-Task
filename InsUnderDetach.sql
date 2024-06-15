CREATE PROCEDURE InsUnderDetach 
(
  @OrderID int,
  @ProductID int,
  @Priority int,
  @Discount decimal(18,2)
)
AS
BEGIN
  DECLARE @InStock int;

  -- Check if product is InStock
  SELECT @InStock = AvailableQuantity 
  FROM Production.ProductInventory 
  WHERE ProductID = @ProductID;

  IF (@InStock >= @Quantity)
  BEGIN
    -- Insert order detail
    INSERT INTO Sales.OrderDetail (OrderID, ProductID, UnitPrice, Quantity, Discount)
    VALUES (@OrderID, @ProductID, GetPrice(@ProductID), @Quantity, @Discount);

    -- Update stock level
    UPDATE Production.ProductInventory
    SET AvailableQuantity = AvailableQuantity - @Quantity
    WHERE ProductID = @ProductID;
  ELSE
    BEGIN
      RAISERROR ('Failed to place the order. Please try again.', 16, 1);
      RETURN;
    END
END;
