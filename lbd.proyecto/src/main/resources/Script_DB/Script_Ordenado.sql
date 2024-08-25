-- Tablas ordenadas
CREATE TABLE Provincias (
    ID_Provincia NUMBER PRIMARY KEY,
    Nombre VARCHAR2(50)
);

CREATE TABLE Cantones (
    ID_Canton NUMBER PRIMARY KEY,
    ID_Provincia NUMBER,
    Nombre VARCHAR2(50),
    FOREIGN KEY (ID_Provincia) REFERENCES Provincias(ID_Provincia)
);

CREATE TABLE Distritos (
    ID_Distrito NUMBER PRIMARY KEY,
    ID_Provincia NUMBER,
    ID_Canton NUMBER,
    Nombre VARCHAR2(50),
    FOREIGN KEY (ID_Provincia) REFERENCES Provincias(ID_Provincia),
    FOREIGN KEY (ID_Canton) REFERENCES Cantones(ID_Canton)
);

CREATE TABLE Clientes (
    ID_Cliente NUMBER PRIMARY KEY,
    Nombre VARCHAR2(50),
    Apellido VARCHAR2(50),
    Telefono VARCHAR2(15),
    Email VARCHAR2(100)
);

CREATE TABLE Empleados (
    ID_Empleado NUMBER PRIMARY KEY,
    Nombre VARCHAR2(50),
    Apellido VARCHAR2(50),
    Fecha_Nacimiento DATE,
    Fecha_Contratacion DATE
);

CREATE TABLE Licencias (
    ID_Licencia NUMBER PRIMARY KEY,
    Tipo VARCHAR2(50)
);

CREATE TABLE Puestos (
    ID_Puesto NUMBER PRIMARY KEY,
    Salario NUMBER,
    Descripcion VARCHAR2(100)
);

CREATE TABLE Estados (
    ID_Estado NUMBER PRIMARY KEY,
    Descripcion VARCHAR2(100)
);

CREATE TABLE Vehiculos (
    ID_Vehiculo NUMBER PRIMARY KEY,
    Marca VARCHAR2(50),
    Modelo VARCHAR2(50),
    Anio NUMBER,
    Placa VARCHAR2(10)
);

CREATE TABLE Carga_Tipos (
    ID_Tipo NUMBER PRIMARY KEY,
    Descripcion VARCHAR2(100)
);

CREATE TABLE Pedidos (
    ID_Pedido NUMBER PRIMARY KEY,
    ID_Cliente NUMBER,
    Fecha DATE,
    Monto NUMBER,
    ID_Estado NUMBER,
    FOREIGN KEY (ID_Cliente) REFERENCES Clientes(ID_Cliente),
    FOREIGN KEY (ID_Estado) REFERENCES Estados(ID_Estado)
);

CREATE TABLE Licencias_Empleado (
    ID_Empleado NUMBER,
    ID_Licencia NUMBER,
    Fecha_Expedicion DATE,
    Fecha_Vencimiento DATE,
    PRIMARY KEY (ID_Empleado, ID_Licencia),
    FOREIGN KEY (ID_Empleado) REFERENCES Empleados(ID_Empleado),
    FOREIGN KEY (ID_Licencia) REFERENCES Licencias(ID_Licencia)
);

CREATE TABLE Puestos_Empleado (
    ID_Empleado NUMBER,
    ID_Puesto NUMBER,
    Salario NUMBER,
    PRIMARY KEY (ID_Empleado, ID_Puesto),
    FOREIGN KEY (ID_Empleado) REFERENCES Empleados(ID_Empleado),
    FOREIGN KEY (ID_Puesto) REFERENCES Puestos(ID_Puesto)
);

CREATE TABLE Direcciones_Empleado (
    ID_Direccion NUMBER PRIMARY KEY,
    ID_Empleado NUMBER,
    ID_Provincia NUMBER,
    ID_Canton NUMBER,
    ID_Distrito NUMBER,
    Detalles VARCHAR2(100),
    FOREIGN KEY (ID_Empleado) REFERENCES Empleados(ID_Empleado),
    FOREIGN KEY (ID_Provincia) REFERENCES Provincias(ID_Provincia),
    FOREIGN KEY (ID_Canton) REFERENCES Cantones(ID_Canton),
    FOREIGN KEY (ID_Distrito) REFERENCES Distritos(ID_Distrito)
);

