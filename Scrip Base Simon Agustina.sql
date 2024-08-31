CREATE DATABASE GABI_MASIN_DISTRIBUIDORA;
USE GABI_MASIN_DISTRIBUIDORA;

-----TABLAS-------

CREATE TABLE PERSONAS (
id_persona SMALLINT UNIQUE NOT NULL AUTO_INCREMENT PRIMARY KEY,
nombre_apellido_razon_social VARCHAR(50) NOT NULL,
cuit BIGINT (13) NOT NULL UNIQUE,
domicilio VARCHAR (50),
celular VARCHAR (15) NOT NULL,
email VARCHAR (50) NOT NULL,
localidad VARCHAR (20)
);

CREATE TABLE MEDIOS_DE_PAGO (
id_pago SMALLINT UNIQUE NOT NULL AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR (30) NOT NULL
);

CREATE TABLE TIPOS_DE_ENTREGA (
id_tipo_de_entrega SMALLINT UNIQUE NOT NULL AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(30) NOT NULL,		
plazo TINYINT NOT NULL
);	

CREATE TABLE CLIENTES (
id_clientes SMALLINT UNIQUE NOT NULL AUTO_INCREMENT PRIMARY KEY,
id_persona SMALLINT UNIQUE NOT NULL,
tipo_de_iva VARCHAR (30) NOT NULL,
FOREIGN KEY (id_persona) REFERENCES personas(id_persona)
);

CREATE TABLE VENDEDORES (
id_vendedor SMALLINT UNIQUE NOT NULL AUTO_INCREMENT PRIMARY KEY,
id_persona SMALLINT UNIQUE NOT NULL,
zona VARCHAR (20) NOT NULL,
FOREIGN KEY (id_persona) REFERENCES personas(id_persona)
);

CREATE TABLE PROVEEDORES (
id_proveedor SMALLINT UNIQUE NOT NULL AUTO_INCREMENT PRIMARY KEY,
id_persona SMALLINT UNIQUE NOT NULL,
tipo_de_iva VARCHAR (30) NOT NULL,
laboratorio VARCHAR (20) NOT NULL,
FOREIGN KEY (id_persona) REFERENCES personas(id_persona)
);

CREATE TABLE ARTICULOS (
id_articulo	SMALLINT UNIQUE NOT NULL AUTO_INCREMENT PRIMARY KEY,
descripcion VARCHAR (50) NOT NULL,
tamaño VARCHAR (50),
stock SMALLINT NOT NULL,
precio_unitario DECIMAL (10) NOT NULL,
id_proveedor SMALLINT,
FOREIGN KEY (id_proveedor) REFERENCES proveedores(id_proveedor)
);

CREATE TABLE VENTAS (
id_tipo_de_comprobante ENUM('NP', 'FA', 'FB', 'NCA','NCB') NOT NULL,
id_numero_de_comprobante DOUBLE NOT NULL, 
fecha DATE NOT NULL,
id_cliente SMALLINT NOT NULL,
id_vendedor SMALLINT NOT NULL,
id_pago SMALLINT NOT NULL,
id_tipo_de_entrega SMALLINT NOT NULL,
PRIMARY KEY (id_tipo_de_comprobante, id_numero_de_comprobante),
FOREIGN KEY (id_cliente) REFERENCES clientes(id_clientes),
FOREIGN KEY (id_vendedor) REFERENCES vendedores(id_vendedor),
FOREIGN KEY (id_pago) REFERENCES medios_de_pago(id_pago),
FOREIGN KEY (id_tipo_de_entrega) REFERENCES tipos_de_entrega(id_tipo_de_entrega)
);

CREATE TABLE DETALLE_VENTA (
id_detalle_venta SMALLINT NOT NULL AUTO_INCREMENT PRIMARY KEY UNIQUE,
id_tipo_de_comprobante ENUM('NP', 'FA', 'FB', 'NCA', 'NCB') NOT NULL,
id_numero_de_comprobante DOUBLE NOT NULL, 
id_articulo SMALLINT NOT NULL,
cantidad_vendida TINYINT NOT NULL, 
FOREIGN KEY (id_tipo_de_comprobante, id_numero_de_comprobante) REFERENCES VENTAS (id_tipo_de_comprobante, id_numero_de_comprobante),
FOREIGN KEY (id_articulo) REFERENCES ARTICULOS(id_articulo)
);

------------------------------------------------------------INSERT----------------------------------------------------------

