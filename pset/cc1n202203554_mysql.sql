-- Começamos criando o banco de dados.
CREATE DATABASE uvv
       DEFAULT CHARACTER SET = 'UTF8'
       DEFAULT COLLATE = 'utf8_general_ci';
    
-- E seguimos com o usuário que vai administrar.
CREATE USER Raphael 
       IDENTIFIED BY '123456';
       GRANT ALL PRIVILEGES ON uvv.* TO Raphael;
       FLUSH PRIVILEGES;
       
-- Selecionamos o BD.
USE uvv;

-- E seguem aqui os comandos para a criação das tabelas do modelo HR e suas respectivas colunas.
CREATE TABLE cargos (
                id_cargo VARCHAR(10) NOT NULL,
                cargo VARCHAR(35) NOT NULL,
                salario_minimo DECIMAL(8,2),
                salario_maximo DECIMAL(8,2),
                PRIMARY KEY (id_cargo)
);

/* 'Tabela dos cargos' 

 'ID dos cargos. Primary Key.'

 'Cargo. Alternate Key.'

 'Tô na universidade pra fugir disso aqui.'

  'Salário máximo.' */

CREATE UNIQUE INDEX cargos_idx -- O ''INDEX único'' me ajuda a identificar a Alternate Key.'
 ON cargos
 ( cargo );

CREATE TABLE regioes (
                id_regiao INT NOT NULL,
                nome VARCHAR(25) NOT NULL,
                PRIMARY KEY (id_regiao)
);

/* 'Tabela de regiões.'

 'Id de região. Primary key.'

  'Campo de Nomes. Alternate Key.' */


CREATE UNIQUE INDEX regioes_idx
 ON regioes
 ( nome );

CREATE TABLE paises (
                id_pais CHAR(2) NOT NULL,
                nome VARCHAR(50) NOT NULL,
                id_regiao INT NOT NULL,
                PRIMARY KEY (id_pais)
);

 /* 'Tabela de países.'

 'ID dos países. Primary Key.'

 'Nome dos países. Alternate Key.'

 'ID das regiões. Foreign Key de Localizações.' */


CREATE UNIQUE INDEX paises_idx
 ON paises
 ( nome );

CREATE TABLE localizacoes (
                id_localizacao INT,
                endereco VARCHAR(50),
                cep VARCHAR(12),
                cidade VARCHAR(50),
                uf VARCHAR(25),
                id_pais CHAR(2) NOT NULL,
                PRIMARY KEY (id_localizacao)
);

/* 'Tabela das localizações.'

 'ID de localização. Primary Key.'

  'Campo de endereço.'

  'Campo de CEP'

 'Campo das cidades.'

 'Campo das unidades federativas.'

 'Id dos países. Foreign Key.' */


CREATE TABLE departamentos (
                id_departamento INT NOT NULL,
                nome VARCHAR(50) NOT NULL,
                id_localizacao INT NOT NULL,
                id_gerente INT,
                PRIMARY KEY (id_departamento)
);

/* 'Tabela de departamentos.'

 'ID dos departamentos.'

 'Nome dos Departamentos. Alternate Key.'

 'ID de localização. Foreign Key.'

  'ID de gerente. Foreign Key.' */


CREATE UNIQUE INDEX ak
 ON departamentos
 ( nome );

CREATE TABLE empregados (
                id_empregado INT NOT NULL,
                nome VARCHAR(75) NOT NULL,
                email VARCHAR(35) NOT NULL,
                telefone VARCHAR(20),
                data_contratacao DATE NOT NULL,
                id_cargo VARCHAR(10) NOT NULL,
                salario DECIMAL(8,2) NOT NULL,
                comissao DECIMAL(4,2),
                id_departamento INT,
                id_supervisor INT,
                PRIMARY KEY (id_empregado)
);

/* 'Tabela dos Empregados.'
 'ID dos empregados. Primary Key.'
 'O nome dos empregados.'
 'E-mail dos empregados. Alternate Key.'
 'Telefone dos empregados.'
 'Data de contratação.'
 'ID dos cargos. Foreign Key.'
 'Salário. Não muito alto.'
 'Comissão dos empregados.'
 'o ID de Departamento. Foreign Key.'
 'ID do supervisor. Foreign Key.' */

CREATE UNIQUE INDEX ak1
 ON empregados
 ( email );

CREATE TABLE historico_cargos (
                id_empregado_fk INT NOT NULL, 
                data_inicial DATE NOT NULL,
                data_final DATE NOT NULL,
                id_cargo VARCHAR(10) NOT NULL,
                id_departamento INT,
                PRIMARY KEY (data_inicial, id_empregado_fk)
);

/* 'Tabela de histórico de cargos.'
 'Data inicial. Primary Key'
 'ID dos empregados. Única primary-foreign key.'
 'Data final.'
 'ID dos cargos. Foreign Key.'
 'ID dos Departamentos. Foreign Key.' */

-- Seguem aqui os Inserts de todos os registros das Tabelas.
-- Inserts das Regiões, seus nomes e IDs:

INSERT INTO regioes VALUES 
        ( 1
        , 'Europe' 
        );

INSERT INTO regioes VALUES 
        ( 2
        , 'Americas' 
        );

INSERT INTO regioes VALUES 
        ( 3
        , 'Asia' 
        );

INSERT INTO regioes VALUES 
        ( 4
        , 'Middle East and Africa' 
        );
       
       -- Seguem os Inserts dos países, IDs, nomes e etc.


INSERT INTO paises VALUES 
        ( 'IT'
        , 'Italy'
        , 1 
        );

INSERT INTO paises VALUES 
        ( 'JP'
        , 'Japan'
	, 3 
        );

INSERT INTO paises VALUES 
        ( 'US'
        , 'United States of America'
        , 2 
        );

INSERT INTO paises VALUES 
        ( 'CA'
        , 'Canada'
        , 2 
        );

INSERT INTO paises VALUES 
        ( 'CN'
        , 'China'
        , 3 
        );

INSERT INTO paises VALUES 
        ( 'IN'
        , 'India'
        , 3 
        );

INSERT INTO paises VALUES 
        ( 'AU'
        , 'Australia'
        , 3 
        );

INSERT INTO paises VALUES 
        ( 'ZW'
        , 'Zimbabwe'
        , 4 
        );

