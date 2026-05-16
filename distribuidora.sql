/*
    Autor: Leonardo Marques Moreira 
    Data: 16/05/2026

    (Proposta 3.12) Nesta atividade você terá que criar os comandos SQL a partir do modelo ER.
    Este modelo é baseado em um exemplo de uma distribuidora.
    Observe a imagem abaixo com o modelo ER.
*/

-- Criacao das tabelas

CREATE TABLE IF NOT EXISTS Fabricante (
    cod_fabricante                     INTEGER NOT NULL,
    nome                               VARCHAR(60) NULL,
    cidade                             VARCHAR(60) NULL,
    telefone                           VARCHAR(20) NUll
);


CREATE TABLE IF NOT EXISTS Tipo_Produto (
    cod_tipo_produto                   INTEGER NOT NULL,
    nome                               VARCHAR(60)
);


CREATE TABLE IF NOT EXISTS Produto (
    cod_produto                        INTEGER NOT NULL,
    cod_tipo_produto                   INTEGER NOT NULL,
    cod_fabricante                     INTEGER NOT NULL,
    nome                               VARCHAR(60),
    peso                               VARCHAR(20),
    medida                             VARCHAR(10),
    preco                              DOUBLE PRECISION,
    qtde_estoque                       INTEGER
);


CREATE TABLE IF NOT EXISTS Item_Nota (
    cod_nota_fiscal                    INTEGER NOT NULL,
    cod_produto                        INTEGER NOT NULL,
    quantidade                         INTEGER,
    valor_unitario                     DOUBLE PRECISION
);


CREATE TABLE IF NOT EXISTS Cargo (
    cod_cargo                          INTEGER NOT NULL,
    nome                               VARCHAR(60),
    salario_base                       DOUBLE PRECISION
);


CREATE TABLE IF NOT EXISTS Funcionario (
    cod_funcionario                    INTEGER NOT NULL,
    cod_cargo                          INTEGER NOT NULL,
    nome                               VARCHAR(60),
    cidade                             VARCHAR(60),
    ano_contratacao                    INTEGER
);


CREATE TABLE IF NOT EXISTS Transportadora (
    cod_transportadora                 INTEGER NOT NULL,
    nome                               VARCHAR(60)
);


CREATE TABLE IF NOT EXISTS Nota_Fiscal (
    cod_nota_fiscal                    INTEGER NOT NULL,
    cod_transportadora                 INTEGER NOT NULL,
    cod_funcionario                    INTEGER NOT NULL,
    valor_frete                        DOUBLE PRECISION
);


-- Atribuicao das chaves Primarias

ALTER TABLE Fabricante                ADD PRIMARY KEY (cod_fabricante);
ALTER TABLE Tipo_Produto              ADD PRIMARY KEY (cod_tipo_produto);
ALTER TABLE Produto                   ADD PRIMARY KEY (cod_produto);
ALTER TABLE Cargo                     ADD PRIMARY KEY (cod_cargo);
ALTER TABLE Funcionario               ADD PRIMARY KEY (cod_funcionario);
ALTER TABLE Transportadora            ADD PRIMARY KEY (cod_transportadora);
ALTER TABLE Nota_Fiscal               ADD PRIMARY KEY (cod_nota_fiscal);

-- Atribuicao Chaves Estrangeiras

ALTER TABLE Produto                   ADD CONSTRAINT fk_tipo_produto FOREIGN KEY (cod_tipo_produto) 
                                      REFERENCES Tipo_Produto(cod_tipo_produto) ON DELETE CASCADE;

ALTER TABLE Produto                   ADD CONSTRAINT fk_fabricante FOREIGN KEY (cod_fabricante) 
                                      REFERENCES Fabricante(cod_fabricante) ON DELETE CASCADE;

ALTER TABLE Item_Nota                 ADD CONSTRAINT fk_cod_nota_fiscal FOREIGN KEY (cod_nota_fiscal) 
                                      REFERENCES Nota_Fiscal(cod_nota_fiscal) ON DELETE CASCADE;

