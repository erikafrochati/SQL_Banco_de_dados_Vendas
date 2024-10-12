SELECT * from categorias;
SELECT * from produtos;

SELECT count (*) from produtos;

SELECT count (*) As Vendas_Totais from vendas;

SELECT COUNT(*) as Qtd, 'Categorias' as Tabela FROM categorias
UNION ALL
SELECT COUNT(*) as Qtd, 'Clientes' as Tabela FROM clientes
UNION ALL
SELECT COUNT(*) as Qtd, 'Fornecedores' as Tabela FROM fornecedores
UNION ALL
SELECT COUNT(*) as Qtd, 'ItensVenda' as Tabela FROM itens_venda
UNION ALL

SELECT COUNT(*) as Qtd, 'Marcas' as Tabela FROM marcas
UNION ALL
SELECT COUNT(*) as Qtd, 'Produtos' as Tabela FROM produtos
UNION ALL
SELECT COUNT(*) as Qtd, 'Vendas' as Tabela FROM vendas;

SELECT * from vendas LIMIT 5;

SELECT strftime('%Y',data_venda) from vendas limit 5;

SELECT DISTINCT(strftime('%Y',data_venda)) AS Ano from vendas
ORDER by Ano;

SELECT strftime('%Y', data_venda) AS Ano, COUNT(id_venda) AS Total_Vendas
FROM vendas
GROUP BY Ano
ORDER BY Ano
;

SELECT strftime('%Y', data_venda) AS Ano, strftime('%m', data_venda) AS Mes, COUNT(id_venda) AS Total_Vendas
FROM vendas
GROUP BY Ano
ORDER BY Ano
;

SELECT strftime('%Y', data_venda) AS Ano, strftime('%m', data_venda) AS Mes, COUNT(id_venda) AS Total_Vendas
FROM vendas
GROUP BY Ano, Mes
ORDER BY Ano
;

SELECT strftime('%Y', data_venda) AS Ano, strftime('%m', data_venda) AS Mes, COUNT(id_venda) AS Total_Vendas
FROM vendas
WHERE Mes = '01' OR Mes = '11' OR Mes = '12'
GROUP BY Ano, Mes
ORDER BY Ano
;

-- Calcula o total de vendas de cada fornecedor na Black Friday
SELECT strftime('%Y/%m', v.data_venda) AS 'Ano/Mes', f.nome AS Nome_Fornecedor, COUNT(iv.produto_id) AS Qtd_Vendas
FROM itens_venda iv
JOIN vendas v ON v.id_venda = iv.venda_id
JOIN produtos p ON p.id_produto = iv.produto_id
JOIN fornecedores f ON f.id_fornecedor = p.fornecedor_id
WHERE strftime('%m', v.data_venda) = '11'
GROUP BY Nome_Fornecedor, 'Ano/Mes'
ORDER BY 'Ano/Mes', Qtd_Vendas desc
;

-- Analisa as vendas por categoria de produtos na Black Friday
SELECT strftime('%Y/%m', v.data_venda) AS 'Ano/Mes', c.nome_categoria AS Nome_Categoria, COUNT(iv.produto_id) AS Qtd_Vendas
FROM itens_venda iv
JOIN vendas v ON v.id_venda = iv.venda_id
JOIN produtos p ON p.id_produto = iv.produto_id
JOIN categorias c ON c.id_categoria = p.categoria_id
WHERE strftime('%m', v.data_venda) = '11'
GROUP BY Nome_Categoria, 'Ano/Mes'
ORDER BY 'Ano/Mes', Qtd_Vendas desc
;

-- Validação da consistência das vendas registradas
--Valor total das vendas R$ 150.034
SELECT SUM(Qtd_Vendas)
FROM (
    SELECT strftime('%Y/%m', v.data_venda) AS 'Ano/Mes', f.nome AS Nome_Fornecedor, COUNT(iv.produto_id)   AS Qtd_Vendas
    FROM itens_venda iv
    JOIN vendas v ON v.id_venda = iv.venda_id
    JOIN produtos p ON p.id_produto = iv.produto_id
    JOIN fornecedores f ON f.id_fornecedor = p.fornecedor_id
    GROUP BY Nome_Fornecedor, 'Ano/Mes'
    ORDER BY 'Ano/Mes', Qtd_Vendas
	);

-- Análise da performance de vendas do fornecedor "NebulaNetworks" ao longo do tempo
SELECT strftime('%Y/%m', v.data_venda) AS 'Ano/Mes', COUNT(iv.produto_id) AS Qtd_Vendas
FROM itens_venda iv
JOIN vendas v ON v.id_venda = iv.venda_id
JOIN produtos p ON p.id_produto = iv.produto_id
JOIN fornecedores f ON f.id_fornecedor = p.fornecedor_id
WHERE f.nome='NebulaNetworks'
GROUP BY 'Ano/Mes'
ORDER BY 'Ano/Mes', Qtd_Vendas;
