CREATE DATABASE SixS;
USE Sixs;

CREATE TABLE TabLogin(
	idUser 		int primary key auto_increment, -- Chave Primaria da tabela
    login 		varchar (50),
    senha 		varchar (15),
    celular 	int
);

INSERT INTO TabLogin values (null, 'carolina.nascimento@bandtec.com.br', '**********', 958050753),
							(null, 'gabriel.vieira@bandtec.com.br', '**********', 946484564),
                            (null, 'andre.guimaraes@bandtec.com.br', '**********', 948648134),
                            (null, 'rony.sobral@bandtec.com.br', '**********', 932469452),
                            (null, 'breno.cesar@bandtec.com.br', '**********', 954624652),
                            (null, 'pedro.vieira@bandtec.com.br', '**********', 946524562);
                            
SELECT * FROM Tablogin;

CREATE TABLE Estufa (
	idEstufa 	int primary key auto_increment, 	-- Chave Primaria da Tabela
	FKUser 	int, 
    foreign key (FKUser) references TabLogin (idUser), -- Chave estrangeira da tabela TabLogin    
    nomeEstufa 	varchar (30)    
    ) auto_increment = 1000;
    
    INSERT INTO Estufa values (null, 4, 'Estufa Rony - 1'),
						  (null, 6, 'Estufa Pedro - 1'),
                          (null, 2, 'Estufa Gabriel - 1'),
                          (null, 1, 'Estufa Carolina - 1'),
                          (null, 3, 'Estufa André - 1 '),
                          (null, 5, 'Estufa Breno - 1');
                          
SELECT * FROM Estufa;
SELECT * FROM Estufa ORDER BY FKUser;

CREATE TABLE Controle(	
	FKEstufa 		int,
    foreign key (FKEstufa) references Estufa (idEstufa),-- Chave Estrangeira da tabela Estufa    
    sensor 			int,
	temperatura 	int,
    umidade 		int
    );
    
    INSERT INTO Controle values (1000, 1, 23, 67), 	-- Estufa Rony - 1 	- Sensor 1
							(1000, 2, 23, 67), 	-- Estufa Rony - 1 	    - Sensor 2
                            (1000, 3, 23, 67), 	-- Estufa Rony - 1 	    - Sensor 3
                            (1000, 4, 23, 67), 	-- Estufa Rony - 1 	    - Sensor 4
							(1001, 1, 22, 65), 	-- Estufa Pedro - 1 	- Sensor 1
                            (1001, 2, 22, 62), 	-- Estufa Pedro - 1 	- Sensor 2
                            (1001, 3, 21, 64), 	-- Estufa Pedro - 1 	- Sensor 3
                            (1001, 4, 23, 65), 	-- Estufa Pedro - 1 	- Sensor 4                        
							(1002, 1, 22, 62), 	-- Estufa Gabriel - 1 	- Sensor 1
                            (1002, 2, 25, 65), 	-- Estufa Gabriel - 1 	- Sensor 2
                            (1002, 3, 22, 61), 	-- Estufa Gabriel - 1 	- Sensor 3
                            (1002, 4, 24, 62), 	-- Estufa Gabriel - 1 	- Sensor 4
                            (1003, 1, 25, 76), 	-- Estufa Carolina - 1 	- Sensor 1
                            (1003, 2, 23, 71), 	-- Estufa Carolina - 1 	- Sensor 2
                            (1003, 3, 22, 77), 	-- Estufa Carolina-  1 	- Sensor 3
                            (1003, 4, 22, 75), 	-- Estufa Carolina - 1 	- Sensor 4                            
                            (1004, 1, 22, 73), 	-- Estufa André - 1 	- Sensor 1
                            (1004, 2, 21, 71), 	-- Estufa André - 1 	- Sensor 2
                            (1004, 3, 23, 72), 	-- Estufa André - 1 	- Sensor 3
                            (1004, 4, 22, 73), 	-- Estufa André - 1 	- Sensor 4
                            (1005, 1, 21, 72), 	-- Estufa Breno - 1		- Sensor 1
                            (1005, 2, 22, 75), 	-- Estufa Breno - 1		- Sensor 2
                            (1005, 3, 25, 71), 	-- Estufa Breno - 1		- Sensor 3
                            (1005, 4, 23, 74); 	-- Estufa Breno - 1		- Sensor 4
                            
SELECT * FROM Controle;
SELECT * FROM Controle ORDER BY FKEstufa;

SELECT * FROM Estufa join TabLogin on FKUser = TabLogin.idUser;
SELECT * FROM Controle join Estufa on FKEstufa = Estufa.idEstufa;



							

                          


