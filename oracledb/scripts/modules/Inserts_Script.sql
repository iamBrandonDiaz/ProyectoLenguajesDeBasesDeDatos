-- Inserts para tabla Provincias
INSERT INTO Provincias (Nombre) VALUES ('San Jose');
INSERT INTO Provincias (Nombre) VALUES ('Heredia');
INSERT INTO Provincias (Nombre) VALUES ('Cartago');

-- Inserts para tabla Cantones
INSERT INTO Cantones (ID_Provincia, Nombre) VALUES (1, 'San Jose');
INSERT INTO Cantones (ID_Provincia, Nombre) VALUES (1, 'Escazu');
INSERT INTO Cantones (ID_Provincia, Nombre) VALUES (1, 'Desamparados ');

INSERT INTO Cantones (ID_Provincia, Nombre) VALUES (2, 'Heredia ');
INSERT INTO Cantones (ID_Provincia, Nombre) VALUES (2, 'Barva');
INSERT INTO Cantones (ID_Provincia, Nombre) VALUES (2, 'Santo Domingo');

INSERT INTO Cantones (ID_Provincia, Nombre) VALUES (3, 'Cartago ');
INSERT INTO Cantones (ID_Provincia, Nombre) VALUES (3, 'Paraiso');
INSERT INTO Cantones (ID_Provincia, Nombre) VALUES (3, 'La Union');

-- Inserts para tabla Distritos
INSERT INTO Distritos (ID_Provincia, ID_Canton, Nombre) VALUES (1, 1, 'Carmen');
INSERT INTO Distritos (ID_Provincia, ID_Canton, Nombre) VALUES (1, 1, 'Merced');
INSERT INTO Distritos (ID_Provincia, ID_Canton, Nombre) VALUES (1, 1, 'Catedral');

INSERT INTO Distritos (ID_Provincia, ID_Canton, Nombre) VALUES (1, 2, 'Escazu');
INSERT INTO Distritos (ID_Provincia, ID_Canton, Nombre) VALUES (1, 2, 'San Antonio');
INSERT INTO Distritos (ID_Provincia, ID_Canton, Nombre) VALUES (1, 2, 'San Rafael');

INSERT INTO Distritos (ID_Provincia, ID_Canton, Nombre) VALUES (1, 3, 'Desamparados');
INSERT INTO Distritos (ID_Provincia, ID_Canton, Nombre) VALUES (1, 3, 'San Miguel');
INSERT INTO Distritos (ID_Provincia, ID_Canton, Nombre) VALUES (1, 3, 'San Rafael');

INSERT INTO Distritos (ID_Provincia, ID_Canton, Nombre) VALUES (2, 4, 'Heredia');
INSERT INTO Distritos (ID_Provincia, ID_Canton, Nombre) VALUES (2, 4, 'Mercedes');
INSERT INTO Distritos (ID_Provincia, ID_Canton, Nombre) VALUES (2, 4, 'Ulloa');

INSERT INTO Distritos (ID_Provincia, ID_Canton, Nombre) VALUES (2, 5, 'Barva');
INSERT INTO Distritos (ID_Provincia, ID_Canton, Nombre) VALUES (2, 5, 'San Pedro');
INSERT INTO Distritos (ID_Provincia, ID_Canton, Nombre) VALUES (2, 5, 'San Roque');

INSERT INTO Distritos (ID_Provincia, ID_Canton, Nombre) VALUES (2, 6, 'Santo Domingo');
INSERT INTO Distritos (ID_Provincia, ID_Canton, Nombre) VALUES (2, 6, 'Paracito');
INSERT INTO Distritos (ID_Provincia, ID_Canton, Nombre) VALUES (2, 6, 'Santa Rosa');

INSERT INTO Distritos (ID_Provincia, ID_Canton, Nombre) VALUES (3, 7, 'Oriental');
INSERT INTO Distritos (ID_Provincia, ID_Canton, Nombre) VALUES (3, 7, 'Occidental');
INSERT INTO Distritos (ID_Provincia, ID_Canton, Nombre) VALUES (3, 7, 'Carmen');

INSERT INTO Distritos (ID_Provincia, ID_Canton, Nombre) VALUES (3, 8, 'Paraíso');
INSERT INTO Distritos (ID_Provincia, ID_Canton, Nombre) VALUES (3, 8, 'Orosi');
INSERT INTO Distritos (ID_Provincia, ID_Canton, Nombre) VALUES (3, 8, 'Cachí');

INSERT INTO Distritos (ID_Provincia, ID_Canton, Nombre) VALUES (3, 9, 'Tres Ríos');
INSERT INTO Distritos (ID_Provincia, ID_Canton, Nombre) VALUES (3, 9, 'San Diego');
INSERT INTO Distritos (ID_Provincia, ID_Canton, Nombre) VALUES (3, 9, 'Concepción');

-- Inserts para tabla Licencias
INSERT INTO Licencias (Tipo) VALUES ('Tipo A1');
INSERT INTO Licencias (Tipo) VALUES ('Tipo A2');
INSERT INTO Licencias (Tipo) VALUES ('Tipo A3');

INSERT INTO Licencias (Tipo) VALUES ('Tipo B1');
INSERT INTO Licencias (Tipo) VALUES ('Tipo B2');
INSERT INTO Licencias (Tipo) VALUES ('Tipo B3');
INSERT INTO Licencias (Tipo) VALUES ('Tipo B4');

