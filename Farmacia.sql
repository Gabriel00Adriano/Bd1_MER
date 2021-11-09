CREATE TABLE FARMACIA (
    cnpj INTEGER ,
    nome VARCHAR(100) ,
    tel INTEGER ,
    PRIMARY KEY(cnpj)
);

CREATE TABLE FARMACEUTICO (
    RG INTEGER ,
    nome VARCHAR(100) ,
    salario INTEGER ,
    PRIMARY KEY(RG)
);

CREATE TABLE ENTREGADOR (
    RG INTEGER ,
    nome VARCHAR(100) ,
    salario INTEGER ,
    PRIMARY KEY(RG)
);

CREATE TABLE PRODUTOS (
    codigo INTEGER ,
    nome VARCHAR(100) ,
    preco INTEGER ,
    PRIMARY KEY(codigo)
);

CREATE TABLE CLIENTE (
    RG INTEGER ,
    nome VARCHAR(100) ,
    tel INTEGER ,
    PRIMARY KEY(RG)
);

CREATE TABLE GERENTE (
    RG INTEGER ,
    nome VARCHAR(100) ,
    tel INTEGER ,
    PRIMARY KEY(RG)
);

CREATE TABLE DESPESAS (
    aluguel INTEGER ,
    luz INTEGER ,
    agua INTEGER ,
    PRIMARY KEY(aluguel)
);

CREATE TABLE FABRICANTE (
    RG INTEGER ,
    nome VARCHAR(100) ,
    tel INTEGER ,
    PRIMARY KEY(RG)
);

CREATE TABLE REDE_DE_FARMACIAS (
    cnpj INTEGER , 
    nome VARCHAR(100) ,
    qtd INTEGER ,
    PRIMARY KEY(cnpj)
);

CREATE TABLE ASSOCIADOS (
    RG INTEGER ,
    nome VARCHAR(100) ,
    qtd INTEGER ,
    PRIMARY KEY(RG)
);

CREATE TABLE GERENCIADA (
    cnpj_farmacia INTEGER ,
    RG_gerente INTEGER ,
    FOREIGN KEY(cnpj_farmacia) REFERENCES FARMACIA(cnpj)
    FOREIGN KEY(RG_gerente) REFERENCES GERENTE(RG)
);

CREATE TABLE PAGA (
    RG_gerente INTEGER ,
    aluguel_despesa INTEGER ,
    FOREIGN KEY(RG_gerente) REFERENCES GERENTE(RG)
    FOREIGN KEY(aluguel_despesa) REFERENCES DESPESAS(aluguel)
    PRIMARY KEY(aluguel_despesa)
);

CREATE TABLE COMPRA_PRODUTO (
    
    RG_gerente INTEGER ,
    cnpj_fabricante INTEGER ,
    FOREIGN KEY(RG_gerente) REFERENCES GERENTE(RG)
    FOREIGN KEY(cnpj_fabricante) REFERENCES FABRICANTE(cnpj)
);

CREATE TABLE TRABALHA_EM (
    cnpj_farmacia INTEGER ,
    RG_farmaceutico INTEGER ,
    RG_entregador INTEGER ,
    FOREIGN KEY(cnpj_farmacia) REFERENCES FARMACIA(cnpj)
    FOREIGN KEY(RG_farmaceutico) REFERENCES FARMACEUTICO(RG)
    FOREIGN KEY(RG_entregador) REFERENCES ENTREGADOR(RG)
    PRIMARY KEY(RG_farmaceutico, RG_entregador)
);

CREATE TABLE ENTREGA (
    RG_entregador INTEGER ,
    codigo_produto INTEGER ,
    FOREIGN KEY(RG_entregador) REFERENCES ENTREGADOR(RG)
    FOREIGN KEY(codigo_produto) REFERENCES PRODUTOS(codigo)
    PRIMARY KEY(codigo_produto)
);

CREATE TABLE VENDE (
    RG_farmaceutico INTEGER ,
    codigo_produto INTEGER ,
    FOREIGN KEY(RG_farmaceutico) REFERENCES FARMACEUTICO(RG)
    FOREIGN KEY(codigo_produto) REFERENCES PRODUTOS(codigo)
    PRIMARY KEY(codigo_produto)
);

CREATE TABLE COMPRA (
    rg_cliente INTEGER ,
    codigo_produto INTEGER ,
    FOREIGN KEY(rg_cliente) REFERENCES CLIENTE(RG)
    FOREIGN KEY(codigo_produto) REFERENCES PRODUTOS(codigo)
    PRIMARY KEY(rg_cliente, codigo_produto)
);

CREATE TABLE ESTA_EM (
    cnpj_farmacia INTEGER ,
    cnpj_rede_de_farmacias INTEGER ,
    FOREIGN KEY(cnpj_farmacia) REFERENCES FARMACIA(cnpj)
    FOREIGN KEY(cnpj_rede_de_farmacias) REFERENCES REDE_DE_FARMACIAS(cnpj)
    PRIMARY KEY(cnpj_farmacia)
);

CREATE TABLE POSSUI (
    cnpj_rede_de_farmacias INTEGER ,
    rg_associados INTEGER ,
    FOREIGN KEY(cnpj_rede_de_farmacias) REFERENCES REDE_DE_FARMACIAS(cnpj)
    FOREIGN KEY(rg_associados) REFERENCES ASSOCIADOS(RG)
    PRIMARY KEY(rg_associados)
);

