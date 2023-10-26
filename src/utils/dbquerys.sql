SELECT TOP (9000)
    tbExistenciaCosto.Periodo,
    alm.CCODIGOALMACEN AS Codigo_Alm,
    alm.CNOMBREALMACEN AS Almacen,
    tbExistenciaCosto.CIDPRODUCTO AS ID_Producto,
    pro.CCODIGOPRODUCTO AS Codigo_Producto,
    pro.CNOMBREPRODUCTO AS Producto,
    pro.CPRECIO1 AS Precio_Venta,
    SUM(tbExistenciaCosto.Existencias) AS Existencias
FROM
    (SELECT       tb.CIDEXISTENCIA, tb.CIDEJERCICIO, CONVERT(VARCHAR(4), eje.CEJERCICIO) + RIGHT('0' + CONVERT(VARCHAR(2), tb.NumPeriodo), 2) AS Periodo, tb.CIDALMACEN, tb.CIDPRODUCTO, tb.Entradas, tb.Salidas, 
          tb.Existencias, tb.Costo
        FROM      (SELECT       CIDEXISTENCIA, CIDEJERCICIO, 1 AS NumPeriodo, CIDALMACEN, CIDPRODUCTO, 1 AS Tipo, CENTRADASINICIALES AS Entradas, 0 AS Salidas, CENTRADASINICIALES AS Existencias, 
      CCOSTOINICIALENTRADAS AS Costo
          FROM      dbo.admExistenciaCosto
          UNION ALL
          SELECT        CIDEXISTENCIA, CIDEJERCICIO, 1 AS NumPeriodo, CIDALMACEN, CIDPRODUCTO, 2 AS Tipo, 0 AS Entradas, CSALIDASINICIALES AS Salidas, - CSALIDASINICIALES AS Existencias, 
           - CCOSTOINICIALSALIDAS AS Costo
          FROM      dbo.admExistenciaCosto
          UNION ALL
          SELECT        CIDEXISTENCIA, CIDEJERCICIO, 1 AS NumPeriodo, CIDALMACEN, CIDPRODUCTO, 3 AS Tipo, CENTRADASPERIODO1 AS Entradas, 0 AS Salidas, CENTRADASPERIODO1 AS Existencias, 
           CCOSTOENTRADASPERIODO1 AS Costo
          FROM      dbo.admExistenciaCosto
          UNION ALL
          SELECT        CIDEXISTENCIA, CIDEJERCICIO, 1 AS NumPeriodo, CIDALMACEN, CIDPRODUCTO, 4 AS Tipo, 0 AS Entradas, CSALIDASPERIODO1 AS Salidas, - CSALIDASPERIODO1 AS Existencias, 
           - CCOSTOSALIDASPERIODO1 AS Costo
          FROM      dbo.admExistenciaCosto
          UNION ALL
          SELECT        CIDEXISTENCIA, CIDEJERCICIO, 2 AS NumPeriodo, CIDALMACEN, CIDPRODUCTO, 3 AS Tipo, CENTRADASPERIODO2 AS Entradas, 0 AS Salidas, CENTRADASPERIODO2 AS Existencias, 
           CCOSTOENTRADASPERIODO2 AS Costo
          FROM      dbo.admExistenciaCosto
          UNION ALL
          SELECT        CIDEXISTENCIA, CIDEJERCICIO, 2 AS NumPeriodo, CIDALMACEN, CIDPRODUCTO, 4 AS Tipo, 0 AS Entradas, CSALIDASPERIODO2 AS Salidas, - CSALIDASPERIODO2 AS Existencias, 
           - CCOSTOSALIDASPERIODO2 AS Costo
          FROM      dbo.admExistenciaCosto
          UNION ALL
          SELECT        CIDEXISTENCIA, CIDEJERCICIO, 3 AS NumPeriodo, CIDALMACEN, CIDPRODUCTO, 3 AS Tipo, CENTRADASPERIODO3 AS Entradas, 0 AS Salidas, CENTRADASPERIODO3 AS Existencias, 
           CCOSTOENTRADASPERIODO3 AS Costo
          FROM      dbo.admExistenciaCosto
          UNION ALL
          SELECT        CIDEXISTENCIA, CIDEJERCICIO, 3 AS NumPeriodo, CIDALMACEN, CIDPRODUCTO, 4 AS Tipo, 0 AS Entradas, CSALIDASPERIODO3 AS Salidas, - CSALIDASPERIODO3 AS Existencias, 
           - CCOSTOSALIDASPERIODO3 AS Costo
          FROM      dbo.admExistenciaCosto
          UNION ALL
          SELECT        CIDEXISTENCIA, CIDEJERCICIO, 4 AS NumPeriodo, CIDALMACEN, CIDPRODUCTO, 3 AS Tipo, CENTRADASPERIODO4 AS Entradas, 0 AS Salidas, CENTRADASPERIODO4 AS Existencias, 
           CCOSTOENTRADASPERIODO4 AS Costo
          FROM      dbo.admExistenciaCosto
          UNION ALL
          SELECT        CIDEXISTENCIA, CIDEJERCICIO, 4 AS NumPeriodo, CIDALMACEN, CIDPRODUCTO, 4 AS Tipo, 0 AS Entradas, CSALIDASPERIODO4 AS Salidas, - CSALIDASPERIODO4 AS Existencias, 
           - CCOSTOSALIDASPERIODO4 AS Costo
          FROM      dbo.admExistenciaCosto
          UNION ALL
          SELECT        CIDEXISTENCIA, CIDEJERCICIO, 5 AS NumPeriodo, CIDALMACEN, CIDPRODUCTO, 3 AS Tipo, CENTRADASPERIODO5 AS Entradas, 0 AS Salidas, CENTRADASPERIODO5 AS Existencias, 
           CCOSTOENTRADASPERIODO5 AS Costo
          FROM      dbo.admExistenciaCosto
          UNION ALL
          SELECT        CIDEXISTENCIA, CIDEJERCICIO, 5 AS NumPeriodo, CIDALMACEN, CIDPRODUCTO, 4 AS Tipo, 0 AS Entradas, CSALIDASPERIODO5 AS Salidas, - CSALIDASPERIODO5 AS Existencias, 
           - CCOSTOSALIDASPERIODO5 AS Costo
          FROM      dbo.admExistenciaCosto
          UNION ALL
          SELECT        CIDEXISTENCIA, CIDEJERCICIO, 6 AS NumPeriodo, CIDALMACEN, CIDPRODUCTO, 3 AS Tipo, CENTRADASPERIODO6 AS Entradas, 0 AS Salidas, CENTRADASPERIODO6 AS Existencias, 
           CCOSTOENTRADASPERIODO6 AS Costo
          FROM      dbo.admExistenciaCosto
          UNION ALL
          SELECT        CIDEXISTENCIA, CIDEJERCICIO, 6 AS NumPeriodo, CIDALMACEN, CIDPRODUCTO, 4 AS Tipo, 0 AS Entradas, CSALIDASPERIODO6 AS Salidas, - CSALIDASPERIODO6 AS Existencias, 
           - CCOSTOSALIDASPERIODO6 AS Costo
          FROM      dbo.admExistenciaCosto
          UNION ALL
          SELECT        CIDEXISTENCIA, CIDEJERCICIO, 7 AS NumPeriodo, CIDALMACEN, CIDPRODUCTO, 3 AS Tipo, CENTRADASPERIODO7 AS Entradas, 0 AS Salidas, CENTRADASPERIODO7 AS Existencias, 
           CCOSTOENTRADASPERIODO7 AS Costo
          FROM      dbo.admExistenciaCosto
          UNION ALL
          SELECT        CIDEXISTENCIA, CIDEJERCICIO, 7 AS NumPeriodo, CIDALMACEN, CIDPRODUCTO, 4 AS Tipo, 0 AS Entradas, CSALIDASPERIODO7 AS Salidas, - CSALIDASPERIODO7 AS Existencias, 
           - CCOSTOSALIDASPERIODO7 AS Costo
          FROM      dbo.admExistenciaCosto
          UNION ALL
          SELECT        CIDEXISTENCIA, CIDEJERCICIO, 8 AS NumPeriodo, CIDALMACEN, CIDPRODUCTO, 3 AS Tipo, CENTRADASPERIODO8 AS Entradas, 0 AS Salidas, CENTRADASPERIODO8 AS Existencias, 
           CCOSTOENTRADASPERIODO8 AS Costo
          FROM      dbo.admExistenciaCosto
          UNION ALL
          SELECT        CIDEXISTENCIA, CIDEJERCICIO, 8 AS NumPeriodo, CIDALMACEN, CIDPRODUCTO, 4 AS Tipo, 0 AS Entradas, CSALIDASPERIODO8 AS Salidas, - CSALIDASPERIODO8 AS Existencias, 
           - CCOSTOSALIDASPERIODO8 AS Costo
          FROM      dbo.admExistenciaCosto
          UNION ALL
          SELECT        CIDEXISTENCIA, CIDEJERCICIO, 9 AS NumPeriodo, CIDALMACEN, CIDPRODUCTO, 3 AS Tipo, CENTRADASPERIODO9 AS Entradas, 0 AS Salidas, CENTRADASPERIODO9 AS Existencias, 
           CCOSTOENTRADASPERIODO9 AS Costo
          FROM      dbo.admExistenciaCosto
          UNION ALL
          SELECT        CIDEXISTENCIA, CIDEJERCICIO, 9 AS NumPeriodo, CIDALMACEN, CIDPRODUCTO, 4 AS Tipo, 0 AS Entradas, CSALIDASPERIODO9 AS Salidas, - CSALIDASPERIODO9 AS Existencias, 
           - CCOSTOSALIDASPERIODO9 AS Costo
          FROM      dbo.admExistenciaCosto
          UNION ALL
          SELECT        CIDEXISTENCIA, CIDEJERCICIO, 10 AS NumPeriodo, CIDALMACEN, CIDPRODUCTO, 3 AS Tipo, CENTRADASPERIODO10 AS Entradas, 0 AS Salidas, CENTRADASPERIODO10 AS Existencias, 
           CCOSTOENTRADASPERIODO10 AS Costo
          FROM      dbo.admExistenciaCosto
          UNION ALL
          SELECT        CIDEXISTENCIA, CIDEJERCICIO, 10 AS NumPeriodo, CIDALMACEN, CIDPRODUCTO, 4 AS Tipo, 0 AS Entradas, CSALIDASPERIODO10 AS Salidas, - CSALIDASPERIODO10 AS Existencias, 
           - CCOSTOSALIDASPERIODO10 AS Costo
          FROM      dbo.admExistenciaCosto
          UNION ALL
          SELECT        CIDEXISTENCIA, CIDEJERCICIO, 11 AS NumPeriodo, CIDALMACEN, CIDPRODUCTO, 3 AS Tipo, CENTRADASPERIODO11 AS Entradas, 0 AS Salidas, CENTRADASPERIODO11 AS Existencias, 
           CCOSTOENTRADASPERIODO11 AS Costo
          FROM      dbo.admExistenciaCosto
          UNION ALL
          SELECT        CIDEXISTENCIA, CIDEJERCICIO, 11 AS NumPeriodo, CIDALMACEN, CIDPRODUCTO, 4 AS Tipo, 0 AS Entradas, CSALIDASPERIODO11 AS Salidas, - CSALIDASPERIODO11 AS Existencias, 
           - CCOSTOSALIDASPERIODO11 AS Costo
          FROM      dbo.admExistenciaCosto
          UNION ALL
          SELECT        CIDEXISTENCIA, CIDEJERCICIO, 12 AS NumPeriodo, CIDALMACEN, CIDPRODUCTO, 3 AS Tipo, CENTRADASPERIODO12 AS Entradas, 0 AS Salidas, CENTRADASPERIODO12 AS Existencias, 
           CCOSTOENTRADASPERIODO12 AS Costo
          FROM      dbo.admExistenciaCosto
          UNION ALL
          SELECT        CIDEXISTENCIA, CIDEJERCICIO, 12 AS NumPeriodo, CIDALMACEN, CIDPRODUCTO, 4 AS Tipo, 0 AS Entradas, CSALIDASPERIODO12 AS Salidas, - CSALIDASPERIODO12 AS Existencias, 
           - CCOSTOSALIDASPERIODO12 AS Costo
          FROM      dbo.admExistenciaCosto) AS tb
        LEFT OUTER JOIN dbo.admEjercicios AS eje ON tb.CIDEJERCICIO = eje.CIDEJERCICIO
    ) AS tbExistenciaCosto
LEFT OUTER JOIN dbo.admAlmacenes AS alm ON tbExistenciaCosto.CIDALMACEN = alm.CIDALMACEN
LEFT OUTER JOIN dbo.admProductos AS pro ON tbExistenciaCosto.CIDPRODUCTO = pro.CIDPRODUCTO
WHERE
    tbExistenciaCosto.Periodo = valorFechaPeriodo
GROUP BY
    tbExistenciaCosto.Periodo,
    alm.CCODIGOALMACEN,
    alm.CNOMBREALMACEN,
    tbExistenciaCosto.CIDPRODUCTO,
    pro.CCODIGOPRODUCTO,
    pro.CNOMBREPRODUCTO,
    pro.CPRECIO1;
