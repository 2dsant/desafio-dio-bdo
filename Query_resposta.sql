-- Buscar o nome e ano dos filmes
SELECT NOME, ANO FROM FILMES

-- Buscar o nome e ano dos filmes, ordenados por ordem crescente pelo ano
SELECT NOME, ANO FROM FILMES ORDER BY ANO ASC

-- Buscar pelo filme de volta para o futuro, trazendo o nome, ano e a duração
SELECT NOME, ANO, DURACAO FROM FILMES WHERE NOME = 'De Volta para o Futuro'

-- Buscar os filmes lançados em 1997
SELECT * FROM FILMES WHERE ANO = 1997

-- Buscar os filmes lançados APÓS o ano 2000
SELECT * FROM FILMES WHERE ANO > 2000

-- Buscar os filmes com a duracao maior que 100 e menor que 150, ordenando pela duracao em ordem crescente
SELECT * FROM FILMES WHERE DURACAO > 100 AND DURACAO < 150 ORDER BY DURACAO ASC

-- Buscar a quantidade de filmes lançadas no ano, agrupando por ano, ordenando pela duracao em ordem decrescente
SELECT  ANO, 
		COUNT(*) AS quantidade_filmes
FROM FILMES
GROUP BY ANO
ORDER BY quantidade_filmes DESC

-- Buscar os Atores do gênero masculino, retornando o PrimeiroNome, UltimoNome
SELECT  PrimeiroNome, UltimoNome FROM ATORES WHERE GENERO = 'M'

-- Buscar os Atores do gênero feminino, retornando o PrimeiroNome, UltimoNome, e ordenando pelo PrimeiroNome
SELECT  PrimeiroNome, UltimoNome FROM ATORES WHERE GENERO = 'F' ORDER BY PrimeiroNome

-- Buscar o nome do filme e o gênero
SELECT F.NOME, G.Genero FROM FILMES F
INNER JOIN FilmesGenero FG
ON FG.IdFilme = F.Id
INNER JOIN Generos G
ON G.Id = FG.IdGenero

-- Buscar o nome do filme e o gênero do tipo "Mistério"
SELECT F.NOME, G.Genero FROM FILMES F
INNER JOIN FilmesGenero FG
ON FG.IdFilme = F.Id
INNER JOIN Generos G
ON G.Id = FG.IdGenero
WHERE G.Genero = 'Mistério'

-- Buscar o nome do filme e os atores, trazendo o PrimeiroNome, UltimoNome e seu Papel
SELECT F.NOME, A.PrimeiroNome, A.UltimoNome, EF.Papel
FROM FILMES F
INNER JOIN ElencoFilme EF
ON EF.IdFilme = F.Id
INNER JOIN Atores A
ON EF.IdAtor = A.Id