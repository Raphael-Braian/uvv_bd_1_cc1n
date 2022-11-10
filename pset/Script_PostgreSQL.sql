
CREATE TABLE public.cargos (
                id_cargo VARCHAR(10) NOT NULL,
                cargo VARCHAR(35) NOT NULL,
                salario_minimo NUMERIC(8,2),
                salario_maximo NUMERIC(8,2),
                CONSTRAINT id_cargo PRIMARY KEY (id_cargo)
);
COMMENT ON TABLE public.cargos IS 'Agora vamos para a tabela dos cargos. Isso me faz questionar que tipo de empresa é essa? Nunca é deixado claro. Acho que esse sistema de banco de dados pode ser útil para várias empresas, sem especificidade. Prático.';
COMMENT ON COLUMN public.cargos.id_cargo IS 'ê ID pra tudo?';
COMMENT ON COLUMN public.cargos.cargo IS 'trado aqui?';
COMMENT ON COLUMN public.cargos.salario_minimo IS 'Tô na universidade pra fugir disso aqui.';
COMMENT ON COLUMN public.cargos.salario_maximo IS 'do mundo? Quem é a pessoa que, exercendo uma profissão, fatura mais no mundo inteiro? Devo lembrar de pesquisar no Google depois.';


CREATE UNIQUE INDEX ak
 ON public.cargos
 ( cargo );

CREATE TABLE public.regioes (
                id_regiao INTEGER NOT NULL,
                nome VARCHAR(25) NOT NULL,
                CONSTRAINT id_regiao PRIMARY KEY (id_regiao)
);
COMMENT ON TABLE public.regioes IS 'Essa é a tabela de regiões. É a primeira tabela que eu decidi recriar no SQL Power Architect, não só por ser uma das mais simples do projeto, como por se conectar com apenas outra tabela através de uma PK, a tabela países.';
COMMENT ON COLUMN public.regioes.id_regiao IS 'não conhecia o propósito. É como um DDD de celular? Tive de pesquisar para entender melhor.';
COMMENT ON COLUMN public.regioes.nome IS 'arte foi descobrir como limitar a quantidade de Varchar para 25.';


CREATE UNIQUE INDEX regioes_idx
 ON public.regioes
 ( nome );

CREATE TABLE public.regioes_1 (
                id_pais CHAR(2) NOT NULL,
                nome VARCHAR(50) NOT NULL,
                id_regiao INTEGER NOT NULL,
                CONSTRAINT id_pais PRIMARY KEY (id_pais)
);
COMMENT ON TABLE public.regioes_1 IS 'Segunda tabela criada. O desafio na primeira foi identificar a Alternate Key. O desafio nessa vai ser conectar à Primary Key com a Foreign Key. Vou descobrir!';
COMMENT ON COLUMN public.regioes_1.id_pais IS 'País da terceira tabela, de Localizações. Como eu vou criar esse relacionamento, só Deus sabe.';
COMMENT ON COLUMN public.regioes_1.nome IS 'a portadora da Alternate Key dentre esses campos.';
COMMENT ON COLUMN public.regioes_1.id_regiao IS 'tamente é um ''''ID de região''''. Entendo que é um número, mas não conhecia o propósito. É como um DDD de celular? Tive de pesquisar para entender melhor.';


CREATE UNIQUE INDEX regioes_idx
 ON public.regioes_1
 ( nome );

