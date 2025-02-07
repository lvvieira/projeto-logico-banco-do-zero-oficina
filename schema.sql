-- Criação do banco de dados (opcional)
CREATE DATABASE oficina;
\c oficina;

-- Tabela de clientes
CREATE TABLE clientes (
    id_cliente SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(20),
    email VARCHAR(100) UNIQUE,
    endereco TEXT
);

-- Tabela de veículos
CREATE TABLE veiculos (
    id_veiculo SERIAL PRIMARY KEY,
    id_cliente INT REFERENCES clientes(id_cliente),
    modelo VARCHAR(100) NOT NULL,
    placa VARCHAR(10) UNIQUE NOT NULL,
    ano INT
);

-- Tabela de funcionários (mecânicos)
CREATE TABLE funcionarios (
    id_funcionario SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cargo VARCHAR(50) NOT NULL,
    telefone VARCHAR(20)
);

-- Tabela de serviços
CREATE TABLE servicos (
    id_servico SERIAL PRIMARY KEY,
    descricao VARCHAR(100) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL
);

-- Tabela de ordens de serviço
CREATE TABLE ordens_servico (
    id_ordem SERIAL PRIMARY KEY,
    id_veiculo INT REFERENCES veiculos(id_veiculo),
    id_funcionario INT REFERENCES funcionarios(id_funcionario),
    id_servico INT REFERENCES servicos(id_servico),
    data_ordem DATE DEFAULT CURRENT_DATE,
    status VARCHAR(20) NOT NULL,
    valor_total DECIMAL(10, 2)
);

-- Tabela de pagamentos
CREATE TABLE pagamentos (
    id_pagamento SERIAL PRIMARY KEY,
    id_ordem INT REFERENCES ordens_servico(id_ordem),
    forma_pagamento VARCHAR(50) NOT NULL,
    data_pagamento DATE DEFAULT CURRENT_DATE,
    valor_pago DECIMAL(10, 2) NOT NULL
);
