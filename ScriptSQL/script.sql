
--cria a tabela habilidades, suas restrições e seus comentários
CREATE TABLE habilidades (
                habilidade_id VARCHAR NOT NULL,
                nome VARCHAR NOT NULL,
                tipo VARCHAR NOT NULL,
                area_de_conhecimento VARCHAR NOT NULL,
                CONSTRAINT habilidades_pk PRIMARY KEY (habilidade_id)
                CONSTRAINT check_habilidades_tipo CHECK (tipo IN ('SOFT', 'HARD'))
);
COMMENT ON TABLE habilidades IS 'dados das habilidades presentes no sistema';
COMMENT ON COLUMN habilidades.habilidade_id IS 'identifica cada habilidade de maneira unica';
COMMENT ON COLUMN habilidades.nome IS 'nome da habilidade';
COMMENT ON COLUMN habilidades.tipo IS 'indica se a habilidade é do tipo soft ou hard';
COMMENT ON COLUMN habilidades.area_de_conhecimento IS 'indica de qual area de conhecimento é a habilidade';


--cria a tabela colaboradores, sua primary key e seus comentários
CREATE TABLE colaboradores (
                numero_de_registro VARCHAR NOT NULL,
                nome VARCHAR NOT NULL,
                data_de_nascimento DATE NOT NULL,
                cargo VARCHAR NOT NULL,
                departamento VARCHAR NOT NULL,
                email VARCHAR NOT NULL,
                bio VARCHAR,
                foto_de_perfil BYTEA,
                CONSTRAINT colaboradores_pk PRIMARY KEY (numero_de_registro)
);
COMMENT ON TABLE colaboradores IS 'armazena dados sobre os colaboradores';
COMMENT ON COLUMN colaboradores.numero_de_registro IS 'identifica o colaborador de maneira unica';
COMMENT ON COLUMN colaboradores.nome IS 'nome do colaborador';
COMMENT ON COLUMN colaboradores.data_de_nascimento IS 'data de nascimento do colaborador';
COMMENT ON COLUMN colaboradores.cargo IS 'cargo do colaborador';
COMMENT ON COLUMN colaboradores.departamento IS 'departamento do colaborador';
COMMENT ON COLUMN colaboradores.email IS 'email profissional do colaborador';
COMMENT ON COLUMN colaboradores.bio IS 'breve autodescrição do colaborador no aplicativo';
COMMENT ON COLUMN colaboradores.foto_de_perfil IS 'foto de perfil do colaborador no aplicativo';


--cria a tabela colaboradores_habilidades, a primary key e seu comentario
CREATE TABLE colaboradores_habilidades (
                numero_de_registro VARCHAR NOT NULL,
                habilidade_id VARCHAR NOT NULL,
                CONSTRAINT colaboradores_habilidades_pk PRIMARY KEY (numero_de_registro, habilidade_id)
);
COMMENT ON TABLE colaboradores_habilidades IS 'tabela que relaciona os colaboradores com as habilidades que possuem';


--cria a tabela enderecos, a primary key e seus comentarios
CREATE TABLE enderecos (
                endereco_id VARCHAR NOT NULL,
                numero_de_registro VARCHAR NOT NULL,
                estado VARCHAR NOT NULL,
                cep VARCHAR NOT NULL,
                numero INTEGER NOT NULL,
                complemento VARCHAR,
                CONSTRAINT enderecos_pk PRIMARY KEY (endereco_id, numero_de_registro)
);
COMMENT ON TABLE enderecos IS 'dados sobre os endereços de cada colaborador';
COMMENT ON COLUMN enderecos.endereco_id IS 'identifica cada endereço de maneira unica';
COMMENT ON COLUMN enderecos.estado IS 'estado em que está o endereço';
COMMENT ON COLUMN enderecos.cep IS 'cep do endereço';
COMMENT ON COLUMN enderecos.numero IS 'numero do endereço';
COMMENT ON COLUMN enderecos.complemento IS 'complemento do endereço';


--cria a tabela telefones, a primary key e seus comentarios
CREATE TABLE telefones (
                telefone VARCHAR NOT NULL,
                numero_de_registro VARCHAR NOT NULL,
                CONSTRAINT telefones_pk PRIMARY KEY (telefone)
);
COMMENT ON TABLE telefones IS 'relaciona telefones com os colaboradores';
COMMENT ON COLUMN telefones.telefone IS 'telefone de cada colaborador';

--cria as foreign keys das tabelas
ALTER TABLE colaboradores_habilidades ADD CONSTRAINT habilidades_colaboradores_habilidades_fk
FOREIGN KEY (habilidade_id)
REFERENCES habilidades (habilidade_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE telefones ADD CONSTRAINT colaboradores_telefones_fk
FOREIGN KEY (numero_de_registro)
REFERENCES colaboradores (numero_de_registro)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE enderecos ADD CONSTRAINT colaboradores_enderecos_fk
FOREIGN KEY (numero_de_registro)
REFERENCES colaboradores (numero_de_registro)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE colaboradores_habilidades ADD CONSTRAINT colaboradores_colaboradores_habilidades_fk
FOREIGN KEY (numero_de_registro)
REFERENCES colaboradores (numero_de_registro)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
