CREATE TABLE auditoria_vehiculo (
    id_auditoria NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    tipo_evento VARCHAR2(10),
    usuario_bd VARCHAR2(30),
    fecha_evento TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    usuario_sistema VARCHAR2(30),
    ip_maquina VARCHAR2(45),
    nombre_maquina VARCHAR2(100),
    datos_antes CLOB
);

CREATE OR REPLACE TRIGGER trg_auditoria_delete
AFTER DELETE ON VEHICULOS
FOR EACH ROW
BEGIN
    INSERT INTO auditoria_vehiculo (
        tipo_evento,
        usuario_bd,
        usuario_sistema,
        ip_maquina,
        nombre_maquina,
        datos_antes
    )
    VALUES (
        'DELETE',
        USER,
        SYS_CONTEXT('USERENV', 'OS_USER'),
        SYS_CONTEXT('USERENV', 'IP_ADDRESS'),
        SYS_CONTEXT('USERENV', 'HOST'),
        'ID_VEHICULO: ' || :OLD.ID_VEHICULO || ', MARCA: ' || :OLD.MARCA || ', MODELO: ' || :OLD.MODELO || ', ANIO: ' || :OLD.ANIO || ', PLACA: ' || :OLD.PLACA);
END;

CREATE OR REPLACE TRIGGER trg_auditoria_update
AFTER UPDATE ON VEHICULOS
FOR EACH ROW
BEGIN
    INSERT INTO auditoria_vehiculo (
        tipo_evento,
        usuario_bd,
        usuario_sistema,
        ip_maquina,
        nombre_maquina,
        datos_antes
    )
    VALUES (
        'UPDATE',
        USER,
        SYS_CONTEXT('USERENV', 'OS_USER'),
        SYS_CONTEXT('USERENV', 'IP_ADDRESS'),
        SYS_CONTEXT('USERENV', 'HOST'),
        'ID_VEHICULO: ' || :OLD.ID_VEHICULO || ', MARCA: ' || :OLD.MARCA || ', MODELO: ' || :OLD.MODELO || ', ANIO: ' || :OLD.ANIO || ', PLACA: ' || :OLD.PLACA);
END;




--DROP TABLE auditoria_pedidos;
CREATE TABLE auditoria_pedidos (
    audit_id            NUMBER GENERATED BY DEFAULT AS IDENTITY,
    tipo_evento         VARCHAR2(10),
    pedido_id           NUMBER,
    usuario_bd          VARCHAR2(30),
    fecha_hora          DATE,
    usuario_so          VARCHAR2(100),
    ip_maquina          VARCHAR2(45),
    nombre_maquina      VARCHAR2(100)
);

CREATE OR REPLACE TRIGGER trg_auditoria_pedidos_inserts
AFTER INSERT ON pedidos
FOR EACH ROW
DECLARE
    v_usuario_so    VARCHAR2(100);
    v_ip_maquina    VARCHAR2(45);
    v_nombre_maquina VARCHAR2(100);
BEGIN
   
    SELECT SYS_CONTEXT('USERENV', 'OS_USER') INTO v_usuario_so FROM dual;


    SELECT SYS_CONTEXT('USERENV', 'IP_ADDRESS') INTO v_ip_maquina FROM dual;


    SELECT SYS_CONTEXT('USERENV', 'HOST') INTO v_nombre_maquina FROM dual;
    
    INSERT INTO auditoria_pedidos (tipo_evento,pedido_id, usuario_bd, fecha_hora, usuario_so, ip_maquina, nombre_maquina)
    VALUES ('insert',:NEW.id_pedido, USER, SYSDATE, v_usuario_so, v_ip_maquina, v_nombre_maquina);
END;


CREATE OR REPLACE  TRIGGER trg_auditoria_pedidos_updates
AFTER UPDATE ON pedidos
FOR EACH ROW
DECLARE
    v_usuario_so     VARCHAR2(100);
    v_ip_maquina     VARCHAR2(45);
    v_nombre_maquina VARCHAR2(100);
BEGIN
    SELECT SYS_CONTEXT('USERENV', 'OS_USER') INTO v_usuario_so FROM dual;
    SELECT SYS_CONTEXT('USERENV', 'IP_ADDRESS') INTO v_ip_maquina FROM dual;
    SELECT SYS_CONTEXT('USERENV', 'HOST') INTO v_nombre_maquina FROM dual;

    INSERT INTO auditoria_pedidos (tipo_evento, pedido_id, usuario_bd, fecha_hora, usuario_so, ip_maquina, nombre_maquina)
    VALUES ('UPDATE',:NEW.id_pedido, USER, SYSDATE, v_usuario_so, v_ip_maquina, v_nombre_maquina);
END;


CREATE OR REPLACE TRIGGER trg_prevent_delete_factura
BEFORE DELETE ON facturas
FOR EACH ROW
BEGIN
    RAISE_APPLICATION_ERROR(-20002, 'No se permite la eliminaci�n de facturas.');
END;





