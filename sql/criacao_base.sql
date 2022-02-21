-- DROP SCHEMA db_atl;

CREATE SCHEMA db_atl AUTHORIZATION postgres;

-- DROP SEQUENCE db_atl.tb_prova_cod_prova_seq;

CREATE SEQUENCE db_atl.tb_prova_cod_prova_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;

-- Permissions

ALTER SEQUENCE db_atl.tb_prova_cod_prova_seq OWNER TO postgres;
GRANT ALL ON SEQUENCE db_atl.tb_prova_cod_prova_seq TO postgres;

-- DROP SEQUENCE db_atl.tb_prova_cod_prova_seq1;

CREATE SEQUENCE db_atl.tb_prova_cod_prova_seq1
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;

-- Permissions

ALTER SEQUENCE db_atl.tb_prova_cod_prova_seq1 OWNER TO postgres;
GRANT ALL ON SEQUENCE db_atl.tb_prova_cod_prova_seq1 TO postgres;

-- DROP SEQUENCE db_atl.tb_prova_cod_prova_seq2;

CREATE SEQUENCE db_atl.tb_prova_cod_prova_seq2
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;

-- Permissions

ALTER SEQUENCE db_atl.tb_prova_cod_prova_seq2 OWNER TO postgres;
GRANT ALL ON SEQUENCE db_atl.tb_prova_cod_prova_seq2 TO postgres;

-- DROP SEQUENCE db_atl.tb_prova_cod_prova_seq3;

CREATE SEQUENCE db_atl.tb_prova_cod_prova_seq3
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;

-- Permissions

ALTER SEQUENCE db_atl.tb_prova_cod_prova_seq3 OWNER TO postgres;
GRANT ALL ON SEQUENCE db_atl.tb_prova_cod_prova_seq3 TO postgres;

-- DROP SEQUENCE db_atl.tb_prova_competicao_cod_prova_competicao_seq;

CREATE SEQUENCE db_atl.tb_prova_competicao_cod_prova_competicao_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;

-- Permissions

ALTER SEQUENCE db_atl.tb_prova_competicao_cod_prova_competicao_seq OWNER TO postgres;
GRANT ALL ON SEQUENCE db_atl.tb_prova_competicao_cod_prova_competicao_seq TO postgres;

-- DROP SEQUENCE db_atl.tb_prova_competicao_cod_prova_competicao_seq1;

CREATE SEQUENCE db_atl.tb_prova_competicao_cod_prova_competicao_seq1
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;

-- Permissions

ALTER SEQUENCE db_atl.tb_prova_competicao_cod_prova_competicao_seq1 OWNER TO postgres;
GRANT ALL ON SEQUENCE db_atl.tb_prova_competicao_cod_prova_competicao_seq1 TO postgres;

-- DROP SEQUENCE db_atl.tb_prova_competicao_cod_prova_competicao_seq2;

CREATE SEQUENCE db_atl.tb_prova_competicao_cod_prova_competicao_seq2
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;

-- Permissions

ALTER SEQUENCE db_atl.tb_prova_competicao_cod_prova_competicao_seq2 OWNER TO postgres;
GRANT ALL ON SEQUENCE db_atl.tb_prova_competicao_cod_prova_competicao_seq2 TO postgres;

-- DROP SEQUENCE db_atl.tb_wheter_cod_wheter_seq;

CREATE SEQUENCE db_atl.tb_wheter_cod_wheter_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;

-- Permissions

ALTER SEQUENCE db_atl.tb_wheter_cod_wheter_seq OWNER TO postgres;
GRANT ALL ON SEQUENCE db_atl.tb_wheter_cod_wheter_seq TO postgres;
-- db_atl.tb_atleta definition

-- Drop table

-- DROP TABLE db_atl.tb_atleta;

CREATE TABLE db_atl.tb_atleta (
	cod_atleta int4 NOT NULL,
	nome_atleta varchar(250) NULL,
	pais_atleta varchar(100) NULL,
	idade_atleta int4 NULL,
	nascimento_atleta date NULL,
	url_foto_atleta varchar(250) NULL,
	url_atleta varchar(250) NULL,
	CONSTRAINT tb_atleta_pkey PRIMARY KEY (cod_atleta)
);

-- Permissions

ALTER TABLE db_atl.tb_atleta OWNER TO postgres;
GRANT ALL ON TABLE db_atl.tb_atleta TO postgres;


-- db_atl.tb_competicao definition

-- Drop table

-- DROP TABLE db_atl.tb_competicao;

