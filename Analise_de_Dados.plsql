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
