
CREATE TABLE cargos (
                id_cargo VARCHAR(10) NOT NULL,
                cargo VARCHAR(35) NOT NULL,
                salario_minimo DECIMAL(8,2),
                salario_maximo DECIMAL(8,2),
                CONSTRAINT id_cargo PRIMARY KEY (id_cargo)
);
COMMENT ON TABLE cargos IS 'Agora vamos para a tabela dos cargos. Isso me faz questionar que tipo de empresa é essa? Nunca é deixado claro. Acho que esse sistema de banco de dados pode ser útil para várias empresas, sem especificidade. Prático.';
COMMENT ON COLUMN cargos.id_cargo IS 'Agora cargos também tem IDs. Eu tô perdendo a cabeça. Pra quê ID pra tudo?';
COMMENT ON COLUMN cargos.cargo IS 'Os cargos da empresa. Me pergunto se o CEO também está registrado aqui?';
COMMENT ON COLUMN cargos.salario_minimo IS 'Tô na universidade pra fugir disso aqui.';
COMMENT ON COLUMN cargos.salario_maximo IS 'O salário máximo. Isso me faz pensar, qual é o maior salário do mundo? Quem é a pessoa que, exercendo uma profissão, fatura mais no mundo inteiro? Devo lembrar de pesquisar no Google depois.';


CREATE UNIQUE INDEX AK
 ON cargos
 ( cargo );

CREATE TABLE regions (
                id_regiao INTEGER NOT NULL,
                nome VARCHAR(25) NOT NULL,
                CONSTRAINT id_regiao PRIMARY KEY (id_regiao)
);
COMMENT ON TABLE regions IS 'Essa é a tabela de regiões. É a primeira tabela que eu decidi recriar no SQL Power Architect, não só por ser uma das mais simples do projeto, como por se conectar com apenas outra tabela através de uma PK, a tabela países.';
COMMENT ON COLUMN regions.id_regiao IS 'Tabela do ID de região. Eu estava em dúvidas sobre o que exatamente é um ''''ID de região''''. Entendo que é um número, mas não conhecia o propósito. É como um DDD de celular? Tive de pesquisar para entender melhor.';
COMMENT ON COLUMN regions.nome IS 'Essa é a coluna Nome. O que mais me deu dificuldades nessa parte foi descobrir como limitar a quantidade de Varchar para 25.';


CREATE UNIQUE INDEX regioes_idx
 ON regions
 ( nome );

CREATE TABLE regioes (
                id_pais CHAR(2) NOT NULL,
                nome VARCHAR(50) NOT NULL,
                id_regiao INTEGER NOT NULL,
                CONSTRAINT id_pais PRIMARY KEY (id_pais)
);
COMMENT ON TABLE regioes IS 'Segunda tabela criada. O desafio na primeira foi identificar a Alternate Key. O desafio nessa vai ser conectar à Primary Key com a Foreign Key. Vou descobrir!';
COMMENT ON COLUMN regioes.id_pais IS 'Esse é o identificador do ID País. Deve se conectar com o ID País da terceira tabela, de Localizações. Como eu vou criar esse relacionamento, só Deus sabe.';
COMMENT ON COLUMN regioes.nome IS 'Essa é a coluna que identifica o nome das regiões. Também é a portadora da Alternate Key dentre esses campos.';
COMMENT ON COLUMN regioes.id_regiao IS 'Tabela do ID de região. Eu estava em dúvidas sobre o que exatamente é um ''''ID de região''''. Entendo que é um número, mas não conhecia o propósito. É como um DDD de celular? Tive de pesquisar para entender melhor.';


CREATE UNIQUE INDEX regioes_idx
 ON regioes
 ( nome );

