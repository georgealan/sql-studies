SELECT TOP(10) * FROM FactSales
SELECT TOP(10) * FROM DimProduct
SELECT TOP(10) * FROM DimCustomer

-- Fun��o SUM
SELECT 
	SUM(SalesQuantity) AS 'Total Vendido',
	SUM(ReturnQuantity) AS 'Total Devolvido'
FROM
	FactSales

-- Fun��o COUNT
SELECT
	COUNT(*) AS 'Qtd. Produtos'
FROM
	DimProduct

-- Tenha cautela quando usar o COUNT em uma coluna que contenha valores nulos, ele ignora linhas com valores nulos.
SELECT
	COUNT(Size) AS 'Qtd. Produtos'
FROM
	DimProduct

-- Fun��o COUNT combinada com DISTINCT
-- Para fazer a contagem de valores distintos �nicos
SELECT
	COUNT(DISTINCT ColorName)
FROM
	DimProduct

-- Fun��es MIN e MAX
SELECT
	MAX(UnitPrice) AS 'Maior Pre�o',
	MIN(UnitPrice) AS 'Menor Pre�o'
FROM
	DimProduct

-- Fun��o AVG
SELECT
	AVG(YearlyIncome) AS 'M�dia de renda anual'
FROM 
	DimCustomer
