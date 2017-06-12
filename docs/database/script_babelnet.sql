--
-- Importa��o das LUs via Babelnet
-- Espanhol
-- tabela: temp_babelnet_es
--

-- Passo 0: criar o Dominio BabelNet

-- Passo 1: lower nas lus

update temp_babelnet_es set nameLU_es = trim(lower(nameLU_en));

-- Passo 2: gerar a lista de WF - Lexeme
-- usando offline

-- Passo 3: Criar as LUs no banco e simultaneamente a relação Equivalence com a LU em PT
-- usando offline


