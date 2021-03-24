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


create table sensores (
	id_sensor int primary key auto_increment,
    fk_estufa int,
    constraint sensores_fk_estufa foreign key (fk_estufa) references Estufa(idEstufa)
);

insert into sensores (fk_estufa) values
(1),
(1),
(2),
(2);


select * from sensores;

create table controle (
	id_leitura int primary key auto_increment,
	fk_sensor int,         
    temperatura int,
    umidade int,
    data_leitura datetime default current_timestamp,
    constraint controle_fk_sensor foreign key (fk_sensor) references sensores(id_sensor)
);

insert into controle (fk_sensor,temperatura,umidade) values  -- exemplos de inserts de sensores ao longo do tempo (sensores 1 e 2 captando ao mesmo tempo)
(1,25,80),
(2,28,85);
insert into controle (fk_sensor,temperatura,umidade) values
(1,27,79),
(2,29,86);
insert into controle (fk_sensor,temperatura,umidade) values
(1,26,79),
(2,30,86);

select * from controle;
select * from controle where fk_sensor=1 order by data_leitura; -- select para organizar dados de um sensor por tempo na tabela

SELECT * FROM Estufa join TabLogin on FKUser = TabLogin.idUser;
SELECT * FROM Controle join Estufa on FKEstufa = Estufa.idEstufa;