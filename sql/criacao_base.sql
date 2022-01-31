-- DROP SCHEMA db_atl;

SET default_tablespace = '';
DROP SCHEMA IF EXISTS db_atl CASCADE;
CREATE SCHEMA db_atl;

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



-- db_atl.tb_atleta definition



CREATE TABLE db_atl.tb_atleta (
	cod_atleta int4 NOT NULL,
	nome_atleta varchar(250) NOT NULL,
	pais_atleta varchar(100) NOT NULL,
	idade_atleta int4 NOT NULL,
	nascimento_atleta date NOT null,
	url_foto_atleta varchar(250) NOT NULL,
	url_insta_atleta varchar(250) NOT NULL,
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
	nome_competição varchar(60) NOT NULL,
	score_competicao int4 NOT NULL,
	score_participacao_competicao int4 NOT NULL,
	score_result_competicao int4 NOT NULL,
	data_inicial_competicao date NOT NULL,
	data_final_competicao date NOT NULL,
	local_competicao varchar(100) NOT NULL,
	cidade_competicao varchar(100) NOT NULL,
	pais_competicao varchar(100) NOT NULL,
	ps_place_competicao int4 NOT NULL,
	rs_place_competicao int4 NOT NULL,
	wr_score_competicao int4 NOT NULL,
	CONSTRAINT tb_competicao_pkey PRIMARY KEY (cod_competicao)
);

-- Permissions

ALTER TABLE db_atl.tb_competicao OWNER TO postgres;
GRANT ALL ON TABLE db_atl.tb_competicao TO postgres;


-- db_atl.tb_prova definition



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

-- db_atl.tb_prova_competicao definition



CREATE TABLE db_atl.tb_prova_competicao (
	cod_prova_competicao serial4 NOT NULL,
	cod_competicao int4 NOT NULL,
	cod_prova int4 NOT NULL,
	score_prova_competicao int4 NOT NULL,
	data_prova_competicao date NOT NULL,
	
	
	CONSTRAINT unique_comptetion UNIQUE(cod_prova_competicao),
	CONSTRAINT tb_prova_competicao_pkey PRIMARY KEY (cod_competicao, cod_prova, cod_prova_competicao),
	CONSTRAINT tb_prova_competicao_cod_competicao_fkey FOREIGN KEY (cod_competicao) REFERENCES db_atl.tb_competicao(cod_competicao),
	CONSTRAINT tb_prova_competicao_cod_prova_fkey FOREIGN KEY (cod_prova) REFERENCES db_atl.tb_prova(cod_prova)
);

-- Permissions

ALTER TABLE db_atl.tb_prova_competicao OWNER TO postgres;
GRANT ALL ON TABLE db_atl.tb_prova_competicao TO postgres;

-- db_atl.tb_atleta_prova_competicao definition


CREATE TABLE db_atl.tb_atleta_prova_competicao (
	"result" float8 NOT NULL,
	score int4 NOT NULL,
	team_code int4 NOT NULL,
	cod_atleta int4 NOT NULL,
	cod_prova_competicao int4 NOT NULL,
	
	CONSTRAINT tb_atleta_prova_competicao_pkey PRIMARY KEY (cod_atleta, cod_prova_competicao),
	CONSTRAINT tb_atleta_prova_competicao_fkey FOREIGN KEY (cod_prova_competicao) REFERENCES db_atl.tb_prova_competicao(cod_prova_competicao),
	CONSTRAINT tb_atleta_prova_competicao_fkey1 FOREIGN KEY (cod_atleta) REFERENCES db_atl.tb_atleta(cod_atleta)
);

-- Permissions

ALTER TABLE db_atl.tb_atleta_prova_competicao OWNER TO postgres;
GRANT ALL ON table db_atl.tb_atleta_prova_competicao TO postgres;






-- Permissions

GRANT ALL ON SCHEMA db_atl TO postgres;
