-- Inserção de clientes
INSERT INTO clientes (nome, telefone, email, endereco)
VALUES ('João Silva', '99999-9999', 'joao@email.com', 'Rua A, 123'),
       ('Maria Oliveira', '88888-8888', 'maria@email.com', 'Rua B, 456');

-- Inserção de veículos
INSERT INTO veiculos (id_cliente, modelo, placa, ano)
VALUES (1, 'Toyota Corolla', 'ABC-1234', 2018),
       (2, 'Honda Civic', 'XYZ-5678', 2020);

-- Inserção de funcionários (mecânicos)
INSERT INTO funcionarios (nome, cargo, telefone)
VALUES ('Carlos Mendes', 'Mecânico', '77777-7777'),
       ('Ana Paula', 'Supervisora', '66666-6666');

-- Inserção de serviços
INSERT INTO servicos (descricao, preco)
VALUES ('Troca de óleo', 150.00),
       ('Alinhamento e balanceamento', 200.00),
       ('Revisão geral', 500.00);

-- Inserção de ordens de serviço
INSERT INTO ordens_servico (id_veiculo, id_funcionario, id_servico, status, valor_total)
VALUES (1, 1, 1, 'Em andamento', 150.00),
       (2, 2, 3, 'Finalizado', 500.00);

-- Inserção de pagamentos
INSERT INTO pagamentos (id_ordem, forma_pagamento, valor_pago)
VALUES (1, 'Cartão de crédito', 150.00),
       (2, 'Boleto', 500.00);
