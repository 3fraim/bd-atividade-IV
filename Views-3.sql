
CREATE TABLE funcionarios3 (
    id_funcionario INT PRIMARY KEY,
    nome VARCHAR(255),
    cargo VARCHAR(255),
    salario DECIMAL(10, 2)
);

CREATE TABLE vendas3 (
    id_venda INT PRIMARY KEY,
    id_funcionario INT,
    data_venda DATETIME,
    valor_venda DECIMAL(10, 2),
    FOREIGN KEY (id_funcionario) REFERENCES funcionarios(id_funcionario)
);


CREATE VIEW relatorio_vendas_funcionario AS
SELECT
    f.nome AS nome_funcionario,
    COUNT(v.id_venda) AS numero_vendas,
    SUM(v.valor_venda) AS valor_total_vendas
FROM
    funcionarios f
    LEFT JOIN vendas3 v ON f.id_funcionario = v.id_funcionario
GROUP BY
    f.id_funcionario;


INSERT INTO funcionarios3 (id_funcionario, nome, cargo, salario)
VALUES
    (1, 'Funcionario A', 'Vendedor', 3000.00),
    (2, 'Funcionario B', 'Gerente', 5000.00),
    (3, 'Funcionario C', 'Atendente', 2500.00);

INSERT INTO vendas3 (id_venda, id_funcionario, data_venda, valor_venda)
VALUES
    (1, 1, '2023-11-17 14:30:00', 150.00),
    (2, 1, '2023-11-18 10:45:00', 200.50),
    (3, 2, '2023-11-18 15:20:00', 350.25);

SELECT * FROM relatorio_vendas_funcionario;
