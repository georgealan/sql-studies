SELECT TOP(10) * FROM FactSales
SELECT TOP(10) * FROM DimProduct
SELECT TOP(10) * FROM DimCustomer

-- Função SUM
SELECT 
	SUM(SalesQuantity) AS 'Total Vendido',
	SUM(ReturnQuantity) AS 'Total Devolvido'
FROM
	FactSales

-- Função COUNT
SELECT
	COUNT(*) AS 'Qtd. Produtos'
FROM
	DimProduct

-- Tenha cautela quando usar o COUNT em uma coluna que contenha valores nulos, ele ignora linhas com valores nulos.
SELECT
	COUNT(Size) AS 'Qtd. Produtos'
FROM
	DimProduct

-- Função COUNT combinada com DISTINCT
-- Para fazer a contagem de valores distintos únicos
SELECT
	COUNT(DISTINCT ColorName)
FROM
	DimProduct

-- Funções MIN e MAX
SELECT
	MAX(UnitPrice) AS 'Maior Preço',
	MIN(UnitPrice) AS 'Menor Preço'
FROM
	DimProduct

-- Função AVG
SELECT
	AVG(YearlyIncome) AS 'Média de renda anual'
FROM 
	DimCustomer
