.bail ON
.echo ON
.headers ON
.mode column

PRAGMA foreign_keys = ON;

CREATE TABLE usuario (
	idUsuario INTEGER NOT NULL PRIMARY KEY,
	calle TEXT NOT NULL,
	numero INTEGER NOT NULL,
	localidad TEXT NOT NULL,
	telefono TEXT NOT NULL,
	email TEXT NOT NULL,
	tipo INTEGER NOT NULL
);

CREATE TABLE particular (
	idUsuario INTEGER NOT NULL PRIMARY KEY,
	DNI INTEGER NOT NULL,
	nombre TEXT NOT NULL,
	apellido TEXT NOT NULL,
	FOREIGN KEY(idUsuario) REFERENCES usuario(idUsuario)
);

CREATE TABLE empresa (
	idUsuario INTEGER NOT NULL PRIMARY KEY,
	CUIT TEXT NOT NULL,
	razonSocial TEXT NOT NULL,
	nombreCategoriaEmpresa TEXT NOT NULL,
	FOREIGN KEY(idUsuario) REFERENCES usuario(idUsuario)
	FOREIGN KEY(nombreCategoriaEmpresa) REFERENCES categoriaEmpresa(nombre)
);

CREATE TABLE categoriaEmpresa (
	nombre TEXT NOT NULL PRIMARY KEY,
	nombreSuperCategoria TEXT,
	FOREIGN KEY(nombreSuperCategoria) REFERENCES categoriaEmpresa(nombre)
);

CREATE TABLE suscripcionRubiOriente (
	idSuscripcion INTEGER NOT NULL PRIMARY KEY,
	periodo DATE NOT NULL,
	idUsuario INTEGER NOT NULL,
	FOREIGN KEY(idUsuario) REFERENCES usuario(idUsuario)
);

CREATE TABLE factura (
	idFactura INTEGER NOT NULL PRIMARY KEY,
	periodo DATE NOT NULL,
	monto INTEGER NOT NULL,
	idUsuario INTEGER NOT NULL,
	FOREIGN KEY(idUsuario) REFERENCES usuario(idUsuario)
);

CREATE TABLE publicacion (
	idPublicacion INTEGER NOT NULL PRIMARY KEY,
	titulo TEXT NOT NULL,
	fecha DATE NOT NULL,
	precio INTEGER NOT NULL,
	nombreTipoPublicacion TEXT NOT NULL,
	tipoVigencia INTEGER NOT NULL,
	tipoVenta INTEGER NOT NULL,
	idUsuario INTEGER NOT NULL,
	FOREIGN KEY(nombreTipoPublicacion) REFERENCES tipoPublicacion(nombre),
	FOREIGN KEY(idUsuario) REFERENCES usuario(idUsuario)
);

CREATE TABLE publicacionSubasta (
	idPublicacion INTEGER NOT NULL PRIMARY KEY,
	FOREIGN KEY(idPublicacion) REFERENCES publicacion(idPublicacion)
);

CREATE TABLE publicacionFinalizada (
	idPublicacion INTEGER NOT NULL PRIMARY KEY,
	FOREIGN KEY(idPublicacion) REFERENCES publicacion(idPublicacion)
);

CREATE TABLE tipoPublicacion (
	nombre TEXT NOT NULL PRIMARY KEY,
	comision FLOAT NOT NULL,
	costo INTEGER NOT NULL,
	nivel INTEGER NOT NULL,
	caducidad DATE NOT NULL
);

CREATE TABLE item (
	idItem INTEGER NOT NULL PRIMARY KEY,
	idPublicacion INTEGER NOT NULL,
	nombre TEXT NOT NULL,
	tipo INTEGER NOT NULL,
	FOREIGN KEY(idPublicacion) REFERENCES publicacion(idPublicacion)
);

CREATE TABLE producto (
	idItem INTEGER NOT NULL PRIMARY KEY,
	nombreCategoriaProducto TEXT NOT NULL,
	FOREIGN KEY(idItem) REFERENCES item(idItem),
	FOREIGN KEY(nombreCategoriaProducto) REFERENCES categoriaProducto(nombre)
);

CREATE TABLE servicio (
	idItem INTEGER NOT NULL PRIMARY KEY,
	precioPorHora INTEGER NOT NULL,
	nombreTipoServicio TEXT NOT NULL,
	FOREIGN KEY(idItem) REFERENCES item(idItem),
	FOREIGN KEY(nombreTipoServicio) REFERENCES tipoServicio(nombre)
);

