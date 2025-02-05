Atributos principais:

Cliente (id_cliente, nome, telefone, endereço)
Veículo (id_veiculo, id_cliente, placa, modelo, ano)
Mecânico (id_mecanico, nome, endereço, especialidade)
Ordem de Serviço (OS) (id_os, id_veiculo, data_emissao, valor_total, status, data_conclusao)
Serviço (id_servico, descricao, valor)
Peça (id_peca, descricao, valor)

Relacionamentos
Cliente 1:N Veículo
Veículo 1:N Ordem de Serviço
Ordem de Serviço N:N Mecânico (tabela intermediária OS_Mecanico)
Ordem de Serviço N:N Serviço (tabela intermediária OS_Servico)
Ordem de Serviço N:N Peça (tabela intermediária OS_Peca)
