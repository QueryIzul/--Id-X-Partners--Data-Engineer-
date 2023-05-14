CREATE PROCEDURE dbo.summary_order_status
(
	@StatusID int
)
AS
BEGIN
	SELECT 
		fso.OrderID,
		dc.CustomerName,
		dp.ProductName,
		fso.Quantity,
		dso.StatusOrder
	FROM FactSalesOrder fso
	JOIN DimCustomer dc ON fso.CustomerID = dc.CustomerID
	JOIN DimProduct dp ON fso.ProductID = dp.ProductID
	JOIN DimStatusOrder dso ON fso.StatusID = dso.StatusID
	WHERE fso.StatusID = @StatusID
END;

EXEC dbo.summary_order_status @StatusID = 4;