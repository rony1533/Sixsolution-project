CREATE DATABASE SixS;
USE Sixs;

create table empresas_parceiras (            -- empresas que estão utilizando nosso serviço
id_empresa int primary key auto_increment,
mome varchar(60),
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
                          (null, 5, 'Estufa Breno - 1'),
                          (null, 3, 'Estufa André - 2');
                          
SELECT * FROM Estufa;
SELECT * FROM Estufa ORDER BY FK_empresa;

create table usuarios (
id_usuario int primary key auto_increment,
fk_empresa int,    
nome varchar(60),
RG varchar (20),
login varchar(60),
senha varchar(60),
funcao varchar(15),
check (funcao="administrador" or funcao="funcionário"), -- O administrador é o encarregado pela empresa para definir qual(is) funcionários trabalham em qual(is) estufas (no caso, pode restringir o acesso às informções de outras estufas no nosso site)
foreign key (fk_empresa) references empresas_parceiras(id_empresa)
);

insert into usuarios values      
(null,1,'Ricardo','35678959-0','login1','senha1','administrador'),
(null,1,'Lucas','38475637-5','login2','senha2','funcionário'),
(null,1,'José','34675681-5','login3','senha3','funcionário'),
(null,3,'Mariana','45763476-4','login4','senha4','administrador'),
(null,3,'Ana','23465478-9','login5','senha5','funcionário'),
(null,3,'João','16457645-1','login6','senha6','funcionário');

select * from usuarios;


create table usuario_estufa (
fk_usuario int,
fk_estufa int,
foreign key (fk_usuario) references usuarios(id_usuario),
foreign key (fk_estufa) references Estufa(idEstufa),
primary key (fk_usuario,fk_estufa)
);

insert into usuario_estufa values  -- empresa 3 tem 2 estufas idestufa 1006 e 1004
(1,1003),
(2,1003),
(3,1003),
(4,1004), -- a usuaria Mariana com o id 4 é administradora, portanto tem acesso às duas estufas da empresa 3
(4,1006),
(5,1004),
(6,1004),
(6,1006); -- o usuario Joao de id 6 trabalha nas duas estufas da empresa 3

select * from usuario_estufa;

create table sensores (
	id_sensor int primary key auto_increment,
    fk_estufa int,
    constraint sensores_fk_estufa foreign key (fk_estufa) references Estufa(idEstufa)
);

insert into sensores (fk_estufa) values -- insere 2 sensores na estufa de id 1000 e mais dois na 1001
(1000),
(1000),
(1001),
(1001);


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

SELECT * FROM Estufa join empresas_parceiras on FK_empresa = empresas_parceiras.id_empresa; -- relacao de empresas parceiras com suas estufas
SELECT * FROM controle join sensores join estufa on fk_estufa=idEstufa and fk_sensor=id_sensor; -- relacao de dados de todas as leituras de todas as estufas e seus sensores
select usuarios.nome,Estufa.nomeEstufa from usuarios join usuario_estufa join Estufa on id_usuario=fk_usuario and idEstufa=fk_estufa order by nome; -- mostra os nomes dos funcionarios e as estufas as quais eles tem acesso
select avg(temperatura) from controle where fk_sensor=1; -- media das temperaturas captadas pelo sensor 1

drop database sixs;