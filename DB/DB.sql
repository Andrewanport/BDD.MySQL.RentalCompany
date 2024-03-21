CREATE DATABASE locadora;

CREATE TABLE Veiculos (
	VeiculoID INT AUTO_INCREMENT PRIMARY KEY,
    
    Numero_Chassi VARCHAR(17) UNIQUE,
    Modelo VARCHAR(100),
    Marca VARCHAR(50),
    Ano VARCHAR(4),
    Placa VARCHAR(7) UNIQUE,
    Categoria VARCHAR(50),
    Disponibilidade BOOLEAN,
    
    Reserva_ID INT,			
    Aluguel_ID INT,	
    Agencia_ID INT,	
    Cliente_ID INT,
    Categoria_ID INT,
    Manutencao_ID INT,
    
    FOREIGN KEY (Reserva_ID) REFERENCES Reserva(Reserva_ID),
    FOREIGN KEY (Aluguel_ID) REFERENCES Aluguel(Aluguel_ID),
    FOREIGN KEY (Agencia_ID) REFERENCES Agencia(Agencia_ID),
    FOREIGN KEY (Cliente_ID) REFERENCES Cliente(Cliente_ID),
    FOREIGN KEY (Categoria_ID) REFERENCES Categoria(Categoria_ID),
    FOREIGN KEY (Manuntencao_ID) REFERENCES Manutencao(Manutencao_ID)
	
);

CREATE TABLE Categoria_Veiculos (
	Categoria_Veiculos_ID INT AUTO_INCREMENT PRIMARY KEY,
    
    Nome_Categoria VARCHAR(50),
    Descricao VARCHAR(255),
    Tarifa_Diaria DECIMAL(10,2)

);

CREATE TABLE Manuntencao (
	Manutencao_ID INT AUTO_INCREMENT PRIMARY KEY,
    
    Tipo_Manuntencao VARCHAR(255),
    Data_Inicio DATETIME,
    Data_Conclusao DATETIME,
    Custo DECIMAL (10,2), 
    
    Veiculo_ID INT,

    FOREIGN KEY (Veiculo_ID) REFERENCES Veiculo(Veiculo_ID)
    
);

CREATE TABLE Reserva (
	Reserva_ID INT AUTO_INCREMENT PRIMARY KEY,
    
    Data_Reserva DATETIME,
    Data_Retirada_Prevista DATETIME,
    Disponibilidade_Reserva BOOLEAN,
    
    Veiculo_ID INT,
    Cliente_ID INT,
    
    FOREIGN KEY (Veiculo_ID) REFERENCES Veiculo(Veiculo_ID),
    FOREIGN KEY (Cliente_ID) REFERENCES Cliente(Cliente_ID)
    
);

CREATE TABLE Cliente (

    /* Primary Key */
    Cliente_ID INT AUTO_INCREMENT PRIMARY KEY,

    /* Atributos */
    Nome VARCHAR(255),
    Telefone VARCHAR(15),
    Email VARCHAR(255),
    CNH VARCHAR(255),
    CPF VARCHAR(255),
    
    Aluguel_ID INT,			
    Endereco_ID INT, 		
    Veiculo_ID INT,			
    Reserva_ID INT,			
    
    /* Foreign Key */
    FOREIGN KEY (Aluguel_ID) REFERENCES Aluguel(Aluguel_ID),
    FOREIGN KEY (Endereco_ID) REFERENCES Endereco(Endereco_ID),
    FOREIGN KEY (Veiculo_ID) REFERENCES Veiculo(Veiculo_ID),
    FOREIGN KEY (Reserva_ID) REFERENCES Reserva(Reserva_ID)
    
);

CREATE TABLE Endereco (

    /* Primary Key */
    Endereco_ID INT AUTO_INCREMENT PRIMARY KEY,

    /* Atributos */
    Rua VARCHAR(255),
    Numero VARCHAR(255),
    Complemento VARCHAR(255),
    Bairro VARCHAR(255),
    Cidade VARCHAR(255),
    Estado VARCHAR(255),
    CEP VARCHAR(255)
    
);

