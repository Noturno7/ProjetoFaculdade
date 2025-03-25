INSERT INTO combustivel (id_combustivel, nome_combustivel) 
VALUES (4, 'Gasolina Aditivada');


-- Função: MENOR PREÇO FILTRO: Retorna o menor preço de um bairro e/ou combustível específico, ou seja retorna o menor preço filtrado.
CREATE OR REPLACE FUNCTION menor_preco_filtro(
    p_bairro VARCHAR DEFAULT NULL,
    p_combustivel VARCHAR DEFAULT NULL
)
RETURNS TABLE (
    nome_posto VARCHAR,
    endereco VARCHAR,
    bairro VARCHAR,
    nome_combustivel VARCHAR,
    menor_valor NUMERIC(10,2),
    data_coleta TIMESTAMP
) AS $$
BEGIN
    RETURN QUERY
    SELECT 
        p.nome AS nome_posto,
        e.nome_rua || ', ' || e.numero AS endereco,
        e.nome_bairro AS bairro,
        c.nome_combustivel,
        pc.valor AS menor_valor,
        pe.data_pesquisa AS data_coleta
    FROM pesquisa_combustivel pc
    JOIN pesquisa pe ON pe.id_pesquisa = pc.id_pesquisa
    JOIN posto p ON p.id_posto = pe.id_posto
    JOIN endereco e ON e.id_endereco = p.id_bairro
    JOIN combustivel c ON c.id_combustivel = pc.id_combustivel
    WHERE (p_bairro IS NULL OR e.nome_bairro = p_bairro)
      AND (p_combustivel IS NULL OR c.nome_combustivel = p_combustivel)
    ORDER BY c.nome_combustivel, pc.valor;
END;
$$ LANGUAGE plpgsql;

-- Função:MENOR PREÇO COMBUSTÍVEL: Retorna o menor preço de cada combustível
CREATE OR REPLACE FUNCTION menor_preco_combustivel()
RETURNS TABLE (
    nome_posto VARCHAR,
    endereco VARCHAR,
    bairro VARCHAR,
    nome_combustivel VARCHAR,
    menor_valor NUMERIC(10,2),
    data_coleta TIMESTAMP
) AS $$
BEGIN
    RETURN QUERY
    SELECT 
        p.nome AS nome_posto,
        e.nome_rua || ', ' || e.numero AS endereco,
        e.nome_bairro AS bairro,
        c.nome_combustivel,
        pc.valor AS menor_valor,
        pe.data_pesquisa AS data_coleta
    FROM pesquisa_combustivel pc
    JOIN pesquisa pe ON pe.id_pesquisa = pc.id_pesquisa
    JOIN posto p ON p.id_posto = pe.id_posto
    JOIN endereco e ON e.id_endereco = p.id_bairro
    JOIN combustivel c ON c.id_combustivel = pc.id_combustivel
    WHERE pc.valor = (SELECT MIN(valor) FROM pesquisa_combustivel WHERE id_combustivel = pc.id_combustivel)
    ORDER BY c.nome_combustivel;
END;
$$ LANGUAGE plpgsql;


-- Função: PREÇO MÉDIO COMBUSTIVEL: retorna o preço médio dos combustíveis
CREATE OR REPLACE FUNCTION preco_medio_combustivel(
    p_bairro VARCHAR DEFAULT NULL
)
RETURNS TABLE (
    nome_combustivel VARCHAR,
    preco_medio NUMERIC(10,2)
) AS $$
BEGIN
    RETURN QUERY
    SELECT 
        c.nome_combustivel,
        AVG(pc.valor) AS preco_medio
    FROM pesquisa_combustivel pc
    JOIN pesquisa pe ON pe.id_pesquisa = pc.id_pesquisa
    JOIN posto p ON p.id_posto = pe.id_posto
    JOIN endereco e ON e.id_endereco = p.id_bairro
    JOIN combustivel c ON c.id_combustivel = pc.id_combustivel
    WHERE (p_bairro IS NULL OR e.nome_bairro = p_bairro)
    GROUP BY c.nome_combustivel;
END;
$$ LANGUAGE plpgsql;


-- Função: LISTAGEM POSTO PREÇO: Essa função retorna todos os postos, seus bairros, a quantidade de pesquisas feitas e o preço médio de cada combustível.
CREATE OR REPLACE FUNCTION listagem_posto_preco(
    p_data_inicio TIMESTAMP DEFAULT NULL,
    p_data_fim TIMESTAMP DEFAULT NULL
)
RETURNS TABLE (
    nome_posto VARCHAR,
    bairro VARCHAR,
    quantidade_amostras INTEGER,
    nome_combustivel VARCHAR,
    preco_medio NUMERIC(10,2)
) AS $$
BEGIN
    RETURN QUERY
    SELECT 
        p.nome AS nome_posto,
        e.nome_bairro AS bairro,
        COUNT(pc.id_pesquisa) AS quantidade_amostras,
        c.nome_combustivel,
        AVG(pc.valor) AS preco_medio
    FROM pesquisa_combustivel pc
    JOIN pesquisa pe ON pe.id_pesquisa = pc.id_pesquisa
    JOIN posto p ON p.id_posto = pe.id_posto
    JOIN endereco e ON e.id_endereco = p.id_endereco
    JOIN combustivel c ON c.id_combustivel = pc.id_combustivel
    WHERE (p_data_inicio IS NULL OR pe.data_pesquisa >= p_data_inicio)
      AND (p_data_fim IS NULL OR pe.data_pesquisa <= p_data_fim)
    GROUP BY p.nome, e.nome_bairro, c.nome_combustivel;
