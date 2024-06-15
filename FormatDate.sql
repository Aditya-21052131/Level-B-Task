CREATE FUNCTION FormatDate (@date date)
RETURNS varchar(10)
AS
BEGIN
  DECLARE @formattedDate varchar(10);
  SET @formattedDate = CONVERT(varchar(10), @date, 101);
  RETURN @formattedDate;
END;