CREATE TABLE Direcciones_Cliente (
    ID_Direccion NUMBER PRIMARY KEY,
    ID_Provincia NUMBER,
    ID_Canton NUMBER,
    ID_Distrito NUMBER,
    Detalles VARCHAR2(100),
    FOREIGN KEY (ID_Provincia) REFERENCES Provincias(ID_Provincia),
    FOREIGN KEY (ID_Canton) REFERENCES Cantones(ID_Canton),
    FOREIGN KEY (ID_Distrito) REFERENCES Distritos(ID_Distrito)
);

CREATE TABLE Direcciones_Pedido (
    ID_Direccion NUMBER PRIMARY KEY,
    ID_Pedido NUMBER,
    ID_Provincia NUMBER,
    ID_Canton NUMBER,
    ID_Distrito NUMBER,
    Detalles VARCHAR2(100),
    FOREIGN KEY (ID_Pedido) REFERENCES Pedidos(ID_Pedido),
    FOREIGN KEY (ID_Provincia) REFERENCES Provincias(ID_Provincia),
    FOREIGN KEY (ID_Canton) REFERENCES Cantones(ID_Canton),
    FOREIGN KEY (ID_Distrito) REFERENCES Distritos(ID_Distrito)
);

CREATE TABLE Facturaciones (
    ID_Factura NUMBER PRIMARY KEY,
    ID_Pedido NUMBER,
    Fecha DATE,
    Monto NUMBER,
    ID_Estado NUMBER,
    FOREIGN KEY (ID_Pedido) REFERENCES Pedidos(ID_Pedido),
    FOREIGN KEY (ID_Estado) REFERENCES Estados(ID_Estado)
);


--Vistas


CREATE OR REPLACE VIEW Vista_Clientes_Direcciones AS
SELECT 
    c.ID_Cliente,
    c.Nombre,
    c.Apellido,
    d.Detalles AS Direccion,
    p.Nombre AS Provincia,
    ct.Nombre AS Canton,
    dt.Nombre AS Distrito
FROM 
    Clientes c
    JOIN Direcciones_Cliente d ON c.ID_Cliente = d.ID_Direccion
    JOIN Provincias p ON d.ID_Provincia = p.ID_Provincia
    JOIN Cantones ct ON d.ID_Canton = ct.ID_Canton
    JOIN Distritos dt ON d.ID_Distrito = dt.ID_Distrito;



CREATE OR REPLACE VIEW Vista_Empleados_Puestos AS
SELECT 
    e.ID_Empleado,
    e.Nombre,
    e.Apellido,
    p.Descripcion AS Puesto,
    pe.Salario
FROM 
    Empleados e
    JOIN Puestos_Empleado pe ON e.ID_Empleado = pe.ID_Empleado
    JOIN Puestos p ON pe.ID_Puesto = p.ID_Puesto;
    
    
    CREATE OR REPLACE VIEW Vista_Pedidos_Estados AS
SELECT 
    p.ID_Pedido,
    c.Nombre AS Cliente,
    p.Fecha,
    p.Monto,
    e.Descripcion AS Estado
FROM 
    Pedidos p
    JOIN Clientes c ON p.ID_Cliente = c.ID_Cliente
    JOIN Estados e ON p.ID_Estado = e.ID_Estado;
    
    CREATE OR REPLACE VIEW Vista_Vehiculos_Empleados AS
SELECT 
    v.ID_Vehiculo,
    v.Marca,
    v.Modelo,
    v.Anio,
    e.Nombre AS Conductor
FROM 
    Vehiculos v
    JOIN Direcciones_Empleado de ON v.ID_Vehiculo = de.ID_Direccion
    JOIN Empleados e ON de.ID_Empleado = e.ID_Empleado;
    
    CREATE OR REPLACE VIEW Vista_Facturacion_Pedidos AS
SELECT 
    f.ID_Factura,
    p.ID_Pedido,
    c.Nombre AS Cliente,
    f.Fecha,
    f.Monto,
    e.Descripcion AS Estado
FROM 
    Facturaciones f
    JOIN Pedidos p ON f.ID_Pedido = p.ID_Pedido
    JOIN Clientes c ON p.ID_Cliente = c.ID_Cliente
    JOIN Estados e ON f.ID_Estado = e.ID_Estado;