ALTER TABLE Item_Nota                 ADD CONSTRAINT fk_cod_produto FOREIGN KEY (cod_produto) 
                                      REFERENCES Produto(cod_produto) ON DELETE CASCADE;

ALTER TABLE Funcionario               ADD CONSTRAINT fk_cod_cargo FOREIGN KEY (cod_cargo) 
                                      REFERENCES Cargo(cod_cargo) ON DELETE CASCADE;

ALTER TABLE Nota_Fiscal               ADD CONSTRAINT fk_cod_transportadora FOREIGN KEY (cod_transportadora) 
                                      REFERENCES Transportadora(cod_transportadora) ON DELETE CASCADE;

ALTER TABLE Nota_Fiscal               ADD CONSTRAINT fk_cod_funcionario FOREIGN KEY (cod_funcionario) 
                                      REFERENCES Funcionario(cod_funcionario) ON DELETE CASCADE;


-- Populando as tabelas

-- Fabricante
/*
    Daddos gerados atraves do ChatGPT segue o Prompt criado:
    Gere dez linhas seguindo as regras abaixo:
    - Onde estiver o símbolo %cf coloque o numero da sequencia
    - Onde estiver o símbolo %n cria um nome de uma empresa fictícia e coloque esse no nome no lugar do símbolo em aspas simples
    - Onde estiver o símbolo %c coloque um nome de uma cidade do Brasil e coloque / depois coloque a sigla do estado tudo junto dentro de aspas simples
    - Onde estiver o símbolo %t cria numeros de telefones aleatorios no formato(xx)xxxxxxxxx coloque dentro de aspas simples
    Segue a estrutura:
    INSERT INTO Fabricante(cod_fabricante, nome, cidade, telefone) VALUES (%cf, %n, %c, %t);
*/
INSERT INTO Fabricante(cod_fabricante, nome, cidade, telefone) VALUES (1, 'NovaTech Industrial', 'Curitiba/PR', '(41)998765432');
INSERT INTO Fabricante(cod_fabricante, nome, cidade, telefone) VALUES (2, 'Metalúrgica Horizonte', 'Campinas/SP', '(19)987654321');
INSERT INTO Fabricante(cod_fabricante, nome, cidade, telefone) VALUES (3, 'Alpha Equipamentos', 'Salvador/BA', '(71)996543210');
INSERT INTO Fabricante(cod_fabricante, nome, cidade, telefone) VALUES (4, 'Fortline Máquinas', 'Florianópolis/SC', '(48)995432109');
INSERT INTO Fabricante(cod_fabricante, nome, cidade, telefone) VALUES (5, 'Brasil Forte Ltda', 'Manaus/AM', '(92)994321098');
INSERT INTO Fabricante(cod_fabricante, nome, cidade, telefone) VALUES (6, 'EletroMax Solutions', 'Goiânia/GO', '(62)993210987');
INSERT INTO Fabricante(cod_fabricante, nome, cidade, telefone) VALUES (7, 'Prime Indústria', 'Recife/PE', '(81)992109876');
INSERT INTO Fabricante(cod_fabricante, nome, cidade, telefone) VALUES (8, 'Vision Components', 'Belo Horizonte/MG', '(31)991098765');
INSERT INTO Fabricante(cod_fabricante, nome, cidade, telefone) VALUES (9, 'Titan Brasil', 'Fortaleza/CE', '(85)990987654');
INSERT INTO Fabricante(cod_fabricante, nome, cidade, telefone) VALUES (10, 'MasterPeças Comércio', 'Porto Alegre/RS', '(51)989876543');


