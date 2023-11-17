
CREATE TABLE alunos (
    id_aluno INT PRIMARY KEY,
    nome VARCHAR(255),
    data_nascimento DATE,
    serie INT
);


CREATE TABLE matriculas (
    id_matricula INT PRIMARY KEY,
    id_aluno INT,
    data_matricula DATE,
    status VARCHAR(20),
    FOREIGN KEY (id_aluno) REFERENCES alunos(id_aluno)
);


DELIMITER //

CREATE TRIGGER verificar_idade_matricula
BEFORE INSERT ON matriculas
FOR EACH ROW
BEGIN
    DECLARE idade_aluno INT;
    DECLARE idade_minima INT;
    
    SELECT TIMESTAMPDIFF(YEAR, (SELECT data_nascimento FROM alunos WHERE id_aluno = NEW.id_aluno), CURDATE()) INTO idade_aluno;
    
    SELECT idade_minima INTO idade_minima
    FROM series
    WHERE serie = (SELECT serie FROM alunos WHERE id_aluno = NEW.id_aluno); 
    
    IF idade_aluno < idade_minima THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Aluno não atende aos requisitos de idade para a série';
    END IF;
END;

//


DELIMITER ;


INSERT INTO alunos (id_aluno, nome, data_nascimento, serie)
VALUES
    (1, 'Aluno A', '2010-01-15', 5),
    (2, 'Aluno B', '2011-03-20', 8),
    (3, 'Aluno C', '2012-06-05', 6);

INSERT INTO matriculas (id_matricula, id_aluno, data_matricula, status)
VALUES
    (1, 1, '2023-11-17', 'Ativa'),
    (2, 2, '2023-11-17', 'Ativa'),
    (3, 3, '2023-11-17', 'Ativa');