CREATE TABLE public.localizacoes (
                id_localizacao INTEGER NOT NULL,
                cidade VARCHAR(50),
                uf VARCHAR(25),
                cep VARCHAR(12),
                id_pais CHAR(2) NOT NULL,
                CONSTRAINT id_localizacoes PRIMARY KEY (id_localizacao)
);
COMMENT ON TABLE public.localizacoes IS 'Essa é a terceira tabela com a qual vamos trabalhar, a tabela de localizações. Ela deve se conectar tanto com a tabela de regiões, quanto com a tabela de departamentos. Então deve se mostrar como um desafio interessante.';
COMMENT ON COLUMN public.localizacoes.id_localizacao IS 'como todos esses IDs funcionam, pra ser sincero. Esse campo atua como a Primary Key que se relaciona com a tabela de departamentos.';
COMMENT ON COLUMN public.localizacoes.cidade IS 'localizados. Cara, eu queria viver em uma cidade maneira como Shibuya no Japão. As cidades do Brasil são tão caídas';
COMMENT ON COLUMN public.localizacoes.uf IS 'u muito cansado e não tô raciocinando direito hoje. Imploro ao professor Abrantes, em sua infinita sabedoria e misericórdia, que não reduza minha nota por causa dessas anotações bestas.';
COMMENT ON COLUMN public.localizacoes.cep IS 'que comentar.';
COMMENT ON COLUMN public.localizacoes.id_pais IS 'País da terceira tabela, de Localizações. Como eu vou criar esse relacionamento, só Deus sabe.';


CREATE TABLE public.departamentos (
                id_departamento INTEGER NOT NULL,
                nome VARCHAR(50),
                id_localizacao INTEGER NOT NULL,
                id_gerente INTEGER NOT NULL,
                CONSTRAINT id_departamento PRIMARY KEY (id_departamento)
);
COMMENT ON TABLE public.departamentos IS 'Essa é a quarta tabela que eu recriei. Também é a primeira que eu pinto de uma cor diferente. A tabela departamento reúne campos que se conectam mais com outras tabelas, como o Id de Localização e o Id Gerente. Sua Primary Key é a Id de Departamento';
COMMENT ON COLUMN public.departamentos.id_departamento IS 'o ID de Departamento. Eu não tinha ideia que Departamentos precisavam de IDs. Não é mais fácil só identificar pelo nome do departamento?';
COMMENT ON COLUMN public.departamentos.nome IS 'mes legais, tipo ''''Processamento de Macrodados''''. Ei professor, se estiver lendo isso, dê uma olhada em uma série chamada ''''Ruptura'''', da Apple. Acho que vai gostar';
COMMENT ON COLUMN public.departamentos.id_localizacao IS 'como todos esses IDs funcionam, pra ser sincero. Esse campo atua como a Primary Key que se relaciona com a tabela de departamentos.';
COMMENT ON COLUMN public.departamentos.id_gerente IS 'o bastava o ID das regiões, países e departamentos? Bem, acho que ID de empregados é bem mais comum, na verdade.';


CREATE UNIQUE INDEX ak
 ON public.departamentos
 ( nome );

CREATE TABLE public.empregados (
                id_empregado INTEGER NOT NULL,
                nome VARCHAR(75) NOT NULL,
                email VARCHAR(35) NOT NULL,
                telefone VARCHAR(20),
                data_contratacao DATE NOT NULL,
                id_cargo VARCHAR(10) NOT NULL,
                salario NUMERIC(8,2),
                comissao NUMERIC(4,2),
                id_departamento INTEGER NOT NULL,
                id_supervisor INTEGER NOT NULL,
                CONSTRAINT id_empregado PRIMARY KEY (id_empregado)
);
COMMENT ON TABLE public.empregados IS 'tos? Seria isso um erro (?)';
COMMENT ON COLUMN public.empregados.id_empregado IS 'o bastava o ID das regiões, países e departamentos? Bem, acho que ID de empregados é bem mais comum, na verdade.';
COMMENT ON COLUMN public.empregados.nome IS 'O nome dos empregados. O meu seria ''''Raphael Braian C.''''';
COMMENT ON COLUMN public.empregados.email IS 'm trabalhar com Banco de Dados se você estiver solteiro. Tem alguma moça bonita no escritório e você quer o e-mail dela? Só olhar diretamente aqui, nem precisa perguntar.';
COMMENT ON COLUMN public.empregados.telefone IS 'har aqui, precisa resistir à tentação de fazer trotes constantes nos seus colegas de trabalho.';
COMMENT ON COLUMN public.empregados.data_contratacao IS 'uncionário. Caso você precise fazer uma festa de aniversário de contratação surpresa. Na verdade, isso nem sequer existe, não é? Mas seria divertido.';
COMMENT ON COLUMN public.empregados.id_cargo IS 'ê ID pra tudo?';
COMMENT ON COLUMN public.empregados.salario IS 'amenta de exploração que existe, e ao mesmo tempo, a fonte da nossa felicidade.';
COMMENT ON COLUMN public.empregados.comissao IS 'Uma comissão em dinheiro à ser paga.';
COMMENT ON COLUMN public.empregados.id_departamento IS 'o ID de Departamento. Eu não tinha ideia que Departamentos precisavam de IDs. Não é mais fácil só identificar pelo nome do departamento?';
COMMENT ON COLUMN public.empregados.id_supervisor IS 'se relaciona com a própria tabela. Tive dificuldades de entender como fazer isso, então tirei algumas dúvidas com colegas.';