INSERT INTO paises VALUES 
        ( 'SG'
        , 'Singapore'
        , 3 
        );

INSERT INTO paises VALUES 
        ( 'UK'
        , 'United Kingdom'
        , 1 
        );

INSERT INTO paises VALUES 
        ( 'FR'
        , 'France'
        , 1 
        );

INSERT INTO paises VALUES 
        ( 'DE'
        , 'Germany'
        , 1 
        );

INSERT INTO paises VALUES 
        ( 'ZM'
        , 'Zambia'
        , 4 
        );

INSERT INTO paises VALUES 
        ( 'EG'
        , 'Egypt'
        , 4 
        );

INSERT INTO paises VALUES 
        ( 'BR'
        , 'Brazil'
        , 2 
        );

INSERT INTO paises VALUES 
        ( 'CH'
        , 'Switzerland'
        , 1 
        );

INSERT INTO paises VALUES 
        ( 'NL'
        , 'Netherlands'
        , 1 
        );

INSERT INTO paises VALUES 
        ( 'MX'
        , 'Mexico'
        , 2 
        );

INSERT INTO paises VALUES 
        ( 'KW'
        , 'Kuwait'
        , 4 
        );

INSERT INTO paises VALUES 
        ( 'IL'
        , 'Israel'
        , 4 
        );

INSERT INTO paises VALUES 
        ( 'DK'
        , 'Denmark'
        , 1 
        );

INSERT INTO paises VALUES 
        ( 'ML'
        , 'Malaysia'
        , 3 
        );

INSERT INTO paises VALUES 
        ( 'NG'
        , 'Nigeria'
        , 4 
        );

INSERT INTO paises VALUES 
        ( 'AR'
        , 'Argentina'
        , 2 
        );

INSERT INTO paises VALUES 
        ( 'BE'
        , 'Belgium'
        , 1 
        );
       
       /* Seguem aqui os inserts das localizações. Esses precisaram ser alterados 
       para funcionar, mas sem modificação nos valores.*/

       INSERT INTO localizacoes VALUES 
        ( 1000 
        , '1297 Via Cola di Rie'
        , '00989'
        , 'Roma'
        , NULL
        , 'IT'
        );

INSERT INTO localizacoes VALUES 
        ( 1100 
        , '93091 Calle della Testa'
        , '10934'
        , 'Venice'
        , NULL
        , 'IT'
        );

INSERT INTO localizacoes VALUES 
        ( 1200 
        , '2017 Shinjuku-ku'
        , '1689'
        , 'Tokyo'
        , 'Tokyo Prefecture'
        , 'JP'
        );

INSERT INTO localizacoes VALUES 
        ( 1300 
        , '9450 Kamiya-cho'
        , '6823'
        , 'Hiroshima'
        , NULL
        , 'JP'
        );

INSERT INTO localizacoes VALUES 
        ( 1400 
        , '2014 Jabberwocky Rd'
        , '26192'
        , 'Southlake'
        , 'Texas'
        , 'US'
        );

INSERT INTO localizacoes VALUES 
        ( 1500 
        , '2011 Interiors Blvd'
        , '99236'
        , 'South San Francisco'
        , 'California'
        , 'US'
        );

INSERT INTO localizacoes VALUES 
        ( 1600 
        , '2007 Zagora St'
        , '50090'
        , 'South Brunswick'
        , 'New Jersey'
        , 'US'
        );

INSERT INTO localizacoes VALUES 
        ( 1700 
        , '2004 Charade Rd'
        , '98199'
        , 'Seattle'
        , 'Washington'
        , 'US'
        );

INSERT INTO localizacoes VALUES 
        ( 1800 
        , '147 Spadina Ave'
        , 'M5V 2L7'
        , 'Toronto'
        , 'Ontario'
        , 'CA'
        );

INSERT INTO localizacoes VALUES 
        ( 1900 
        , '6092 Boxwood St'
        , 'YSW 9T2'
        , 'Whitehorse'
        , 'Yukon'
        , 'CA'
        );

INSERT INTO localizacoes VALUES 
        ( 2000 
        , '40-5-12 Laogianggen'
        , '190518'
        , 'Beijing'
        , NULL
        , 'CN'
        );

INSERT INTO localizacoes VALUES 
        ( 2100 
        , '1298 Vileparle (E)'
        , '490231'
        , 'Bombay'
        , 'Maharashtra'
        , 'IN'
        );

INSERT INTO localizacoes VALUES 
        ( 2200 
        , '12-98 Victoria Street'
        , '2901'
        , 'Sydney'
        , 'New South Wales'
        , 'AU'
        );

INSERT INTO localizacoes VALUES 
        ( 2300 
        , '198 Clementi North'
        , '540198'
        , 'Singapore'
        , NULL
        , 'SG'
        );

INSERT INTO localizacoes VALUES 
        ( 2400 
        , '8204 Arthur St'
        , NULL
        , 'London'
        , NULL
        , 'UK'
        );

INSERT INTO localizacoes VALUES 
        ( 2500 
        , 'Magdalen Centre, The Oxford Science Park'
        , 'OX9 9ZB'
        , 'Oxford'
        , 'Oxford'
        , 'UK'
        );

INSERT INTO localizacoes VALUES 
        ( 2600 
        , '9702 Chester Road'
        , '09629850293'
        , 'Stretford'
        , 'Manchester'
        , 'UK'
        );

INSERT INTO localizacoes VALUES 
        ( 2700 
        , 'Schwanthalerstr. 7031'
        , '80925'
        , 'Munich'
        , 'Bavaria'
        , 'DE'
        );

INSERT INTO localizacoes VALUES 
        ( 2800 
        , 'Rua Frei Caneca 1360 '
        , '01307-002'
        , 'Sao Paulo'
        , 'Sao Paulo'
        , 'BR'
        );

INSERT INTO localizacoes VALUES 
        ( 2900 
        , '20 Rue des Corps-Saints'
        , '1730'
        , 'Geneva'
        , 'Geneve'
        , 'CH'
        );

INSERT INTO localizacoes VALUES 
        ( 3000 
        , 'Murtenstrasse 921'
        , '3095'
        , 'Bern'
        , 'BE'
        , 'CH'
        );

