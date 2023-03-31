CREATE DATABASE Banco_pedido;

CREATE TABLE Cliente
(
   cod_cliente INT,
   nome_cliente VARCHAR NOT NULL,

   CONSTRAINT pk_cliente PRIMARY KEY(cod_cliente)

);

 CREATE TABLE Peca
(
  cod_peca INT,
  descricao_peca VARCHAR NOT NULL,

  CONSTRAINT pk_peca PRIMARY KEY(cod_peca)
);

CREATE TABLE Pedido
(
   cod_pedido INT,
   data_pediddo DATETIME NOT NULL,
   codigo_cliente INT,

   CONSTRAINT pk_pedido PRIMARY KEY(cod_pedido),
   CONSTRAINT fk_pedido_cliente FOREIGN KEY(codigo_cliente) REFERENCES Cliente(cod_cliente)
);

CREATE TABLE Pedido_Telefone
(
  codigo_pedido_telefone INT,
  numero_telefone INT,

  CONSTRAINT pk_pedido_telefone PRIMARY KEY(codigo_pedido_telefone,numero_telefone),
  CONSTRAINT fk_codigo_pedido_tel FOREIGN KEY(codigo_pedido_telefone) references Pedido(cod_pedido)

);

CREATE TABLE Item_Pedido
(
  codigo_pedido_item INT,
  codigo_peca_item INT,

  CONSTRAINT pk_item_pedido PRIMARY KEY(codigo_pedido_item,codigo_peca_item),
  CONSTRAINT fk_codigo_pediod_item FOREIGN KEY(codigo_pedido_item) REFERENCES Pedido(cod_pedido),
  CONSTRAINT fk_codigo_peca_item FOREIGN KEY(codigo_peca_item) REFERENCES Peca(cod_peca) 
);