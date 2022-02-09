USE [Northwind]
GO

DECLARE	@return_value Int

EXEC	@return_value = [dbo].[MusterilerinDagilimi]
		@yil = 1998

SELECT	@return_value as 'Return Value'

GO
