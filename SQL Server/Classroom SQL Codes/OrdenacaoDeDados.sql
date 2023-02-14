/* ORDER BY serve para ordenar consultas
	Abaixo estamos ordenando a consulta para trazer os dados da tabela de lojas ordenados
	pelo número de funcionarios da loja, em ordem decrescente.
*/
SELECT
	TOP(100) *
FROM
	DimStore
ORDER BY EmployeeCount DESC

-- Ordenação mista com mais de uma coluna no ORDER BY
SELECT 
	TOP(10)
		ProductName,
		UnitCost,
		Weight
FROM
	DimProduct
ORDER BY UnitCost DESC, Weight DESC

/*
	Comando WHERE serve para realizar consultas de acordo com uma condição
*/
SELECT
	ProductName AS 'Produto',
	UnitPrice AS 'Preço da Unidade'
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

-- Filtragens por data, o padrão do SQL para data é yyyy-mm-dd
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
	ou Red, MAS a marca deve ser obrigatoriamente igual a Fabrikam. Para garantir uma ordem lógica de execução
	utiliza-se () parenteses para delimitar operações a serem executadas primeiro.
*/
SELECT
	*
FROM
	DimProduct
WHERE
	(ColorName = 'Black' OR ColorName = 'Red') AND BrandName = 'Fabrikam'  

/* 
	Utilizando o IN para agrupar várias condições em uma unica linha para melhor legibilidade 
	ao invéz de utilizar uma cadeia de OR's ou AND's
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
-- O sinal de % significa que existe conteúdo antes ou depois da palavra
SELECT
	*
FROM
	DimProduct
WHERE ProductName LIKE '%MP3 Player%'

/* 
	Abaixo busca dados que começam com Type e terminam com qualquer coisa, caso tivesse um % no inicio
	buscaria a palavra Type em qualquer local do texto, no ínicio, meio ou final.
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
	Filtro utilizando o IS NULL ou IS NOT NULL para filtrar valores com base na informação se é 
	nulo ou não.
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
