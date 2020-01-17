-- tabla provincia
CREATE TABLE provincia 
(id_provincia NUMBER
 , nombre VARCHAR2(20)
 , CONSTRAINT pk_idprov PRIMARY KEY (id_provincia)
);

-- tabla departamento
CREATE TABLE departamento
(id_departamento NUMBER
 , nombre VARCHAR2(20) DEFAULT 'Nuevo'
 , presupuesto NUMBER(6,2) 
 , id_prov NUMBER 
 , CONSTRAINT ck_presupuesto CHECK (presupuesto BETWEEN 1000 AND 5000)
 , CONSTRAINT pk_iddep PRIMARY KEY (id_departamento)
 , CONSTRAINT fk_idprov FOREIGN KEY (id_prov) REFERENCES provincia(id_provincia)
    );
    
-- tabla trabajador
CREATE TABLE trabajador
(id_trabajador NUMBER 
 , nombre VARCHAR2(30)
 , salario NUMBER (6,2) 
 , comision NUMBER (6,2) 
 , id_provin NUMBER
 , id_dep NUMBER
 , CONSTRAINT ck_comision CHECK (comision <=(salario / 2))
 , CONSTRAINT ck_salario CHECK (salario>=0)
 , CONSTRAINT pk_idtrab PRIMARY KEY (id_trabajador)
 , CONSTRAINT fk_iddep FOREIGN KEY (id_dep) REFERENCES departamento(id_departamento)
 , CONSTRAINT fk_idprovin FOREIGN KEY (id_provin) REFERENCES provincia(id_provincia)
    );