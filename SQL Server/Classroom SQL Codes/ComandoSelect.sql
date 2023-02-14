-- Cometário de apenas uma linha

/*
Cometário de mais de uma linha
a segunda linha
a terceira linha e etc...
*/

-- Melhor forma de organizar um bloco de código SQL, para melhor visualização, padrão de legibilidade.
SELECT 
	StoreName, 
	StoreDescription 
FROM 
	DimStore

-- O comando SELECT TOP(N) e TOP(N) PERCENT: retorna as N primeiras linhas
-- Retorna 10 primeiras linhas da tabela produtos.
SELECT TOP(10)
	*
FROM
	DimProduct

-- Retorna as 10% primeiras linhas da tabela de clientes
SELECT 
	TOP(10) PERCENT	*
FROM
	DimCustomer

-- Comando SELECT DISTINCT: Retorna os valores distintos de uma tabela
SELECT 
	DISTINCT ColorName
FROM
	DimProduct

-- Comando AS: Renomeando colunas (aliasing), só altera o nome das colunas no momento do select a tabela original continua inalterada
SELECT
	ProductName AS 'Nome do Produto',
	BrandName AS 'Marca',
	ColorName AS 'Cor'
FROM
	DimProduct

