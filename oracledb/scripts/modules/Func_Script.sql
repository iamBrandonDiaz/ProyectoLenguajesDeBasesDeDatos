
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

-- Function to search directions by client ID
CREATE OR REPLACE FUNCTION buscar_direcciones_por_cliente(p_id_cliente IN NUMBER)
RETURN SYS_REFCURSOR AS
    l_cursor SYS_REFCURSOR;
BEGIN
    OPEN l_cursor FOR
    SELECT ID_Direccion, ID_Cliente, Detalles, ID_Distrito
    FROM Direcciones_Cliente
    WHERE ID_Cliente = p_id_cliente;
    RETURN l_cursor;
END buscar_direcciones_por_cliente;