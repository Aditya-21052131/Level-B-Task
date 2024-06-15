CREATE FUNCTION ReverseDate (@date int)
RETURNS varchar(8)
AS
BEGIN
  DECLARE @reversedDate varchar(8);
  SET @reversedDate = CONVERT(varchar(8), @date, 112);
  RETURN @reversedDate;
END;
