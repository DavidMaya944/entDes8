-- tabla provincia
CREATE TABLE provincia 
(id_provincia INT
 , nombre VARCHAR
 , CONSTRAINT pk_idprov PRIMARY KEY (id_provincia)
);

-- tabla departamento
CREATE TABLE departamento
(id_departamento INT
 , nombre VARCHAR DEFAULT 'Nuevo'
 , presupuesto FLOAT CHECK (presupuesto BETWEEN 1000 AND 5000)
 , id_prov INT 
 , CONSTRAINT pk_iddep PRIMARY KEY (id_departamento)
 , CONSTRAINT fk_idprov FOREIGN KEY (id_prov) REFERENCES provincia(id_provincia)
    );
    
-- tabla trabajador
CREATE TABLE trabajador
(id_trabajador INT 
 , nombre VARCHAR(30)
 , salario FLOAT CHECK (salario>=0)
 , comision FLOAT CHECK (comision <=(salario / 2))
 , id_provin INT
 , id_dep INT
 , CONSTRAINT pk_idtrab PRIMARY KEY (id_trabajador)
 , CONSTRAINT fk_iddep FOREIGN KEY (id_dep) REFERENCES departamento(id_departamento
 , CONSTRAINT fk_idprovin FOREIGN KEY (id_provin) REFERENCES provincia(id_provincia)
    );