-- Tipo Produto
INSERT INTO Tipo_Produto(cod_tipo_produto, nome) VALUES (1, 'Equipamento de TI');
INSERT INTO Tipo_Produto(cod_tipo_produto, nome) VALUES (2, 'Peca de Maquinario');
INSERT INTO Tipo_Produto(cod_tipo_produto, nome) VALUES (3, 'Peca de Caminhao');
INSERT INTO Tipo_Produto(cod_tipo_produto, nome) VALUES (4, 'Limpeza e Higiene');
INSERT INTO Tipo_Produto(cod_tipo_produto, nome) VALUES (5, 'Vestuario');


-- Produto
/*
    Dados Gerados pelo ChatGPT segue o Prompt criado:
    Gere dez linhas seguindo as regras abaixo:
    - Onde estiver o símbolo %cp coloque o numero da sequencia
    - Onde estiver o símbolo %ctp coloque um número aleatório de 1 a 5
    - Onde estiver o símbolo %cf coloque um número aleatório de 1 a 10
    - Onde estiver o símbolo %n cria o nome de um produto e coloque entre aspas simples
    - Onde estiver o símbolo %p coloque um número aleatório entre 0.00 a 150.00 com duas casas decimais coloque entre aspas simples
    - Onde estiver o símbolo %m coloque um número aleatório entre 1.00 a 1000 coloque entre aspas simples
    - Onde estiver o símbolo $pr coloque um número aleatório entre 10.00 a 50000.00 com apenas duas casas decimais
    - Onde estiver o símbolo %qe coloque um número aleatório entre 0 a 1000 sem casas decimais
    Segue a estrutura:
    INSERT INTO Produto(cod_produto, cod_tipo_produto, cod_fabricante, nome, peso, medida, preco, qtde_estoque) VALUES (%cp, %ctp, %cf, %n, %p, %m, %pr, %qe);
*/
INSERT INTO Produto(cod_produto, cod_tipo_produto, cod_fabricante, nome, peso, medida, preco, qtde_estoque) 
    VALUES (1, 2, 8, 'Furadeira Impact Pro', '12.45', '350', 2450.90, 120);

INSERT INTO Produto(cod_produto, cod_tipo_produto, cod_fabricante, nome, peso, medida, preco, qtde_estoque) 
    VALUES (2, 5, 3, 'Sensor Industrial Vision', '4.80', '95', 875.50, 430);

INSERT INTO Produto(cod_produto, cod_tipo_produto, cod_fabricante, nome, peso, medida, preco, qtde_estoque) 
    VALUES (3, 1, 10, 'Compressor MegaAir', '89.30', '780', 18490.00, 27);

INSERT INTO Produto(cod_produto, cod_tipo_produto, cod_fabricante, nome, peso, medida, preco, qtde_estoque) 
    VALUES (4, 4, 6, 'Painel LED SmartLux', '7.25', '140', 650.75, 510);

INSERT INTO Produto(cod_produto, cod_tipo_produto, cod_fabricante, nome, peso, medida, preco, qtde_estoque) 
    VALUES (5, 3, 1, 'Motor Hidráulico ForceMax', '56.90', '620', 22340.60, 15);

INSERT INTO Produto(cod_produto, cod_tipo_produto, cod_fabricante, nome, peso, medida, preco, qtde_estoque) 
    VALUES (6, 2, 9, 'Controlador Térmico HeatSafe', '2.15', '45', 420.30, 685);

INSERT INTO Produto(cod_produto, cod_tipo_produto, cod_fabricante, nome, peso, medida, preco, qtde_estoque) 
    VALUES (7, 5, 4, 'Gerador Compact Energy', '134.70', '920', 45890.99, 8);

INSERT INTO Produto(cod_produto, cod_tipo_produto, cod_fabricante, nome, peso, medida, preco, qtde_estoque) 
    VALUES (8, 1, 7, 'Bomba Elétrica AquaFlow', '18.55', '270', 3199.40, 74);

INSERT INTO Produto(cod_produto, cod_tipo_produto, cod_fabricante, nome, peso, medida, preco, qtde_estoque) 
    VALUES (9, 4, 2, 'Serra Industrial TitanCut', '23.10', '410', 5420.00, 58);

