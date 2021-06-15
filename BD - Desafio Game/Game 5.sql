create database fantasia;
use fantasia;

create table reinos(
	id_reino			int	primary key auto_increment,
	nome_reino		varchar(64), 
	rei			varchar(64), 
	economia	varchar(10), 
	check (economia = 'declínio' or economia = 'estagnado' or economia ='estavel' or economia = 'crescente'),
	qtdsoldados	int
);

insert into reinos values 
(1,'Westeros','Robert','estagnado',50000),
(2,'Easteros','Varys','crescente',65000),
(3,'Terra Média','Aragorn','declínio',40000);


create table clas(
	id_cla		int primary key auto_increment, 
	nome_cla		varchar(64), 
	lider		varchar(64)
); 

insert into clas values 
(1,'clã adagas voadoras','Rony'),
(2,'clã das sombras','André'),
(3,'clã imortal','Pedro'),
(4,'clã punho de ferro','Breno');

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
(5,2,3,'saquear um vilarejo do reino de Westeros',2500),
(6,3,4,'matar 35 monstros no reino da terra média',2800),
(7,3,1,'saquear um vilarejo do reino de Easteros',2000);

select * from contratos;

create table classes (
	id_classe	int primary key auto_increment, 
	tipo		varchar(32), 
	arma		varchar(32)
);

insert into classes values 
(1,'guerreiro','machado'),
(2,'mago','cetro'),
(3,'arqueiro','arco e flecha'),
(4,'cavaleiro','lança');

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
(5,'Marcos','F',3,3),
(6,'Valquíria','D',3,2),
(7,'Jorge','E',4,4),
(8,'Augusto','D',1,4),
(9,'Matheus','B',1,1);





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
(6,3),
(7,2),
(7,5),
(8,2),
(9,1),
(9,4);


