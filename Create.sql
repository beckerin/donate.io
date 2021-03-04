/* DiagramaEntidade: */

CREATE TABLE Campanha (
                          id_campanha INT PRIMARY KEY,
                          titulo varchar(256),
                          descricao varchar(1024),
                          data_criado date,
                          data_prazo date,
                          data_verificado date,
                          realizado boolean,
                          meta INT,
                          fk_Usuario_id_usuario INT
);

CREATE TABLE Usuario (
                         id_usuario INT PRIMARY KEY,
                         nome varchar(256),
                         apelido varchar(256),
                         email varchar(256),
                         cpf INT,
                         data_criado date,
                         verificado bool,
                         data_verificado date,
                         fk_TipoUsuario_id_tipo int,
                         fk_Endereco_id_endereco INT
);

CREATE TABLE TipoUsuario (
                             id_tipo int PRIMARY KEY,
                             nome varchar(13)
);

CREATE TABLE Endereco (
                          id_endereco INT PRIMARY KEY,
                          rua varchar(64),
                          cep INT,
                          bairro varchar(128),
                          complemento varchar(128),
                          numero INT,
                          fk_Cidade_id_cidade int,
                          fk_Estado_id_estado int
);

CREATE TABLE Cidade (
                        id_cidade int PRIMARY KEY,
                        nome varchar(29)
);

CREATE TABLE Estado (
                        id_estado int PRIMARY KEY,
                        nome varchar(19)
);

CREATE TABLE Alteracao (
                           id_alteracao int PRIMARY KEY,
                           antes json,
                           depois json,
                           data date,
                           fk_Campanha_id_campanha INT,
                           fk_Comentarios_id_comentario int
);

CREATE TABLE Comentarios (
                             id_comentario int PRIMARY KEY,
                             descricao varchar(512),
                             data_criado date,
                             ativo bool,
                             fk_Campanha_id_campanha INT,
                             fk_Usuario_id_usuario INT
);

CREATE TABLE Doacao (
                        id_doacao INT PRIMARY KEY,
                        valor_centavos INT,
                        mensagem varchar(1024),
                        data_criado date,
                        data_concluido date,
                        fk_Tipo_de_Pagamento_id_tipo_pagamento INT,
                        fk_Status_de_Pagamento_id_tipo_pagamento INT,
                        fk_Usuario_id_usuario INT,
                        fk_Campanha_id_campanha INT
);

CREATE TABLE Status_de_Pagamento (
                                     id_tipo_pagamento INT PRIMARY KEY,
                                     descricao varchar(16)
);

CREATE TABLE Tipo_de_Pagamento (
                                   id_tipo_pagamento INT PRIMARY KEY,
                                   descricao varchar(16),
                                   ativo boolean
);

ALTER TABLE Campanha ADD CONSTRAINT FK_Campanha_2
    FOREIGN KEY (fk_Usuario_id_usuario)
        REFERENCES Usuario (id_usuario)
        ON DELETE CASCADE;

ALTER TABLE Usuario ADD CONSTRAINT FK_Usuario_2
    FOREIGN KEY (fk_TipoUsuario_id_tipo)
        REFERENCES TipoUsuario (id_tipo)
        ON DELETE CASCADE;

ALTER TABLE Usuario ADD CONSTRAINT FK_Usuario_3
    FOREIGN KEY (fk_Endereco_id_endereco)
        REFERENCES Endereco (id_endereco)
        ON DELETE CASCADE;

ALTER TABLE Endereco ADD CONSTRAINT FK_Endereco_2
    FOREIGN KEY (fk_Cidade_id_cidade)
        REFERENCES Cidade (id_cidade)
        ON DELETE CASCADE;

ALTER TABLE Endereco ADD CONSTRAINT FK_Endereco_3
    FOREIGN KEY (fk_Estado_id_estado)
        REFERENCES Estado (id_estado)
        ON DELETE CASCADE;

ALTER TABLE Alteracao ADD CONSTRAINT FK_Alteracao_2
    FOREIGN KEY (fk_Campanha_id_campanha)
        REFERENCES Campanha (id_campanha)
        ON DELETE SET NULL;

ALTER TABLE Alteracao ADD CONSTRAINT FK_Alteracao_3
    FOREIGN KEY (fk_Comentarios_id_comentario)
        REFERENCES Comentarios (id_comentario)
        ON DELETE SET NULL;

ALTER TABLE Comentarios ADD CONSTRAINT FK_Comentarios_2
    FOREIGN KEY (fk_Campanha_id_campanha)
        REFERENCES Campanha (id_campanha)
        ON DELETE CASCADE;

ALTER TABLE Comentarios ADD CONSTRAINT FK_Comentarios_3
    FOREIGN KEY (fk_Usuario_id_usuario)
        REFERENCES Usuario (id_usuario)
        ON DELETE CASCADE;

ALTER TABLE Doacao ADD CONSTRAINT FK_Doacao_2
    FOREIGN KEY (fk_Tipo_de_Pagamento_id_tipo_pagamento)
        REFERENCES Tipo_de_Pagamento (id_tipo_pagamento)
        ON DELETE CASCADE;

ALTER TABLE Doacao ADD CONSTRAINT FK_Doacao_3
    FOREIGN KEY (fk_Status_de_Pagamento_id_tipo_pagamento)
        REFERENCES Status_de_Pagamento (id_tipo_pagamento)
        ON DELETE CASCADE;

ALTER TABLE Doacao ADD CONSTRAINT FK_Doacao_4
    FOREIGN KEY (fk_Usuario_id_usuario)
        REFERENCES Usuario (id_usuario)
        ON DELETE CASCADE;

ALTER TABLE Doacao ADD CONSTRAINT FK_Doacao_5
    FOREIGN KEY (fk_Campanha_id_campanha)
        REFERENCES Campanha (id_campanha)
        ON DELETE CASCADE;