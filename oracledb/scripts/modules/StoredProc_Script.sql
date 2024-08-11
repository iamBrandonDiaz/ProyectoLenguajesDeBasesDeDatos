-- Script para crear los SPs de la base de datos

/* SP de objeto Empleado */
CREATE OR REPLACE PROCEDURE insertar_empleado (
    p_nombre IN VARCHAR2,
    p_apellido IN VARCHAR2,
    p_fecha_nacimiento IN DATE,
    p_fecha_contratacion IN DATE
) AS
BEGIN
    INSERT INTO Empleados (Nombre, Apellido, Fecha_Nacimiento, Fecha_Contratacion)
    VALUES (p_nombre, p_apellido, p_fecha_nacimiento, p_fecha_contratacion);
END insertar_empleado;


CREATE OR REPLACE PROCEDURE ver_empleado (
    p_id_empleado IN NUMBER,
    p_nombre OUT VARCHAR2,
    p_apellido OUT VARCHAR2,
    p_fecha_nacimiento OUT DATE,
    p_fecha_contratacion OUT DATE
) AS
BEGIN
    SELECT Nombre, Apellido, Fecha_Nacimiento, Fecha_Contratacion
    INTO p_nombre, p_apellido, p_fecha_nacimiento, p_fecha_contratacion
    FROM Empleados
    WHERE ID_Empleado = p_id_empleado;
END ver_empleado;


CREATE OR REPLACE PROCEDURE actualizar_empleado (
    p_id_empleado IN NUMBER,
    p_nombre IN VARCHAR2,
    p_apellido IN VARCHAR2,
    p_fecha_nacimiento IN DATE,
    p_fecha_contratacion IN DATE
) AS
BEGIN
    UPDATE Empleados
    SET Nombre = p_nombre,
        Apellido = p_apellido,
        Fecha_Nacimiento = p_fecha_nacimiento,
        Fecha_Contratacion = p_fecha_contratacion
    WHERE ID_Empleado = p_id_empleado;
END actualizar_empleado;

CREATE OR REPLACE PROCEDURE eliminar_empleado (
    p_id_empleado IN NUMBER
) AS
BEGIN
    DELETE FROM Empleados
    WHERE ID_Empleado = p_id_empleado;
END eliminar_empleado;

/* SP de objeto Vehiculo */
CREATE OR REPLACE PROCEDURE insertar_vehiculo (
    p_marca IN VARCHAR2,
    p_modelo IN VARCHAR2,
    p_anio IN NUMBER,
    p_placa IN VARCHAR2
) AS
BEGIN
    INSERT INTO Vehiculos (Marca, Modelo, Anio, Placa)
    VALUES (p_marca, p_modelo, p_anio, p_placa);
END insertar_vehiculo;


CREATE OR REPLACE PROCEDURE ver_vehiculo (
    p_id_vehiculo IN NUMBER,
    p_marca OUT VARCHAR2,
    p_modelo OUT VARCHAR2,
    p_anio OUT NUMBER,
    p_placa OUT VARCHAR2
) AS
BEGIN
    SELECT Marca, Modelo, Anio, Placa
    INTO p_marca, p_modelo, p_anio, p_placa
    FROM Vehiculos
    WHERE ID_Vehiculo = p_id_vehiculo;
END ver_vehiculo;


CREATE OR REPLACE PROCEDURE actualizar_vehiculo (
    p_id_vehiculo IN NUMBER,
    p_marca IN VARCHAR2,
    p_modelo IN VARCHAR2,
    p_anio IN NUMBER,
    p_placa IN VARCHAR2
) AS
BEGIN
    UPDATE Vehiculos
    SET Marca = p_marca,
        Modelo = p_modelo,
        Anio = p_anio,
        Placa = p_placa
    WHERE ID_Vehiculo = p_id_vehiculo;
END actualizar_vehiculo;


CREATE OR REPLACE PROCEDURE eliminar_vehiculo (
    p_id_vehiculo IN NUMBER
) AS
BEGIN
    DELETE FROM Vehiculos
    WHERE ID_Vehiculo = p_id_vehiculo;
