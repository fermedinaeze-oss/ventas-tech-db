-- Entregable 4: Consultas SQL de negocio

-- CONSULTA 1: Resumen ejecutivo mensual

SELECT
    EXTRACT(MONTH FROM fecha_venta) AS mes,
    SUM(cantidad * precio_unitario) AS total_facturado,
    COUNT(*) AS cantidad_pedidos,
    AVG(cantidad * precio_unitario) AS ticket_promedio
FROM ventas
GROUP BY EXTRACT(MONTH FROM fecha_venta)
ORDER BY mes;

-- CONSULTA 2: Ranking de los 5 productos más vendidos por facturación

SELECT
    id_producto,
    SUM(cantidad) AS unidades_vendidas,
    SUM(cantidad * precio_unitario) AS total_facturado
FROM ventas
GROUP BY id_producto
ORDER BY total_facturado DESC
LIMIT 5;

-- CONSULTA 3: Clientes recurrentes

SELECT
    id_cliente,
    COUNT(*) AS cantidad_pedidos,
    SUM(cantidad * precio_unitario) AS total_gastado
FROM ventas
GROUP BY id_cliente
HAVING COUNT(*) > 1
ORDER BY id_cliente;

-- CONSULTA 4: Comparación de facturación mensual con el promedio

WITH ventas_por_mes AS (
    SELECT
        EXTRACT(MONTH FROM fecha_venta) AS mes,
        SUM(cantidad * precio_unitario) AS total_facturado
    FROM ventas
    GROUP BY EXTRACT(MONTH FROM fecha_venta)
)
SELECT
    mes,
    total_facturado,
    CASE
        WHEN total_facturado > (
            SELECT AVG(total_facturado)
            FROM ventas_por_mes
        ) THEN 'Por encima'
        WHEN total_facturado < (
            SELECT AVG(total_facturado)
            FROM ventas_por_mes
        ) THEN 'Por debajo'
        ELSE 'Igual al promedio'
    END AS comparacion_promedio
FROM ventas_por_mes
ORDER BY mes;

-- 1. Los datos disponibles corresponden únicamente a marzo, por lo que no es posible comparar con otros meses.
-- 2. La mayor cantidad de unidades vendidas no necesariamente genera la mayor facturación:
-- el producto 2 vendió más unidades, mientras que el producto 1 generó más ingresos.
-- 3. Los cinco clientes registran dos ventas cada uno, pero el total gastado es diferente entre ellos.