INSERT INTO localizacoes VALUES 
        ( 3100 
        , 'Pieter Breughelstraat 837'
        , '3029SK'
        , 'Utrecht'
        , 'Utrecht'
        , 'NL'
        );

INSERT INTO localizacoes VALUES 
        ( 3200 
        , 'Mariano Escobedo 9991'
        , '11932'
        , 'Mexico City'
        , 'Distrito Federal,'
        , 'MX'
        );
       
       -- Seguem aqui os Inserts das informações pertinentes à tabela Departamentos.
       
       INSERT INTO departamentos VALUES 
        ( 10
        , 'Administration'
        , 200
        , 1700
        );

INSERT INTO departamentos VALUES 
        ( 20
        , 'Marketing'
        , 201
        , 1800
        );
                                
INSERT INTO departamentos VALUES 
        ( 30
        , 'Purchasing'
        , 114
        , 1700
	);
                
INSERT INTO departamentos VALUES 
        ( 40
        , 'Human Resources'
        , 203
        , 2400
        );

INSERT INTO departamentos VALUES 
        ( 50
        , 'Shipping'
        , 121
        , 1500
        );
                
INSERT INTO departamentos VALUES 
        ( 60 
        , 'IT'
        , 103
        , 1400
        );
                
INSERT INTO departamentos VALUES 
        ( 70 
        , 'Public Relations'
        , 204
        , 2700
        );
                
INSERT INTO departamentos VALUES 
        ( 80 
        , 'Sales'
        , 145
        , 2500
        );
                
INSERT INTO departamentos VALUES 
        ( 90 
        , 'Executive'
        , 100
        , 1700
        );

INSERT INTO departamentos VALUES 
        ( 100 
        , 'Finance'
        , 108
        , 1700
        );
                
INSERT into departamentos VALUES 
        ( 110 
        , 'Accounting'
        , 205
        , 1700
        );

INSERT INTO departamentos VALUES 
        ( 120 
        , 'Treasury'
        , 105
        , 1700
        );

INSERT INTO departamentos VALUES 
        ( 130 
        , 'Corporate Tax'
        , 201
        , 1700
        );

INSERT INTO departamentos VALUES 
        ( 140 
        , 'Control And Credit'
        , NULL
        , 1700
        );

INSERT into departamentos VALUES 
        ( 150 
        , 'Shareholder Services'
        , NULL
        , 1700
        );

INSERT INTO departamentos VALUES 
        ( 160 
        , 'Benefits'
        , NULL
        , 1700
        );

INSERT INTO departamentos VALUES 
        ( 170 
        , 'Manufacturing'
        , NULL
        , 1700
        );

INSERT INTO departamentos VALUES 
        ( 180 
        , 'Construction'
        , NULL
        , 1700
        );

INSERT INTO departamentos VALUES 
        ( 190 
        , 'Contracting'
        , NULL
        , 1700
        );

INSERT INTO departamentos  VALUES 
        ( 200 
        , 'Operations'
        , NULL
        , 1700
        );

INSERT INTO departamentos  VALUES 
        ( 210 
        , 'IT Support'
        , NULL
        , 1700
        );

INSERT INTO departamentos  VALUES 
        ( 220 
        , 'NOC'
        , NULL
        , 1700
        );

INSERT INTO departamentos VALUES 
        ( 230 
        , 'IT Helpdesk'
        , NULL
        , 1700
        );

INSERT INTO departamentos  VALUES 
        ( 240 
        , 'Government Sales'
        , NULL
        , 1700
        );

INSERT INTO departamentos  VALUES 
        ( 250 
        , 'Retail Sales'
        , NULL
        , 1700
        );

INSERT INTO departamentos  VALUES 
        ( 260 
        , 'Recruiting'
        , NULL
        , 1700
        );

INSERT INTO departamentos VALUES 
        ( 270 
        , 'Payroll'
        , NULL
        , 1700
        );
       
       -- Seguem aqui os Inserts pertinentes à tabela cargos.
       
       INSERT INTO cargos VALUES 
        ( 'AD_PRES'
        , 'President'
        , 20080
        , 40000
        );
INSERT INTO cargos VALUES 
        ( 'AD_VP'
        , 'Administration Vice President'
        , 15000
        , 30000
        );

INSERT INTO cargos VALUES 
        ( 'AD_ASST'
        , 'Administration Assistant'
        , 3000
        , 6000
        );

INSERT INTO cargos VALUES 
        ( 'FI_MGR'
        , 'Finance Manager'
        , 8200
        , 16000
        );

INSERT INTO cargos VALUES 
        ( 'FI_ACCOUNT'
        , 'Accountant'
        , 4200
        , 9000
        );

INSERT INTO cargos VALUES 
        ( 'AC_MGR'
        , 'Accounting Manager'
        , 8200
        , 16000
        );

INSERT into cargos VALUES 
        ( 'AC_ACCOUNT'
        , 'Public Accountant'
        , 4200
        , 9000
        );
INSERT INTO cargos VALUES 
        ( 'SA_MAN'
        , 'Sales Manager'
        , 10000
        , 20080
        );

INSERT INTO cargos VALUES 
        ( 'SA_REP'
        , 'Sales Representative'
        , 6000
        , 12008
        );

INSERT INTO cargos VALUES 
        ( 'PU_MAN'
        , 'Purchasing Manager'
        , 8000
        , 15000
        );

INSERT into cargos VALUES 
        ( 'PU_CLERK'
        , 'Purchasing Clerk'
        , 2500
        , 5500
        );

INSERT INTO cargos VALUES 
        ( 'ST_MAN'
        , 'Stock Manager'
        , 5500
        , 8500
        );
INSERT INTO cargos VALUES 
        ( 'ST_CLERK'
        , 'Stock Clerk'
        , 2008
        , 5000
        );

INSERT INTO cargos VALUES 
        ( 'SH_CLERK'
        , 'Shipping Clerk'
        , 2500
        , 5500
        );

INSERT into cargos VALUES 
        ( 'IT_PROG'
        , 'Programmer'
        , 4000
        , 10000
        );

INSERT INTO cargos VALUES 
        ( 'MK_MAN'
        , 'Marketing Manager'
        , 9000
        , 15000
        );

