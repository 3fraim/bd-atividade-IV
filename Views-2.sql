
CREATE TABLE produtos1 (
    id_produto INT PRIMARY KEY,
    nome VARCHAR(255),
    preco_unitario DECIMAL(10, 2),
    categoria VARCHAR(255)
);


CREATE TABLE estoque (
    id_produto INT PRIMARY KEY,
    quantidade INT,
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
);


CREATE VIEW estoque_critico AS
SELECT
    p.nome AS nome_produto,
    e.quantidade AS quantidade_em_estoque
FROM
    produtos p
    JOIN estoque e ON p.id_produto = e.id_produto
WHERE
    e.quantidade < 10; 


INSERT INTO produtos (id_produto, nome, preco_unitario, categoria)
VALUES
    (1, 'Produto A', 20.00, 'Eletrônicos'),
    (2, 'Produto B', 15.50, 'Roupas'),
    (3, 'Produto C', 25.75, 'Acessórios');

INSERT INTO estoque (id_produto, quantidade)
VALUES
    (1, 5),
    (2, 12),
    (3, 8);


SELECT * FROM estoque_critico;
