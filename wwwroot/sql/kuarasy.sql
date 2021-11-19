/* Database Kuarasy: */

CREATE DATABASE IF NOT EXISTS `kuarasy`;
USE `kuarasy`;

CREATE TABLE IF NOT EXISTS usuario (
    id_usuario INT(11) CONSTRAINT usuario_pk PRIMARY KEY,
    email VARCHAR(255) NOT NULL,
    cpf CHAR(14) NOT NULL UNIQUE,
    nome VARCHAR(120) NOT NULL,
    sobrenome VARCHAR(255) NOT NULL,
    nacionalidade VARCHAR(60) NOT NULL,
    data_nascimento DATE NOT NULL,
    senha LONGTEXT NOT NULL,
    tipo_usuario TINYINT(2) NOT NULL,
    imagem BLOB
);

CREATE TABLE IF NOT EXISTS comprador (
    id_comprador INT(11) CONSTRAINT comprador_pk PRIMARY KEY,
    id_usuario INT(11) NOT NULL
);
   
CREATE TABLE IF NOT EXISTS vendedor (
    id_vendedor INT(11) CONSTRAINT vendedor_pk PRIMARY KEY,
    biografia VARCHAR(2500),
    cnpj CHAR(14) NOT NULL UNIQUE,
    id_usuario INT(11) NOT NULL
);

CREATE TABLE IF NOT EXISTS produto (
    id_produto INT(11) CONSTRAINT produto_pk PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    preco FLOAT(6,2) NOT NULL,
    descricao VARCHAR(255) NOT NULL,
    quantidade INT(11) NOT NULL,
    peso FLOAT(6,2) NOT NULL,
    imagem BLOB NOT NULL,
    id_tamanho INT(11) NOT NULL,
    id_vendedor INT(11) NOT NULL,
    id_tipo INT(11) NOT NULL
);

CREATE TABLE IF NOT EXISTS tamanho (
    id_tamanho INT(11) CONSTRAINT tamanho_pk PRIMARY KEY,
    altura FLOAT(6,2) NOT NULL,
    largura FLOAT(6,2) NOT NULL,
    comprimento FLOAT(6,2) NOT NULL
);

CREATE TABLE IF NOT EXISTS categoria (
    id_categoria INT(11) CONSTRAINT categoria_pk PRIMARY KEY,
    nome VARCHAR(30) NOT NULL
);

CREATE TABLE IF NOT EXISTS endereco (
    id_endereco INT(11) CONSTRAINT endereco_pk PRIMARY KEY,
    cep CHAR(10) NOT NULL,
    numero INT(11) NOT NULL,
    logradouro VARCHAR(255) NOT NULL,
    bairro VARCHAR(255) NOT NULL,
    complemento VARCHAR(255) NOT NULL,
    id_cidade INT(11) NOT NULL,
    id_usuario INT(11) NOT NULL
);

CREATE TABLE IF NOT EXISTS telefone (
    id_telefone INT(11) CONSTRAINT telefone_pk PRIMARY KEY, 
    ddd INT(2) NOT NULL,
    numero CHAR(9) NOT NULL,
    tipo_telefone VARCHAR(60) NOT NULL
);

CREATE TABLE IF NOT EXISTS cidade (
    id_cidade INT(11) CONSTRAINT cidade_pk PRIMARY KEY,
    nome VARCHAR(75) NOT NULL,
    id_estado INT(11) NOT NULL
);

CREATE TABLE IF NOT EXISTS estado (
    id_estado INT(11) CONSTRAINT estado_pk PRIMARY KEY,
    nome VARCHAR(75) NOT NULL,
    uf CHAR(2) NOT NULL
);

CREATE TABLE IF NOT EXISTS origem (
    id_origem INT(11) CONSTRAINT origem_pk PRIMARY KEY,
    pais VARCHAR(50) NOT NULL,
    continente VARCHAR(255) NOT NULL,
    descricao VARCHAR(3000) NOT NULL
);

CREATE TABLE IF NOT EXISTS tipo (
    id_tipo INT(11) CONSTRAINT tipo_pk PRIMARY KEY,
    nome VARCHAR(60) NOT NULL,
    id_categoria INT(11) NOT NULL
);

CREATE TABLE IF NOT EXISTS compra (
    id_compra INT(11) CONSTRAINT compra_pk PRIMARY KEY,
    data_entrega DATE NOT NULL,
    data_compra TIMESTAMP NOT NULL,
    observacao VARCHAR(1000),
    valor_total FLOAT(6,2) NOT NULL,
    id_produto INT(11) NOT NULL,
    id_comprador INT(11) NOT NULL
);

