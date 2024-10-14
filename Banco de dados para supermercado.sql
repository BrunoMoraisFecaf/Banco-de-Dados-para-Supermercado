CREATE DATABASE db_supermercado;
USE db_supermercado;

CREATE TABLE tbl_clientes (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    cpf VARCHAR(20) NOT NULL,
    rg VARCHAR(11) NOT NULL,
   
   UNIQUE INDEX (id)
);

CREATE TABLE tbl_telefone (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    numero VARCHAR(20) NOT NULL,
    id_clientes INT NOT NULL,
    CONSTRAINT fk_Cliente_Telefone 
    FOREIGN KEY (id_clientes) 
    REFERENCES tbl_clientes (id),
    
    UNIQUE INDEX (id)
);

CREATE TABLE tbl_email (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(50) NOT NULL,
    id_clientes INT NOT NULL,
    CONSTRAINT fk_cliente_email 
    FOREIGN KEY (id_clientes) 
    REFERENCES tbl_clientes (id),
   
   UNIQUE INDEX (id)
);

CREATE TABLE tbl_colaboradores (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome_colaborador VARCHAR(100),
    genero VARCHAR(45),
    cargo VARCHAR(45),
    data_nascimento DATE,
    cpf VARCHAR(20),
   
   UNIQUE INDEX (id)
);

CREATE TABLE tbl_endereco (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    logradouro VARCHAR(100) NOT NULL,
    bairro VARCHAR(45) NOT NULL,
    estado VARCHAR(45) NOT NULL,
    pais VARCHAR(45) NOT NULL,
    cidade VARCHAR(45) NOT NULL,
    id_clientes INT NOT NULL,
    CONSTRAINT fk_cliente_endereco 
    FOREIGN KEY (id_clientes) 
    REFERENCES tbl_clientes (id),
  
  UNIQUE INDEX (id)
);

CREATE TABLE tbl_produtos (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    qntde INT NOT NULL,
    data_compra DATE NOT NULL,
    categoria_produto VARCHAR(25) NOT NULL,
    marcas_mais_compradas VARCHAR(20) NOT NULL,
    estoque_disponivel VARCHAR(5) NOT NULL,
    
    UNIQUE INDEX (id)
);

CREATE TABLE tbl_vendas (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    valor_pagamento DECIMAL(10, 2) NOT NULL,
    qntde_vendida INT NOT NULL,
    nome_vendedor VARCHAR(20),
    
    UNIQUE INDEX (id)
);

CREATE TABLE tbl_vendas_produtos (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    id_produtos INT NOT NULL,
    id_vendas INT NOT NULL,
    forma_pagamento VARCHAR(30) NOT NULL,
   
   CONSTRAINT fk_vendas_vendas_produtos 
    
    FOREIGN KEY (id_produtos) 
    
    REFERENCES tbl_produtos (id),
   
   CONSTRAINT fk_vendas_vendas_produtos_vendas 
   
   FOREIGN KEY (id_vendas) 
   
   REFERENCES tbl_vendas (id),
    
    UNIQUE INDEX (id)
);

INSERT INTO tbl_clientes (nome, cpf, rg) 
VALUES
('Jose Oliveira Santos', '98765432100', '456789013'),
('Diego Mendes', '11122233344', '345678902');


INSERT INTO tbl_email (email, id_clientes) 
VALUES
('joseoliveiradossantos12@gmail.com', 1);

INSERT INTO tbl_telefone (numero, id_clientes) 
VALUES 
('31987654321', 1),
('41995551212', 2);


INSERT INTO tbl_colaboradores (nome_colaborador, genero, cargo, data_nascimento, cpf) 
VALUES
('Paulo Pereira', 'Masculino', 'Atendente de caixa', '2002-01-02', '22334455678');


INSERT INTO tbl_produtos (qntde, data_compra, categoria_produto, marcas_mais_compradas, estoque_disponivel) 
VALUES
(15, '2023-11-24', 'alimentos', 'bauducco', 'SIM'),
(30, '2023-11-24', 'alimentos', 'bauducco', 'SIM'),
(45, '2023-11-24', 'alimentos', 'bauducco', 'SIM'),
(65, '2023-11-24', 'alimentos', 'bauducco', 'SIM'),
(125, '2023-11-24', 'eletrônicos', 'samsung', 'SIM');


INSERT INTO tbl_vendas (valor_pagamento, qntde_vendida, nome_vendedor) 
VALUES
(240.00, 15, 'Jose Oliveira Santos'),
(260.00, 30, 'André Martins'),
(360.00, 45, 'Joao Oliveira'),
(400.00, 65, 'Jose Morais'),
(1200.00, 125, 'Arthur Cavalieri');

INSERT INTO tbl_vendas_produtos (id_produtos, id_vendas, forma_pagamento) 
VALUES
('1, 1','debito'),
('2, 2', 'debito'),
('3, 3', 'dinheiro'),
('4, 4', 'dinheiro'),
('5,5', 'cartao de credito');


SHOW TABLES;


SELECT * FROM tbl_endereco;
INSERT INTO TBL_ENDERECO(id, 
						logradouro,
                        bairro,
                        cidade,
                        estado,
                        pais,
                        id_clientes
				)  values ( 
                          '5',
                          'Rua da Esperança, 654',
                          'Centro',
                          'São Paulo',
                          'SP',
                          'Brasil',
                          '5'
						);

USE DB_SUPERMERCADO;
SELECT * FROM tbl_vendas_produtos;
