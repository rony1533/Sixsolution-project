create database fantasia;
use fantasia;

create table reino(
	id_reino			int	primary key auto_increment,
	nome_reino		varchar(64), 
	rei			varchar(64), 
	economia	varchar(10), 
	check (economia = 'Declinio' or economia = 'estagnado' or economia ='estavel' or economia = 'crescente'),
	qtdsoldados	int
);

create table cla(
	id_cla		int primary key auto_increment, 
	nome_cla		varchar(64), 
	lider		varchar(64)
); 

create table contratos(
	id_contrato	int primary key auto_increment, 
	fk_reino	int, 
	fk_cla		int, 
	missão		varchar(128), 
	recompensa	double(3,2),
	foreign key (fk_reino) references reino(id_reino),
	foreign key (fk_cla) references cla(id_cla)
);

create table aventureiro (
	id_aventureiro	int primary key auto_increment, 
	nome		varchar(64), 
	rank		char(1),
	check (rank = 'F' or rank = 'E' or rank = 'D' or rank = 'C' or rank = 'B' or rank = 'A'),
	fk_cla		int, 
	fk_classe	int,
	foreign key (fk_cla) references cla(id_cla),
	foreign key (fk_classe) references classe(id_classe)
);

create table classe (
	id_classe	int primary key auto_increment, 
	tipo		varchar(32), 
	arma		varchar(32)
);

create table aventureiro_habilidade (
	fk_aventureiro	int,
	fk_habilidades	int,
	foreign key (fk_aventureiro) references aventureiro(id_aventureiro), 
	foreign key (fk_habilidades) references  habilidades(id_habilidades),
	primary key ( fk_aventureiro, fk_habilidades)
);

create table habilidades (
	id_habilidades	int primary key auto_increment, 
	habilidade		varchar(45)
);

create table monstro (
	id_monstro	int primary key auto_increment, 
	Raca		varchar(64), 
	dropmoedas	double(3,2)
) auto_increment = 1000;

create table batalha (
	id_batalha	int primary key auto_increment, 
	fk_monstro	int, 
	fk_aventureiro int,
	terreno		varchar(20), 
	vencedor	int
);