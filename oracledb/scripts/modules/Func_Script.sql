
-- Clientes
-- Function to search clients by a string in their name
CREATE OR REPLACE FUNCTION buscar_clientes_nombre(p_nombre IN VARCHAR2)
RETURN SYS_REFCURSOR AS
    l_cursor SYS_REFCURSOR;
BEGIN
    OPEN l_cursor FOR
    SELECT ID_Cliente, Nombre, Apellido, Telefono, Email
    FROM Clientes
    WHERE LOWER(Nombre) LIKE '%' || LOWER(p_nombre) || '%';
    RETURN l_cursor;
END buscar_clientes_nombre;

-- Test function
SET SERVEROUTPUT ON;
DECLARE
    l_cursor SYS_REFCURSOR;
    l_record Clientes%ROWTYPE;
BEGIN
    l_cursor := buscar_clientes_nombre('ale');
    LOOP
        FETCH l_cursor INTO l_record;
        EXIT WHEN l_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('ID_Cliente: ' || l_record.ID_Cliente);
        DBMS_OUTPUT.PUT_LINE('Nombre: ' || l_record.Nombre);
        DBMS_OUTPUT.PUT_LINE('Apellido: ' || l_record.Apellido);
        DBMS_OUTPUT.PUT_LINE('Telefono: ' || l_record.Telefono);
        DBMS_OUTPUT.PUT_LINE('Email: ' || l_record.Email);
        DBMS_OUTPUT.PUT_LINE('-------------------------');
    END LOOP;
    CLOSE l_cursor;
END;

-- Function to search clients by a string in their email
CREATE OR REPLACE FUNCTION buscar_clientes_email(p_email IN VARCHAR2)
RETURN SYS_REFCURSOR AS
    l_cursor SYS_REFCURSOR;
BEGIN
    OPEN l_cursor FOR
    SELECT ID_Cliente, Nombre, Apellido, Telefono, Email
    FROM Clientes
    WHERE LOWER(Email) LIKE '%' || LOWER(p_email) || '%';
    RETURN l_cursor;
END buscar_clientes_email;

-- Test function
SET SERVEROUTPUT ON;
DECLARE
    l_cursor SYS_REFCURSOR;
    l_record Clientes%ROWTYPE;
BEGIN
    l_cursor := buscar_clientes_email('gmail');
    LOOP
        FETCH l_cursor INTO l_record;
        EXIT WHEN l_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('ID_Cliente: ' || l_record.ID_Cliente);
        DBMS_OUTPUT.PUT_LINE('Nombre: ' || l_record.Nombre);
        DBMS_OUTPUT.PUT_LINE('Apellido: ' || l_record.Apellido);
        DBMS_OUTPUT.PUT_LINE('Telefono: ' || l_record.Telefono);
        DBMS_OUTPUT.PUT_LINE('Email: ' || l_record.Email);
        DBMS_OUTPUT.PUT_LINE('-------------------------');
    END LOOP;
    CLOSE l_cursor;
END;

--busca empleado por Nombre
CREATE OR REPLACE FUNCTION buscar_empleado_nombre(p_nombre IN VARCHAR2)
RETURN SYS_REFCURSOR AS
    l_cursor SYS_REFCURSOR;
BEGIN
    OPEN l_cursor FOR
    SELECT ID_Empleado, Nombre, Apellido, Fecha_Nacimiento, Fecha_Contratacion
    FROM Empleados
    WHERE LOWER(Nombre) LIKE '%' || LOWER(p_nombre) || '%';
    RETURN l_cursor;
END buscar_empleado_nombre;


DECLARE
    l_cursor SYS_REFCURSOR;
    l_record Empleados%ROWTYPE;
BEGIN
    l_cursor := buscar_empleado_nombre('Brandon');
    LOOP
        FETCH l_cursor INTO l_record;
        EXIT WHEN l_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('ID_Empleado: ' || l_record.ID_Empleado);
        DBMS_OUTPUT.PUT_LINE('Nombre: ' || l_record.Nombre);
        DBMS_OUTPUT.PUT_LINE('Apellido: ' || l_record.Apellido);
        DBMS_OUTPUT.PUT_LINE('Fecha_Nacimiento: ' || l_record.Fecha_Nacimiento);
        DBMS_OUTPUT.PUT_LINE('Fecha_Contratacion: ' || l_record.Fecha_Contratacion);
        DBMS_OUTPUT.PUT_LINE('-------------------------');
    END LOOP;
    CLOSE l_cursor;