INSERT INTO cargos VALUES 
        ( 'MK_REP'
        , 'Marketing Representative'
        , 4000
        , 9000
        );

INSERT INTO cargos  VALUES 
        ( 'HR_REP'
        , 'Human Resources Representative'
        , 4000
        , 9000
        );

INSERT INTO cargos VALUES 
        ( 'PR_REP'
        , 'Public Relations Representative'
        , 4500
        , 10500
        );
       
       /*Esse gigantesco bloco de texto à seguir, são os inserts dos empregados. Eles não funcionaram
        * nesse script da mesma maneira que funcionaram no meu script do Postgresql, então tive de tomar
        * uma estratégia alternativa, usando como base o comando do professor Abrantes para o Oracle Database.
        * Com alguns ajustes, acabou funcionando. Todas as informações nos registros permanecem intactas.
        */
       
    INSERT INTO empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario, comissao, id_supervisor, id_departamento) VALUES
(198, 'DonaldOConnell', 'DOCONNEL', '650.507.9833', '2007-06-21', 'SH_CLERK', 2600, null, 124,50);
INSERT INTO empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario, comissao, id_supervisor, id_departamento) VALUES
(199, 'DouglasGrant', 'DGRANT', '650.507.9844', '2008-01-13', 'SH_CLERK', 2600, null, 124,50);
INSERT INTO empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario, comissao, id_supervisor, id_departamento) VALUES
(200, 'JenniferWhalen', 'JWHALEN', '515.123.4444', '2003-09-17', 'AD_ASST', 4400, null, 101,10);
INSERT INTO empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario, comissao, id_supervisor, id_departamento) VALUES
(201, 'MichaelHartstein', 'MHARTSTE', '515.123.5555', '2004-02-17', 'MK_MAN', 13000, null, 100,20);
INSERT INTO empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario, comissao, id_supervisor, id_departamento) VALUES
(202, 'PatFay', 'PFAY', '603.123.6666', '2005-08-17', 'MK_REP', 6000, null, 201,20);
INSERT INTO empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario, comissao, id_supervisor, id_departamento) VALUES
(203, 'SusanMavris', 'SMAVRIS', '515.123.7777', '2002-06-07', 'HR_REP', 6500, null, 101,40);
INSERT INTO empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario, comissao, id_supervisor, id_departamento) VALUES
(204, 'HermannBaer', 'HBAER', '515.123.8888', '2002-06-07', 'PR_REP', 10000, null, 101,70);
INSERT INTO empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario, comissao, id_supervisor, id_departamento) VALUES
(205, 'ShelleyHiggins', 'SHIGGINS', '515.123.8080', '2002-06-07', 'AC_MGR', 12008, null, 101,110);
INSERT INTO empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario, comissao, id_supervisor, id_departamento) VALUES
(206, 'WilliamGietz', 'WGIETZ', '515.123.8181', '2002-06-07', 'AC_ACCOUNT', 8300, null, 205,110);
INSERT INTO empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario, comissao, id_supervisor, id_departamento) VALUES
(100, 'StevenKing', 'SKING', '515.123.4567', '2003-06-17', 'AD_PRES', 24000, null, null,90);
INSERT INTO empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario, comissao, id_supervisor, id_departamento) VALUES
(101, 'NeenaKochhar', 'NKOCHHAR', '515.123.4568', '2005-09-21', 'AD_VP', 17000, null, 100,90);
INSERT INTO empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario, comissao, id_supervisor, id_departamento) VALUES
(102, 'LexDe Haan', 'LDEHAAN', '515.123.4569', '2001-01-13', 'AD_VP', 17000, null, 100,90);
INSERT INTO empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario, comissao, id_supervisor, id_departamento) VALUES
(103, 'AlexanderHunold', 'AHUNOLD', '590.423.4567', '2006-01-03', 'IT_PROG', 9000, null, 102,60);
INSERT INTO empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario, comissao, id_supervisor, id_departamento) VALUES
(104, 'BruceErnst', 'BERNST', '590.423.4568', '2007-05-21', 'IT_PROG', 6000, null, 103,60);
INSERT INTO empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario, comissao, id_supervisor, id_departamento) VALUES
(105, 'DavidAustin', 'DAUSTIN', '590.423.4569', '2005-06-25', 'IT_PROG', 4800, null, 103,60);
INSERT INTO empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario, comissao, id_supervisor, id_departamento) VALUES
(106, 'ValliPataballa', 'VPATABAL', '590.423.4560', '2006-02-05', 'IT_PROG', 4800, null, 103,60);
INSERT INTO empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario, comissao, id_supervisor, id_departamento) VALUES
(107, 'DianaLorentz', 'DLORENTZ', '590.423.5567', '2007-02-07', 'IT_PROG', 4200, null, 103,60);
INSERT INTO empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario, comissao, id_supervisor, id_departamento) VALUES
(108, 'NancyGreenberg', 'NGREENBE', '515.124.4569', '2002-08-17', 'FI_MGR', 12008, null, 101,100);
INSERT INTO empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario, comissao, id_supervisor, id_departamento) VALUES
(109, 'DanielFaviet', 'DFAVIET', '515.124.4169', '2002-08-16', 'FI_ACCOUNT', 9000, null, 108,100);
INSERT INTO empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario, comissao, id_supervisor, id_departamento) VALUES
(110, 'JohnChen', 'JCHEN', '515.124.4269', '2005-09-28', 'FI_ACCOUNT', 8200, null, 108,100);
INSERT INTO empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario, comissao, id_supervisor, id_departamento) VALUES
(111, 'IsmaelSciarra', 'ISCIARRA', '515.124.4369', '2005-09-30', 'FI_ACCOUNT', 7700, null, 108,100);
INSERT INTO empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario, comissao, id_supervisor, id_departamento) VALUES
(112, 'Jose ManuelUrman', 'JMURMAN', '515.124.4469', '2006-03-07', 'FI_ACCOUNT', 7800, null, 108,100);
INSERT INTO empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario, comissao, id_supervisor, id_departamento) VALUES
(113, 'LuisPopp', 'LPOPP', '515.124.4567', '2007-12-07', 'FI_ACCOUNT', 6900, null, 108,100);
INSERT INTO empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario, comissao, id_supervisor, id_departamento) VALUES
(114, 'DenRaphaely', 'DRAPHEAL', '515.127.4561', '2002-12-07', 'PU_MAN', 11000, null, 100,30);
INSERT INTO empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario, comissao, id_supervisor, id_departamento) VALUES
(115, 'AlexanderKhoo', 'AKHOO', '515.127.4562', '2003-05-18', 'PU_CLERK', 3100, null, 114,30);
INSERT INTO empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario, comissao, id_supervisor, id_departamento) VALUES
(116, 'ShelliBaida', 'SBAIDA', '515.127.4563', '2005-12-24', 'PU_CLERK', 2900, null, 114,30);
INSERT INTO empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario, comissao, id_supervisor, id_departamento) VALUES
(117, 'SigalTobias', 'STOBIAS', '515.127.4564', '2005-07-24', 'PU_CLERK', 2800, null, 114,30);
INSERT INTO empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario, comissao, id_supervisor, id_departamento) VALUES
(118, 'GuyHimuro', 'GHIMURO', '515.127.4565', '2006-11-15', 'PU_CLERK', 2600, null, 114,30);
INSERT INTO empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario, comissao, id_supervisor, id_departamento) VALUES
(119, 'KarenColmenares', 'KCOLMENA', '515.127.4566', '2007-08-10', 'PU_CLERK', 2500, null, 114,30);
INSERT INTO empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario, comissao, id_supervisor, id_departamento) VALUES
(120, 'MatthewWeiss', 'MWEISS', '650.123.1234', '2004-07-18', 'ST_MAN', 8000, null, 100,50);
INSERT INTO empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario, comissao, id_supervisor, id_departamento) VALUES
(121, 'AdamFripp', 'AFRIPP', '650.123.2234', '2005-04-10', 'ST_MAN', 8200, null, 100,50);
INSERT INTO empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario, comissao, id_supervisor, id_departamento) VALUES
(122, 'PayamKaufling', 'PKAUFLIN', '650.123.3234', '2003-05-01', 'ST_MAN', 7900, null, 100,50);
INSERT INTO empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario, comissao, id_supervisor, id_departamento) VALUES
(123, 'ShantaVollman', 'SVOLLMAN', '650.123.4234', '2005-10-10', 'ST_MAN', 6500, null, 100,50);
INSERT INTO empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario, comissao, id_supervisor, id_departamento) VALUES
(124, 'KevinMourgos', 'KMOURGOS', '650.123.5234', '2007-11-16', 'ST_MAN', 5800, null, 100,50);
INSERT INTO empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario, comissao, id_supervisor, id_departamento) VALUES
(125, 'JuliaNayer', 'JNAYER', '650.124.1214', '2005-07-16', 'ST_CLERK', 3200, null, 120,50);
INSERT INTO empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario, comissao, id_supervisor, id_departamento) VALUES
(126, 'IreneMikkilineni', 'IMIKKILI', '650.124.1224', '2006-09-28', 'ST_CLERK', 2700, null, 120,50);
INSERT INTO empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario, comissao, id_supervisor, id_departamento) VALUES
(127, 'JamesLandry', 'JLANDRY', '650.124.1334', '2007-01-14', 'ST_CLERK', 2400, null, 120,50);
INSERT INTO empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario, comissao, id_supervisor, id_departamento) VALUES
(128, 'StevenMarkle', 'SMARKLE', '650.124.1434', '2008-03-08', 'ST_CLERK', 2200, null, 120,50);
INSERT INTO empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario, comissao, id_supervisor, id_departamento) VALUES
(129, 'LauraBissot', 'LBISSOT', '650.124.5234', '2005-08-20', 'ST_CLERK', 3300, null, 121,50);
INSERT INTO empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario, comissao, id_supervisor, id_departamento) VALUES
(130, 'MozheAtkinson', 'MATKINSO', '650.124.6234', '2005-10-30', 'ST_CLERK', 2800, null, 121,50);
INSERT INTO empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario, comissao, id_supervisor, id_departamento) VALUES
(131, 'JamesMarlow', 'JAMRLOW', '650.124.7234', '2005-02-16', 'ST_CLERK', 2500, null, 121,50);
INSERT INTO empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario, comissao, id_supervisor, id_departamento) VALUES
(132, 'TJOlson', 'TJOLSON', '650.124.8234', '2007-04-10', 'ST_CLERK', 2100, null, 121,50);
INSERT INTO empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario, comissao, id_supervisor, id_departamento) VALUES
(133, 'JasonMallin', 'JMALLIN', '650.127.1934', '2004-06-14', 'ST_CLERK', 3300, null, 122,50);
INSERT INTO empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario, comissao, id_supervisor, id_departamento) VALUES
(134, 'MichaelRogers', 'MROGERS', '650.127.1834', '2006-08-26', 'ST_CLERK', 2900, null, 122,50);
INSERT INTO empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario, comissao, id_supervisor, id_departamento) VALUES
(135, 'KiGee', 'KGEE', '650.127.1734', '2007-12-12', 'ST_CLERK', 2400, null, 122,50);
INSERT INTO empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario, comissao, id_supervisor, id_departamento) VALUES
(136, 'HazelPhiltanker', 'HPHILTAN', '650.127.1634', '2008-02-06', 'ST_CLERK', 2200, null, 122,50);
INSERT INTO empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario, comissao, id_supervisor, id_departamento) VALUES
(137, 'RenskeLadwig', 'RLADWIG', '650.121.1234', '2003-07-14', 'ST_CLERK', 3600, null, 123,50);
INSERT INTO empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario, comissao, id_supervisor, id_departamento) VALUES
(138, 'StephenStiles', 'SSTILES', '650.121.2034', '2005-10-26', 'ST_CLERK', 3200, null, 123,50);
INSERT INTO empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario, comissao, id_supervisor, id_departamento) VALUES
(139, 'JohnSeo', 'JSEO', '650.121.2019', '2006-02-12', 'ST_CLERK', 2700, null, 123,50);
INSERT INTO empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario, comissao, id_supervisor, id_departamento) VALUES
(140, 'JoshuaPatel', 'JPATEL', '650.121.1834', '2006-04-06', 'ST_CLERK', 2500, null, 123,50);
INSERT INTO empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario, comissao, id_supervisor, id_departamento) VALUES
(141, 'TrennaRajs', 'TRAJS', '650.121.8009', '2003-10-17', 'ST_CLERK', 3500, null, 124,50);
INSERT INTO empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario, comissao, id_supervisor, id_departamento) VALUES
(142, 'CurtisDavies', 'CDAVIES', '650.121.2994', '2005-01-29', 'ST_CLERK', 3100, null, 124,50);
INSERT INTO empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario, comissao, id_supervisor, id_departamento) VALUES
(143, 'RandallMatos', 'RMATOS', '650.121.2874', '2006-03-15', 'ST_CLERK', 2600, null, 124,50);
INSERT INTO empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario, comissao, id_supervisor, id_departamento) VALUES
(144, 'PeterVargas', 'PVARGAS', '650.121.2004', '2006-07-09', 'ST_CLERK', 2500, null, 124,50);
INSERT INTO empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario, comissao, id_supervisor, id_departamento) VALUES
(145, 'JohnRussell', 'JRUSSEL', '011.44.1344.429268', '2004-10-01', 'SA_MAN', 14000, .4, 100,80);
INSERT INTO empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario, comissao, id_supervisor, id_departamento) VALUES
(146, 'KarenPartners', 'KPARTNER', '011.44.1344.467268', '2005-01-05', 'SA_MAN', 13500, .3, 100,80);
INSERT INTO empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario, comissao, id_supervisor, id_departamento) VALUES
(147, 'AlbertoErrazuriz', 'AERRAZUR', '011.44.1344.429278', '2005-03-10', 'SA_MAN', 12000, .3, 100,80);
INSERT INTO empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario, comissao, id_supervisor, id_departamento) VALUES
(148, 'GeraldCambrault', 'GCAMBRAU', '011.44.1344.619268', '2007-10-15', 'SA_MAN', 11000, .3, 100,80);
INSERT INTO empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario, comissao, id_supervisor, id_departamento) VALUES
(149, 'EleniZlotkey', 'EZLOTKEY', '011.44.1344.429018', '2008-01-29', 'SA_MAN', 10500, .2, 100,80);
INSERT INTO empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario, comissao, id_supervisor, id_departamento) VALUES
(150, 'PeterTucker', 'PTUCKER', '011.44.1344.129268', '2005-01-30', 'SA_REP', 10000, .3, 145,80);
INSERT INTO empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario, comissao, id_supervisor, id_departamento) VALUES
(151, 'DavidBernstein', 'DBERNSTE', '011.44.1344.345268', '2005-03-24', 'SA_REP', 9500, .25, 145,80);
INSERT INTO empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario, comissao, id_supervisor, id_departamento) VALUES
(152, 'PeterHall', 'PHALL', '011.44.1344.478968', '2005-08-20', 'SA_REP', 9000, .25, 145,80);
INSERT INTO empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario, comissao, id_supervisor, id_departamento) VALUES
(153, 'ChristopherOlsen', 'COLSEN', '011.44.1344.498718', '2006-03-30', 'SA_REP', 8000, .2, 145,80);
INSERT INTO empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario, comissao, id_supervisor, id_departamento) VALUES
(154, 'NanetteCambrault', 'NCAMBRAU', '011.44.1344.987668', '2006-12-09', 'SA_REP', 7500, .2, 145,80);
INSERT INTO empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario, comissao, id_supervisor, id_departamento) VALUES
(155, 'OliverTuvault', 'OTUVAULT', '011.44.1344.486508', '2007-11-23', 'SA_REP', 7000, .15, 145,80);
INSERT INTO empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario, comissao, id_supervisor, id_departamento) VALUES
(156, 'JanetteKing', 'JKING', '011.44.1345.429268', '2004-01-30', 'SA_REP', 10000, .35, 146,80);
INSERT INTO empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario, comissao, id_supervisor, id_departamento) VALUES
(157, 'PatrickSully', 'PSULLY', '011.44.1345.929268', '2004-03-04', 'SA_REP', 9500, .35, 146,80);
INSERT INTO empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario, comissao, id_supervisor, id_departamento) VALUES
(158, 'AllanMcEwen', 'AMCEWEN', '011.44.1345.829268', '2004-08-01', 'SA_REP', 9000, .35, 146,80);
INSERT INTO empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario, comissao, id_supervisor, id_departamento) VALUES
(159, 'LindseySmith', 'LSMITH', '011.44.1345.729268', '2005-03-10', 'SA_REP', 8000, .3, 146,80);
INSERT INTO empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario, comissao, id_supervisor, id_departamento) VALUES
(160, 'LouiseDoran', 'LDORAN', '011.44.1345.629268', '2005-12-15', 'SA_REP', 7500, .3, 146,80);
INSERT INTO empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario, comissao, id_supervisor, id_departamento) VALUES
(161, 'SarathSewall', 'SSEWALL', '011.44.1345.529268', '2006-11-03', 'SA_REP', 7000, .25, 146,80);
INSERT INTO empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario, comissao, id_supervisor, id_departamento) VALUES
(162, 'ClaraVishney', 'CVISHNEY', '011.44.1346.129268', '2005-11-11', 'SA_REP', 10500, .25, 147,80);
INSERT INTO empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario, comissao, id_supervisor, id_departamento) VALUES
(163, 'DanielleGreene', 'DGREENE', '011.44.1346.229268', '2007-03-19', 'SA_REP', 9500, .15, 147,80);
INSERT INTO empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario, comissao, id_supervisor, id_departamento) VALUES
(164, 'MatteaMarvins', 'MMARVINS', '011.44.1346.329268', '2008-01-24', 'SA_REP', 7200, .1, 147,80);
INSERT INTO empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario, comissao, id_supervisor, id_departamento) VALUES
(165, 'DavidLee', 'DLEE', '011.44.1346.529268', '2008-02-23', 'SA_REP', 6800, .1, 147,80);
INSERT INTO empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario, comissao, id_supervisor, id_departamento) VALUES
(166, 'SundarAnde', 'SANDE', '011.44.1346.629268', '2008-03-24', 'SA_REP', 6400, .1, 147,80);
INSERT INTO empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario, comissao, id_supervisor, id_departamento) VALUES
(167, 'AmitBanda', 'ABANDA', '011.44.1346.729268', '2008-04-21', 'SA_REP', 6200, .1, 147,80);
INSERT INTO empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario, comissao, id_supervisor, id_departamento) VALUES
(168, 'LisaOzer', 'LOZER', '011.44.1343.929268', '2005-03-11', 'SA_REP', 11500, .25, 148,80);
INSERT INTO empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario, comissao, id_supervisor, id_departamento) VALUES
(169, 'HarrisonBloom', 'HBLOOM', '011.44.1343.829268', '2006-03-23', 'SA_REP', 10000, .2, 148,80);
INSERT INTO empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario, comissao, id_supervisor, id_departamento) VALUES
(170, 'TaylerFox', 'TFOX', '011.44.1343.729268', '2006-01-24', 'SA_REP', 9600, .2, 148,80);
INSERT INTO empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario, comissao, id_supervisor, id_departamento) VALUES
(171, 'WilliamSmith', 'WSMITH', '011.44.1343.629268', '2007-02-23', 'SA_REP', 7400, .15, 148,80);
INSERT INTO empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario, comissao, id_supervisor, id_departamento) VALUES
(172, 'ElizabethBates', 'EBATES', '011.44.1343.529268', '2007-03-24', 'SA_REP', 7300, .15, 148,80);
INSERT INTO empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario, comissao, id_supervisor, id_departamento) VALUES
(173, 'SunditaKumar', 'SKUMAR', '011.44.1343.329268', '2008-04-21', 'SA_REP', 6100, .1, 148,80);
INSERT INTO empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario, comissao, id_supervisor, id_departamento) VALUES
(174, 'EllenAbel', 'EABEL', '011.44.1644.429267', '2004-05-11', 'SA_REP', 11000, .3, 149,80);
INSERT INTO empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario, comissao, id_supervisor, id_departamento) VALUES
(175, 'AlyssaHutton', 'AHUTTON', '011.44.1644.429266', '2005-03-19', 'SA_REP', 8800, .25, 149,80);
INSERT INTO empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario, comissao, id_supervisor, id_departamento) VALUES
(176, 'JonathonTaylor', 'JTAYLOR', '011.44.1644.429265', '2006-03-24', 'SA_REP', 8600, .2, 149,80);
INSERT INTO empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario, comissao, id_supervisor, id_departamento) VALUES
(177, 'JackLivingston', 'JLIVINGS', '011.44.1644.429264', '2006-04-23', 'SA_REP', 8400, .2, 149,80);
INSERT INTO empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario, comissao, id_supervisor, id_departamento) VALUES
(178, 'KimberelyGrant', 'KGRANT', '011.44.1644.429263', '2007-05-24', 'SA_REP', 7000, .15, 149,null);
INSERT INTO empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario, comissao, id_supervisor, id_departamento) VALUES
(179, 'CharlesJohnson', 'CJOHNSON', '011.44.1644.429262', '2008-01-04', 'SA_REP', 6200, .1, 149,80);
INSERT INTO empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario, comissao, id_supervisor, id_departamento) VALUES
(180, 'WinstonTaylor', 'WTAYLOR', '650.507.9876', '2006-01-24', 'SH_CLERK', 3200, null, 120,50);
INSERT INTO empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario, comissao, id_supervisor, id_departamento) VALUES
(181, 'JeanFleaur', 'JFLEAUR', '650.507.9877', '2006-02-23', 'SH_CLERK', 3100, null, 120,50);
INSERT INTO empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario, comissao, id_supervisor, id_departamento) VALUES
(182, 'MarthaSullivan', 'MSULLIVA', '650.507.9878', '2007-06-21', 'SH_CLERK', 2500, null, 120,50);
INSERT INTO empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario, comissao, id_supervisor, id_departamento) VALUES
(183, 'GirardGeoni', 'GGEONI', '650.507.9879', '2008-02-03', 'SH_CLERK', 2800, null, 120,50);
INSERT INTO empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario, comissao, id_supervisor, id_departamento) VALUES
(184, 'NanditaSarchand', 'NSARCHAN', '650.509.1876', '2004-01-27', 'SH_CLERK', 4200, null, 121,50);
INSERT INTO empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario, comissao, id_supervisor, id_departamento) VALUES
(185, 'AlexisBull', 'ABULL', '650.509.2876', '2005-02-20', 'SH_CLERK', 4100, null, 121,50);
INSERT INTO empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario, comissao, id_supervisor, id_departamento) VALUES
(186, 'JuliaDellinger', 'JDELLING', '650.509.3876', '2006-06-24', 'SH_CLERK', 3400, null, 121,50);
INSERT INTO empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario, comissao, id_supervisor, id_departamento) VALUES
(187, 'AnthonyCabrio', 'ACABRIO', '650.509.4876', '2007-02-07', 'SH_CLERK', 3000, null, 121,50);
INSERT INTO empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario, comissao, id_supervisor, id_departamento) VALUES
(188, 'KellyChung', 'KCHUNG', '650.505.1876', '2005-06-14', 'SH_CLERK', 3800, null, 122,50);
INSERT INTO empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario, comissao, id_supervisor, id_departamento) VALUES
(189, 'JenniferDilly', 'JDILLY', '650.505.2876', '2005-08-13', 'SH_CLERK', 3600, null, 122,50);
INSERT INTO empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario, comissao, id_supervisor, id_departamento) VALUES
(190, 'TimothyGates', 'TGATES', '650.505.3876', '2006-07-11', 'SH_CLERK', 2900, null, 122,50);
INSERT INTO empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario, comissao, id_supervisor, id_departamento) VALUES
(191, 'RandallPerkins', 'RPERKINS', '650.505.4876', '2007-12-19', 'SH_CLERK', 2500, null, 122,50);
INSERT INTO empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario, comissao, id_supervisor, id_departamento) VALUES
(192, 'SarahBell', 'SBELL', '650.501.1876', '2004-02-04', 'SH_CLERK', 4000, null, 123,50);
INSERT INTO empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario, comissao, id_supervisor, id_departamento) VALUES
(193, 'BritneyEverett', 'BEVERETT', '650.501.2876', '2005-03-03', 'SH_CLERK', 3900, null, 123,50);
INSERT INTO empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario, comissao, id_supervisor, id_departamento) VALUES
(194, 'SamuelMcCain', 'SMCCAIN', '650.501.3876', '2006-07-01', 'SH_CLERK', 3200, null, 123,50);
INSERT INTO empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario, comissao, id_supervisor, id_departamento) VALUES
(195, 'VanceJones', 'VJONES', '650.501.4876', '2007-03-17', 'SH_CLERK', 2800, null, 123,50);
INSERT INTO empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario, comissao, id_supervisor, id_departamento) VALUES
(196, 'AlanaWalsh', 'AWALSH', '650.507.9811', '2006-04-24', 'SH_CLERK', 3100, null, 124,50);
INSERT INTO empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario, comissao, id_supervisor, id_departamento) VALUES
(197, 'KevinFeeney', 'KFEENEY', '650.507.9822', '2006-05-23', 'SH_CLERK', 3000, null, 124,50);   

