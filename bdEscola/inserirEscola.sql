use escola;

insert into aluno values("Silva",17,"1","CC");
insert into aluno values("Braga",8,"2","CC");

insert into disciplina values("Introd. à ciencia da computacao","CC1310",4,"CC");
insert into disciplina values("Estrutura de dados","CC3320",4,"CC");
insert into disciplina values("Matematica discreta","MAT2410",3,"MAT");
insert into disciplina values("Banco de dados","CC3380",3,"CC");

insert into turma values(85,"Segundo","07","Kleber","MAT2410");
insert into turma values(92,"Segundo","07","Anderson","CC1310");
insert into turma values(102,"Primeiro","08","Carlos","CC3320");
insert into turma values(112,"Segundo","08","Chang","MAT2410");
insert into turma values(119,"Segundo","08","Anderson","CC1310");
insert into turma values(135,"Segundo","08","Santos","CC3380");

insert into historico_escolar values("B",17,112);
insert into historico_escolar values("C",17,119);
insert into historico_escolar values("A",8,85);
insert into historico_escolar values("A",8,92);
insert into historico_escolar values("B",8,102);
insert into historico_escolar values("A",8,135);

insert into pre_requisito values("CC3320","CC3380");
insert into pre_requisito values("MAT2410","CC3380");
insert into pre_requisito values("CC1310","CC3320");

