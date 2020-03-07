CREATE SCHEMA Empresa;

use Empresa;

CREATE TABLE Departamento(
	idDepto INT NOT NULL auto_increment,
    nomeDepto VARCHAR (40) NOT NULL,
    idGerente INT NOT NUll,
    CONSTRAINT pk_depto PRIMARY KEY (idDepto),
    CONSTRAINT uk_nome UNIQUE (nomeDepto)
);

CREATE TABLE Funcinario(
	idFUnc INT NOT NULL auto_increment,
    nomeFunc VARCHAR(50) not null,
    endereco varchar(80) not null,
    dataNasc date not null,
    sexo char(1) not null,
    salario decimal(8,2) not null,
    idSupervisor int null,
    idDepto int not null,
    constraint pk_func primary key (idFunc),
    constraint ck_sexo check (sexo='M' or sexo='F'),
    constraint fk_func_depto foreign key (idDepto)
		references Departamento(idDepto)
        on delete set null
);

create table Projeto(
	idProj int not null auto_increment,
    nomeProj varchar(30) not null,
    localizacao varchar(30) null,
    idDepto int not null,
    constraint pk_proj primary key (idProj),
    constraint fk_proj_depto foreign key (idDepto)
		references Departamento (idDepto),
	constraint uk_nomeProj unique (nomeProj)
);

create table dependente(
	idDep int not null auto_increment,
    idFunc int not null,
    nomeDep varchar(50) not null,
    dataNasc date not null,
    sexo char(1) not null,
    parentesco varchar(15) not null,
    constraint pk_depend primary key(idDep),
    constraint fk_depend_func foreign key (idFunc)
		references Funcinario (idFUnc)
        on delete cascade,
	constraint ck_sexo_depend check (sexo='M' or sexo='F')
);

create table Trabalha(
	idFunc int not null,
    idProj int not null,
    numHoras decimal(6,1),
    constraint pk_trab primary key(idFunc,idProj),
    constraint fk_trab_func foreign key (idFunc)
		references Funcinario (idFnc)
        on delete cascade,
	constraint fk_trab_proj foreign key (idProj)
		references Projeto (idProj)
        on delete cascade
);