/*Seguem aqui os inserts do histórico de cargos. Estes me deram uma grande dor de cabeça,
 * devido ao sistema de datas, que não batia com a especificação do MySQL. Mantive as datas
 * as mesmas, mas reescrevi manualmente seus Inserts.
 */
       
       INSERT INTO historico_cargos
VALUES (102
       , '2001-01-03'
       , '2006-07-24'
       , 'IT_PROG'
       , 60);

INSERT INTO historico_cargos
VALUES (101
       , '1997-09-21'
       , '2001-10-27'
       , 'AC_ACCOUNT'
       , 110);

INSERT INTO historico_cargos
VALUES ( 103
       , '2001-10-28'
       , '2005-03-15'
       , 'AC_MGR'
       , 110);

INSERT INTO historico_cargos
VALUES ( 201
       , '2004-02-17'
       , '2007-12-19'
       , 'MK_REP'
       , 20);

INSERT INTO historico_cargos
VALUES  ( 114
        , '2006-03-24'
        , '2007-12-31'
        , 'ST_CLERK'
        , 50
        );

INSERT INTO historico_cargos
VALUES  ( 122
        , '2007-01-01'
        , '2007-12-31'
        , 'ST_CLERK'
        , 50
        );

INSERT INTO historico_cargos
VALUES  ( 200
        , '1995-09-17'
        , '2001-06-17'
        , 'AD_ASST'
        , 90
        );

