--@block 1. Obter todas as colunas das tabelas Clientes, Pedidos e Fornecedores
SELECT * FROM customers;
SELECT * FROM orders;
SELECT * FROM suppliers;

--@block 2. Obter todos os Clientes em ordem alfabética por país e nome
SELECT * FROM customers ORDER BY country, contact_name;

--@block 3. Obter os 5 pedidos mais antigos
SELECT * FROM orders ORDER BY order_date LIMIT 5;

--@block 4. Obter a contagem de todos os Pedidos feitos durante 1997
SELECT count(*) FROM orders WHERE order_date BETWEEN '1997-1-1' AND '1997-12-31';
SELECT count(*) FROM orders WHERE EXTRACT(YEAR FROM order_date) = 1997;
SELECT count(*) FROM orders WHERE DATE_PART('YEAR', order_date) = 1997;

--@block 5. Obter os nomes de todas as pessoas de contato onde a pessoa é um gerente, em ordem alfabética
SELECT contact_name, contact_title FROM customers WHERE contact_title LIKE '%Manager%' ORDER BY contact_name;

--@block 6. Obter todos os pedidos feitos em 19 de maio de 1997
SELECT * FROM orders WHERE order_date = '1997-05-19';
