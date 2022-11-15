
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE Procedure304162

	@YearsAgo int
AS
SET @YearsAgo = @YearsAgo
BEGIN

	SET NOCOUNT ON;

	SELECT *
	FROM [AdventureWorksDW2019].[dbo].[DimCurrency]
	INNER JOIN [AdventureWorksDW2019].[dbo].[FactCurrencyRate]
	ON [AdventureWorksDW2019].[dbo].[DimCurrency].[CurrencyKey] = [AdventureWorksDW2019].[dbo].[FactCurrencyRate].[CurrencyKey]
	WHERE DATEDIFF(YEAR, [AdventureWorksDW2019].[dbo].[FactCurrencyRate].[Date],CAST(GETDATE() as datetime)) = @YearsAgo AND ([AdventureWorksDW2019].[dbo].[DimCurrency].[CurrencyAlternateKey] = 'GBP' OR [AdventureWorksDW2019].[dbo].[DimCurrency].[CurrencyAlternateKey] = 'EUR')

END
GO
