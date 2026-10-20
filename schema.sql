create table clientes (
	codigo_cliente int auto_increment primary key,
	nome_cliente varchar(100) not null,
	cpf char(11) not null unique,
	data_nascimento date,
	endereco varchar(120),
	bairro varchar(50),
	cep char(8),
	cidade varchar(30),
	email varchar(100),
	telefone varchar(20),
	celular varchar(20) not null
);

create table produtos (
	id int auto_increment primary key,
	codigo_fabrica varchar(30) not null unique,
	descricao varchar(100) not null,
	marca varchar(60),
	modelo_veiculo varchar(70)
	);

CREATE TABLE estoque (
    id INT AUTO_INCREMENT PRIMARY KEY,
    produto_id INT NOT NULL,
    status ENUM('novo', 'usado', 'revisado', 'nao_funciona') NOT NULL,
    quantidade INT NOT NULL,
    valor DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (produto_id) REFERENCES produtos(id),
    UNIQUE (produto_id, status),
    CONSTRAINT chk_estoque_quantidade CHECK (quantidade >= 0),
    CONSTRAINT chk_estoque_valor CHECK (valor >= 0)
);

CREATE TABLE formas_pagamento (
    codigo_pagamento INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(50) NOT NULL UNIQUE,
    ativo BOOLEAN NOT NULL DEFAULT TRUE,
    CONSTRAINT chk_formas_pagamento_descricao CHECK (TRIM(descricao) <> '')
);

CREATE TABLE documentos (
    numero_documento INT NOT NULL,
    especie_documento ENUM('pedido', 'orcamento') NOT NULL,
    codigo_cliente INT NOT NULL,
    codigo_pagamento INT NOT NULL,
    data_emissao DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    servico_descricao VARCHAR(255),
    servico_valor DECIMAL(10,2) NOT NULL DEFAULT 0,
    subtotal DECIMAL(10,2) NOT NULL,
    desconto DECIMAL(10,2) NOT NULL DEFAULT 0,
    total DECIMAL(10,2) NOT NULL,
    observacao VARCHAR(255),
    PRIMARY KEY (numero_documento, especie_documento),
    FOREIGN KEY (codigo_cliente) REFERENCES clientes(codigo_cliente),
    FOREIGN KEY (codigo_pagamento) REFERENCES formas_pagamento(codigo_pagamento),
    CONSTRAINT chk_documentos_servico CHECK (
        servico_valor = 0
        OR (servico_descricao IS NOT NULL AND TRIM(servico_descricao) <> '')
    ),
    CONSTRAINT chk_documentos_valores CHECK (
        servico_valor >= 0 AND subtotal >= 0 AND desconto >= 0
    ),
    CONSTRAINT chk_documentos_total CHECK (
        desconto <= subtotal AND total = subtotal - desconto
    )
);