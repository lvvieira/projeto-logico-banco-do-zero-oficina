-- 1. Recuperar a lista de todos os clientes e seus veículos
SELECT c.nome AS cliente, v.modelo, v.placa
FROM clientes c
JOIN veiculos v ON c.id_cliente = v.id_cliente;

-- 2. Verificar quantas ordens de serviço cada funcionário atendeu
SELECT f.nome AS funcionario, COUNT(os.id_ordem) AS total_ordens
FROM funcionarios f
JOIN ordens_servico os ON f.id_funcionario = os.id_funcionario
GROUP BY f.nome;

-- 3. Total de serviços realizados por tipo de serviço
SELECT s.descricao, COUNT(os.id_ordem) AS total_servicos
FROM servicos s
JOIN ordens_servico os ON s.id_servico = os.id_servico
GROUP BY s.descricao;

-- 4. Lista de clientes que já possuem pagamentos registrados
SELECT DISTINCT c.nome, p.forma_pagamento, p.valor_pago
FROM clientes c
JOIN veiculos v ON c.id_cliente = v.id_cliente
JOIN ordens_servico os ON v.id_veiculo = os.id_veiculo
JOIN pagamentos p ON os.id_ordem = p.id_ordem;

-- 5. Total de receitas da oficina por mês
SELECT DATE_TRUNC('month', p.data_pagamento) AS mes, SUM(p.valor_pago) AS total_receitas
FROM pagamentos p
GROUP BY DATE_TRUNC('month', p.data_pagamento)
ORDER BY mes;
