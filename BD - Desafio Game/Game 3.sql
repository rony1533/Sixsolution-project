create database fantasia;
use fantasia;

create table reinos(
	id_reino			int	primary key auto_increment,
	nome_reino		varchar(64), 
	rei			varchar(64), 
	economia	varchar(10), 
	check (economia = 'Declinio' or economia = 'estagnado' or economia ='estavel' or economia = 'crescente'),
	qtdsoldados	int
);

insert into reinos values 
(1,'Westeros','Robert','estagnado',50000),
(2,'Easteros','Varys','crescente',65000);


create table clas(
	id_cla		int primary key auto_increment, 
	nome_cla		varchar(64), 
	lider		varchar(64)
); 

insert into clas values 
(1,'adagas voadoras','Rony'),
(2,'clã das sombras','André'),
(3,'clã imortal','Pedro');

create table contratos(
	id_contrato	int primary key auto_increment, 
	fk_reino	int, 
	fk_cla		int, 
	missao		varchar(128), 
	recompensa	double,
	foreign key (fk_reino) references reinos(id_reino),
	foreign key (fk_cla) references clas(id_cla)
);

insert into contratos values 
(1,1,1,'matar 10 monstros no sul do reino de Westeros',1500),
(2,1,2,'obter informações sobre um contrato de outro reino',1000),
(3,1,2,'assassinar o líder do cla das adagas voadoras',6000),
(4,2,1,'matar 20 monstros ao norte de Easteros',2000),
(5,2,3,'saquear um vilarejo do reino de Westeros',2500);

select * from contratos;

create table classes (
	id_classe	int primary key auto_increment, 
	tipo		varchar(32), 
	arma		varchar(32)
);

insert into classes values 
(1,'guerreiro','machado'),
(2,'mago','cetro'),
(3,'arqueiro','arco e flecha');

create table aventureiros (
	id_aventureiro	int primary key auto_increment, 
	nome		varchar(64), 
	ranking	char(1),
	check (ranking = 'F' or ranking = 'E' or ranking = 'D' or ranking = 'C' or ranking = 'B' or ranking = 'A'),
	fk_cla		int, 
	fk_classe	int,
	foreign key (fk_cla) references clas(id_cla),
	foreign key (fk_classe) references classes(id_classe)
);

insert into aventureiros values 
(1,'Ricardo','A',2,1),
(2,'Mauro','A',1,2),
(3,'Lucas','B',2,2),
(4,'Angélica','C',1,1),
(5,'Mauro','F',3,3),
(6,'Valquíria','D',3,2);




create table habilidades (
	id_habilidade	int primary key auto_increment, 
	habilidade		varchar(45)
);

insert into habilidades values 
(1,'fúria'),
(2,'inspirar aliados'),
(3,'criar ilusão'),
(4,'rajada de fogo'),
(5,'curar');

create table aventureiro_habilidade (
	fk_aventureiro	int,
	fk_habilidade	int,
	foreign key (fk_aventureiro) references aventureiros(id_aventureiro), 
	foreign key (fk_habilidade) references  habilidades(id_habilidade),
	primary key ( fk_aventureiro, fk_habilidade)
);

insert into aventureiro_habilidade values 
(1,1),
(1,2),
(1,4),
(3,4),
(4,1),
(4,2),
(2,3),
(2,4),
(5,2),
(5,5),
(6,5),
(6,3);


create table monstros (
	id_monstro	int primary key auto_increment, 
	Raca		varchar(64), 
	drop_moedas	double
) auto_increment = 1000;

insert into monstros values 
(1000,'centauro',20),
(1001,'dragão',100),
(1002,'ogro',25),
(1003,'troll',50);


create table batalhas (
	id_batalha	int primary key auto_increment, 
    fk_aventureiro int,
	fk_monstro	int, 
	terreno		varchar(20), 
	vencedor	int,
    foreign key (fk_aventureiro) references aventureiros (id_aventureiro),
	foreign key (fk_monstro) references monstros (id_monstro),
    check (vencedor=fk_monstro or vencedor=fk_aventureiro) -- esse check garante que somente a fk de um dos envolvidos na batalha possa ser inserido no campo vencedor
);

insert into batalhas values 
(1,1,1000,'montanha',1),
(2,1,1002,'deserto',1),
(3,4,1000,'planície',4),
(4,2,1002,'planície',2),
(5,2,1001,'planície',1001),
(6,3,1002,'montanha',3),
(7,1,1003,'montanha',1),
(8,5,1000,'deserto',1000),
(9,6,1000,'planície',6);



drop database fantasia;


