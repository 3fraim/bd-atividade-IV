CREATE DATABASE atividadeIV;
use atividadeIV;

CREATE TABLE livros (
    id_livro INT PRIMARY KEY,
    titulo VARCHAR(255),
    autor VARCHAR(255),
    quantidade_estoque INT
);


CREATE TABLE emprestimos (
    id_emprestimo INT PRIMARY KEY,
    id_livro INT,
    data_emprestimo DATETIME,
    data_devolucao DATETIME,
    FOREIGN KEY (id_livro) REFERENCES livros(id_livro)
);
CREATE TRIGGER atualizar_estoque
AFTER INSERT ON emprestimos
FOR EACH ROW
UPDATE livros
SET quantidade_estoque = quantidade_estoque - 1
WHERE id_livro = NEW.id_livro;

INSERT INTO livros (id_livro, titulo, autor, quantidade_estoque)
VALUES
    (1, 'Livro A', 'Autor A', 5),
    (2, 'Livro B', 'Autor B', 3),
    (3, 'Livro C', 'Autor C', 7);

select * from livros;

INSERT INTO emprestimos (id_emprestimo, id_livro, data_emprestimo, data_devolucao)
VALUES
    (4, 3, '2023-11-09 10:00:00', '2023-11-22 10:00:00');