CREATE TABLE db_atl.tb_competicao (
	cod_competicao int4 NOT NULL,
	nome_competição varchar(150) NOT NULL,
	score_competicao varchar(10) NULL,
	score_participacao_competicao varchar(10) NULL,
	score_result_competicao varchar(10) NULL,
	data_inicial_competicao date NOT NULL,
	data_final_competicao date NOT NULL,
	cidade_competicao varchar(100) NOT NULL,
	pais_competicao varchar(100) NOT NULL,
	ps_place_competicao varchar(10) NULL,
	rs_place_competicao varchar(10) NULL,
	CONSTRAINT tb_competicao_pkey PRIMARY KEY (cod_competicao)
);

-- Permissions

ALTER TABLE db_atl.tb_competicao OWNER TO postgres;
GRANT ALL ON TABLE db_atl.tb_competicao TO postgres;


-- db_atl.tb_prova definition

-- Drop table

-- DROP TABLE db_atl.tb_prova;

CREATE TABLE db_atl.tb_prova (
	cod_prova serial4 NOT NULL,
	nome_prova varchar(100) NOT NULL,
	genero_prova varchar(10) NOT NULL,
	CONSTRAINT tb_prova_pkey PRIMARY KEY (cod_prova),
	CONSTRAINT tb_prova_un UNIQUE (nome_prova, genero_prova)
);

-- Permissions

ALTER TABLE db_atl.tb_prova OWNER TO postgres;
GRANT ALL ON TABLE db_atl.tb_prova TO postgres;


-- db_atl.tb_wheter definition

-- Drop table

-- DROP TABLE db_atl.tb_wheter;

CREATE TABLE db_atl.tb_wheter (
	cod_wheter serial4 NOT NULL,
	data_prova_competicao date NULL,
	cidade_competicao varchar(100) NOT NULL,
	pais_competicao varchar(100) NOT NULL,
	info_wheter jsonb NULL,
	CONSTRAINT tb_wheter_pkey PRIMARY KEY (cod_wheter),
	CONSTRAINT tb_wheter_un UNIQUE (data_prova_competicao, pais_competicao, cidade_competicao)
);

-- Permissions

ALTER TABLE db_atl.tb_wheter OWNER TO postgres;
GRANT ALL ON TABLE db_atl.tb_wheter TO postgres;


-- db_atl.tb_prova_competicao definition

-- Drop table

-- DROP TABLE db_atl.tb_prova_competicao;

CREATE TABLE db_atl.tb_prova_competicao (
	cod_prova_competicao serial4 NOT NULL,
	cod_competicao int4 NOT NULL,
	cod_prova int4 NOT NULL,
	score_prova_competicao int4 NOT NULL,
	data_prova_competicao date NOT NULL,
	CONSTRAINT tb_prova_competicao_pkey PRIMARY KEY (cod_competicao, cod_prova, cod_prova_competicao),
	CONSTRAINT unique_comptetion UNIQUE (cod_prova_competicao),
	CONSTRAINT unique_comptetion_1 UNIQUE (cod_competicao, cod_prova),
	CONSTRAINT tb_prova_competicao_cod_competicao_fkey FOREIGN KEY (cod_competicao) REFERENCES db_atl.tb_competicao(cod_competicao),
	CONSTRAINT tb_prova_competicao_cod_prova_fkey FOREIGN KEY (cod_prova) REFERENCES db_atl.tb_prova(cod_prova)
);

-- Permissions

ALTER TABLE db_atl.tb_prova_competicao OWNER TO postgres;
GRANT ALL ON TABLE db_atl.tb_prova_competicao TO postgres;


-- db_atl.tb_atleta_prova_competicao definition

-- Drop table

-- DROP TABLE db_atl.tb_atleta_prova_competicao;

CREATE TABLE db_atl.tb_atleta_prova_competicao (
	"result" varchar(20) NOT NULL,
	score int4 NOT NULL,
	team_code int4 NULL,
	cod_atleta int4 NOT NULL,
	cod_prova_competicao int4 NOT NULL,
	CONSTRAINT tb_atleta_prova_competicao_pkey PRIMARY KEY (cod_atleta, cod_prova_competicao),
	CONSTRAINT tb_atleta_prova_competicao_fkey FOREIGN KEY (cod_prova_competicao) REFERENCES db_atl.tb_prova_competicao(cod_prova_competicao),
	CONSTRAINT tb_atleta_prova_competicao_fkey1 FOREIGN KEY (cod_atleta) REFERENCES db_atl.tb_atleta(cod_atleta)
);

-- Permissions

ALTER TABLE db_atl.tb_atleta_prova_competicao OWNER TO postgres;
GRANT ALL ON TABLE db_atl.tb_atleta_prova_competicao TO postgres;


-- db_atl.view_100metros source