INSERT INTO Produto(cod_produto, cod_tipo_produto, cod_fabricante, nome, peso, medida, preco, qtde_estoque) 
    VALUES (10, 3, 5, 'Filtro de Ar CleanTech', '5.65', '110', 299.99, 940);


-- Cargo
/*
    Dados Gerados pelo ChatGPT segue o Prompt criado:
    Gere dez linhas seguindo as regras abaixo:
    - Onde estiver o símbolo %cg coloque o numero da sequencia
    - Onde estiver o símbolo %n coloque o nome de um cargo dentro de uma distribuidora entre as simples
    - Onde estiver o simbolo %sb coloque um valor aleatorio entre 1625.00 ate 15000.00 com duas casas decimais
    Segue a estrutura:
    INSERT INTO Cargo(cod_cargo, nome, salario_base) VALUES (%cg, %n, %sb);
*/
INSERT INTO Cargo(cod_cargo, nome, salario_base) VALUES (1, 'Auxiliar de Estoque', 1850.00);
INSERT INTO Cargo(cod_cargo, nome, salario_base) VALUES (2, 'Motorista Entregador', 2750.50);
INSERT INTO Cargo(cod_cargo, nome, salario_base) VALUES (3, 'Supervisor de Logística', 6480.75);
INSERT INTO Cargo(cod_cargo, nome, salario_base) VALUES (4, 'Analista de Compras', 5320.40);
INSERT INTO Cargo(cod_cargo, nome, salario_base) VALUES (5, 'Coordenador Comercial', 8950.00);
INSERT INTO Cargo(cod_cargo, nome, salario_base) VALUES (6, 'Gerente de Distribuição', 14200.90);
INSERT INTO Cargo(cod_cargo, nome, salario_base) VALUES (7, 'Conferente de Mercadorias', 2435.80);
INSERT INTO Cargo(cod_cargo, nome, salario_base) VALUES (8, 'Operador de Empilhadeira', 3190.25);
INSERT INTO Cargo(cod_cargo, nome, salario_base) VALUES (9, 'Assistente Administrativo', 2280.60);
INSERT INTO Cargo(cod_cargo, nome, salario_base) VALUES (10, 'Diretor Operacional', 14950.00);


-- Funcionario
/*
    Dados Gerados pelo ChatGPT segue o Prompt criado:
    Gere dez linhas seguindo as regras abaixo:
    - Onde estiver o símbolo %cf coloque o numero da sequencia
    - Onde estiver o símbolo %cg coloque um número aleatório entre 1 e 10
    - Onde estiver o símbolo %n coloque um nome e sobrenome entre as aspas simples
    - Onde estiver o símbolo %c coloque um nome de uma cidade do Brasil e coloque / depois coloque a sigla do estado tudo junto dentro de aspas simples
    - Onde estiver o símbolo %ac coloque um número aleatório entre 1980 2001
    Segue a estrutura:
    INSERT INTO Funcionario(cod_funcionario, cod_cargo, nome, cidade, ano_contratacao) VALUES (%cf, %cg, %n, %c, %ac);
*/
INSERT INTO Funcionario(cod_funcionario, cod_cargo, nome, cidade, ano_contratacao) VALUES (1, 4, 'Carlos Henrique Souza', 'Curitiba/PR', 1998);
INSERT INTO Funcionario(cod_funcionario, cod_cargo, nome, cidade, ano_contratacao) VALUES (2, 7, 'Mariana Alves Costa', 'Fortaleza/CE', 1987);
INSERT INTO Funcionario(cod_funcionario, cod_cargo, nome, cidade, ano_contratacao) VALUES (3, 2, 'João Pedro Lima', 'Belo Horizonte/MG', 1992);
INSERT INTO Funcionario(cod_funcionario, cod_cargo, nome, cidade, ano_contratacao) VALUES (4, 9, 'Fernanda Ribeiro Martins', 'Manaus/AM', 2000);
INSERT INTO Funcionario(cod_funcionario, cod_cargo, nome, cidade, ano_contratacao) VALUES (5, 1, 'Lucas Gabriel Ferreira', 'Recife/PE', 1984);
INSERT INTO Funcionario(cod_funcionario, cod_cargo, nome, cidade, ano_contratacao) VALUES (6, 5, 'Patricia Gomes Silva', 'Florianópolis/SC', 1996);
INSERT INTO Funcionario(cod_funcionario, cod_cargo, nome, cidade, ano_contratacao) VALUES (7, 3, 'Rafael Oliveira Santos', 'Goiânia/GO', 1989);
INSERT INTO Funcionario(cod_funcionario, cod_cargo, nome, cidade, ano_contratacao) VALUES (8, 10, 'Juliana Mendes Rocha', 'Salvador/BA', 1995);
INSERT INTO Funcionario(cod_funcionario, cod_cargo, nome, cidade, ano_contratacao) VALUES (9, 6, 'Eduardo Carvalho Pinto', 'Porto Alegre/RS', 1982);
INSERT INTO Funcionario(cod_funcionario, cod_cargo, nome, cidade, ano_contratacao) VALUES (10, 8, 'Camila Nunes Barbosa', 'Campinas/SP', 2001);