--PAQUETES 

--Paquete Manejo de Clientes
CREATE OR REPLACE PACKAGE pkg_clientes AS
    PROCEDURE agregar_cliente(p_nombre VARCHAR2, p_apellido VARCHAR2, p_telefono VARCHAR2, p_email VARCHAR2);
    PROCEDURE eliminar_cliente(p_id_cliente NUMBER);
    PROCEDURE actualizar_cliente(p_id_cliente NUMBER, p_nombre VARCHAR2, p_apellido VARCHAR2, p_telefono VARCHAR2, p_email VARCHAR2);
    FUNCTION obtener_cliente(p_id_cliente NUMBER) RETURN SYS_REFCURSOR;
END pkg_clientes;

CREATE OR REPLACE PACKAGE BODY pkg_clientes AS
    PROCEDURE agregar_cliente(p_nombre VARCHAR2, p_apellido VARCHAR2, p_telefono VARCHAR2, p_email VARCHAR2) IS
    BEGIN
        INSERT INTO Clientes (Nombre, Apellido, Telefono, Email)
        VALUES (p_nombre, p_apellido, p_telefono, p_email);
    END agregar_cliente;

    PROCEDURE eliminar_cliente(p_id_cliente NUMBER) IS
    BEGIN
        DELETE FROM Clientes WHERE ID_Cliente = p_id_cliente;
    END eliminar_cliente;

    PROCEDURE actualizar_cliente(p_id_cliente NUMBER, p_nombre VARCHAR2, p_apellido VARCHAR2, p_telefono VARCHAR2, p_email VARCHAR2) IS
    BEGIN
        UPDATE Clientes
        SET Nombre = p_nombre, Apellido = p_apellido, Telefono = p_telefono, Email = p_email
        WHERE ID_Cliente = p_id_cliente;
    END actualizar_cliente;

    FUNCTION obtener_cliente(p_id_cliente NUMBER) RETURN SYS_REFCURSOR IS
        cur SYS_REFCURSOR;
    BEGIN
        OPEN cur FOR
        SELECT * FROM Clientes WHERE ID_Cliente = p_id_cliente;
        RETURN cur;
    END obtener_cliente;
END pkg_clientes;

--Paquete Manejo de Pedidos


CREATE OR REPLACE PACKAGE pkg_pedidos AS
    PROCEDURE agregar_pedido(p_id_cliente NUMBER, p_fecha DATE, p_monto NUMBER, p_id_estado NUMBER);
    PROCEDURE eliminar_pedido(p_id_pedido NUMBER);
    PROCEDURE actualizar_pedido(p_id_pedido NUMBER, p_fecha DATE, p_monto NUMBER, p_id_estado NUMBER);
    FUNCTION obtener_pedido(p_id_pedido NUMBER) RETURN SYS_REFCURSOR;
END pkg_pedidos;


CREATE OR REPLACE PACKAGE BODY pkg_pedidos AS
    PROCEDURE agregar_pedido(p_id_cliente NUMBER, p_fecha DATE, p_monto NUMBER, p_id_estado NUMBER) IS
    BEGIN
        INSERT INTO Pedidos (ID_Cliente, Fecha, Monto, ID_Estado)
        VALUES (p_id_cliente, p_fecha, p_monto, p_id_estado);
    END agregar_pedido;

    PROCEDURE eliminar_pedido(p_id_pedido NUMBER) IS
    BEGIN
        DELETE FROM Pedidos WHERE ID_Pedido = p_id_pedido;
    END eliminar_pedido;

    PROCEDURE actualizar_pedido(p_id_pedido NUMBER, p_fecha DATE, p_monto NUMBER, p_id_estado NUMBER) IS
    BEGIN
        UPDATE Pedidos
        SET Fecha = p_fecha, Monto = p_monto, ID_Estado = p_id_estado
        WHERE ID_Pedido = p_id_pedido;
    END actualizar_pedido;

    FUNCTION obtener_pedido(p_id_pedido NUMBER) RETURN SYS_REFCURSOR IS
        cur SYS_REFCURSOR;
    BEGIN
        OPEN cur FOR
        SELECT * FROM Pedidos WHERE ID_Pedido = p_id_pedido;
        RETURN cur;
    END obtener_pedido;
END pkg_pedidos;