END;

--buscar empleado por ID_Empleado
CREATE OR REPLACE FUNCTION buscar_empleado_ID(p_Empleado_ID IN NUMBER)
RETURN SYS_REFCURSOR AS
    l_cursor SYS_REFCURSOR;
BEGIN
    OPEN l_cursor FOR
    SELECT ID_Empleado, Nombre, Apellido, Fecha_Nacimiento, Fecha_Contratacion
    FROM Empleados
    WHERE ID_Empleado = p_Empleado_ID;
    RETURN l_cursor;
END buscar_empleado_ID;

DECLARE
    l_cursor SYS_REFCURSOR;
    l_id_empleado Empleados.ID_Empleado%TYPE;
    l_nombre Empleados.Nombre%TYPE;
    l_apellido Empleados.Apellido%TYPE;
    l_fecha_nacimiento Empleados.Fecha_Nacimiento%TYPE;
    l_fecha_contratacion Empleados.Fecha_Contratacion%TYPE;
BEGIN
    l_cursor := buscar_empleado_ID(3);
    LOOP
        FETCH l_cursor INTO l_id_empleado, l_nombre, l_apellido, l_fecha_nacimiento, l_fecha_contratacion;
        EXIT WHEN l_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('ID_Empleado: ' || l_id_empleado);
        DBMS_OUTPUT.PUT_LINE('Nombre: ' || l_nombre);
        DBMS_OUTPUT.PUT_LINE('Apellido: ' || l_apellido);
        DBMS_OUTPUT.PUT_LINE('Fecha_Nacimiento: ' || l_fecha_nacimiento);
        DBMS_OUTPUT.PUT_LINE('Fecha_Contratacion: ' || l_fecha_contratacion);
        DBMS_OUTPUT.PUT_LINE('-------------------------');
    END LOOP;
    CLOSE l_cursor;
END;

--buscar vehiculo por placa
CREATE OR REPLACE FUNCTION buscar_vehiculo_placa(p_placa IN VARCHAR2)
RETURN SYS_REFCURSOR AS
    l_cursor SYS_REFCURSOR;
BEGIN
    OPEN l_cursor FOR
    SELECT ID_Vehiculo, Marca, Modelo, Anio, Placa
    FROM Vehiculos
    WHERE LOWER(Placa) LIKE '%' || LOWER(p_placa) || '%';
    RETURN l_cursor;
END buscar_vehiculo_placa;


DECLARE
    l_cursor SYS_REFCURSOR;
    l_id_vehiculo Vehiculos.ID_Vehiculo%TYPE;
    l_marca Vehiculos.Marca%TYPE;
    l_modelo Vehiculos.Modelo%TYPE;
    l_anio Vehiculos.Anio%TYPE;
    l_placa Vehiculos.Placa%TYPE;
BEGIN
    l_cursor := buscar_vehiculo_placa('123456789');
    LOOP
        FETCH l_cursor INTO l_id_vehiculo, l_marca, l_modelo, l_anio, l_placa;
        EXIT WHEN l_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('ID_Vehiculo: ' || l_id_vehiculo);
        DBMS_OUTPUT.PUT_LINE('Marca: ' || l_marca);
        DBMS_OUTPUT.PUT_LINE('Modelo: ' || l_modelo);
        DBMS_OUTPUT.PUT_LINE('Año: ' || l_anio);
        DBMS_OUTPUT.PUT_LINE('Placa: ' || l_placa);
        DBMS_OUTPUT.PUT_LINE('-------------------------');
    END LOOP;
    CLOSE l_cursor;
END;

--busca vehiculo por marca
CREATE OR REPLACE FUNCTION buscar_vehiculo_marca(p_marca IN VARCHAR2)
RETURN SYS_REFCURSOR AS
    l_cursor SYS_REFCURSOR;
