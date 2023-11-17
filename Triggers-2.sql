
CREATE TABLE contas (
    id_conta INT PRIMARY KEY,
    nome VARCHAR(255),
    saldo DECIMAL(10, 2)
);


CREATE TABLE transacoes (
    id_transacao INT PRIMARY KEY,
    id_conta INT,
    tipo VARCHAR(10),
    valor DECIMAL(10, 2),
    FOREIGN KEY (id_conta) REFERENCES contas(id_conta)
);
CREATE TRIGGER atualizar_saldo
AFTER INSERT ON transacoes
FOR EACH ROW
UPDATE contas
SET saldo = CASE
    WHEN NEW.tipo = 'entrada' THEN saldo + NEW.valor
    WHEN NEW.tipo = 'saída' THEN saldo - NEW.valor
    END
WHERE id_conta = NEW.id_conta;

 INSERT INTO contas (id_conta, nome, saldo)
VALUES
    (1, 'Conta A', 1000.00),
    (2, 'Conta B', 500.50),
    (3, 'Conta C', 1200.75);

select * from contas;

INSERT INTO transacoes (id_transacao, id_conta, tipo, valor)
VALUES
    (1 , 1, 'entrada', 200.00),
    (2, 1, 'saída', 50.50),
    (3, 2, 'entrada', 100.00),
    (4, 3, 'saída', 300.25);