INSERT INTO Licencias (Tipo) VALUES ('Tipo C1');
INSERT INTO Licencias (Tipo) VALUES ('Tipo C2');

INSERT INTO Licencias (Tipo) VALUES ('Tipo D1');
INSERT INTO Licencias (Tipo) VALUES ('Tipo D2');
INSERT INTO Licencias (Tipo) VALUES ('Tipo D3');

INSERT INTO Licencias (Tipo) VALUES ('Tipo E1');
INSERT INTO Licencias (Tipo) VALUES ('Tipo E2');

-- Inserts para tabla Estados
INSERT INTO Estados (Descripcion) VALUES ('Cancelado');
INSERT INTO Estados (Descripcion) VALUES ('No aceptado');
INSERT INTO Estados (Descripcion) VALUES ('Aceptado');
INSERT INTO Estados (Descripcion) VALUES ('En Proceso');
INSERT INTO Estados (Descripcion) VALUES ('Entregado');
INSERT INTO Estados (Descripcion) VALUES ('Completado');

-- Inserts para tabla Tipos_Carga
-- Carga a granel: Este tipo de carga incluye materiales como granos, minerales, petróleo, gas, entre otros. Son transportados en grandes cantidades y no requieren embalaje.
-- Carga general: Este tipo de carga incluye mercancías empaquetadas individualmente, como electrodomésticos, muebles, y productos electrónicos.
-- Carga fraccionada: Este tipo de carga incluye mercancías que son demasiado grandes para ser enviadas como carga general, pero demasiado pequeñas para requerir un camión completo.
-- Carga de contenedor: Este tipo de carga se transporta en contenedores estandarizados que pueden ser cargados y descargados, apilados, transportados de manera eficiente a largas distancias.
-- Carga pesada o sobredimensionada: Este tipo de carga es demasiado grande o pesada para ser transportada en un camión estándar o contenedor. Puede requerir permisos especiales y equipos de manejo especializados.
-- Carga peligrosa: Este tipo de carga incluye materiales que son potencialmente peligrosos, como productos químicos, materiales radiactivos y explosivos.
-- Carga refrigerada: Este tipo de carga requiere control de temperatura durante el transporte. Incluye alimentos, productos farmacéuticos y ciertos productos químicos.
INSERT INTO Tipos_Carga (Descripcion) VALUES ('Carga a granel');
INSERT INTO Tipos_Carga (Descripcion) VALUES ('Carga general');
INSERT INTO Tipos_Carga (Descripcion) VALUES ('Carga fraccionada');
INSERT INTO Tipos_Carga (Descripcion) VALUES ('Carga de contenedor');
INSERT INTO Tipos_Carga (Descripcion) VALUES ('Carga pesada o sobredimensionada');
INSERT INTO Tipos_Carga (Descripcion) VALUES ('Carga peligrosa');
INSERT INTO Tipos_Carga (Descripcion) VALUES ('Carga refrigerada');

-- Inserts para tabla Puestos
INSERT INTO Puestos (ID_Puesto, Salario, Descripcion) VALUES ('DRV-01', 750000, 'Conductor Nivel 1');
INSERT INTO Puestos (ID_Puesto, Salario, Descripcion) VALUES ('DRV-02', 900000, 'Conductor Nivel 2');
INSERT INTO Puestos (ID_Puesto, Salario, Descripcion) VALUES ('DRV-03', 1100000, 'Conductor Nivel 3');
INSERT INTO Puestos (ID_Puesto, Salario, Descripcion) VALUES ('LOG-MGR', 920000, 'Administrador de Logistica');
INSERT INTO Puestos (ID_Puesto, Salario, Descripcion) VALUES ('STR-MGR', 800000, 'Administrador de Almacen');
INSERT INTO Puestos (ID_Puesto, Salario, Descripcion) VALUES ('DRV-MGR', 1000000, 'Administrador de Conductores');
INSERT INTO Puestos (ID_Puesto, Salario, Descripcion) VALUES ('MTN-TEC', 850000, 'Tecnico de Mantenimiento');
INSERT INTO Puestos (ID_Puesto, Salario, Descripcion) VALUES ('MTN-ENG', 1300000, 'Ingeniero de Mantenimiento');

-- Inserts para tabla Vehiculos
-- Vehículos de carga liviana
INSERT INTO Vehiculos (Marca, Modelo, Anio, Placa) VALUES ('Toyota', 'Hilux', 2018, 'CMV-000');
INSERT INTO Vehiculos (Marca, Modelo, Anio, Placa) VALUES ('Nissan', 'Navara', 2019, 'CMV-002');
INSERT INTO Vehiculos (Marca, Modelo, Anio, Placa) VALUES ('Mitsubishi', 'L200', 2020, 'CMV-004');
INSERT INTO Vehiculos (Marca, Modelo, Anio, Placa) VALUES ('Ford', 'Ranger', 2021, 'CMV-006');

-- Vehículos de carga pesada
INSERT INTO Vehiculos (Marca, Modelo, Anio, Placa) VALUES ('Volvo', 'FH', 2016, '567890');
INSERT INTO Vehiculos (Marca, Modelo, Anio, Placa) VALUES ('Scania', 'R450', 2017, '678901');
INSERT INTO Vehiculos (Marca, Modelo, Anio, Placa) VALUES ('Mercedes-Benz', 'Actros', 2018, '789012');
INSERT INTO Vehiculos (Marca, Modelo, Anio, Placa) VALUES ('MAN', 'TGX', 2019, '890123');