BEGIN
    OPEN l_cursor FOR
    SELECT ID_Vehiculo, Marca, Modelo, Anio, Placa
    FROM Vehiculos
    WHERE LOWER(Marca) LIKE '%' || LOWER(p_marca) || '%';
    RETURN l_cursor;
END buscar_vehiculo_marca;


DECLARE
    l_cursor SYS_REFCURSOR;
    l_id_vehiculo Vehiculos.ID_Vehiculo%TYPE;
    l_marca Vehiculos.Marca%TYPE;
    l_modelo Vehiculos.Modelo%TYPE;
    l_anio Vehiculos.Anio%TYPE;
    l_placa Vehiculos.Placa%TYPE;
BEGIN
    l_cursor := buscar_vehiculo_marca('Mack');
    LOOP
        FETCH l_cursor INTO l_id_vehiculo, l_marca, l_modelo, l_anio, l_placa;
        EXIT WHEN l_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('ID_Vehiculo: ' || l_id_vehiculo);
        DBMS_OUTPUT.PUT_LINE('Marca: ' || l_marca);
        DBMS_OUTPUT.PUT_LINE('Modelo: ' || l_modelo);
        DBMS_OUTPUT.PUT_LINE('Año: ' || l_anio);
        DBMS_OUTPUT.PUT_LINE('Placa: ' || l_placa);
        DBMS_OUTPUT.PUT_LINE('-------------------------');
    END LOOP;
    CLOSE l_cursor;
END;

--busca pedido por id
CREATE OR REPLACE FUNCTION buscar_pedido_ID(p_pedido_ID IN NUMBER)
RETURN SYS_REFCURSOR AS
    l_cursor SYS_REFCURSOR;
BEGIN
    OPEN l_cursor FOR
    SELECT ID_Pedido, ID_Cliente, Fecha, Monto, ID_Estado
    FROM Pedidos
    WHERE ID_Pedido = p_pedido_ID;
    RETURN l_cursor;
END buscar_pedido_ID;

DECLARE
    l_cursor SYS_REFCURSOR;
    l_id_pedido Pedidos.ID_Pedido%TYPE;
    l_id_cliente Pedidos.ID_Cliente%TYPE;
    l_fecha Pedidos.Fecha%TYPE;
    l_monto Pedidos.Monto%TYPE;
    l_id_estado Pedidos.ID_Estado%TYPE;
BEGIN
    l_cursor := buscar_pedido_ID(3);
    LOOP
        FETCH l_cursor INTO l_id_pedido, l_id_cliente, l_fecha, l_monto, l_id_estado;
        EXIT WHEN l_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('ID_Pedido: ' || l_id_pedido);
        DBMS_OUTPUT.PUT_LINE('ID_Cliente: ' || l_id_cliente);
        DBMS_OUTPUT.PUT_LINE('Fecha: ' || l_fecha);
        DBMS_OUTPUT.PUT_LINE('Monto: ' || l_monto);
        DBMS_OUTPUT.PUT_LINE('ID_Estado: ' || l_id_estado);
        DBMS_OUTPUT.PUT_LINE('-------------------------');
    END LOOP;
    CLOSE l_cursor;
END;

--busca pedido por id_Estado
CREATE OR REPLACE FUNCTION buscar_pedido_ID_Estado(p_pedido_ID_Estado IN NUMBER)
RETURN SYS_REFCURSOR AS
    l_cursor SYS_REFCURSOR;
BEGIN
    OPEN l_cursor FOR
    SELECT ID_Pedido, ID_Cliente, Fecha, Monto, ID_Estado
    FROM Pedidos
    WHERE ID_Estado = p_pedido_ID_Estado;
    RETURN l_cursor;
END buscar_pedido_ID_Estado;

DECLARE
    l_cursor SYS_REFCURSOR;
    l_id_pedido Pedidos.ID_Pedido%TYPE;
    l_id_cliente Pedidos.ID_Cliente%TYPE;
    l_fecha Pedidos.Fecha%TYPE;
    l_monto Pedidos.Monto%TYPE;
    l_id_estado Pedidos.ID_Estado%TYPE;
