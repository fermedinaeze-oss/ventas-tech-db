-- Entregable 5: Consultas con JOINs
-- Motor utilizado: PostgreSQL
-- Proyecto: Ventas_Tech_DB

-- =====================================================
-- Consulta 1: Vista general de ventas (INNER JOIN)
-- Propósito: reunir ventas, clientes, productos y categorías
-- para facilitar el análisis comercial.
-- =====================================================

SELECT
    v.fecha_venta,
    c.id_cliente,
    c.nombre AS nombre_cliente,
    c.ciudad,
    p.nombre_producto,
    cat.nombre_categoria,
    v.cantidad,
    v.precio_unitario,
    v.cantidad * v.precio_unitario AS total_venta
FROM ventas AS v
INNER JOIN clientes AS c
    ON v.id_cliente = c.id_cliente
INNER JOIN productos AS p
    ON v.id_producto = p.id_producto
INNER JOIN categorias AS cat
    ON p.id_categoria = cat.id_categoria
ORDER BY v.fecha_venta;

-- =====================================================
-- Consulta 2: Clientes sin ventas (LEFT JOIN)
-- Propósito: identificar clientes registrados que nunca compraron.
-- =====================================================

SELECT
    c.nombre,
    c.email,
    c.fecha_registro
FROM clientes AS c
LEFT JOIN ventas AS v
    ON c.id_cliente = v.id_cliente
WHERE v.id_cliente IS NULL
ORDER BY c.nombre;

-- Hallazgo: la consulta devolvió 0 clientes sin ventas. En los datos de prueba, todos los clientes registrados realizaron al menos una compra, por lo que no se identificaron clientes pendientes de su primera compra.

-- =====================================================
-- Consulta 3: Productos que nunca se vendieron
-- Propósito: identificar productos sin ventas asociadas.
-- =====================================================

SELECT
p.nombre_producto,
cat.nombre_categoria,
p.precio
FROM productos AS p
INNER JOIN categorias AS cat
ON p.id_categoria = cat.id_categoria
LEFT JOIN ventas AS v
ON p.id_producto = v.id_producto
WHERE v.id_producto IS NULL
ORDER BY p.nombre_producto;

-- Hallazgo: la consulta devolvió 0 productos sin ventas. En los datos de prueba, todos los productos registrados aparecen en al menos una venta, por lo que no se identificaron productos sin rotación comercial.

-- =====================================================
-- Consulta 4: Consolidación de ventas con UNION ALL
-- Propósito: comparar el importe de las ventas de dos períodos.
-- =====================================================

SELECT
    grupo,
    SUM(total) AS total_facturado
FROM (
    SELECT
        fecha_venta,
        cantidad * precio_unitario AS total,
        'Hasta el 10 de marzo' AS grupo
    FROM ventas
    WHERE fecha_venta <= DATE '2024-03-10'

    UNION ALL

    SELECT
        fecha_venta,
        cantidad * precio_unitario AS total,
        'Desde el 11 de marzo' AS grupo
    FROM ventas
    WHERE fecha_venta > DATE '2024-03-10'
) AS consolidado
GROUP BY grupo
ORDER BY grupo;

-- Hallazgo: las ventas hasta el 10 de marzo sumaron $3.620, mientras que las ventas desde el 11 de marzo sumaron $2.824. En los datos analizados, el primer período registró un importe total superior al segundo.






