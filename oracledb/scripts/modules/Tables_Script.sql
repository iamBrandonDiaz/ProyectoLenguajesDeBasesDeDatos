-- Script para crear las tablas de la base de datos

CREATE TABLE Empleados (
    ID_Empleado NUMBER PRIMARY KEY GENERATED BY DEFAULT ON NULL AS IDENTITY,
    Nombre VARCHAR2(50),
    Apellido VARCHAR2(50),
    Fecha_Nacimiento DATE,
    Fecha_Contratacion DATE
);


CREATE TABLE Licencias_Empleado (
    id_licencia_empleado NUMBER PRIMARY KEY GENERATED BY DEFAULT ON NULL AS IDENTITY,
    ID_Empleado NUMBER,
    ID_Licencia NUMBER,
    Fecha_Expedicion DATE,
    Fecha_Vencimiento DATE,
    PRIMARY KEY (ID_Empleado, ID_Licencia),
    FOREIGN KEY (ID_Empleado) REFERENCES Empleados(ID_Empleado),
    FOREIGN KEY (ID_Licencia) REFERENCES Licencias(ID_Licencia)
);


CREATE TABLE Licencias (
    ID_Licencia NUMBER PRIMARY KEY GENERATED BY DEFAULT ON NULL AS IDENTITY,
    Tipo VARCHAR2(50)
);


CREATE TABLE Puestos_Empleado (
    ID_Empleado NUMBER,
    ID_Puesto NUMBER,
    Salario NUMBER,
    PRIMARY KEY (ID_Empleado, ID_Puesto),
    FOREIGN KEY (ID_Empleado) REFERENCES Empleados(ID_Empleado),
    FOREIGN KEY (ID_Puesto) REFERENCES Puestos(ID_Puesto)
);


CREATE TABLE Puestos (
    ID_Puesto VARCHAR2(10) PRIMARY KEY,
    Salario NUMBER,
    Descripcion VARCHAR2(100)
);


CREATE TABLE Direcciones_Empleado (
    ID_Direccion NUMBER PRIMARY KEY GENERATED BY DEFAULT ON NULL AS IDENTITY,
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


CREATE TABLE Direcciones_Pedido (
    ID_Direccion NUMBER PRIMARY KEY GENERATED BY DEFAULT ON NULL AS IDENTITY,
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


CREATE TABLE Provincias (
    ID_Provincia NUMBER PRIMARY KEY GENERATED BY DEFAULT ON NULL AS IDENTITY,
    Nombre VARCHAR2(50)
);


CREATE TABLE Cantones (
    ID_Canton NUMBER PRIMARY KEY GENERATED BY DEFAULT ON NULL AS IDENTITY,
    ID_Provincia NUMBER,
    Nombre VARCHAR2(50),
    FOREIGN KEY (ID_Provincia) REFERENCES Provincias(ID_Provincia)
);


CREATE TABLE Distritos (
    ID_Distrito NUMBER PRIMARY KEY GENERATED BY DEFAULT ON NULL AS IDENTITY,
    ID_Provincia NUMBER,
    ID_Canton NUMBER,
    Nombre VARCHAR2(50),
    FOREIGN KEY (ID_Provincia) REFERENCES Provincias(ID_Provincia),
    FOREIGN KEY (ID_Canton) REFERENCES Cantones(ID_Canton)
);


-- DROP TABLE Clientes CASCADE CONSTRAINTS;
CREATE TABLE Clientes (
    ID_Cliente NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY PRIMARY KEY,
    Nombre VARCHAR2(50),
    Apellido VARCHAR2(50),
    Telefono VARCHAR2(15),
    Email VARCHAR2(100)
);


CREATE TABLE Direcciones_Cliente (
    ID_Direccion NUMBER PRIMARY KEY GENERATED BY DEFAULT ON NULL AS IDENTITY,
    ID_Provincia NUMBER,
    ID_Canton NUMBER,
    ID_Distrito NUMBER,
    Detalles VARCHAR2(100),
    FOREIGN KEY (ID_Provincia) REFERENCES Provincias(ID_Provincia),
    FOREIGN KEY (ID_Canton) REFERENCES Cantones(ID_Canton),
    FOREIGN KEY (ID_Distrito) REFERENCES Distritos(ID_Distrito)
);

CREATE TABLE Pedidos (
    ID_Pedido NUMBER PRIMARY KEY GENERATED BY DEFAULT ON NULL AS IDENTITY,
    ID_Cliente NUMBER,
    Fecha DATE,
    Monto NUMBER,
    ID_Estado NUMBER,
    FOREIGN KEY (ID_Cliente) REFERENCES Clientes(ID_Cliente),
    FOREIGN KEY (ID_Estado) REFERENCES Estados(ID_Estado)
);


CREATE TABLE Tipos_Carga (
    ID_Tipo NUMBER PRIMARY KEY GENERATED BY DEFAULT ON NULL AS IDENTITY,
    Descripcion VARCHAR2(100)
);


CREATE TABLE Estados (
    ID_Estado NUMBER PRIMARY KEY GENERATED BY DEFAULT ON NULL AS IDENTITY,
    Descripcion VARCHAR2(100)
);

CREATE TABLE Facturas (
    ID_Factura NUMBER PRIMARY KEY GENERATED BY DEFAULT ON NULL AS IDENTITY,
    ID_Pedido NUMBER,
    Fecha DATE,
    Monto NUMBER,
    ID_Estado NUMBER,
    FOREIGN KEY (ID_Pedido) REFERENCES Pedidos(ID_Pedido),
    FOREIGN KEY (ID_Estado) REFERENCES Estados(ID_Estado)
);


CREATE TABLE Vehiculos (
    ID_Vehiculo NUMBER PRIMARY KEY GENERATED BY DEFAULT ON NULL AS IDENTITY,
    Marca VARCHAR2(50),
    Modelo VARCHAR2(50),
    Anio NUMBER,
    Placa VARCHAR2(10)
);