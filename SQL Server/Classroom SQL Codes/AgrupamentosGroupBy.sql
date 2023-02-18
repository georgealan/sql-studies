-- GROUP BY
SELECT
	BrandName AS 'Nome do Produto',
	COUNT(*) AS 'Qtd. Total'
FROM
	DimProduct
GROUP BY
	BrandName

SELECT
	StoreType AS 'Tipo da Loja',
	SUM(EmployeeCount) AS 'Quantidade de Lojas'
FROM 
	DimStore
GROUP BY
	StoreType

-- Media de custo de acordo com o brand name
SELECT * FROM DimProduct

SELECT
	BrandName AS 'Nome da Marca',
	AVG(UnitCost) AS 'Media de custo'
FROM
	DimProduct
GROUP BY 
	BrandName

-- de acordo com a classe qual o máximo valor do preço unitário
SELECT
	ClassName AS 'Nome da Classe',
	MAX(UnitPrice) AS 'Maior Preço'
FROM
	DimProduct
GROUP BY
	ClassName


-- GROUP BY em conjunto com ORDER BY
SELECT
	StoreType,
	SUM(EmployeeCount)
FROM
	DimStore
GROUP BY
	StoreType
ORDER BY SUM(EmployeeCount)


-- GROUP BY em conjunto com WHERE - WHERE é usado para filtros antes de agrupamentos
SELECT
	ColorName AS 'Cor do Produto',
	COUNT(*) AS 'Quantidade total'
FROM
	DimProduct
WHERE -- Filtra a tabela original antes de agrupar
	BrandName = 'Contoso'
GROUP BY
	ColorName
ORDER BY
	COUNT(*)

-- GROUP BY em conjunto com HAVING - HAVING é usado para filtros depois de agrupamentos
SELECT
	BrandName AS 'Marca',
	COUNT(BrandName) AS 'Total por Marca'
FROM
	DimProduct
GROUP BY
	BrandName
HAVING COUNT(BrandName) >= 200 -- Filtra depois de agrupar
