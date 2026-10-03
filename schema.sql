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
)

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
    FOREIGN KEY (produto_id) REFERENCES produtos(id)
);
