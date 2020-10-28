------------------CREACION DE BASE DE DATOS------------
CREATE DATABASE REGISTRO_TABLAS
GO
USE REGISTRO_TABLAS

--------------------CREAR TABLAS----------------------
CREATE TABLE CATEGORIAS(
IDCATEG INT IDENTITY (1,1) PRIMARY KEY,
CATEGORIA NVARCHAR (100)
)

CREATE TABLE MARCAS(
IDMARCA INT IDENTITY (1,1) PRIMARY KEY,
MARCA NVARCHAR(100)
)
CREATE TABLE PRODUCTOS(
IDPROD INT IDENTITY (1,1) PRIMARY KEY,
IDCATEGORIA INT,
IDMARCA INT,
DESCRIPCION NVARCHAR(100),
PRECIO FLOAT

----RELACIONES
CONSTRAINT RELACION_CATEGORIA FOREIGN KEY (IDCATEGORIA) REFERENCES CATEGORIAS(IDCATEG),
CONSTRAINT RELACION_MARCA FOREIGN KEY (IDMARCA) REFERENCES MARCAS(IDMARCA)
)
-------------------------INSERTAR DATOS--------------------------------
INSERT INTO CATEGORIAS VALUES
(''),
('X1 E84 DIESEL'),
('TIGUAN DIESEL'),
('RAV-4 DIESEL'),
('QASHQAI DIESEL'),
('COUNTRYMAN DIESEL')

INSERT INTO MARCAS VALUES
(''),
('NISSAN'),
('VOLKSWAGEN'),
('VOLVO'),
('BMW'),
('AUDI')
-----------------------PROCEDIMIENTO ALMACENADO---------------------------------
---------------LISTAR CATEGORIAS
CREATE PROC ListarCategorias
as
select * from CATEGORIAS order by CATEGORIA asc
go

---probar procedimiento con esto  
exec ListarCategorias
---------------LISTAR MARCAS
CREATE PROC ListarMarcas
as
select * from MARCAS order by MARCA asc
go

---probar procedimiento con esto  
exec ListarMarcas
---------------AGREGAR PRODUCTOS
CREATE PROC InsertarProducto
@idcategoria int,
@idmarca int,
@descripcion nvarchar (100),
@prec Float
as
insert into PRODUCTOS values (@idcategoria,@idmarca,@descripcion,@prec)
go
------
exec InsertarProducto 1,1,'Nissan',1010
select * from PRODUCTOS


---------------LISTAR PRODUCTOS
CREATE PROC ListarProductos
as
select IDPROD AS ID,CATEGORIA AS MODELO,MARCA,DESCRIPCION,PRECIO
from PRODUCTOS
inner join CATEGORIAS on PRODUCTOS.IDCATEGORIA=CATEGORIAS.IDCATEG
INNER JOIN MARCAS ON PRODUCTOS.IDMARCA=MARCAS.IDMARCA
go

exec ListarProductos



---------------ACTULIZAR PRODUCTOS
CREATE PROC ActualizarProducto
@idcategoria int,
@idmarca int,
@descripcion nvarchar (100),
@prec Float
as
UPDATE PRODUCTOS 
SET IDCATEGORIA =@idcategoria , IDMARCA = @idmarca , DESCRIPCION=@descripcion, PRECIO =@prec
go
------
exec InsertarProducto 1,1,'Nissan',1010
select * from PRODUCTOS


------------------------ELIMINAR REGISTRO
CREATE PROC EliminarRegistro
@idcategoria int
as
delete from PRODUCTOS where IDPROD =@idcategoria