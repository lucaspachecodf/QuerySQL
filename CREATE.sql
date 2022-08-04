CREATE DATABASE Juridico
go
USE Juridico
go

CREATE TABLE Tb_001_Status(
IdStatus int not null identity,
DsStatus varchar(50),
CONSTRAINT Tb_001_PK PRIMARY KEY (IdStatus)
)

CREATE TABLE Tb_002_Processo(
IdProcesso int not null identity,
NroProcesso bigint not null,
Autor varchar(90) null,
DtEntrada date null,
DtEncerramento date null,
IdStatus int null,
CONSTRAINT Tb_002_PK PRIMARY KEY (IdProcesso),
CONSTRAINT Tb_002_Tb_001_FK FOREIGN KEY (IdStatus) REFERENCES Tb_001_Status(IdStatus)
)

CREATE TABLE Tb_003_Andamento(
IdAndamento int not null identity,
IdProcesso int not null,
DtAndamento date null,
DsMovimento varchar(2000) null,
CONSTRAINT Tb_003_PK PRIMARY KEY (IdAndamento),
CONSTRAINT Tb_003_Tb_002_FK FOREIGN KEY (IdProcesso) REFERENCES Tb_002_Processo(IdProcesso)
)