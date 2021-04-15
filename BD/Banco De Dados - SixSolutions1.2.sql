CREATE DATABASE SixS;
USE Sixs;

create table empresas_parceiras (            -- empresas que estão utilizando nosso serviço
id_empresa int primary key auto_increment,
nome varchar(60),
CNPJ varchar(30),
data_inclusao date                      -- data na qual começou a parceria
);

 INSERT INTO empresas_parceiras values 
(null,'empresa1','12. 345. 678/0001-12','2020-01-01'),
(null,'empresa2','22. 345. 678/0001-12','2019-11-02'),
(null,'empresa3','32. 345. 678/0001-12','2018-04-01'),
(null,'empresa4','42. 345. 678/0001-12','2020-12-13'),
(null,'empresa5','52. 345. 678/0001-12','2021-01-15'),
(null,'empresa6','62. 345. 678/0001-12','2020-10-30');

                            
SELECT * FROM empresas_parceiras;

CREATE TABLE Estufa (
	idEstufa 	int primary key auto_increment, 	-- Chave Primaria da Tabela
	FK_empresa 	int, 
    foreign key (FK_empresa) references empresas_parceiras (id_empresa), -- Chave estrangeira da tabela empresas_parceiras   
    nomeEstufa 	varchar (30)    
    ) auto_increment = 1000;
    
    INSERT INTO Estufa values (null, 4, 'Estufa Rony - 1'),
						  (null, 6, 'Estufa Pedro - 1'),
                          (null, 2, 'Estufa Gabriel - 1'),
                          (null, 1, 'Estufa Carolina - 1'),
                          (null, 3, 'Estufa André - 1 '),
                          (null, 5, 'Estufa Breno - 1');
                          
SELECT * FROM Estufa;
SELECT * FROM Estufa ORDER BY FK_empresa;

create table usuarios (
id_usuario int primary key auto_increment,
fk_empresa int,
fk_estufa int,     -- O ideal seria funcionário e estufa ser N para M mas, como não aprendemos ainda, cada funcionário só poderá trabalhar em uma estufa
nome varchar(60),
RG varchar (20),
login varchar(60),
senha varchar(60),
funcao varchar(15),
check (funcao="administrador" or funcao="funcionário"), -- O administrador é o encarregado pela empresa para definir qual(is) funcionários trabalham em qual(is) estufas (no caso, pode restringir o acesso às informções de outras estufas no nosso site)
foreign key (fk_empresa) references empresas_parceiras(id_empresa),
foreign key (fk_estufa) references Estufa(idEstufa)
);

insert into usuarios values      -- é perigoso inserir estufa que não pertence à empresa. Melhor deixar só fk empresa?
(null,1,4,'Ricardo','35678959-0','login1','senha1','administrador');

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

SELECT * FROM Estufa join empresas_parceiras on FK_empresa = empresas_parceiras.id_empresa;
SELECT * FROM controle join sensores join estufa on fk_estufa=idEstufa and fk_sensor=id_sensor