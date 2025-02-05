-- Criando tabelas principais
CREATE TABLE Cliente (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(15),
    endereco TEXT
);

CREATE TABLE Veiculo (
    id_veiculo INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT NOT NULL,
    placa VARCHAR(10) UNIQUE NOT NULL,
    modelo VARCHAR(50) NOT NULL,
    ano INT,
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente)
);

CREATE TABLE Mecanico (
    id_mecanico INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    endereco TEXT,
    especialidade VARCHAR(50)
);

CREATE TABLE OrdemServico (
    id_os INT PRIMARY KEY AUTO_INCREMENT,
    id_veiculo INT NOT NULL,
    data_emissao DATE NOT NULL,
    valor_total DECIMAL(10,2) DEFAULT 0,
    status ENUM('Aberta', 'Em andamento', 'Concluída', 'Cancelada') NOT NULL,
    data_conclusao DATE,
    FOREIGN KEY (id_veiculo) REFERENCES Veiculo(id_veiculo)
);

-- Tabela intermediária para N:N entre OS e Mecânicos
CREATE TABLE OS_Mecanico (
    id_os INT,
    id_mecanico INT,
    PRIMARY KEY (id_os, id_mecanico),
    FOREIGN KEY (id_os) REFERENCES OrdemServico(id_os),
    FOREIGN KEY (id_mecanico) REFERENCES Mecanico(id_mecanico)
);

CREATE TABLE Servico (
    id_servico INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(100) NOT NULL,
    valor DECIMAL(10,2) NOT NULL
);

-- Tabela intermediária para N:N entre OS e Serviços
CREATE TABLE OS_Servico (
    id_os INT,
    id_servico INT,
    quantidade INT DEFAULT 1,
    valor_total DECIMAL(10,2),
    PRIMARY KEY (id_os, id_servico),
    FOREIGN KEY (id_os) REFERENCES OrdemServico(id_os),
    FOREIGN KEY (id_servico) REFERENCES Servico(id_servico)
);

CREATE TABLE Peca (
    id_peca INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(100) NOT NULL,
    valor DECIMAL(10,2) NOT NULL
);

-- Tabela intermediária para N:N entre OS e Peças
CREATE TABLE OS_Peca (
    id_os INT,
    id_peca INT,
    quantidade INT DEFAULT 1,
    valor_total DECIMAL(10,2),
    PRIMARY KEY (id_os, id_peca),
    FOREIGN KEY (id_os) REFERENCES OrdemServico(id_os),
    FOREIGN KEY (id_peca) REFERENCES Peca(id_peca)
);