CREATE TABLE localizacoes (
                id_localizacao INTEGER NOT NULL,
                cidade VARCHAR(50),
                uf VARCHAR(25),
                cep VARCHAR(12),
                id_pais CHAR(2) NOT NULL,
                CONSTRAINT id_localizacoes PRIMARY KEY (id_localizacao)
);
COMMENT ON TABLE localizacoes IS 'Essa é a terceira tabela com a qual vamos trabalhar, a tabela de localizações. Ela deve se conectar tanto com a tabela de regiões, quanto com a tabela de departamentos. Então deve se mostrar como um desafio interessante.';
COMMENT ON COLUMN localizacoes.id_localizacao IS 'O ID de localizações específicas. Não tenho muita certeza de como todos esses IDs funcionam, pra ser sincero. Esse campo atua como a Primary Key que se relaciona com a tabela de departamentos.';
COMMENT ON COLUMN localizacoes.cidade IS 'As cidades onde os departamentos e os empregados devem estar localizados. Cara, eu queria viver em uma cidade maneira como Shibuya no Japão. As cidades do Brasil são tão caídas';
COMMENT ON COLUMN localizacoes.uf IS 'UF equivale à Unidade Federativa, eu presumo?
Desculpe, estou muito cansado e não tô raciocinando direito hoje. Imploro ao professor Abrantes, em sua infinita sabedoria e misericórdia, que não reduza minha nota por causa dessas anotações bestas.';
COMMENT ON COLUMN localizacoes.cep IS 'Esse  é o campo para o CEP. Du-di-du-di-da. Não tem muito o que comentar.';
COMMENT ON COLUMN localizacoes.id_pais IS 'Esse é o identificador do ID País. Deve se conectar com o ID País da terceira tabela, de Localizações. Como eu vou criar esse relacionamento, só Deus sabe.';


CREATE TABLE departamentos (
                id_departamento INTEGER NOT NULL,
                nome VARCHAR(50),
                id_localizacao INTEGER NOT NULL,
                id_gerente INTEGER,
                CONSTRAINT id_departamento PRIMARY KEY (id_departamento)
);
COMMENT ON TABLE departamentos IS 'Essa é a quarta tabela que eu recriei. Também é a primeira que eu pinto de uma cor diferente. A tabela departamento reúne campos que se conectam mais com outras tabelas, como o Id de Localização e o Id Gerente. Sua Primary Key é a Id de Departamento';
COMMENT ON COLUMN departamentos.id_departamento IS 'Esse é mais um campo Integer, da tabela de Departamentos. É o ID de Departamento. Eu não tinha ideia que Departamentos precisavam de IDs. Não é mais fácil só identificar pelo nome do departamento?';
COMMENT ON COLUMN departamentos.nome IS 'O nome dos departamentos. Me pergunto se alguns deles tem nomes legais, tipo ''''Processamento de Macrodados''''. Ei professor, se estiver lendo isso, dê uma olhada em uma série chamada ''''Ruptura'''', da Apple. Acho que vai gostar';
COMMENT ON COLUMN departamentos.id_localizacao IS 'O ID de localizações específicas. Não tenho muita certeza de como todos esses IDs funcionam, pra ser sincero. Esse campo atua como a Primary Key que se relaciona com a tabela de departamentos.';
COMMENT ON COLUMN departamentos.id_gerente IS 'Esse ID Gerente está clássificado no Pset do Abrantes como uma *Foreign Key*... porém, ele não se conecta à nenhuma outra tabela ou campo. Suponho então que esse seja um dos erros que o professor mencionou?';


CREATE UNIQUE INDEX AK
 ON departamentos
 ( nome );

CREATE TABLE empregados (
                id_empregado INTEGER NOT NULL,
                nome VARCHAR(75) NOT NULL,
                email VARCHAR(35) NOT NULL,
                telefone VARCHAR(20),
                data_contratacao DATE NOT NULL,
                id_cargo VARCHAR(10) NOT NULL,
                salario DECIMAL(8,2),
                comissao DECIMAL(4,2),
                id_departamento INTEGER NOT NULL,
                id_supervisor INTEGER,
                CONSTRAINT id_empregado PRIMARY KEY (id_empregado)
);
COMMENT ON TABLE empregados IS 'Essa é a tabela de empregados. É de longe a maior tabela desse modelo lógico, e consta com muitos campos. Uma das coisas que eu reparei é que além de se conectar com muitas outras tabelas, aparentemente ela se conecta duas vezes com a tabela de departamentos? Seria isso um erro (?)';
COMMENT ON COLUMN empregados.id_empregado IS 'Esse é o ID dos empregados. Agora até empregados tem IDs? Não bastava o ID das regiões, países e departamentos? Bem, acho que ID de empregados é bem mais comum, na verdade.';
COMMENT ON COLUMN empregados.nome IS 'O nome dos empregados. O meu seria ''''Raphael Braian C.''''';
COMMENT ON COLUMN empregados.email IS 'Esse é o campo dos e-mails dos empregados. Cara, deve ser bom trabalhar com Banco de Dados se você estiver solteiro. Tem alguma moça bonita no escritório e você quer o e-mail dela? Só olhar diretamente aqui, nem precisa perguntar.';
COMMENT ON COLUMN empregados.telefone IS 'Aqui é o campo para o telefone dos funcionários. Se ousar olhar aqui, precisa resistir à tentação de fazer trotes constantes nos seus colegas de trabalho.';
COMMENT ON COLUMN empregados.data_contratacao IS 'Nosso primeiro campo de data, e é a data de contratação do funcionário. Caso você precise fazer uma festa de aniversário de contratação surpresa. Na verdade, isso nem sequer existe, não é? Mas seria divertido.';
COMMENT ON COLUMN empregados.id_cargo IS 'Agora cargos também tem IDs. Eu tô perdendo a cabeça. Pra quê ID pra tudo?';
COMMENT ON COLUMN empregados.salario IS 'Agora, é disso que estamos falando. O salário. A melhor ferramenta de exploração que existe, e ao mesmo tempo, a fonte da nossa felicidade.';
COMMENT ON COLUMN empregados.comissao IS 'Uma comissão em dinheiro à ser paga.';
COMMENT ON COLUMN empregados.id_departamento IS 'Esse é mais um campo Integer, da tabela de Departamentos. É o ID de Departamento. Eu não tinha ideia que Departamentos precisavam de IDs. Não é mais fácil só identificar pelo nome do departamento?';
COMMENT ON COLUMN empregados.id_supervisor IS 'E esse é o ID do supervisor. Provavelmente um cara muito chato que gosta de se meter no trabalho dos outros.';


