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

/* SP de objeto Canton */
CREATE OR REPLACE PROCEDURE ver_canton (
    p_id_canton IN NUMBER,
    p_nombre OUT VARCHAR2,
    p_id_provincia OUT NUMBER
) AS
BEGIN
    SELECT Nombre, ID_Provincia
    INTO p_nombre, p_id_provincia
    FROM Cantones
    WHERE ID_Canton = p_id_canton;
END ver_canton;

CREATE OR REPLACE PROCEDURE ver_cantones (
    p_cursor OUT SYS_REFCURSOR
) AS
BEGIN
    OPEN p_cursor FOR
    SELECT ID_Canton, Nombre, ID_Provincia
    FROM Cantones;
END ver_cantones;

/* SP de objeto Distrito */
CREATE OR REPLACE PROCEDURE ver_distrito (
    p_id_distrito IN NUMBER,
    p_nombre OUT VARCHAR2,
    p_id_canton OUT NUMBER
) AS
BEGIN
    SELECT Nombre, ID_Canton
    INTO p_nombre, p_id_canton
    FROM Distritos
    WHERE ID_Distrito = p_id_distrito;
END ver_distrito;

CREATE OR REPLACE PROCEDURE ver_distritos (
    p_cursor OUT SYS_REFCURSOR
) AS
BEGIN
    OPEN p_cursor FOR
    SELECT ID_Distrito, Nombre, ID_Canton
    FROM Distritos;
END ver_distritos;


/* SP de objeto DireccionCliente */
CREATE OR REPLACE PROCEDURE insertar_direccion_cliente (
    p_id_cliente IN NUMBER,
    p_detalles IN VARCHAR2,
    p_provincia IN VARCHAR2,
    p_canton IN VARCHAR2,
    p_distrito IN VARCHAR2
) AS
BEGIN
    INSERT INTO Direcciones_Cliente (ID_Cliente, ID_Provincia, ID_Canton, ID_Distrito, Detalles)
    VALUES (p_id_cliente, p_provincia, p_canton, p_distrito, p_detalles);
END insertar_direccion_cliente;

CREATE OR REPLACE PROCEDURE actualizar_direccion_cliente (
    p_id_direccion IN NUMBER,
    p_detalles IN VARCHAR2,
    p_provincia IN VARCHAR2,
    p_canton IN VARCHAR2,
    p_distrito IN VARCHAR2
) AS
BEGIN
    UPDATE Direcciones_Cliente
    SET ID_Provincia = p_provincia,
        ID_Canton = p_canton,
        ID_Distrito = p_distrito,
        Detalles = p_detalles
    WHERE ID_Direccion = p_id_direccion;
END actualizar_direccion_cliente;

CREATE OR REPLACE PROCEDURE ver_direccion_cliente (
    p_id_direccion IN NUMBER,
    p_id_cliente OUT NUMBER,
    p_detalles OUT VARCHAR2,
    p_id_distrito OUT VARCHAR2
) AS
BEGIN
    SELECT ID_Cliente, Detalles, ID_Distrito
    INTO p_id_cliente, p_detalles, p_id_distrito
    FROM Direcciones_Cliente
    WHERE ID_Direccion = p_id_direccion;
END ver_direccion_cliente;

-- DROP PROCEDURE ver_direcciones_clientes;
CREATE OR REPLACE PROCEDURE ver_direcciones_clientes(
    p_cursor OUT SYS_REFCURSOR
) AS
BEGIN
    OPEN p_cursor FOR
    SELECT ID_Direccion, ID_Cliente, Detalles, ID_Distrito
    FROM Direcciones_Cliente;
END ver_direcciones_clientes;

CREATE OR REPLACE PROCEDURE eliminar_direccion_cliente (
    p_id_direccion IN NUMBER
) AS
BEGIN
    DELETE FROM Direcciones_Cliente
    WHERE ID_Direccion = p_id_direccion;
END eliminar_direccion_cliente;

-- SP de objeto Licencia
CREATE OR REPLACE PROCEDURE ver_licencia (
    p_id_licencia IN NUMBER,
    p_tipo OUT VARCHAR2
) AS
BEGIN
    SELECT Tipo
    INTO p_tipo
    FROM Licencias
    WHERE ID_Licencia = p_id_licencia;
END ver_licencia;

CREATE OR REPLACE PROCEDURE ver_licencias (
    p_cursor OUT SYS_REFCURSOR
) AS
BEGIN
    OPEN p_cursor FOR
    SELECT ID_Licencia, Tipo
    FROM Licencias;
END ver_licencias;

-- SP de objeto Estado
CREATE OR REPLACE PROCEDURE ver_estado (
    p_id_estado IN NUMBER,
    p_descripcion OUT VARCHAR2
) AS
BEGIN
    SELECT Descripcion
    INTO p_descripcion
    FROM Estados
    WHERE ID_Estado = p_id_estado;
END ver_estado;

CREATE OR REPLACE PROCEDURE ver_estados (
    p_cursor OUT SYS_REFCURSOR
) AS
BEGIN
    OPEN p_cursor FOR
    SELECT ID_Estado, Descripcion
    FROM Estados;
END ver_estados;