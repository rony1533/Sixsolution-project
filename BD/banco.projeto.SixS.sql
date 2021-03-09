CREATE DATABASE SixS;

USE Sixs;

CREATE TABLE TabLogin(
	idUser 		int primary key, -- Chave Primaria da tabela
    login 		varchar (30),
    senha 		varchar (15),
    celular 	int
);

INSERT INTO TabLogin values (1, 'danilo.santos@bandtec.com.br', '**********', 956504864),
							(2, 'erick.lara@bandtec.com.br', '**********', 946484564),
                            (3, 'matheus.lemos@bandtec.com.br', '**********', 948648134),
                            (4, 'rony.sobral@bandtec.com.br', '**********', 932469452),
                            (5, 'breno.cesar@bandtec.com.br', '**********', 954624652),
                            (6, 'rafael.barretto@bandtec.com.br', '**********', 946524562);

SELECT * FROM Tablogin;

CREATE TABLE Controle(	
	idEstufa 		int, -- Chave Estrangeira da tabela Estufa    
    sensor 			int,
	temperatura 	int,
    umidade 		int
);

INSERT INTO Controle values (1, 1, 23, 67), 	-- Estufa Matheus - 1 	- Sensor 1
							(1, 2, 23, 67), 	-- Estufa Matheus - 1 	- Sensor 2
                            (1, 3, 23, 67), 	-- Estufa Matheus - 1 	- Sensor 3
                            (1, 4, 23, 67), 	-- Estufa Matheus - 1 	- Sensor 4
							(2, 1, 22, 65), 	-- Estufa Rafael - 1 	- Sensor 1
                            (2, 2, 22, 62), 	-- Estufa Rafael - 1 	- Sensor 2
                            (2, 3, 21, 64), 	-- Estufa Rafael - 1 	- Sensor 3
                            (2, 4, 23, 65), 	-- Estufa Rafael - 1 	- Sensor 4                        
							(3, 1, 22, 62), 	-- Estufa Erick - 1 	- Sensor 1
                            (3, 2, 25, 65), 	-- Estufa Erick - 1 	- Sensor 2
                            (3, 3, 22, 61), 	-- Estufa Erick - 1 	- Sensor 3
                            (3, 4, 24, 62), 	-- Estufa Erick - 1 	- Sensor 4
                            (4, 1, 25, 76), 	-- Estufa Danilo - 1 	- Sensor 1
                            (4, 2, 23, 71), 	-- Estufa Danilo - 1 	- Sensor 2
                            (4, 3, 22, 77), 	-- Estufa Danilo- 1 	- Sensor 3
                            (4, 4, 22, 75), 	-- Estufa Danilo - 1 	- Sensor 4                            
                            (5, 1, 22, 73), 	-- Estufa Rony - 1 		- Sensor 1
                            (5, 1, 21, 71), 	-- Estufa Rony - 1 		- Sensor 2
                            (5, 1, 23, 72), 	-- Estufa Rony - 1 		- Sensor 3
                            (5, 1, 22, 73), 	-- Estufa Rony - 1 		- Sensor 4
                            (6, 1, 21, 72), 	-- Estufa Breno - 1		- Sensor 1
                            (6, 1, 22, 75), 	-- Estufa Breno - 1		- Sensor 2
                            (6, 1, 25, 71), 	-- Estufa Breno - 1		- Sensor 3
                            (6, 1, 23, 74), 	-- Estufa Breno - 1		- Sensor 4
							(2, 1, 25, 63), 	-- Estufa Rafael - 2 	- Sensor 1
                            (2, 2, 23, 61), 	-- Estufa Rafael - 2 	- Sensor 2
                            (2, 3, 21, 62), 	-- Estufa Rafael - 2 	- Sensor 3
                            (2, 4, 21, 63), 	-- Estufa Rafael - 2 	- Sensor 4
                            (4, 1, 23, 74), 	-- Estufa Danilo - 2 	- Sensor 1
                            (4, 2, 25, 72), 	-- Estufa Danilo - 2 	- Sensor 2
                            (4, 3, 24, 75), 	-- Estufa Danilo - 2 	- Sensor 3
                            (4, 4, 21, 75);		-- Estufa Danilo - 2 	- Sensor 4

SELECT * FROM Controle;

SELECT * FROM Controle ORDER BY idEstufa;

CREATE TABLE Estufa (
	idEstufa 	int primary key, 	-- Chave Primaria da Tabela
	idCliente 	int, 				-- Chave estrangeira da tabela TabLogin    
    nomeEstufa 	varchar (30)
);

INSERT INTO Estufa values (1, 3, 'Estufa Matheus - 1'),
						  (2, 6, 'Estufa Rafael - 1'),
                          (3, 2, 'Estufa Erick - 1'),
                          (4, 1, 'Estufa Danilo - 1'),
                          (5, 4, 'Estufa Rony - 1'),
                          (6, 5, 'Estufa Breno - 1'),
                          (7, 1, 'Estufa Danilo - 2'),
                          (8, 6, 'Estufa Rafael - 2');
                          
						

SELECT * FROM Estufa;

SELECT * FROM Estufa ORDER BY idCliente;