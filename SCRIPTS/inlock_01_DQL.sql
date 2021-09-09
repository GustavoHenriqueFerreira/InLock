--Inicio DQL - InLock_Games_Manhã

USE inLock_Games_Manha
GO

--Listar todos os usuários;
SELECT * FROM Usuario

--Listar todos os estúdios;
SELECT * FROM Estudio

--Listar todos os jogos;
SELECT * FROM Jogo

--Listar todos os jogos e seus respectivos estúdios;
SELECT nomeJogo, DataLan,Valor,Descricao,nomeEstudio FROM Jogo
INNER JOIN Estudio
ON Jogo.idEstudio = Estudio.idEstudio

--Buscar e trazer na lista todos os estúdios com os respectivos jogos. Obs.: Listar
--todos os estúdios mesmo que eles não contenham nenhum jogo de referência;
SELECT nomeEstudio,nomeJogo,DataLan,Valor,Descricao FROM Estudio
FULL OUTER JOIN Jogo
ON Estudio.idEstudio = Jogo.idEstudio

--Buscar um usuário por e-mail e senha (login);
SELECT Email,Senha FROM Usuario
WHERE Email = 'admin@admin.com' 
AND Senha = 'admin'

--Buscar um jogo por idJogo;
SELECT nomeJogo,DataLan,Valor,Descricao FROM Jogo
WHERE idJogo = 1

--Tome os 2 de bônus:
SELECT nomeJogo,DataLan,Valor,Descricao FROM Jogo
WHERE nomeJogo = 'Diablo 3'

--Buscar um estúdio por idEstudio;
SELECT nomeEstudio FROM Estudio
WHERE idEstudio  = 1

--Estrutura do WHERE Ref:
--SELECT idUsuario, email, senha, permissao
--FROM USUARIO
--WHERE email  = 'saulo@gmail' and senha = '123';

--Fim DQL - InLock_Games_Manhã