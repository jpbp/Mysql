-- consulta 1
select Nota,Nome_disciplina
from aluno as A ,historico_escolar as H ,Turma as T ,  Disciplina as  D
where A.Nome_aluno="Braga" and A.Numero_aluno=H.Numero_aluno and T.Id_turma=H.Id_turma and T.Numero_disciplina=D.Numero_disciplina;

-- consulta 2
select Nome_aluno,Nota
from aluno as A ,historico_escolar as H ,Turma as T ,  Disciplina as  D
where D.Nome_disciplina="Banco de dados" and T.Semestre="Segundo" 
and T.Ano="08" and A.Numero_aluno=H.Numero_aluno and 
T.Id_turma=H.Id_turma and T.Numero_disciplina=D.Numero_disciplina;

-- consulta 3
select Numero_pre_requisito, D1.Nome_disciplina
from disciplina D, pre_requisito P, disciplina D1
where D.Nome_disciplina="Banco de dados" and D.Numero_disciplina=P.Numero_disciplina and D1.Numero_disciplina=P.Numero_pre_requisito;

-- consulta 4

update aluno
set Tipo_aluno="2"
where Numero_aluno=17;

select * from aluno;

-- consulta 5
insert into turma values(151,"Primeiro","09","João Paulo","CC3380");
select * from turma;









