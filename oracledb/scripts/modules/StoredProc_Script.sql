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
END leer_vehiculo;


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
END leer_pedido;


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