END;
$$ LANGUAGE plpgsql;

INSERT INTO pesquisa (id_pesquisa, id_posto, data_pesquisa) VALUES
(5, 5, '2025-03-12 07:30:00'),
(6, 6, '2025-03-12 09:15:00'),
(7, 7, '2025-03-12 11:45:00'),
(8, 8, '2025-03-12 14:10:00'),
(9, 9, '2025-03-12 16:50:00'),
(10, 10, '2025-03-12 19:20:00'),

(11, 5, '2025-03-13 07:50:00'),
(12, 6, '2025-03-13 09:35:00'),
(13, 7, '2025-03-13 12:00:00'),
(14, 8, '2025-03-13 15:25:00'),
(15, 9, '2025-03-13 17:10:00'),
(16, 10, '2025-03-13 20:00:00'),

(17, 5, '2025-03-14 07:20:00'),
(18, 6, '2025-03-14 09:50:00'),
(19, 7, '2025-03-14 12:40:00'),
(20, 8, '2025-03-14 14:55:00'),
(21, 9, '2025-03-14 18:05:00'),
(22, 10, '2025-03-14 19:55:00'),

(23, 5, '2025-03-15 07:10:00'),
(24, 6, '2025-03-15 08:45:00'),
(25, 7, '2025-03-15 11:30:00'),
(26, 8, '2025-03-15 14:20:00'),
(27, 9, '2025-03-15 17:15:00'),
(28, 10, '2025-03-15 19:40:00'),

(29, 5, '2025-03-16 08:00:00'),
(30, 6, '2025-03-16 10:30:00'),
(31, 7, '2025-03-16 13:00:00'),
(32, 8, '2025-03-16 15:15:00'),
(33, 9, '2025-03-16 18:40:00'),
(34, 10, '2025-03-16 20:00:00'),

(35, 5, '2025-03-17 07:15:00'),
(36, 6, '2025-03-17 10:00:00'),
(37, 7, '2025-03-17 12:50:00'),
(38, 8, '2025-03-17 14:30:00'),
(39, 9, '2025-03-17 16:45:00'),
(40, 10, '2025-03-17 19:10:00'),

(41, 5, '2025-03-18 07:45:00'),
(42, 6, '2025-03-18 09:25:00'),
(43, 7, '2025-03-18 11:55:00'),
(44, 8, '2025-03-18 14:35:00'),
(45, 9, '2025-03-18 17:30:00'),
(46, 10, '2025-03-18 19:20:00'),

(47, 5, '2025-03-19 07:25:00'),
(48, 6, '2025-03-19 09:45:00'),
(49, 7, '2025-03-19 12:20:00'),
(50, 8, '2025-03-19 14:40:00'),
(51, 9, '2025-03-19 16:55:00'),
(52, 10, '2025-03-19 18:35:00'),

(53, 5, '2025-03-20 07:05:00'),
(54, 6, '2025-03-20 09:30:00'),
(55, 7, '2025-03-20 12:15:00'),
(56, 8, '2025-03-20 15:05:00'),
(57, 9, '2025-03-20 17:45:00'),
(58, 10, '2025-03-20 19:55:00'),

(59, 5, '2025-03-21 07:55:00'),
(60, 6, '2025-03-21 09:10:00');

INSERT INTO endereco (id_endereco, nome_bairro, nome_rua, numero) VALUES
(5, 'Praia de Itaparica', 'R. Itaipava', '2007'),
(6, 'Praia de Itaparica', 'R. Prof. Augusto Rusch', '121'),
(7, 'Aribiri', 'Av. Carlos Lindenberg', '1896'),
(8, 'Vila Velha', 'Av. Luciano das Neves', '512'),
(9, 'Parque Das Gaivotas', 'R. Maria de Oliveira Mares Guia', '40'),
(10, 'Santa Inês', 'Av. Capixaba', '47');

INSERT INTO posto (id_posto, nome, id_endereco) VALUES
(5, 'Posto Atlantica', 5),
(6, 'Posto Saturnino', 6),
(7, 'Posto Ipiranga', 7),
(8, 'Posto Shell', 8),
(9, 'Posto Petrobras', 9),
(10, 'Posto Torres', 10);


