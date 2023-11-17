
CREATE TABLE produtos (
    id_produto INT PRIMARY KEY,
    nome VARCHAR(255),
    quantidade_estoque INT
);


CREATE TABLE vendas (
    id_venda INT PRIMARY KEY,
    data_venda DATETIME
);


CREATE TABLE itens_venda (
    id_item_venda INT PRIMARY KEY,
    id_venda INT,
    id_produto INT,
    quantidade INT,
    FOREIGN KEY (id_venda) REFERENCES vendas(id_venda),
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
);


DELIMITER //

CREATE TRIGGER verificar_estoque
BEFORE INSERT ON itens_venda
FOR EACH ROW
BEGIN
    DECLARE estoque_disponivel INT;
    
    SELECT quantidade_estoque INTO estoque_disponivel
    FROM produtos
    WHERE id_produto = NEW.id_produto;
    
    IF estoque_disponivel < NEW.quantidade THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Produto fora de estoque';
    END IF;
END;

//


DELIMITER ;


INSERT INTO produtos (id_produto, nome, quantidade_estoque)
VALUES
    (1, 'Produto A', 10),
    (2, 'Produto B', 5),
    (3, 'Produto C', 8);

INSERT INTO vendas (id_venda, data_venda)
VALUES (1, '2023-11-17 15:30:00');

INSERT INTO itens_venda (id_item_venda, id_venda, id_produto, quantidade)
VALUES
    (1, 1, 1, 3),
    (2, 1, 2, 6),
    (3, 1, 3, 2);

