/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  gilberto
 * Created: 01/11/2019
 */

CREATE TABLE fornecedor (
	id SERIAL NOT NULL,
	razao_social VARCHAR (100) NOT NULL,
	nome_fantasia VARCHAR (50),
	cnpj VARCHAR (20) NOT NULL,
	ie VARCHAR (20) NOT NULL,
	endereco VARCHAR (100) NOT NULL,
	telefone VARCHAR (20),
	email VARCHAR (20),
	
	PRIMARY KEY (id)
);

CREATE TABLE cliente (
	id SERIAL NOT NULL,
	nome VARCHAR (100) NOT NULL,
	cpf VARCHAR (20) NOT NULL,
	endereco VARCHAR (100) NOT NULL,
	telefone VARCHAR (20),
	email VARCHAR (20),
	
	PRIMARY KEY (id)
);

CREATE TABLE usuario (
	id SERIAL NOT NULL,
	nome VARCHAR (100) NOT NULL,
	senha VARCHAR (20) NOT NULL,
	cargo VARCHAR (20) NOT NULL,
	endereco VARCHAR (100),
	telefone VARCHAR (20),
	email VARCHAR (20),
	
	PRIMARY KEY (id)
);

CREATE TABLE financeiro (
	id SERIAL NOT NULL,
	conta VARCHAR (50) NOT NULL,
	saldo FLOAT,
	
	PRIMARY KEY (id)
);

CREATE TABLE produto (
	id SERIAL NOT NULL,
	codigo_barras VARCHAR (13),
	descricao VARCHAR (50),
	preco FLOAT,
	categoria VARCHAR (30),
	estoque INT,
	id_fornecedor int,
	
	PRIMARY KEY (id),
	FOREIGN KEY (id_fornecedor) REFERENCES fornecedor (id)
);

CREATE TABLE nf_entrada (
	id SERIAL NOT NULL,
	forma_pagmto VARCHAR (20) NOT NULL,
	data_emissao TIMESTAMP WITHOUT TIME ZONE NOT NULL,
	valor_total FLOAT NOT NULL,
	id_financeiro INT NOT NULL,
	id_fornecedor INT NOT NULL,
	
	PRIMARY KEY (id),
	FOREIGN KEY (id_financeiro) REFERENCES financeiro (id),
	FOREIGN KEY (id_fornecedor) REFERENCES fornecedor (id)
);

CREATE TABLE pedido (
	id SERIAL NOT NULL,
	data_emissao TIMESTAMP WITHOUT TIME ZONE NOT NULL,
	valor_total FLOAT NOT NULL,
	id_cliente INT NOT NULL,
	id_usuario INT NOT NULL,
	
	PRIMARY KEY (id),
	FOREIGN KEY (id_cliente) REFERENCES cliente (id),
	FOREIGN KEY (id_usuario) REFERENCES usuario (id)
);

CREATE TABLE venda (
	id SERIAL NOT NULL,
	forma_pagmto VARCHAR (20) NOT NULL,
	id_financeiro INT NOT NULL,
	id_pedido INT NOT NULL,
	
	PRIMARY KEY (id),
	FOREIGN KEY (id_financeiro) REFERENCES financeiro (id),
	FOREIGN KEY (id_pedido) REFERENCES pedido (id)
);

CREATE TABLE produto_venda (
	id_produto INT NOT NULL,
	id_venda INT NOT NULL,
	quant_produto INT NOT NULL,
	
	FOREIGN KEY (id_produto) REFERENCES produto (id),
	FOREIGN KEY (id_venda) REFERENCES venda (id)
);

CREATE TABLE produto_nf_entrada (
	id_produto INT NOT NULL,
	id_nf_entrada INT NOT NULL,
	quant_produto INT NOT NULL,
	
	FOREIGN KEY (id_produto) REFERENCES produto (id),
	FOREIGN KEY (id_nf_entrada) REFERENCES nf_entrada (id)
);

CREATE TABLE entrada_saida (
	entrada_saida BOOLEAN NOT NULL,
	id_venda INT,
	id_nf_entrada INT,
	id_financeiro INT NOT NULL,
	
	FOREIGN KEY (id_venda) REFERENCES venda (id),
	FOREIGN KEY (id_nf_entrada) REFERENCES nf_entrada (id),
	FOREIGN KEY (id_financeiro) REFERENCES financeiro (id)
);

INSERT INTO usuario (nome, senha, cargo) 
	VALUES ('Master', 123, 'Administrador');