-- Transportadora
/*
    Dados Gerados pelo ChatGPT segue o Prompt criado:
    Gere dez linhas seguindo as regras abaixo:
    - Onde estiver o símbolo %ct coloque o numero da sequencia
    - Onde estiver o símbolo %n coloque o nome de uma transportadora entre aspas simples
    Segue a estrutura:
    INSERT INTO Transportadora(cod_transportadora, nome) VALUES (%ct, %n);
*/
INSERT INTO Transportadora(cod_transportadora, nome) VALUES (1, 'Rota Express Logística');
INSERT INTO Transportadora(cod_transportadora, nome) VALUES (2, 'Carga Forte Transportes');
INSERT INTO Transportadora(cod_transportadora, nome) VALUES (3, 'TransBrasil Distribuição');
INSERT INTO Transportadora(cod_transportadora, nome) VALUES (4, 'Via Norte Cargas');
INSERT INTO Transportadora(cod_transportadora, nome) VALUES (5, 'Expresso Horizonte');
INSERT INTO Transportadora(cod_transportadora, nome) VALUES (6, 'Prime Logistics Brasil');
INSERT INTO Transportadora(cod_transportadora, nome) VALUES (7, 'Águia Transportadora');
INSERT INTO Transportadora(cod_transportadora, nome) VALUES (8, 'Speed Cargo Solutions');
INSERT INTO Transportadora(cod_transportadora, nome) VALUES (9, 'Movecta Transportes');
INSERT INTO Transportadora(cod_transportadora, nome) VALUES (10, 'Elite Cargas Rápidas');


