--@block 1. Cria um relatório para todos os pedidos de 1996 e seus clientes (152 linhas)
SELECT 
	*
FROM orders o
JOIN customers c ON c.customer_id = o.customer_id 
WHERE 
	EXTRACT(YEAR FROM o.order_date) = 1996;

--@block 2. Cria um relatório que mostra o número de funcionários e clientes de cada cidade que tem funcionários (5 linhas)
SELECT
	e.city AS cidade,
	COUNT(DISTINCT(c.customer_id)) AS clientes,
	COUNT(DISTINCT(e.employee_id)) AS funcionarios
FROM employees e 
LEFT JOIN customers c ON c.city = e.city
GROUP BY e.city
ORDER BY e.city

--@block 3. Cria um relatório que mostra o número de funcionários e clientes de cada cidade que tem clientes (69 linhas)
SELECT

FROM employers e
RIGHT JOIN customers c ON c.city = e

--@block 4.Cria um relatório que mostra o número de funcionários e clientes de cada cidade (71 linhas)
SELECT
  COALESCE(e.city, c.city) AS cidade,
  COUNT(DISTINCT(c.customer_id)) AS clientes,
  COUNT(DISTINCT(e.employee_id)) AS funcionarios
FROM employees e
FULL JOIN customers c ON c.city = e.city 
GROUP BY COALESCE(e.city, c.city)
ORDER BY cidade;

--@block 5. Cria um relatório que mostra a quantidade total de produtos encomendados.
-- Mostra apenas registros para produtos para os quais a quantidade encomendada é menor que 200 (5 linhas)
SELECT 
  p.product_id,
  p.product_name,
  SUM(od.quantity) AS total_encomendado
FROM products p
JOIN order_details od ON od.product_id = p.product_id
GROUP BY p.product_id, p.product_name
HAVING SUM(od.quantity) < 200
ORDER BY total_encomendado;

--@block 6. Cria um relatório que mostra o total de pedidos por cliente desde 31 de dezembro de 1996.
-- O relatório deve retornar apenas linhas para as quais o total de pedidos é maior que 15 (5 linhas)
SELECT 
  c.customer_id,
  c.contact_name,
  COUNT(o.order_id) AS total_pedidos  
FROM customers c
JOIN orders o ON o.customer_id = c.customer_id  
WHERE o.order_date > '1996-12-31'
GROUP BY c.customer_id, c.contact_name
HAVING COUNT(o.order_id) > 15
ORDER BY total_pedidos DESC;