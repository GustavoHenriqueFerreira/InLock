--Inicio DDL - InLock_Games_Manhã

CREATE DATABASE InLock_Games_Manha
GO

USE InLock_Games_Manha
GO

--Inicio tabelas Independentes:
CREATE TABLE Estudio(
idEstudio SMALLINT PRIMARY KEY IDENTITY, 
nomeEstudio VARCHAR (50) UNIQUE NOT NULL,
);
GO

CREATE TABLE TipoUsuario(
idTipouser INT PRIMARY KEY IDENTITY,
Titulo VARCHAR (17) NOT NULL,
);
GO
--Fim tabelas Independentes:

--Inicio tabelas dependentes:
CREATE TABLE Jogo(
idJogo INT PRIMARY KEY IDENTITY,
idEstudio SMALLINT FOREIGN KEY REFERENCES Estudio(idEstudio),
nomeJogo VARCHAR (50) UNIQUE NOT NULL,
DataLan DATE NOT NULL,
Valor SMALLMONEY NOT NULL,
Descricao VARCHAR (250) NOT NULL,
);
GO

CREATE TABLE Usuario(
idUsuario INT PRIMARY KEY IDENTITY,
idTipoUser INT FOREIGN KEY REFERENCES TipoUsuario(idTipoUser),
Email VARCHAR (200) UNIQUE NOT NULL,
Senha CHAR (10) NOT NULL, 
);
GO
--Fim tabelas dependentes:

--Fim DDL - InLock_Games_Manhã