BEGIN
    l_cursor := buscar_pedido_ID_Estado(3);
    LOOP
        FETCH l_cursor INTO l_id_pedido, l_id_cliente, l_fecha, l_monto, l_id_estado;
        EXIT WHEN l_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('ID_Pedido: ' || l_id_pedido);
        DBMS_OUTPUT.PUT_LINE('ID_Cliente: ' || l_id_cliente);
        DBMS_OUTPUT.PUT_LINE('Fecha: ' || l_fecha);
        DBMS_OUTPUT.PUT_LINE('Monto: ' || l_monto);
        DBMS_OUTPUT.PUT_LINE('ID_Estado: ' || l_id_estado);
        DBMS_OUTPUT.PUT_LINE('-------------------------');
    END LOOP;
    CLOSE l_cursor;
END;

--busca facturas por ID
CREATE OR REPLACE FUNCTION buscar_factura_ID(p_factura_ID IN NUMBER)
RETURN SYS_REFCURSOR AS
    l_cursor SYS_REFCURSOR;
BEGIN
    OPEN l_cursor FOR
    SELECT ID_Factura, ID_Pedido, Fecha, Monto, ID_Estado
    FROM Facturaciones
    WHERE ID_Factura = p_factura_ID;
    RETURN l_cursor;
END buscar_factura_ID;

DECLARE
    l_cursor SYS_REFCURSOR;
    l_id_factura Facturaciones.ID_Factura%TYPE;
    l_id_pedido Facturaciones.ID_Pedido%TYPE;
    l_fecha Facturaciones.Fecha%TYPE;
    l_monto Facturaciones.Monto%TYPE;
    l_id_estado Facturaciones.ID_Estado%TYPE;
BEGIN
    l_cursor := buscar_factura_ID(3);
    LOOP
        FETCH l_cursor INTO l_id_factura, l_id_pedido, l_fecha, l_monto, l_id_estado;
        EXIT WHEN l_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('ID_Factura: ' || l_id_factura);
        DBMS_OUTPUT.PUT_LINE('ID_Pedido: ' || l_id_pedido);
        DBMS_OUTPUT.PUT_LINE('Fecha: ' || l_fecha);
        DBMS_OUTPUT.PUT_LINE('Monto: ' || l_monto);
        DBMS_OUTPUT.PUT_LINE('ID_Estado: ' || l_id_estado);
        DBMS_OUTPUT.PUT_LINE('-------------------------');
    END LOOP;
    CLOSE l_cursor;
END;

--buscar facturas por monto
CREATE OR REPLACE FUNCTION buscar_factura_monto(p_factura_monto IN NUMBER)
RETURN SYS_REFCURSOR AS
    l_cursor SYS_REFCURSOR;
BEGIN
    OPEN l_cursor FOR
    SELECT ID_Factura, ID_Pedido, Fecha, Monto, ID_Estado
    FROM Facturaciones
    WHERE Monto = p_factura_monto;
    RETURN l_cursor;
END buscar_factura_monto;

DECLARE
    l_cursor SYS_REFCURSOR;
    l_id_factura Facturaciones.ID_Factura%TYPE;
    l_id_pedido Facturaciones.ID_Pedido%TYPE;
    l_fecha Facturaciones.Fecha%TYPE;
    l_monto Facturaciones.Monto%TYPE;
    l_id_estado Facturaciones.ID_Estado%TYPE;
BEGIN
    l_cursor := buscar_factura_monto(3);
    LOOP
        FETCH l_cursor INTO l_id_factura, l_id_pedido, l_fecha, l_monto, l_id_estado;
        EXIT WHEN l_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('ID_Factura: ' || l_id_factura);
        DBMS_OUTPUT.PUT_LINE('ID_Pedido: ' || l_id_pedido);
        DBMS_OUTPUT.PUT_LINE('Fecha: ' || l_fecha);
        DBMS_OUTPUT.PUT_LINE('Monto: ' || l_monto);
        DBMS_OUTPUT.PUT_LINE('ID_Estado: ' || l_id_estado);
        DBMS_OUTPUT.PUT_LINE('-------------------------');
    END LOOP;
    CLOSE l_cursor;
END;