END eliminar_vehiculo;


/* SP de objeto Pedido */
CREATE OR REPLACE PROCEDURE insertar_pedido (
    p_id_cliente IN NUMBER,
    p_fecha IN DATE,
    p_monto IN NUMBER,
    p_id_estado IN NUMBER
) AS
BEGIN
    INSERT INTO Pedidos (ID_Cliente, Fecha, Monto, ID_Estado)
    VALUES (p_id_cliente, p_fecha, p_monto, p_id_estado);
END insertar_pedido;


CREATE OR REPLACE PROCEDURE ver_pedido (
    p_id_pedido IN NUMBER,
    p_id_cliente OUT NUMBER,
    p_fecha OUT DATE,
    p_monto OUT NUMBER,
    p_id_estado OUT NUMBER
) AS
BEGIN
    SELECT ID_Cliente, Fecha, Monto, ID_Estado
    INTO p_id_cliente, p_fecha, p_monto, p_id_estado
    FROM Pedidos
    WHERE ID_Pedido = p_id_pedido;
END ver_pedido;


CREATE OR REPLACE PROCEDURE actualizar_pedido (
    p_id_pedido IN NUMBER,
    p_id_cliente IN NUMBER,
    p_fecha IN DATE,
    p_monto IN NUMBER,
    p_id_estado IN NUMBER
) AS
BEGIN
    UPDATE Pedidos
    SET ID_Cliente = p_id_cliente,
        Fecha = p_fecha,
        Monto = p_monto,
        ID_Estado = p_id_estado
    WHERE ID_Pedido = p_id_pedido;
END actualizar_pedido;


CREATE OR REPLACE PROCEDURE eliminar_pedido (
    p_id_pedido IN NUMBER
) AS
BEGIN
    DELETE FROM Pedidos
    WHERE ID_Pedido = p_id_pedido;
END eliminar_pedido;


/* SP de objeto Cliente */
CREATE OR REPLACE PROCEDURE insertar_cliente (
    p_nombre IN VARCHAR2,
    p_apellido IN VARCHAR2,
    p_telefono IN VARCHAR2,
    p_correo IN VARCHAR2
) AS
BEGIN
    INSERT INTO Clientes (Nombre, Apellido, Telefono, Correo)
    VALUES (p_nombre, p_apellido, p_telefono, p_correo);
END insertar_cliente;

CREATE OR REPLACE PROCEDURE ver_cliente (
    p_id_cliente IN NUMBER,
    p_nombre OUT VARCHAR2,
    p_apellido OUT VARCHAR2,
    p_telefono OUT VARCHAR2,
    p_correo OUT VARCHAR2
) AS
BEGIN
    SELECT Nombre, Apellido, Telefono, Email
    INTO p_nombre, p_apellido, p_telefono, p_correo
    FROM Clientes
    WHERE ID_Cliente = p_id_cliente;
END ver_cliente;

CREATE OR REPLACE PROCEDURE actualizar_cliente (
    p_id_cliente IN NUMBER,
    p_nombre IN VARCHAR2,
    p_apellido IN VARCHAR2,
    p_telefono IN VARCHAR2,
    p_correo IN VARCHAR2
) AS
BEGIN
    UPDATE Clientes
    SET Nombre = p_nombre,
        Apellido = p_apellido,
        Telefono = p_telefono,
        Email = p_correo
    WHERE ID_Cliente = p_id_cliente;
END actualizar_cliente;

CREATE OR REPLACE PROCEDURE eliminar_cliente (
    p_id_cliente IN NUMBER
) AS
BEGIN
    DELETE FROM Clientes
    WHERE ID_Cliente = p_id_cliente;
END eliminar_cliente;

CREATE OR REPLACE PROCEDURE ver_clientes (
    p_cursor OUT SYS_REFCURSOR
) AS
BEGIN
    OPEN p_cursor FOR
    SELECT ID_Cliente, Nombre, Apellido, Telefono, Email
    FROM Clientes;
END ver_clientes;


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
