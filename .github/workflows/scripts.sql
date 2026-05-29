CREATE TABLE cliente (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    telefone VARCHAR(20),
    email VARCHAR(100),
    cidade VARCHAR(50)
);

CREATE TABLE funcionario (
    id_funcionario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    cargo VARCHAR(50),
    salario DECIMAL(10,2)
);

CREATE TABLE categoria (
    id_categoria INT PRIMARY KEY AUTO_INCREMENT,
    nome_categoria VARCHAR(50)
);

CREATE TABLE produto (
    id_produto INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    preco DECIMAL(10,2),
    estoque INT,
    id_categoria INT,

    FOREIGN KEY (id_categoria)
    REFERENCES categoria(id_categoria)
);

CREATE TABLE venda (
    id_venda INT PRIMARY KEY AUTO_INCREMENT,
    data_venda DATE,
    valor_total DECIMAL(10,2),
    id_cliente INT,
    id_funcionario INT,

    FOREIGN KEY (id_cliente)
    REFERENCES cliente(id_cliente),

    FOREIGN KEY (id_funcionario)
    REFERENCES funcionario(id_funcionario)
);

CREATE TABLE item_venda (
    id_item INT PRIMARY KEY AUTO_INCREMENT,
    id_venda INT,
    id_produto INT,
    quantidade INT,
    subtotal DECIMAL(10,2),

    FOREIGN KEY (id_venda)
    REFERENCES venda(id_venda),

    FOREIGN KEY (id_produto)
    REFERENCES produto(id_produto)
);
INSERT INTO categoria (nome_categoria)
VALUES
('Ferramentas Elétricas'),
('Ferramentas Manuais'),
('EPIs');

INSERT INTO produto (nome, preco, estoque, id_categoria)
VALUES
('Furadeira Bosch', 350.00, 10, 1),
('Martelo', 45.00, 25, 2),
('Alicate', 30.00, 15, 2),
('Capacete', 80.00, 20, 3);

INSERT INTO cliente (nome, telefone, email, cidade)
VALUES
('João Silva', '11999999999', 'joao@gmail.com', 'São Paulo'),
('Maria Souza', '11988888888', 'maria@gmail.com', 'Campinas');

INSERT INTO funcionario (nome, cargo, salario)
VALUES
('Carlos Mendes', 'Vendedor', 2500.00),
('Ana Costa', 'Gerente', 4000.00);
SELECT * FROM produto;
SELECT * FROM produto
WHERE preco > 50;
SELECT AVG(preco) AS media_preco
FROM produto;
SELECT SUM(valor_total) AS faturamento
FROM venda;