create table monstros (
	id_monstro	int primary key auto_increment, 
	raca		varchar(64), 
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
(9,6,1000,'planície',6),
(10,8,1001,'montanha',8),
(11,9,1000,'planície',9),
(12,7,1003,'planície',7);




select nome,raca from aventureiros right join batalhas on vencedor=id_aventureiro 
left join monstros on vencedor=id_monstro; -- traz os vencedores em 2 colunas


select id_batalha as id_venc,nome as nome_venc,raca as raca_venc from aventureiros right join batalhas on vencedor=id_aventureiro 
left join monstros on vencedor=id_monstro; -- com id

-- exibir, para cada batalha, o nome do aventureiro, a raca do monstro combatido e o nome ou a raca do vencedor.
-- os nomes e racas dos vencedores podem ser exibidos em colunas diferentes ex: null dragao

select nome,raca,nome_venc,raca_venc from aventureiros join batalhas on fk_aventureiro=id_aventureiro
join monstros on fk_monstro=id_monstro join (select id_batalha as id_venc,nome as nome_venc,raca as raca_venc from aventureiros 
right join batalhas on vencedor=id_aventureiro left join monstros on vencedor=id_monstro) as vencedores on id_batalha=id_venc; -- finalmente traz o nome e raca que batalharam e o vencedor em duas colunas

select id_batalha,nome,raca,nome_venc,raca_venc from aventureiros join batalhas on fk_aventureiro=id_aventureiro
join monstros on fk_monstro=id_monstro join (select id_batalha as id_venc,nome as nome_venc,raca as raca_venc from aventureiros 
right join batalhas on vencedor=id_aventureiro left join monstros on vencedor=id_monstro) as vencedores on id_batalha=id_venc; -- com id pra vizualizar melhor



select nome,raca from aventureiros join batalhas on vencedor=id_aventureiro 
join monstros on vencedor=id_monstro; -- nao da certo com o inner join, precisa de left e right

-- exibir os dados de todas as batalhas que ocorreram no terreno 'planície' (easy)

select * from batalhas where terreno='planície'; 


-- exibir o numero de tipos de terreno no qual o aventureiro Ricardo participou de batalhas (easy)

select count(distinct terreno) from batalhas where fk_aventureiro=1;
select count(terreno) from batalhas where fk_aventureiro=1; -- sem distinct da diferente nesse caso


-- exibir o numero de batalhas nas quais o monstro centauro participou (easy)

select count(fk_monstro) from batalhas where fk_monstro=1000;


-- exibir o número total de moedas de recompensa em contratos que envolvam o reino de Westeros 
-- (contratos que ele iniciou e contratos cuja missão fale algo sobre ele) (medium)

select sum(recompensa) from contratos where fk_reino=1 or missao like '%Westeros%';


-- exibir os nomes de todos os aventureiros e suas habilidades ordenados pelo nome (medium)

select aventureiros.nome,habilidades.habilidade from aventureiros 
join aventureiro_habilidade on fk_aventureiro=id_aventureiro
join habilidades on fk_habilidade=id_habilidade order by nome; 


-- exibir os nomes dos reinos ao lado da média do valor de recompensa de seus contratos (medium)

select nome_reino,avg(recompensa) from reinos join contratos on fk_reino=id_reino group by nome_reino;

select nome_reino,recompensa from reinos join contratos on fk_reino=id_reino; -- para verificar


-- exibir, para cada uma das batalhas, os nomes e rankings de aventureiros ao lado das racas dos monstros 
-- com os quais eles batalharam, ordenados pelo ranking dos aventureiros (hard - cancelada)

select aventureiros.nome,aventureiros.ranking,monstros.raca from aventureiros 
join batalhas on fk_aventureiro=id_aventureiro 
join monstros on fk_monstro=id_monstro order by ranking;

-- exibir, para cada batalha, o aventureiro, a arma de classe utilizada por ele e a raca do monstro combatido 
-- ordenado pelo nome do aventureiro (hard)

select nome,arma,raca from classes join aventureiros on fk_classe=id_classe 
join batalhas on fk_aventureiro=id_aventureiro
join monstros on fk_monstro=id_monstro order by nome;

-- exibir os nomes dos reinos ao lado dos nomes de todos os aventureiros que participam de clãs 
-- que possuem contrato com esses reinos (sem repetir relação reino-aventureiro) (hard)

select distinct nome_reino,nome from reinos join contratos on fk_reino=id_reino 
join clas on contratos.fk_cla=id_cla join aventureiros on aventureiros.fk_cla=id_cla;

select nome_reino,nome from reinos join contratos on fk_reino=id_reino 
join clas on contratos.fk_cla=id_cla join aventureiros on aventureiros.fk_cla=id_cla; -- sem distinct repete em Westeros





-- exibir o número total de moedas dropadas por monstros em todas as batalhas que todos os membros do clã das adagas voadoras venceram (coringa - virou hard)

select sum(monstros.drop_moedas) from monstros join batalhas on fk_monstro=id_monstro
where vencedor=batalhas.fk_aventureiro and fk_aventureiro in (select id_aventureiro from aventureiros where fk_cla=1); 

select sum(monstros.drop_moedas) from monstros join batalhas on fk_monstro=id_monstro 
join aventureiros on fk_aventureiro=id_aventureiro where vencedor=batalhas.fk_aventureiro and fk_cla=1; -- outro jeito

select sum(monstros.drop_moedas) from monstros join batalhas on fk_monstro=id_monstro
 where fk_aventureiro in (select id_aventureiro from aventureiros where fk_cla=1); -- coringa errado (todas as batalhas até as perdidas)







drop database fantasia;
-- 
select monstros.drop_moedas,batalhas.* from monstros join batalhas on fk_monstro=id_monstro; -- montros e batalhas das quais participaram

select sum(monstros.drop_moedas),batalhas.* from monstros join batalhas on fk_monstro=id_monstro;
select sum(monstros.drop_moedas),batalhas.* from monstros join batalhas on fk_monstro=id_monstro where vencedor=batalhas.fk_aventureiro;

select sum(monstros.drop_moedas),batalhas.* from monstros join batalhas on fk_monstro=id_monstro where fk_aventureiro=2;
select sum(monstros.drop_moedas),batalhas.* from monstros join batalhas on fk_monstro=id_monstro where vencedor=batalhas.fk_aventureiro and fk_aventureiro=2;

