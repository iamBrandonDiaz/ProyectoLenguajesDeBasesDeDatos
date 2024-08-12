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

INSERT INTO Distritos (ID_Provincia, ID_Canton, Nombre) VALUES (2, 1, 'Heredia');
INSERT INTO Distritos (ID_Provincia, ID_Canton, Nombre) VALUES (2, 1, 'Mercedes');
INSERT INTO Distritos (ID_Provincia, ID_Canton, Nombre) VALUES (2, 1, 'Ulloa');

INSERT INTO Distritos (ID_Provincia, ID_Canton, Nombre) VALUES (2, 2, 'Barva');
INSERT INTO Distritos (ID_Provincia, ID_Canton, Nombre) VALUES (2, 2, 'San Pedro');
INSERT INTO Distritos (ID_Provincia, ID_Canton, Nombre) VALUES (2, 2, 'San Roque');

INSERT INTO Distritos (ID_Provincia, ID_Canton, Nombre) VALUES (2, 3, 'Santo Domingo');
INSERT INTO Distritos (ID_Provincia, ID_Canton, Nombre) VALUES (2, 3, 'Paracito');
INSERT INTO Distritos (ID_Provincia, ID_Canton, Nombre) VALUES (2, 3, 'Santa Rosa');

INSERT INTO Distritos (ID_Provincia, ID_Canton, Nombre) VALUES (3, 1, 'Oriental');
INSERT INTO Distritos (ID_Provincia, ID_Canton, Nombre) VALUES (3, 1, 'Occidental');
INSERT INTO Distritos (ID_Provincia, ID_Canton, Nombre) VALUES (3, 1, 'Carmen');

INSERT INTO Distritos (ID_Provincia, ID_Canton, Nombre) VALUES (3, 2, 'Paraíso');
INSERT INTO Distritos (ID_Provincia, ID_Canton, Nombre) VALUES (3, 2, 'Orosi');
INSERT INTO Distritos (ID_Provincia, ID_Canton, Nombre) VALUES (3, 2, 'Cachí');

INSERT INTO Distritos (ID_Provincia, ID_Canton, Nombre) VALUES (3, 3, 'Tres Ríos');
INSERT INTO Distritos (ID_Provincia, ID_Canton, Nombre) VALUES (3, 3, 'San Diego');
INSERT INTO Distritos (ID_Provincia, ID_Canton, Nombre) VALUES (3, 3, 'Concepción');

