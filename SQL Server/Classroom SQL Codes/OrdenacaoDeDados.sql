/* ORDER BY serve para ordenar consultas
	Abaixo estamos ordenando a consulta para trazer os dados da tabela de lojas ordenados
	pelo n�mero de funcionarios da loja, em ordem decrescente.
*/
SELECT
	TOP(100) *
FROM
	DimStore
ORDER BY EmployeeCount DESC

-- Ordena��o mista com mais de uma coluna no ORDER BY
SELECT 
	TOP(10)
		ProductName,
		UnitCost,
		Weight
FROM
	DimProduct
ORDER BY UnitCost DESC, Weight DESC

/*
	Comando WHERE serve para realizar consultas de acordo com uma condi��o
*/
SELECT
	ProductName AS 'Produto',
	UnitPrice AS 'Pre�o da Unidade'
FROM
	DimProduct
WHERE UnitPrice >= 1000
ORDER BY UnitPrice

-- Filtragens por texto
SELECT
	*
FROM
	DimProduct
WHERE
	BrandName = 'Fabrikam'

SELECT
	*
FROM
	DimProduct
WHERE
	ColorName = 'Black'

-- Filtragens por data, o padr�o do SQL para data � yyyy-mm-dd
SELECT
	*
FROM
	DimCustomer
WHERE
	BirthDate >= '1970-12-31'
ORDER BY BirthDate

-- Combinando consultas com AND, OR, NOT
SELECT
	*
FROM
	DimProduct
WHERE
	BrandName = 'Fabrikam' AND ColorName = 'Black'

-- Usando OR 
SELECT
	*
FROM
	DimProduct
WHERE
	BrandName = 'Contoso' OR ColorName = 'White'

-- Usando NOT
SELECT
	*
FROM
	DimEmployee
WHERE
	NOT DepartmentName = 'Marketing'

/*
	Cuidados ao utilizar o AND em conjunto com o OR
	Exemplo: Selecione todas as linhas da tabela DimProduct onde a cor do produto pode ser igual a Black
	ou Red, MAS a marca deve ser obrigatoriamente igual a Fabrikam. Para garantir uma ordem l�gica de execu��o
	utiliza-se () parenteses para delimitar opera��es a serem executadas primeiro.
*/
SELECT
	*
FROM
	DimProduct
WHERE
	(ColorName = 'Black' OR ColorName = 'Red') AND BrandName = 'Fabrikam'  

/* 
	Utilizando o IN para agrupar v�rias condi��es em uma unica linha para melhor legibilidade 
	ao inv�z de utilizar uma cadeia de OR's ou AND's
*/
SELECT
	*
FROM
	DimProduct
WHERE
	ColorName IN ('Silver', 'Red', 'Blue')

/*
	Utilizando o comando LIKE para filtrar dados em conjunto com WHERE, ele permite utilizar filtros mais
	especificos
*/
-- O sinal de % significa que existe conte�do antes ou depois da palavra
SELECT
	*
FROM
	DimProduct
WHERE ProductName LIKE '%MP3 Player%'

/* 
	Abaixo busca dados que come�am com Type e terminam com qualquer coisa, caso tivesse um % no inicio
	buscaria a palavra Type em qualquer local do texto, no �nicio, meio ou final.
*/
SELECT
	*
FROM
	DimProduct
WHERE ProductDescription LIKE 'Type%'

/*
	Filtro com BETWEEN para filtrar em intervalos de valores
*/
SELECT
	*
FROM
	DimProduct
WHERE UnitPrice BETWEEN 50 AND 100

-- Utilizando junto com o NOT
SELECT
	*
FROM
	DimProduct
WHERE UnitPrice NOT BETWEEN 50 AND 100

-- Filtrando entre datas
SELECT
	*
FROM
	DimEmployee
WHERE HireDate BETWEEN '2000-01-01' AND '2000-12-31'

/*
	Filtro utilizando o IS NULL ou IS NOT NULL para filtrar valores com base na informa��o se � 
	nulo ou n�o.
*/
-- Uso do IS NOT NULL
SELECT
	*
FROM
	DimCustomer
WHERE CompanyName IS NOT NULL

-- Uso do IS NULL
SELECT
	*
FROM
	DimCustomer
WHERE CompanyName IS NULL
