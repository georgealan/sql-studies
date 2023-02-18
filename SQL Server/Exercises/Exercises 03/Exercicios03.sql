/*
	1. O gerente comercial pediu a você uma análise da Quantidade Vendida e Quantidade Devolvida 
	para o canal de venda mais importante da empresa: Store.
	Utilize uma função SQL para fazer essas consultas no seu banco de dados. 
	Obs: Faça essa análise considerando a tabela FactSales.
*/
SELECT TOP(10) * FROM FactSales
SELECT * FROM DimChannel

SELECT
	SUM(SalesQuantity) AS 'Quantidade Vendida',
	SUM(ReturnQuantity) AS 'Quantidade Devolvida'
FROM
	FactSales
WHERE channelKey = 1

/*
	2. Uma nova ação no setor de Marketing precisará avaliar a média salarial de todos os clientes 
	da empresa, mas apenas de ocupação Professional. Utilize um comando SQL para atingir esse resultado.
*/
SELECT TOP(10) * FROM DimCustomer

SELECT
	AVG(YearlyIncome) AS 'Media Salarial'
FROM
	DimCustomer
WHERE
	Occupation = 'Professional'

/*
	3. Você precisará fazer uma análise da quantidade de funcionários das lojas registradas na empresa. 
	O seu gerente te pediu os seguintes números e informações:

	a) Quantos funcionários tem a loja com mais funcionários?
	b) Qual é o nome dessa loja?
	c) Quantos funcionários tem a loja com menos funcionários?
	d) Qual é o nome dessa loja?
*/
SELECT TOP(100) * FROM DimStore

-- a)
SELECT 
	MAX(EmployeeCount) AS 'Maior Qtd. de Funcionarios'
FROM
	DimStore

-- b)
SELECT
	TOP(1) StoreName AS 'Nome da Loja',
	EmployeeCount AS 'Qtd. Funcionarios'
FROM
	DimStore
ORDER BY EmployeeCount DESC

-- c)
SELECT
	MIN(EmployeeCount) AS 'Menor Qtd. de Funcionarios'
FROM
	DimStore

-- d)
SELECT
	TOP(1) StoreName AS 'Nome da Loja',
	EmployeeCount AS 'Qtd. de Funcionarios'
FROM
	DimStore
WHERE EmployeeCount IS NOT NULL
ORDER BY EmployeeCount ASC

/*
	4. A área de RH está com uma nova ação para a empresa, e para isso precisa saber a quantidade total 
	de funcionários do sexo Masculino e do sexo Feminino.

	a) Descubra essas duas informações utilizando o SQL.
	b) O funcionário e a funcionária mais antigos receberão uma homenagem. Descubra as seguintes informações 
	de cada um deles: Nome, E-mail, Data de Contratação.
*/
SELECT
	TOP(100) *
FROM
	DimEmployee

-- a)
SELECT
	COUNT(Gender) AS 'Masculino'
FROM
	DimEmployee
WHERE Gender = 'M'
-- Gender = 'F'

-- b)
SELECT
	TOP(1) FirstName,
	LastName,
	EmailAddress,
	HireDate
FROM
	DimEmployee
WHERE
	Gender = 'M' -- Para saber do feminino só mudar para 'F'
ORDER BY
	HireDate ASC

/*
	5. Agora você precisa fazer uma análise dos produtos. Será necessário descobrir as seguintes informações:
	a) Quantidade distinta de cores de produtos.
	b) Quantidade distinta de marcas
	c) Quantidade distinta de classes de produto
	Para simplificar, você pode fazer isso em uma mesma consulta.
*/
SELECT 
	TOP(10) *
FROM
	DimProduct

SELECT
	COUNT(DISTINCT ColorName) AS 'Quantidade de Cores',
	COUNT(DISTINCT BrandName) AS 'Quantidade de Marcas',
	COUNT(DISTINCT ClassName) AS 'Quantidade de Classes'
FROM
	DimProduct