CREATE TABLE Multa (

    /* Primary Key */
    Multa_ID INT AUTO_INCREMENT PRIMARY KEY,

    /* Atributos */
    Infracao VARCHAR(255),
    Data_Multa DATETIME,
    Valor_Multa DECIMAL(10,2),
    
    Aluguel_ID INT,			
    Veiculo_ID INT,			
    Cliente_ID INT,			
    
    /* Foreign Key */
    FOREIGN KEY (Aluguel_ID) REFERENCES Aluguel(Aluguel_ID),
    FOREIGN KEY (Veiculo_ID) REFERENCES Veiculo(Veiculo_ID),
    FOREIGN KEY (Cliente_ID) REFERENCES Cliente(Cliente_ID)
    
);

CREATE TABLE Seguro (

    /* Primary Key */
    Seguro_ID INT AUTO_INCREMENT PRIMARY KEY,

    /* Atributos */
    Tipo_Seguro VARCHAR(255),
    Valor_Premio VARCHAR(255),
    Periodo_Seguro DATETIME,
    
    Aluguel_ID INT,			
    
    /* Foreign Key */
    FOREIGN KEY (Aluguel_ID) REFERENCES Aluguel(Aluguel_ID)
    
);

CREATE TABLE Tipo_Pagamento (

    /* Primary Key */
    Tipo_Pagamento_ID INT AUTO_INCREMENT PRIMARY KEY,
    
    /* Atributos */
    Nome_do_Tipo VARCHAR (255),
    
    Aluguel_ID INT,			

    /* Foreign Key */
    FOREIGN KEY (Aluguel_ID) REFERENCES Aluguel(Aluguel_ID)
);

CREATE TABLE Funcionario (

    /* Primary Key */
    Funcionario_ID INT AUTO_INCREMENT PRIMARY KEY,
    
    /* Atributos */
    Nome VARCHAR (255),
    CPF VARCHAR (255) UNIQUE,
    Cargo VARCHAR (255),
    Telefone VARCHAR (15) UNIQUE,
    Email VARCHAR (50) UNIQUE,
    
    Aluguel_ID INT,			
    Endereco_ID INT,		
    Agencia_ID INT,			
	
    /* Foreign Key */
    FOREIGN KEY (Aluguel_ID) REFERENCES Aluguel(Aluguel_ID),
    FOREIGN KEY (Endereco_ID) REFERENCES Endereco(Endereco_ID),
    FOREIGN KEY (Agencia_ID) REFERENCES Agencia(Agencia_ID)
);

CREATE TABLE Aluguel (

    /* Primary Key */
    Aluguel_ID INT AUTO_INCREMENT PRIMARY KEY,
    
    /* Atributos */
    Data_Inicio DATETIME,
    Data_Termino_Prevista DATETIME,
    Data_Termino_Real DATETIME,
    Valor DECIMAL (10,2)
);

CREATE TABLE Agencia (

    /* Primary Key */
    Agencia_ID INT AUTO_INCREMENT PRIMARY KEY,
    
    /* Atributos */
    Nome VARCHAR (255),
    CNPJ VARCHAR (255) UNIQUE,
    Telefone VARCHAR (15) UNIQUE,
    Email VARCHAR (50) UNIQUE,
    
    Endereco_ID INT,
    Funcionario_ID INT,			
    Veiculo_ID INT,			

    /* Foreign Key */
    FOREIGN KEY (Endereco_ID) REFERENCES Endereco(Endereco_ID),
    FOREIGN KEY (Funcionario_ID) REFERENCES Funcionario(Funcionario_ID),
    FOREIGN KEY (Veiculo_ID) REFERENCES Veiculo(Veiculo_ID)
);
