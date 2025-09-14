
## Esquema de datos (MySQL)

```mermaid
erDiagram
  categorias {
    INT id_categoria PK
    VARCHAR nombre
  }

  proveedores {
    INT id_proveedor PK
    VARCHAR nombre
  }

  turnos {
    INT id_turno PK
    VARCHAR nombre
  }

  sucursales {
    INT id_sucursal PK
    VARCHAR nombre
  }

  productos {
    INT id_producto PK
    VARCHAR nombre
    DECIMAL precio_unitario
    INT id_categoria FK
    INT id_proveedor FK
  }

  clientes {
    INT id_cliente PK
    VARCHAR nombre
  }

  empleados {
    INT id_empleado PK
    VARCHAR nombre
    INT id_turno FK
    INT id_sucursal FK
  }

  ventas {
    INT id_venta PK
    DATETIME fecha
    DECIMAL total
    ENUM metodo_pago
    INT id_cliente FK
    INT id_empleado FK
    INT id_sucursal FK
  }

  detalle_ventas {
    INT id_detalle PK
    INT cantidad
    DECIMAL precio_unitario
    DECIMAL descuento
    INT id_venta FK
    INT id_producto FK
  }

  ordenes_compra {
    INT id_orden PK
    DATE fecha
    DECIMAL total
    ENUM estado
    INT id_proveedor FK
    INT id_empleado FK
  }

  detalle_orden_compra {
    INT id_detalle_orden PK
    INT cantidad
    DECIMAL precio_unitario
    INT id_orden FK
    INT id_producto FK
  }

  inventario {
    INT id_inventario PK
    INT cantidad
    INT id_producto FK
    INT id_sucursal FK
  }

  promociones {
    INT id_promocion PK
    VARCHAR nombre
    DECIMAL descuento
    DATE fecha_inicio
    DATE fecha_fin
    INT id_producto FK
    INT id_categoria FK
  }

  devoluciones {
    INT id_devolucion PK
    DATETIME fecha
    INT cantidad
    INT id_venta FK
    INT id_producto FK
    INT id_empleado FK
  }

  pagos_proveedores {
    INT id_pago PK
    DATE fecha
    DECIMAL monto
    VARCHAR metodo_pago
    INT id_orden FK
    INT id_empleado FK
  }

  %% Relaciones principales
  categorias   ||--o{ productos : "id_categoria"
  proveedores  ||--o{ productos : "id_proveedor"
  turnos       ||--o{ empleados : "id_turno"
  sucursales   ||--o{ empleados : "id_sucursal"
  clientes     ||--o{ ventas    : "id_cliente"
  empleados    ||--o{ ventas    : "id_empleado"
  sucursales   ||--o{ ventas    : "id_sucursal"
  ventas       ||--o{ detalle_ventas : "id_venta"
  productos    ||--o{ detalle_ventas : "id_producto"
  proveedores  ||--o{ ordenes_compra : "id_proveedor"
  empleados    ||--o{ ordenes_compra : "id_empleado"
  ordenes_compra ||--o{ detalle_orden_compra : "id_orden"
  productos    ||--o{ detalle_orden_compra : "id_producto"
  productos    ||--o{ inventario : "id_producto"
  sucursales   ||--o{ inventario : "id_sucursal"
  ventas       ||--o{ devoluciones : "id_venta"
  productos    ||--o{ devoluciones : "id_producto"
  empleados    ||--o{ devoluciones : "id_empleado"
  ordenes_compra ||--o{ pagos_proveedores : "id_orden"
  empleados    ||--o{ pagos_proveedores : "id_empleado"
  categorias   ||--o{ promociones : "id_categoria"
  productos    ||--o{ promociones : "id_producto"
