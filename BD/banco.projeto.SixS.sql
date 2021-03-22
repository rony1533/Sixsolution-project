CREATE DATABASE SixS;
USE Sixs;

CREATE TABLE TabLogin(
	idUser 		int primary key auto_increment, -- Chave Primaria da tabela
    login 		varchar (30),
    senha 		varchar (15),
    celular 	int
);

INSERT INTO TabLogin (login, senha, celular) 
					 values ('danilo.santos@bandtec.com.br', '**********', 956504864),
							('erick.lara@bandtec.com.br', '**********', 946484564),
                            ('matheus.lemos@bandtec.com.br', '**********', 948648134),
                            ('rony.sobral@bandtec.com.br', '**********', 932469452),
                            ('breno.cesar@bandtec.com.br', '**********', 954624652),
                            ( 'rafael.barretto@bandtec.com.br', '**********', 946524562);

SELECT * FROM Tablogin;

CREATE TABLE Estufa (
	idEstufa 	int primary key auto_increment, 	-- Chave Primaria da Tabela
	fkCliente 	int, 				-- Chave estrangeira da tabela TabLogin    
    nomeEstufa 	varchar (30),
	foreign key (fkCliente) references TabLogin(idUser));

INSERT INTO Estufa (nomeEstufa) 
				   values ('Estufa Matheus - 1'),
						  ('Estufa Rafael - 1'),
                          ('Estufa Erick - 1'),
                          ('Estufa Danilo - 1'),
                          ('Estufa Rony - 1'),
                          ('Estufa Breno - 1'),
                          ('Estufa Danilo - 2'),
                          ('Estufa Rafael - 2');
						
SELECT * FROM Estufa;

SELECT * FROM Estufa ORDER BY idCliente;

CREATE TABLE Controle(	
	idSensor		int	primary key auto_increment,
	fkEstufa 		int, -- Chave Estrangeira da tabela Estufa    
	temperatura 	int,
    umidade 		int,
	dataSensor		datetime default current_timestamp,
	foreign key (fkEstufa) references Estufa(idEstufa)
);

INSERT INTO Controle (temperatura, umidade) 
					 values (23, 67), 	-- Estufa Matheus - 1 	- Sensor 1
							(23, 67), 	-- Estufa Matheus - 1 	- Sensor 2
                            (23, 67), 	-- Estufa Matheus - 1 	- Sensor 3
                            (23, 67), 	-- Estufa Matheus - 1 	- Sensor 4
							(22, 65), 	-- Estufa Rafael - 1 	- Sensor 1
                            (22, 62), 	-- Estufa Rafael - 1 	- Sensor 2
                            (21, 64), 	-- Estufa Rafael - 2 	- Sensor 3
                            (23, 65), 	-- Estufa Rafael - 2 	- Sensor 4                        
							(22, 62), 	-- Estufa Erick - 1 	- Sensor 1
                            (25, 65), 	-- Estufa Erick - 1 	- Sensor 2
                            (22, 61), 	-- Estufa Erick - 1 	- Sensor 3
                            (24, 62), 	-- Estufa Erick - 1 	- Sensor 4
                            (25, 76), 	-- Estufa Danilo - 1 	- Sensor 1
                            (23, 71), 	-- Estufa Danilo - 1 	- Sensor 2
                            (22, 77), 	-- Estufa Danilo - 2 	- Sensor 3
                            (22, 75), 	-- Estufa Danilo - 2 	- Sensor 4                            
                            (22, 73), 	-- Estufa Rony - 1 		- Sensor 1
                            (21, 71), 	-- Estufa Rony - 1 		- Sensor 2
                            (23, 72), 	-- Estufa Rony - 2 		- Sensor 3
                            (22, 73); 	-- Estufa Rony - 2 		- Sensor 4

SELECT * FROM Controle;

SELECT * FROM Controle ORDER BY idEstufa;

-- Danilo 
update Estufa set fkCliente = 1 where idEstufa in (4);
update Controle set fkEstufa = 4 where idSensor in (13, 14); 

update Estufa set fkCliente = 1 where idEstufa in (7);
update Controle set fkEstufa = 7 where idSensor in (15, 16); 

-- Erick
update Estufa set fkCliente = 2 where idEstufa = 3;
update Controle set fkEstufa = 3 where idSensor in (9, 10, 11, 12) ;

-- Matheus
update Estufa set fkCliente = 3 where idEstufa = 1;
update Controle set fkEstufa = 1 where idSensor in (1, 2, 3, 4); 


select * from TabLogin join Estufa on fkCliente = idUser;
select * from Estufa join Controle on fkEstufa = idEstufa;

