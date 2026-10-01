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