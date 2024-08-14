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