INSERT INTO historico_cargos
VALUES  ( 176
        , '2006-03-24'
        , '2006-12-31'
        , 'SA_REP'
        , 80
        );

INSERT INTO historico_cargos
VALUES  ( 176
        , '2007-01-01'
        , '2007-12-31'
        , 'SA_MAN'
        , 80
        );

INSERT INTO historico_cargos
VALUES  ( 200
        , '2002-07-01'
        , '2006-12-31'
        , 'AC_ACCOUNT'
        , 90
        );
       
       -- Aqui seguem as constraints para foreign keys, que relacionam as diversas tabelas do projeto.

 ALTER TABLE hr.empregados ADD CONSTRAINT cargos_empregados_fk -- Adiciona a Foreign Key Id Cargo, que referencia a tabela cargos.
FOREIGN KEY (id_cargo)
REFERENCES cargos (id_cargo)
;

ALTER TABLE hr.historico_cargos ADD CONSTRAINT cargos_historico_cargos_fk -- Adiciona a foreign key id cargo, que referencia a tabela cargos. (Em histórico cargos)
FOREIGN KEY (id_cargo)
REFERENCES cargos (id_cargo)
;

ALTER TABLE paises ADD CONSTRAINT regioes_paises_fk -- Adiciona a foreign key id região na tabela países, que referencia a tabela regiões.
FOREIGN KEY (id_regiao)
REFERENCES regioes (id_regiao)
;