CREATE UNIQUE INDEX ak
 ON public.empregados
 ( email );

CREATE TABLE public.historico_cargos (
                data_inicial DATE NOT NULL,
                id_empregado_PFK INTEGER NOT NULL,
                data_final DATE NOT NULL,
                id_cargo VARCHAR(10) NOT NULL,
                id_departamento INTEGER NOT NULL,
                CONSTRAINT data_inicial PRIMARY KEY (data_inicial, id_empregado_PFK)
);
COMMENT ON TABLE public.historico_cargos IS 'Essa é a última tabela que estou fazendo, a de histórico de cargos. Depois de concluir, irei trabalhar em resolver alguns errinhos e garantir o funcionamento desse modelo lógico.';
COMMENT ON COLUMN public.historico_cargos.data_inicial IS 'Essa aqui é a data inicial do histórico de cargos.';
COMMENT ON COLUMN public.historico_cargos.id_empregado_PFK IS 'o bastava o ID das regiões, países e departamentos? Bem, acho que ID de empregados é bem mais comum, na verdade.';
COMMENT ON COLUMN public.historico_cargos.data_final IS 'ta final de entrega desse Pset é dia 15! Preciso me apressar.';
COMMENT ON COLUMN public.historico_cargos.id_cargo IS 'ê ID pra tudo?';
COMMENT ON COLUMN public.historico_cargos.id_departamento IS 'o ID de Departamento. Eu não tinha ideia que Departamentos precisavam de IDs. Não é mais fácil só identificar pelo nome do departamento?';


ALTER TABLE public.empregados ADD CONSTRAINT cargos_empregados_fk
FOREIGN KEY (id_cargo)
REFERENCES public.cargos (id_cargo)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.historico_cargos ADD CONSTRAINT cargos_historico_cargos_fk
FOREIGN KEY (id_cargo)
REFERENCES public.cargos (id_cargo)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.regioes_1 ADD CONSTRAINT regions_regioes_fk
FOREIGN KEY (id_regiao)
REFERENCES public.regioes (id_regiao)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.localizacoes ADD CONSTRAINT regioes_localizacoes_fk
FOREIGN KEY (id_pais)
REFERENCES public.regioes_1 (id_pais)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.departamentos ADD CONSTRAINT localizacoes_departamentos_fk
FOREIGN KEY (id_localizacao)
REFERENCES public.localizacoes (id_localizacao)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.empregados ADD CONSTRAINT departamentos_empregados_fk
FOREIGN KEY (id_departamento)
REFERENCES public.departamentos (id_departamento)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.historico_cargos ADD CONSTRAINT departamentos_historico_cargos_fk
FOREIGN KEY (id_departamento)
REFERENCES public.departamentos (id_departamento)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.historico_cargos ADD CONSTRAINT empregados_historico_cargos_fk
FOREIGN KEY (id_empregado_PFK)
REFERENCES public.empregados (id_empregado)
ON DELETE NO ACTION
ON UPDATE NO ACTION
DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE public.empregados ADD CONSTRAINT empregados_empregados_fk
FOREIGN KEY (id_supervisor)
REFERENCES public.empregados (id_empregado)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.departamentos ADD CONSTRAINT empregados_departamentos_fk
FOREIGN KEY (id_gerente)
REFERENCES public.empregados (id_empregado)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
