/*
	1. O gerente comercial pediu a voc� uma an�lise da Quantidade Vendida e Quantidade Devolvida 
	para o canal de venda mais importante da empresa: Store.
	Utilize uma fun��o SQL para fazer essas consultas no seu banco de dados. 
	Obs: Fa�a essa an�lise considerando a tabela FactSales.
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
	2. Uma nova a��o no setor de Marketing precisar� avaliar a m�dia salarial de todos os clientes 
	da empresa, mas apenas de ocupa��o Professional. Utilize um comando SQL para atingir esse resultado.
*/
SELECT TOP(10) * FROM DimCustomer

SELECT
	AVG(YearlyIncome) AS 'Media Salarial'
FROM
	DimCustomer
WHERE
	Occupation = 'Professional'

/*
	3. Voc� precisar� fazer uma an�lise da quantidade de funcion�rios das lojas registradas na empresa. 
	O seu gerente te pediu os seguintes n�meros e informa��es:

	a) Quantos funcion�rios tem a loja com mais funcion�rios?
	b) Qual � o nome dessa loja?
	c) Quantos funcion�rios tem a loja com menos funcion�rios?
	d) Qual � o nome dessa loja?
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
	4. A �rea de RH est� com uma nova a��o para a empresa, e para isso precisa saber a quantidade total 
	de funcion�rios do sexo Masculino e do sexo Feminino.

	a) Descubra essas duas informa��es utilizando o SQL.
	b) O funcion�rio e a funcion�ria mais antigos receber�o uma homenagem. Descubra as seguintes informa��es 
	de cada um deles: Nome, E-mail, Data de Contrata��o.
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
	Gender = 'M' -- Para saber do feminino s� mudar para 'F'
ORDER BY
	HireDate ASC

/*
	5. Agora voc� precisa fazer uma an�lise dos produtos. Ser� necess�rio descobrir as seguintes informa��es:
	a) Quantidade distinta de cores de produtos.
	b) Quantidade distinta de marcas
	c) Quantidade distinta de classes de produto
	Para simplificar, voc� pode fazer isso em uma mesma consulta.
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