CREATE TABLE categoriaProducto (
	nombre TEXT NOT NULL PRIMARY KEY,
	nombreSuperCategoria TEXT,
	FOREIGN KEY(nombreSuperCategoria) REFERENCES categoriaProducto(nombre)
);

CREATE TABLE tipoServicio (
	nombre TEXT NOT NULL PRIMARY KEY,
	nombreSuperTipo TEXT,
	FOREIGN KEY(nombreSuperTipo) REFERENCES tipoServicio(nombre)
);

CREATE TABLE compra (
	idCompra INTEGER NOT NULL PRIMARY KEY,
	idUsuario INTEGER NOT NULL,
	idPublicacionFinalizada INTEGER NOT NULL,
	idPago INTEGER NOT NULL,
	idCalificacion INTEGER NOT NULL,
	idRetiro INTEGER NOT NULL,
	FOREIGN KEY(idUsuario) REFERENCES usuario(idUsuario),
	FOREIGN KEY(idPublicacionFinalizada) REFERENCES publicacionFinalizada(idPublicacion),
	FOREIGN KEY(idPago) REFERENCES pago(idPago),
	FOREIGN KEY(idCalificacion) REFERENCES calificacion(idCalificacion),
	FOREIGN KEY(idRetiro) REFERENCES retiro(idRetiro)
);

CREATE TABLE pago (
	idPago INTEGER NOT NULL PRIMARY KEY,
	monto INTEGER NOT NULL,
	tipo INTEGER not NULL
);

CREATE TABLE pagoTarjeta (
	idPago INTEGER NOT NULL PRIMARY KEY,
	numeroTarjeta INTEGER NOT NULL,
	cuotas INTEGER NOT NULL,
	FOREIGN KEY(idPago) REFERENCES pago(idPago)
);

CREATE TABLE calificacion (
	idCalificacion INTEGER NOT NULL PRIMARY KEY,
	valoracionComprador INTEGER,
	valoracionVendedor INTEGER,
	comentarioComprador TEXT,
	comentarioVendedor TEXT
);

CREATE TABLE retiro (
	idRetiro INTEGER NOT NULL PRIMARY KEY,
	tipo INTEGER not NULL
);

CREATE TABLE envioPostal (
	idRetiro INTEGER NOT NULL PRIMARY KEY,
	direccion TEXT NOT NULL,
	FOREIGN KEY(idRetiro) REFERENCES retiro(idRetiro)
);

CREATE TABLE hizoOferta (
	idUsuario INTEGER NOT NULL,
	idPublicacion INTEGER NOT NULL,
	fecha DATE NOT NULL,
	monto INTEGER NOT NULL,
	PRIMARY KEY(idUsuario, idPublicacion, fecha),
	FOREIGN KEY(idUsuario) REFERENCES usuario(idUsuario),
	FOREIGN KEY(idPublicacion) REFERENCES publicacionSubasta(idPublicacion)
);

CREATE TABLE pregunta (
	idPregunta INTEGER NOT NULL PRIMARY KEY,
	idUsuario INTEGER NOT NULL,
	idPublicacion INTEGER NOT NULL,
	pregunta TEXT NOT NULL,
	respuesta TEXT,
	FOREIGN KEY(idUsuario) REFERENCES usuario(idUsuario),
	FOREIGN KEY(idPublicacion) REFERENCES publicacion(idPublicacion)
);

CREATE TABLE marcoFavorita (
	idUsuario INTEGER NOT NULL,
	idPublicacion INTEGER NOT NULL,
	PRIMARY KEY(idUsuario, idPublicacion),
	FOREIGN KEY(idUsuario) REFERENCES usuario(idUsuario),
	FOREIGN KEY(idPublicacion) REFERENCES publicacion(idPublicacion)
);

CREATE TABLE visito (
	idUsuario INTEGER NOT NULL,
	idPublicacion INTEGER NOT NULL,
	fecha DATE NOT NULL,
	PRIMARY KEY(idUsuario, idPublicacion, fecha),
	FOREIGN KEY(idUsuario) REFERENCES usuario(idUsuario),
	FOREIGN KEY(idPublicacion) REFERENCES publicacion(idPublicacion)
);
