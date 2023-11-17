
CREATE TABLE categorias (
    id_categoria INT PRIMARY KEY,
    nome_categoria VARCHAR(255),
    descricao VARCHAR(255)
);

-- Tabela "coisas"
CREATE TABLE coisas (
    id_coisa INT PRIMARY KEY,
    nome VARCHAR(255),
    preco_unitario DECIMAL(10, 2),
    id_categoria INT,
    FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria)
);

CREATE VIEW relatorio_coisas_categoria AS
SELECT
    c.nome_categoria AS nome_categoria,
    COUNT(co.id_coisa) AS quantidade_coisas
FROM
    categorias c
    LEFT JOIN coisas co ON c.id_categoria = co.id_categoria
GROUP BY
    c.id_categoria;


INSERT INTO categorias (id_categoria, nome_categoria, descricao)
VALUES
    (1, 'Eletrônicos', 'Produtos eletrônicos diversos'),
    (2, 'Roupas', 'Roupas de moda'),
    (3, 'Acessórios', 'Acessórios variados');

INSERT INTO coisas (id_coisa, nome, preco_unitario, id_categoria)
VALUES
    (1, 'Coisa A', 20.00, 1),
    (2, 'Coisa B', 15.50, 2),
    (3, 'Coisa C', 25.75, 3);


SELECT * FROM relatorio_coisas_categoria;