INSERT INTO personas  VALUES
(1, 'Nancy Reyna', '27181022413', 'Lugones 126', '0351156160102', 'nancyreyna67@hotmail.com', 'Cordoba'), 
(2, 'Agustina Simon', '27385479099', 'Catamarca 728', '0351156160102', 'agusimon95@hotmail.com', 'Cordoba'),
(3, 'Pedro López', '20345678901', 'Calle Luna 456', '1178901234', 'pedro.lopez@email.com', 'Cordoba'),
(4, 'María Fernández', '20456789012', 'Calle Sol 789', '1189012345', 'maria.fernandez@email.com', 'Cordoba'),
(5, 'Luis Martínez', '20567890123', 'Paseo del Río 101', '1190123456', 'luis.martinez@email.com', 'Cordoba'),
(6, 'Laura Rodríguez', '20678901234', 'Avenida del Parque 202', '1201234567', 'laura.rodriguez@email.com', 'Cordoba'),
(7, 'Carlos Sánchez', '20789012345', 'Calle de la Paz 303', '1212345678', 'carlos.sanchez@email.com', 'Cordoba'),
(8, 'Sofía García', '20890123456', 'Calle del Río 404', '1223456789', 'sofia.garcia@email.com', 'Cordoba'),
(9, 'José Martínez', '20901234567', 'Avenida Libertador 505', '1234567890', 'jose.martinez@email.com', 'Cordoba'),
(10, 'Claudia Morales', '20012345678', 'Calle Victoria 606', '1245678901', 'claudia.morales@email.com', 'Cordoba'),
(11, 'David Castro', '20385479099', 'Calle delarticulos Sol 707', '1256789012', 'david.castro@email.com', 'Cordoba'),
(12, 'Gabriela Herrera', '20366936433', 'Calle del Viento 808', '1267890123', 'gabriela.herrera@email.com', 'Cordoba'),
(13, 'Felipe Vargas', '20181022411', 'Calle de la Luna 909', '1278901234', 'felipe.vargas@email.com', 'Cordoba'),
(14, 'Isabel Silva', '20358275642', 'Av. de la Libertad 101', '1289012345', 'isabel.silva@email.com', 'Cordoba'),
(15, 'Marketing Creativo S.A.', '30234567890', 'Av. Publicidad 303', '01134567890', 'ventas@marketingcreativo.com', 'Cordoba'),
(16, 'Servicios XYZ Ltda.', '30234577890', 'Calle Empresarial 202', '01134567890', 'info@serviciosxyz.com', 'Cordoba'),
(17, 'Comercial 123 S.R.L.', '30345678901', 'Paseo de Negocios 303', '01145678901', 'ventas@comercial123.com', 'Cordoba'),
(18, 'Laboratorio Zine', '30456789012', 'Av. del Trabajo 404', '01156789012', 'soporte@solucionesintegrales.com', 'Cordoba'),
(19, 'Productos Eficientes S.A.', '30567890123', 'Calle Innovación 505', '01167890123', 'contacto@tecnologiafuture.com', 'Cordoba'),
(20, 'HDM', '30678901234', 'Av. de los Proyectos 606', '01178901234', 'info@productoseficientes.com', 'Cordoba'),
(21, 'Construcciones Ágiles S.R.L.', '30789012345', 'Calle del Constructor 707', '01189012345', 'consultas@construccionesagiles.com', 'Cordoba'),
(22, 'Alfa y Omega', '30890123456', 'Av. Internacional 808', '01190123456', 'servicios@globalesltda.com', 'Cordoba'),
(23, 'Lidherma', '30901234567', 'Calle del Estratega 909', '01101234567', 'info@consultoraestrategica.com', 'Cordoba'),
(24, 'Logística Rápida S.R.L.', '30012345678', 'Av. de la Logística 101', '01112345678', 'contacto@logisticarapida.com', 'Cordoba'),
(25, 'Energía Verde Ltda.', '30123456789', 'Calle Energía 202', '01123456789', 'info@energiaverde.com', 'Cordoba'),
(26, 'Marketing Creativo S.A.', '30234567690', 'Av. Publicidad 303', '01134567890', 'ventas@marketingcreativo.com', 'Cordoba'), 
(27, 'Maria Jose Simon', '27366936439', 'Ovidio Lagos 52', '035115625361', 'majos92@gmail.com', 'Cordoba');

INSERT INTO MEDIOS_DE_PAGO VALUES 
(1,'Transferencia'),
(2,'Efectivo'),
(3,'Débito'),
(4,'Crédito');

