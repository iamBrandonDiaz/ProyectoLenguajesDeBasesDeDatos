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
    p_cursor OUT SYS_REFCURSOR   
) AS
BEGIN
    OPEN p_cursor FOR
    SELECT Nombre, Apellido, Fecha_Nacimiento, Fecha_Contratacion
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
	p_cursor OUT SYS_REFCURSOR
) AS
BEGIN
	OPEN p_cursor FOR
    SELECT Marca, Modelo, Anio, Placa
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
    p_cursor OUT SYS_REFCURSOR
) AS
BEGIN
    OPEN p_cursor FOR
    SELECT ID_Cliente, Fecha, Monto, ID_Estado
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

/* SP de objeto Provincia */
CREATE OR REPLACE PROCEDURE ver_provincia (
    p_id_provincia IN NUMBER,
    p_nombre OUT VARCHAR2
) AS
BEGIN
    SELECT Nombre
    INTO p_nombre
    FROM Provincias
    WHERE ID_Provincia = p_id_provincia;
END ver_provincia;

CREATE OR REPLACE PROCEDURE ver_provincias (
    p_cursor OUT SYS_REFCURSOR
) AS
BEGIN
    OPEN p_cursor FOR
    SELECT ID_Provincia, Nombre
    FROM Provincias;
END ver_provincias;


/* SP de objeto DireccionCliente */
CREATE OR REPLACE PROCEDURE insertar_direccion_cliente (
    p_id_cliente IN NUMBER,
    p_detalles IN VARCHAR2,
    p_provincia IN VARCHAR2,
    p_canton IN VARCHAR2,
    p_distrito IN VARCHAR2,
) AS
BEGIN
    INSERT INTO Direcciones_Cliente (ID_Cliente, ID_Provincia, ID_Canton, ID_Distrito, Detalles)
    VALUES (p_id_cliente, p_provincia, p_canton, p_distrito, p_detalles);
END insertar_direccion_cliente;

-- Script para provar el SP de instertar direccion de cliente
-- EXEC insertar_direccion_cliente(1, 'Detalles de la direccion', 'San Jose', 'San Jose', 'San Jose');