ALTER TABLE localizacoes ADD CONSTRAINT paises_localizacoes_fk -- Adiciona a foreign key id país na tabela localizações, que se relaciona com a tabela países.
FOREIGN KEY (id_pais)
REFERENCES paises (id_pais)
;

ALTER TABLE hr.localizacoes ADD CONSTRAINT regioes_localizacoes_fk -- Adiciona a foreign key id país na tabela localizações, que se relaciona com a tabela de regiões.
FOREIGN KEY (id_pais)
REFERENCES paises (id_pais)
;

ALTER TABLE departamentos ADD CONSTRAINT localizacoes_departamentos_fk -- Adiciona a foreign key id localização, que se relaciona com a tabela localizações.
FOREIGN KEY (id_localizacao)
REFERENCES localizacoes (id_localizacao)
;

ALTER TABLE empregados ADD CONSTRAINT empregados_empregados_fk -- Adiciona a foreign key id supervisor na tabela empregados, que se auto-relaciona com si mesma.
FOREIGN KEY (id_supervisor)
REFERENCES empregados (id_empregado)
;

ALTER TABLE departamentos ADD CONSTRAINT supervisor_departamentos_fk -- Adiciona a foreign key id supervisor na tabela departamentos.
FOREIGN KEY (id_supervisor)
REFERENCES empregados (id_empregado)
;

ALTER TABLE hr.historico_cargos ADD CONSTRAINT departamentos_historico_cargos_fk -- Adiciona a foreign key da tabela histórico, que se relaciona com departamentos.
FOREIGN KEY (id_departamento)
REFERENCES departamentos (id_departamento)
;

ALTER TABLE hr.historico_cargos ADD CONSTRAINT empregados_historico_cargos_fk -- Adiciona a foreign key da tabela histórico, que se relaciona com empregados.
FOREIGN KEY (id_empregado)
REFERENCES empregados (id_empregado)
;

ALTER TABLE departamentos ADD CONSTRAINT empregados_departamentos_fk  -- Adiciona a foreign key da tabela departamentos, que se relaciona com empregados.
FOREIGN KEY (id_gerente)
REFERENCES empregados (id_empregado)
;
