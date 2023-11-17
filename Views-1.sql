
CREATE TABLE clientes (
    id_cliente INT PRIMARY KEY,
    nome VARCHAR(255),
    email VARCHAR(255),
    telefone VARCHAR(20)
);

CREATE TABLE pedidos (
    id_pedido INT PRIMARY KEY,
    id_cliente INT,
    data_pedido DATETIME,
    valor_total DECIMAL(10, 2),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);


CREATE VIEW relatorio_pedidos_cliente AS
SELECT
    c.nome AS nome_cliente,
    COUNT(p.id_pedido) AS numero_pedidos,
    SUM(p.valor_total) AS valor_total_gasto
FROM
    clientes c
    LEFT JOIN pedidos p ON c.id_cliente = p.id_cliente
GROUP BY
    c.id_cliente;

INSERT INTO clientes (id_cliente, nome, email, telefone)
VALUES
    (1, 'Cliente A', 'clienteA@email.com', '123-4567'),
    (2, 'Cliente B', 'clienteB@email.com', '456-7890'),
    (3, 'Cliente C', 'clienteC@email.com', '789-1234');

INSERT INTO pedidos (id_pedido, id_cliente, data_pedido, valor_total)
VALUES
    (1, 1, '2023-11-17 14:30:00', 50.00),
    (2, 1, '2023-11-18 10:45:00', 75.50),
    (3, 2, '2023-11-18 15:20:00', 120.25);

SELECT * FROM relatorio_pedidos_cliente;