INSERT INTO tipos_de_entrega VALUES
(1,'Retira Cliente','0'),
(2,'Envio Mesajero','0'),
(3,'Envio Correo 24 hs','24'),
(4,'Envio Correo 48 hs ','48');

insert INTO clientes values
(00001,'16','Responsable inscripto'),
(00002,'15','Responsable inscripto'),
(00003,'20','Responsable inscripto'),
(00004,'1','Monotributista'),
(00005,'2','Consumidor Final'),
(00006,'17','Responsable inscripto'),
(00007,'9','Monotributista'),
(00008,'19','Responsable inscripto'),
(00009,'7','Monotributista'),
(00010,'6','Consumidor Final'),
(00011,'8','Consumidor Final'),
(00012,'21','Responsable inscripto'),
(00013,'5','Consumidor Final'),
(00014,'3','Monotributista'),
(00015,'4','Consumidor Final'),
(00016,'26','Responsable inscripto'),
(00017,'13','Consumidor Final'),
(00018,'23','Responsable inscripto'),
(00019,'11','Consumidor Final'),
(00020,'14','Monotributista');

INSERT INTO VENDEDORES VALUES
(001,'27','Centro'),
(002,'8','Villa Allende'),
(003,'10','Zur'),
(004,'12','Norte');

INSERT INTO PROVEEDORES VALUES
(01,'18','Responsable Inscripto','Zine'),
(02,'20','Responsable Inscripto','HDM'),
(03,'22','Responsable Inscripto','Alfa y Omega'),
(04,'23','Responsable Inscripto','Lidherma');

INSERT INTO ARTICULOS VALUES
(1,'Emulsión de Limpieza No lipídica','120 ml.','10','15600','1'),
(2,'Agua Micelar Skin Sensitive ','120 ml. ','4','13800','1'),
(3,'Gel espuma de Tilo','340 ml. ','5','14800','1'),
(4,'Gel espuma de Manzanas Verdes ','340 ml. ','9','14800','1'),
(5,'Solución Vitamina C','50 ml. ','15','25300','1'),
(6,'Vitamina C en Crema','70 gr. ','5','25400','1'),
(7,'Hialurónico Solución ','60 ml.','36','25300','1'),
(8,' Booster Hialuronic ','30 ml. ','80','30700','1'),
(9,'Solución Niacinamida','50 ml.','2','29700','1'),
(10,' Perfect Rice Scrub ','200 gr.','23','25400','1'),
(11,'Gel Ultra Sensitive ','200 ml. ','15','29800','2'),
(12,'Skin Sensitive Crema','70 gr. ','5','21800','2'),
(13,'Marine Control Loción Tratante','120 ml.','9','16700','2'),
(14,' Marine Control Crema Anti Imperfecciones ','70 gr. ','7','16600','2'),
(15,'Extreme Protect Emulsión Dermoprotectora 200 ml. ','70 gr.','3','18300','2'),
(16,'Flexy Day',' 60 ml.','5','9500','2'),
(17,'New Olive ','120 gr. ','3','13800','2'),
(18,' CICA Cream ','70 gr. ','5','14900','2'),
(19,'TensAge ','70 gr. ','6','11000','3'),
(20,' DMAE ','50 ml. ','14','12500','3'),
(21,'Solución Vitamina C ','50 ml. ','2','14500','3'),
(22,'Solución Vitamina C ',' 200 ml. ','4','22000','3'),
(23,' Hialurónico Solución ','50 ml. ','6','14500','3'),
(24,' Ceramidas ','50 ml.','6','11900','4'),
(25,'Coenzima Q ','10 50 ml.','95','12500','4'),
(26,'Rosa Mosqueta',' 50 ml. ','5','12500','4'),
(27,'Quínoa ','50 ml.','3','16600','4');

INSERT INTO VENTAS VALUE
('FA','001000000001','2024-08-17','00012','001','1','1'),
('FA','001000000002','2024-08-19','00004','003','2','3'),
('FB','001000000001','2024-08-22','00010','002','1','2'),
('NCA','001000000001','2024-08-23','00004','003','2','3'),
('NCB','001000000001','2024-08-23','00010','002','1','4');

INSERT INTO detalle_venta VALUE
('1','FA','1000000001','4','2'),
('2','FA','1000000001','9','6'),
('3','FA','1000000001','13','2'),
('4','FA','1000000002','1','1'),
('5','FA','1000000002','6','2'),
('6','FA','1000000002','5','3'),
('7','FA','1000000002','7','1'),
('8','FB','1000000001','1','1'),
('9','NCA','1000000001','4','-1'),
('10','NCB','1000000001','1','-1');