CREATE UNIQUE INDEX AK
 ON empregados
 ( email );

CREATE TABLE historico_cargos (
                id_empregado INTEGER NOT NULL,
                data_inicial DATE NOT NULL,
                data_final DATE NOT NULL,
                id_cargo VARCHAR(10) NOT NULL,
                id_departamento INTEGER NOT NULL,
                CONSTRAINT data_inicial PRIMARY KEY (id_empregado, data_inicial)
);
COMMENT ON TABLE historico_cargos IS 'Essa é a última tabela que estou fazendo, a de histórico de cargos. Depois de concluir, irei trabalhar em resolver alguns errinhos e garantir o funcionamento desse modelo lógico.';
COMMENT ON COLUMN historico_cargos.id_empregado IS 'Esse é o ID dos empregados. Agora até empregados tem IDs? Não bastava o ID das regiões, países e departamentos? Bem, acho que ID de empregados é bem mais comum, na verdade.';
COMMENT ON COLUMN historico_cargos.data_inicial IS 'Essa aqui é a data inicial do histórico de cargos.';
COMMENT ON COLUMN historico_cargos.data_final IS 'A data final do histórico de cargos. Isso me lembra que a data final de entrega desse Pset é dia 15! Preciso me apressar.';
COMMENT ON COLUMN historico_cargos.id_cargo IS 'Agora cargos também tem IDs. Eu tô perdendo a cabeça. Pra quê ID pra tudo?';
COMMENT ON COLUMN historico_cargos.id_departamento IS 'Esse é mais um campo Integer, da tabela de Departamentos. É o ID de Departamento. Eu não tinha ideia que Departamentos precisavam de IDs. Não é mais fácil só identificar pelo nome do departamento?';


ALTER TABLE empregados ADD CONSTRAINT cargos_empregados_fk
FOREIGN KEY (id_cargo)
REFERENCES cargos (id_cargo)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE historico_cargos ADD CONSTRAINT cargos_historico_cargos_fk
FOREIGN KEY (id_cargo)
REFERENCES cargos (id_cargo)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE regioes ADD CONSTRAINT regions_regioes_fk
FOREIGN KEY (id_regiao)
REFERENCES regions (id_regiao)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE localizacoes ADD CONSTRAINT regioes_localizacoes_fk
FOREIGN KEY (id_pais)
REFERENCES regioes (id_pais)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE departamentos ADD CONSTRAINT localizacoes_departamentos_fk
FOREIGN KEY (id_localizacao)
REFERENCES localizacoes (id_localizacao)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE empregados ADD CONSTRAINT departamentos_empregados_fk
FOREIGN KEY (id_departamento)
REFERENCES departamentos (id_departamento)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE historico_cargos ADD CONSTRAINT departamentos_historico_cargos_fk
FOREIGN KEY (id_departamento)
REFERENCES departamentos (id_departamento)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE historico_cargos ADD CONSTRAINT empregados_historico_cargos_fk
FOREIGN KEY (id_empregado)
REFERENCES empregados (id_empregado)
ON DELETE NO ACTION
ON UPDATE NO ACTION
DEFERRABLE INITIALLY DEFERRED;
