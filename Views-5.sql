
CREATE TABLE alunos1 (
    id_aluno INT PRIMARY KEY,
    nome VARCHAR(255),
    data_nascimento DATE,
    serie INT
);


CREATE TABLE matriculas1 (
    id_matricula INT PRIMARY KEY,
    id_aluno INT,
    data_matricula DATE,
    status VARCHAR(255),
    FOREIGN KEY (id_aluno) REFERENCES alunos(id_aluno)
);


CREATE VIEW relatorio_idade_serie AS
SELECT
    a.nome AS nome_aluno,
    a.data_nascimento AS data_nascimento,
    a.serie AS serie,
    m.data_matricula AS data_matricula,
    m.status AS status
FROM
    alunos1 a
    JOIN matriculas1 m ON a.id_aluno = m.id_aluno;

INSERT INTO alunos1 (id_aluno, nome, data_nascimento, serie)
VALUES
    (1, 'Aluno A', '2005-05-15', 9),
    (2, 'Aluno B', '2006-02-22', 7),
    (3, 'Aluno C', '2004-11-10', 10);

INSERT INTO matriculas1 (id_matricula, id_aluno, data_matricula, status)
VALUES
    (1, 1, '2023-01-10', 'Ativo'),
    (2, 2, '2023-02-05', 'Ativo'),
    (3, 3, '2023-03-20', 'Inativo');


SELECT * FROM relatorio_idade_serie;