CREATE TABLE IF NOT EXISTS telefone_usuario (
    id_telefone INT(11) NOT NULL,
    id_usuario INT(11) NOT NULL
);

CREATE TABLE IF NOT EXISTS origem_produto (
    id_produto INT(11) NOT NULL,
    id_origem INT(11) NOT NULL
);

CREATE TABLE IF NOT EXISTS avaliacao (
    id_avaliacao INT(11) CONSTRAINT avaliacao_pk PRIMARY KEY,
    titulo VARCHAR(255),
    comentario VARCHAR(2000),
    nota INT(6) NOT NULL,
    id_comprador INT(11) NOT NULL,
    id_produto INT(11) NOT NULL
);


/*
ALTER TABLE comprador ADD CONSTRAINT comprador_id_usuario_fk
    FOREIGN KEY (id_usuario)
    REFERENCES usuario (id_usuario)
    ON DELETE CASCADE;

ALTER TABLE vendedor ADD CONSTRAINT vendedor_id_usuario_fk
    FOREIGN KEY (id_usuario)
    REFERENCES usuario (id_usuario)
    ON DELETE CASCADE;

ALTER TABLE produto ADD CONSTRAINT produto_id_vendedor_fk
    FOREIGN KEY (id_vendedor)
    REFERENCES vendedor (id_vendedor)
    ON DELETE CASCADE;
 
ALTER TABLE produto ADD CONSTRAINT produto_id_tamanho_fk
    FOREIGN KEY (id_tamanho)
    REFERENCES tamanho (id_tamanho)
    ON DELETE RESTRICT;
 
ALTER TABLE produto ADD CONSTRAINT produto_id_tipo_fk
    FOREIGN KEY (id_tipo)
    REFERENCES tipo (id_tipo)
    ON DELETE RESTRICT;

ALTER TABLE endereco ADD CONSTRAINT endereco_id_usuario_fk
    FOREIGN KEY (id_usuario)
    REFERENCES usuario (id_usuario)
    ON DELETE RESTRICT;
 
ALTER TABLE endereco ADD CONSTRAINT endereco_id_cidade_fk
    FOREIGN KEY (id_cidade)
    REFERENCES cidade (id_cidade)
    ON DELETE RESTRICT;

ALTER TABLE cidade ADD CONSTRAINT cidade_id_estado_fk
    FOREIGN KEY (id_estado)
    REFERENCES estado (id_estado)
    ON DELETE RESTRICT;
 
ALTER TABLE tipo ADD CONSTRAINT tipo_id_categoria_fk
    FOREIGN KEY (id_categoria)
    REFERENCES categoria (id_categoria)
    ON DELETE RESTRICT;
 
ALTER TABLE compra ADD CONSTRAINT compra_id_comprador_fk
    FOREIGN KEY (id_comprador)
    REFERENCES comprador (id_comprador)
    ON DELETE RESTRICT;
 
ALTER TABLE compra ADD CONSTRAINT compra_id_produto_fk
    FOREIGN KEY (id_produto)
    REFERENCES produto (id_produto)
    ON DELETE RESTRICT;

ALTER TABLE telefone_usuario ADD CONSTRAINT telefoneusuario_id_usuario_fk
    FOREIGN KEY (id_telefone)
    REFERENCES telefone (id_telefone)
    ON DELETE RESTRICT;
 
ALTER TABLE telefone_usuario ADD CONSTRAINT telefoneusuario_id_telefone_fk
    FOREIGN KEY (id_usuario)
    REFERENCES usuario (id_usuario)
    ON DELETE RESTRICT;
 
ALTER TABLE origem_produto ADD CONSTRAINT origemproduto_id_produto_fk
    FOREIGN KEY (id_produto)
    REFERENCES produto (id_produto)
    ON DELETE RESTRICT;
 
ALTER TABLE origem_produto ADD CONSTRAINT origemproduto_id_origem_fk
    FOREIGN KEY (id_origem)
    REFERENCES origem (id_origem)
    ON DELETE RESTRICT;
 
ALTER TABLE avaliacao ADD CONSTRAINT avaliacao_id_comprador_fk
    FOREIGN KEY (id_comprador)
    REFERENCES comprador (id_comprador)
    ON DELETE RESTRICT;
 
ALTER TABLE avaliacao ADD CONSTRAINT avaliacao_id_produto_fk
    FOREIGN KEY (id_produto)
    REFERENCES produto (id_produto)
    ON DELETE CASCADE;   */