CREATE OR REPLACE VIEW db_atl.view_100metros
AS SELECT c.data_prova_competicao,
    a.result,
    a.score,
    p.genero_prova,
    t.pais_competicao,
    t.cidade_competicao
   FROM db_atl.tb_prova_competicao c,
    db_atl.tb_atleta_prova_competicao a,
    db_atl.tb_prova p,
    db_atl.tb_competicao t
  WHERE c.cod_prova_competicao = a.cod_prova_competicao AND c.cod_prova = p.cod_prova AND t.cod_competicao = c.cod_competicao AND c.data_prova_competicao >= '2010-01-01'::date AND p.nome_prova::text ~~ '_100 Metres%_'::text;

-- Permissions

ALTER TABLE db_atl.view_100metros OWNER TO postgres;
GRANT ALL ON TABLE db_atl.view_100metros TO postgres;


-- db_atl.ano_competicao source

CREATE OR REPLACE VIEW db_atl.ano_competicao
AS SELECT date_part('year'::text, tb_competicao.data_final_competicao) AS ano,
    count(*) AS count
   FROM db_atl.tb_competicao
  GROUP BY (date_part('year'::text, tb_competicao.data_final_competicao));

-- Permissions

ALTER TABLE db_atl.ano_competicao OWNER TO postgres;
GRANT ALL ON TABLE db_atl.ano_competicao TO postgres;


-- db_atl.cidades source

CREATE OR REPLACE VIEW db_atl.cidades
AS SELECT t.cidade_competicao,
    t.pais_competicao,
    c.data_prova_competicao
   FROM db_atl.tb_competicao t,
    db_atl.tb_prova_competicao c,
    db_atl.tb_prova p,
    db_atl.tb_atleta_prova_competicao a
  WHERE t.cod_competicao = c.cod_competicao AND c.cod_prova_competicao = a.cod_prova_competicao AND c.cod_prova = p.cod_prova;

-- Permissions

ALTER TABLE db_atl.cidades OWNER TO postgres;
GRANT ALL ON TABLE db_atl.cidades TO postgres;


-- db_atl.db_provas_100 source

CREATE OR REPLACE VIEW db_atl.db_provas_100
AS SELECT pc.cod_competicao,
    w.data_prova_competicao,
    w.pais_competicao,
    w.cidade_competicao,
    p.nome_prova,
    p.genero_prova,
    a.cod_atleta,
    a.url_atleta,
    a.pais_atleta,
    apc.result,
    d.days ->> 'humidity'::text AS humidity,
    d.days ->> 'pressure'::text AS pressure,
    d.days ->> 'temp'::text AS temperatura,
    d.days ->> 'windspeed'::text AS windspeed,
    w.info_wheter -> 'latitude'::text AS latitude,
    w.info_wheter -> 'longitude'::text AS longitude
   FROM db_atl.tb_wheter w,
    LATERAL jsonb_array_elements(w.info_wheter -> 'days'::text) d(days),
    db_atl.tb_prova_competicao pc,
    db_atl.tb_prova p,
    db_atl.tb_competicao cp,
    db_atl.tb_atleta_prova_competicao apc,
    db_atl.tb_atleta a
  WHERE cp.cod_competicao = pc.cod_competicao AND cp.pais_competicao::text = w.pais_competicao::text AND cp.cidade_competicao::text = w.cidade_competicao::text AND w.data_prova_competicao = pc.data_prova_competicao AND p.cod_prova = pc.cod_prova AND apc.cod_prova_competicao = pc.cod_prova_competicao AND a.cod_atleta = apc.cod_atleta AND p.nome_prova::text ~~ '_100 Metres'::text;

-- Permissions

ALTER TABLE db_atl.db_provas_100 OWNER TO postgres;
GRANT ALL ON TABLE db_atl.db_provas_100 TO postgres;


-- db_atl.db_all_results source

CREATE OR REPLACE VIEW db_atl.db_all_results
AS SELECT pc.cod_competicao,
    pc.data_prova_competicao,
    cp.pais_competicao,
    cp.cidade_competicao,
    p.nome_prova,
    p.genero_prova,
    a.cod_atleta,
    a.url_atleta,
    a.pais_atleta,
    apc.result
   FROM db_atl.tb_prova_competicao pc,
    db_atl.tb_prova p,
    db_atl.tb_competicao cp,
    db_atl.tb_atleta_prova_competicao apc,
    db_atl.tb_atleta a
  WHERE cp.cod_competicao = pc.cod_competicao AND p.cod_prova = pc.cod_prova AND apc.cod_prova_competicao = pc.cod_prova_competicao AND a.cod_atleta = apc.cod_atleta AND pc.data_prova_competicao >= '2010-01-01'::date AND p.nome_prova::text ~~ '_100 Metres'::text;

-- Permissions

ALTER TABLE db_atl.db_all_results OWNER TO postgres;
GRANT ALL ON TABLE db_atl.db_all_results TO postgres;




-- Permissions

GRANT ALL ON SCHEMA db_atl TO postgres;