-- Nota Fiscal
/*
    Dados Gerados pelo ChatGPT segue o Prompt criado:
    Gere dez linhas seguindo as regras abaixo:
    - Onde estiver o símbolo %cnf coloque o numero da sequencia
    - Onde estiver o símbolo %ct coloque um número aleatório entre 1 e 10
    - Onde estiver o símbolo %ct coloque um número aleatório entre 1 e 9
    - Onde estiver o símbolo %cf coloque um valor entre 0.00 e 10000.00 com duas casas decimais
    Segue a estrutura:
    INSERT INTO Nota_Fiscal(cod_nota_fiscal, cod_transportadora, cod_funcionario, valor_frete) VALUES (%cnf, %ct, %cf, %vf);
*/
INSERT INTO Nota_Fiscal(cod_nota_fiscal, cod_transportadora, cod_funcionario, valor_frete) VALUES (1, 4, 7, 1850.75);
INSERT INTO Nota_Fiscal(cod_nota_fiscal, cod_transportadora, cod_funcionario, valor_frete) VALUES (2, 9, 2, 3420.50);
INSERT INTO Nota_Fiscal(cod_nota_fiscal, cod_transportadora, cod_funcionario, valor_frete) VALUES (3, 1, 5, 890.00);
INSERT INTO Nota_Fiscal(cod_nota_fiscal, cod_transportadora, cod_funcionario, valor_frete) VALUES (4, 6, 3, 7645.20);
INSERT INTO Nota_Fiscal(cod_nota_fiscal, cod_transportadora, cod_funcionario, valor_frete) VALUES (5, 2, 8, 1520.90);
INSERT INTO Nota_Fiscal(cod_nota_fiscal, cod_transportadora, cod_funcionario, valor_frete) VALUES (6, 7, 1, 9980.00);
INSERT INTO Nota_Fiscal(cod_nota_fiscal, cod_transportadora, cod_funcionario, valor_frete) VALUES (7, 5, 6, 4325.45);
INSERT INTO Nota_Fiscal(cod_nota_fiscal, cod_transportadora, cod_funcionario, valor_frete) VALUES (8, 10, 4, 2760.30);
INSERT INTO Nota_Fiscal(cod_nota_fiscal, cod_transportadora, cod_funcionario, valor_frete) VALUES (9, 3, 9, 615.80);
INSERT INTO Nota_Fiscal(cod_nota_fiscal, cod_transportadora, cod_funcionario, valor_frete) VALUES (10, 8, 2, 5410.99);


-- Item Nota Fiscal
/*
    Dados Gerados pelo ChatGPT segue o Prompt criado:
    Gere dez linhas seguindo as regras abaixo:
    - Onde estiver o símbolo %cnf coloque o numero da sequencia
    - Onde estiver o símbolo %cp coloque um número aleatório entre 1 e 10
    - Onde estiver o símbolo %q coloque um número aleatório entre 1 e 1000
    - Onde estiver o símbolo %q coloque um número aleatório entre 1.00 e 10000.00 com duas casas decimais
    Segue a estrutura:
    INSERT INTO Item_Nota(cod_nota_fiscal, cod_produto, quantidade, valor_unitario) VALUES (%cnf, %cp, %q, %vu);
*/
INSERT INTO Item_Nota(cod_nota_fiscal, cod_produto, quantidade, valor_unitario) VALUES (1, 3, 120, 2450.75);
INSERT INTO Item_Nota(cod_nota_fiscal, cod_produto, quantidade, valor_unitario) VALUES (2, 7, 45, 899.90);
INSERT INTO Item_Nota(cod_nota_fiscal, cod_produto, quantidade, valor_unitario) VALUES (3, 1, 300, 150.50);
INSERT INTO Item_Nota(cod_nota_fiscal, cod_produto, quantidade, valor_unitario) VALUES (4, 9, 18, 8450.00);
INSERT INTO Item_Nota(cod_nota_fiscal, cod_produto, quantidade, valor_unitario) VALUES (5, 5, 640, 320.80);
INSERT INTO Item_Nota(cod_nota_fiscal, cod_produto, quantidade, valor_unitario) VALUES (6, 2, 75, 1250.45);
INSERT INTO Item_Nota(cod_nota_fiscal, cod_produto, quantidade, valor_unitario) VALUES (7, 10, 12, 9999.99);
INSERT INTO Item_Nota(cod_nota_fiscal, cod_produto, quantidade, valor_unitario) VALUES (8, 4, 510, 780.30);
INSERT INTO Item_Nota(cod_nota_fiscal, cod_produto, quantidade, valor_unitario) VALUES (9, 8, 95, 4520.10);
INSERT INTO Item_Nota(cod_nota_fiscal, cod_produto, quantidade, valor_unitario) VALUES (10, 6, 230, 6400.55);