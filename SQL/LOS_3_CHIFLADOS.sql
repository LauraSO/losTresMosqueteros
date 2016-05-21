CREATE TABLE ROL (
id_rol int Primary Key,
nombre nvarchar(255),
suspendido int);

CREATE TABLE FUNCIONALIDAD (
id_funcionalidad int Primary Key,
descripcion nvarchar(255));

CREATE TABLE FUNCIONABILIDADxROL (
id_funcionalidadXRol int Primary Key,
id_rol int not null references ROL,
id_funcionalidad int not null references FUNCIONALIDAD);

CREATE TABLE TIPODNI (
id_tipoDNI int Primary Key,
descripcion nvarchar(255));

CREATE TABLE USUARIO (
id_user int Primary Key,
usuario nvarchar(255),
contrasenia nvarchar(500),
mail nvarchar(255),
intentos int,
suspendido int);

CREATE TABLE LOCALIDAD (
id_localidad int Primary Key,
descripcion nvarchar(255));

CREATE TABLE EMPRESA (
id_empresa int Primary Key,
id_usuario int not null references USUARIO,
id_localidad int not null references LOCALIDAD,
razonSocial nvarchar(255),
telefono int,
direccion nvarchar(50),
numeroCalle nvarchar(50),
dpto nvarchar(50),
codigoPostal nvarchar(50),
cuit nvarchar(50),
contacto nvarchar(45),
rubro nvarchar(255),
calificacionProm int,
fechaCreacion datetime);

CREATE TABLE PERSONA (
id_persona int Primary Key,
id_tipoDNI int not null references TIPODNI,
id_usuario int not null references USUARIO,
id_localidad int not null references LOCALIDAD,
nombre nvarchar(255),
apellido nvarchar(255),
dni numeric(18,0),
piso numeric(18,0),
dpto nvarchar(50),
codigoPostal nvarchar(255),
fechaNacimiento datetime,
fechaCreacion datetime);

CREATE TABLE ROLxUSUARIO (
id_rolXUsuario int Primary Key,
id_usuario int not null references USUARIO,
id_rol int not null references ROL,
suspendido int);

CREATE TABLE FORMADEPAGO (
id_formaDePago int Primary Key,
descripcion nvarchar(50));

CREATE TABLE SUBASTA_COMPRADIRECTA (
id_oferta int Primary Key,
precio int,
valorOferta int,
cantidad int,
stock int,
nombre nvarchar(255));

CREATE TABLE ESTADO (
id_estado int Primary Key,
descripcion nvarchar(255));

CREATE TABLE VISIBILIDAD (
id_visibilidad int Primary Key,
costoPorTipo int,
comisionPorVenta int,
comisionPorEnvio int,
descripcion NVARCHAR(255));

CREATE TABLE ENVIO (
id_envio int Primary Key,
costo int);

CREATE TABLE PUBLICACION (
id_publicacion int Primary Key,
id_oferta int not null references SUBASTA_COMPRADIRECTA,
id_estado int not null references ESTADO,
id_visibilidad int not null references VISIBILIDAD,
id_envio int not null references ENVIO,
id_usuario int not null references USUARIO,
fechaInicio datetime,
fechaVencimiento datetime,
descripcion nvarchar(255),
admitePreguntas bit);

CREATE TABLE RUBRO (
id_rubro int Primary Key,
descripcionLarga nvarchar(255),
descripcionCorta nvarchar(255));

CREATE TABLE PUBLICACIONESxRUBRO (
id_publicacionesXRubro int Primary Key,
id_publicacion int not null references PUBLICACION,
id_rubro int not null references RUBRO);

CREATE TABLE FACTURA (
id_factura int Primary Key,
id_usuario int not null references USUARIO,
id_publicacion int not null references PUBLICACION,
id_formaDePago int not null references FORMADEPAGO,
importe int,
cantidad int,
fecha datetime);

CREATE TABLE PREGUNTA (
id_pregunta int Primary Key,
id_usuario int not null references USUARIO,
id_publicacion int not null references PUBLICACION,
pregunta nvarchar(500),
fechaPregunta datetime,
respuesta nvarchar(500),
fechaRespuesta datetime);

CREATE TABLE CALIFICACION (
id_calificaciones int Primary Key,
id_usuario int not null references USUARIO,
id_publicacion int not null references PUBLICACION,
fecha datetime,
detalle nvarchar(255),
puntaje int,
pendiente bit);