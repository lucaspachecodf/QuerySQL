--1º Script
SELECT 
	COUNT(Tb_002.IdProcesso) AS 'Quantidade',
	Tb_001.DsStatus AS 'Status'
	FROM Tb_002_Processo AS Tb_002
INNER JOIN Tb_001_Status AS Tb_001 ON Tb_002.IdStatus = Tb_001.IdStatus
GROUP BY Tb_001.DsStatus

--2º Script
SELECT 
	Tb_002.NroProcesso AS 'Número de processo',
	MAX(Tb_003.DtAndamento) AS 'Maior data de andamento'	
	FROM Tb_002_Processo AS Tb_002
	INNER JOIN Tb_003_Andamento AS Tb_003 ON Tb_002.IdProcesso = Tb_003.IdProcesso
WHERE YEAR(Tb_002.DtEncerramento) = 2013
GROUP BY Tb_002.NroProcesso


--3º Script
SELECT 
	COUNT(Tb_002.DtEncerramento) AS 'Quantidade',
	Tb_002.DtEncerramento AS 'Data de encerramento'
	FROM Tb_002_Processo as Tb_002
GROUP BY Tb_002.DtEncerramento 
HAVING COUNT(Tb_002.DtEncerramento) > 5

--4º Script
SELECT 
	REPLICATE('0', 12-LEN(NroProcesso))+RTrim(NroProcesso) AS 'Número do Processo'
FROM Tb_002_Processo