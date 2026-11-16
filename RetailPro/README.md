# RetailPro

## 1. Descripción y objetivos

RetailPro es un proyecto práctico de análisis de datos orientado al área comercial de una empresa minorista.

Sus objetivos son:
- Consultar y analizar datos comerciales mediante SQL.
- Preparar y transformar información con Power BI.
- Construir un modelo de datos y crear indicadores mediante DAX.
- Documentar el proyecto utilizando GitHub.

## 2. Herramientas utilizadas

- **PostgreSQL:** gestión y consulta de bases de datos.
- **pgAdmin:** administración y ejecución de scripts SQL.
- **Power BI:** transformación, modelado y visualización de datos.
- **DAX:** creación de medidas e indicadores.
- **GitHub:** almacenamiento y control de versiones.

## 3. Estructura del repositorio

El proyecto se encuentra en el repositorio `fermedinaeze-oss/ventas-tech-db`, dentro de la carpeta `RetailPro`.

Principales archivos:

```text
RetailPro/
├── m4_consultas_negocio.sql
├── m5_consultas_joins.sql
├── Pipeline_ETL_Medina_Fernando.pbix
├── Medina_Fernando_Checkpoint2.pbix
└── Medina_Fernando_Checkpoint2.pdf
```

## 4. Ejecución de scripts SQL

Para ejecutar los scripts en PostgreSQL mediante pgAdmin:

1. Conectarse al servidor PostgreSQL.
2. Seleccionar la base de datos correspondiente.
3. Abrir el Query Tool.
4. Abrir el archivo `.sql`.
5. Ejecutar el script con F5.
6. Revisar los resultados en Data Output y Messages.

## 5. Trabajo realizado en Power BI

Se utilizaron Power Query y Power BI para preparar los datos y construir un modelo compuesto por:

- Dim_Clientes
- Dim_Productos
- Dim_Categorias
- Dim_Fechas
- Fact_Ventas

También se creó la tabla `MedidasCore`, que contiene cinco medidas DAX:

- Total Ventas.
- Ventas Online.
- Ventas YTD.
- Ventas LY.
- % Crecimiento Anual.

Estas medidas permiten analizar la facturación y comparar la evolución de las ventas.

## 6. Repositorio

**GitHub:** https://github.com/fermedinaeze-oss/ventas-tech-db

**Carpeta RetailPro:** https://github.com/fermedinaeze-oss/ventas-tech-db/tree/main/RetailPro