INSERT INTO pesquisa_combustivel (id_pesquisa, id_combustivel, valor) VALUES
(5, 1, 6.37), (5, 2, 4.43), (5, 3, 6.33), (5, 4, 6.65),
(6, 1, 6.35), (6, 2, 4.42), (6, 3, 6.32), (6, 4, 6.60),
(7, 1, 6.40), (7, 2, 4.45), (7, 3, 6.35), (7, 4, 6.70),
(8, 1, 6.38), (8, 2, 4.40), (8, 3, 6.30), (8, 4, 6.63),
(9, 1, 6.36), (9, 2, 4.41), (9, 3, 6.31), (9, 4, 6.62),
(10, 1, 6.39), (10, 2, 4.44), (10, 3, 6.34), (10, 4, 6.66),

(11, 1, 6.33), (11, 2, 4.39), (11, 3, 6.29), (11, 4, 6.58),
(12, 1, 6.32), (12, 2, 4.38), (12, 3, 6.28), (12, 4, 6.57),
(13, 1, 6.34), (13, 2, 4.40), (13, 3, 6.30), (13, 4, 6.60),
(14, 1, 6.31), (14, 2, 4.37), (14, 3, 6.27), (14, 4, 6.55),
(15, 1, 6.35), (15, 2, 4.41), (15, 3, 6.32), (15, 4, 6.62),
(16, 1, 6.37), (16, 2, 4.43), (16, 3, 6.33), (16, 4, 6.65),

(17, 1, 6.39), (17, 2, 4.44), (17, 3, 6.34), (17, 4, 6.66),
(18, 1, 6.36), (18, 2, 4.42), (18, 3, 6.32), (18, 4, 6.63),
(19, 1, 6.38), (19, 2, 4.40), (19, 3, 6.30), (19, 4, 6.61),
(20, 1, 6.37), (20, 2, 4.39), (20, 3, 6.28), (20, 4, 6.60),
(21, 1, 6.40), (21, 2, 4.45), (21, 3, 6.36), (21, 4, 6.70),
(22, 1, 6.35), (22, 2, 4.41), (22, 3, 6.31), (22, 4, 6.62),

(23, 1, 6.34), (23, 2, 4.40), (23, 3, 6.30), (23, 4, 6.61),
(24, 1, 6.32), (24, 2, 4.38), (24, 3, 6.28), (24, 4, 6.58),
(25, 1, 6.36), (25, 2, 4.41), (25, 3, 6.32), (25, 4, 6.62),
(26, 1, 6.31), (26, 2, 4.37), (26, 3, 6.27), (26, 4, 6.55),
(27, 1, 6.39), (27, 2, 4.44), (27, 3, 6.35), (27, 4, 6.68),
(28, 1, 6.37), (28, 2, 4.42), (28, 3, 6.33), (28, 4, 6.65),

(29, 1, 6.33), (29, 2, 4.39), (29, 3, 6.29), (29, 4, 6.58),
(30, 1, 6.30), (30, 2, 4.35), (30, 3, 6.25), (30, 4, 6.54),
(31, 1, 6.35), (31, 2, 4.41), (31, 3, 6.31), (31, 4, 6.62),
(32, 1, 6.31), (32, 2, 4.37), (32, 3, 6.27), (32, 4, 6.56),
(33, 1, 6.38), (33, 2, 4.42), (33, 3, 6.33), (33, 4, 6.65),
(34, 1, 6.30), (34, 2, 4.35), (34, 3, 6.25), (34, 4, 6.53),

(35, 1, 6.31), (35, 2, 4.36), (35, 3, 6.26), (35, 4, 6.55),
(36, 1, 6.36), (36, 2, 4.41), (36, 3, 6.32), (36, 4, 6.61),
(37, 1, 6.39), (37, 2, 4.45), (37, 3, 6.35), (37, 4, 6.67),
(38, 1, 6.37), (38, 2, 4.42), (38, 3, 6.33), (38, 4, 6.64),
(39, 1, 6.35), (39, 2, 4.41), (39, 3, 6.31), (39, 4, 6.61),
(40, 1, 6.30), (40, 2, 4.35), (40, 3, 6.25), (40, 4, 6.53),

(41, 1, 6.38), (41, 2, 4.43), (41, 3, 6.34), (41, 4, 6.66),
(42, 1, 6.35), (42, 2, 4.41), (42, 3, 6.32), (42, 4, 6.62),
(43, 1, 6.40), (43, 2, 4.45), (43, 3, 6.36), (43, 4, 6.70),
(44, 1, 6.32), (44, 2, 4.38), (44, 3, 6.28), (44, 4, 6.58),
(45, 1, 6.36), (45, 2, 4.41), (45, 3, 6.32), (45, 4, 6.63),
(46, 1, 6.30), (46, 2, 4.35), (46, 3, 6.25), (46, 4, 6.54);


SELECT * FROM buscar_preco_mais_recente(5,1);
SELECT * FROM calcular_media_precos(5, 1);
SELECT * FROM listagem_posto_preco('2025-03-12', '2025-03-21');



