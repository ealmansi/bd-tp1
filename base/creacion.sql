.bail ON
.echo ON
.headers ON
.mode column

PRAGMA foreign_keys = ON;

CREATE TABLE usuario (
	idUsuario INTEGER NOT NULL PRIMARY KEY,
	telefono TEXT NOT NULL,
	email TEXT NOT NULL
);

CREATE TABLE domicilio (
	idUsuario INTEGER NOT NULL PRIMARY KEY,
	numero INTEGER NOT NULL,
	localidad TEXT NOT NULL
);

CREATE TABLE empresa (
	CUIT TEXT NOT NULL,
	razonSocial TEXT NOT NULL,

	idUsuario INTEGER NOT NULL PRIMARY KEY,
	FOREIGN KEY(idUsuario) REFERENCES domicilio(idUsuario)
);

CREATE TABLE persona (
	nombre TEXT NOT NULL,
	apellido TEXT NOT NULL,
	DNI TEXT NOT NULL,

	idUsuario INTEGER NOT NULL PRIMARY KEY,
	FOREIGN KEY(idUsuario) REFERENCES usuario(idUsuario)
);

CREATE TABLE categoriaEmpresa (
	idCatetoriaEmpresa INTEGER NOT NULL PRIMARY KEY,
	nombre TEXT NOT NULL,

	idUsuario INTEGER NOT NULL,
	idCategoriaPadre INTEGER,
	FOREIGN KEY(idUsuario) REFERENCES empresa(idUsuario),
	FOREIGN KEY(idCategoriaPadre) REFERENCES categoriaEmpresa(idCategoriaPadre)
);

CREATE TABLE factura (
	idFactura INTEGER NOT NULL PRIMARY KEY,
	deuda INTEGER NOT NULL,

	idUsuario INTEGER NOT NULL,
	mesFactura INTEGER NOT NULL,
	FOREIGN KEY(idUsuario) REFERENCES usuario(idUsuario)
);

CREATE TABLE pago (
	idPago INTEGER NOT NULL PRIMARY KEY
);

CREATE TABLE pagoTarjeta (
	numero INTEGER NOT NULL,
	cuotas INTEGER NOT NULL,

	idPago INTEGER NOT NULL PRIMARY KEY,
	FOREIGN KEY(idPago) REFERENCES pago(idPago)
);

CREATE TABLE pagoEfectivo (
	idPago INTEGER NOT NULL PRIMARY KEY,
	FOREIGN KEY(idPago) REFERENCES pago(idPago)
);

CREATE TABLE calificacion (
	idCalificacion INTEGER NOT NULL PRIMARY KEY,
	comentarioComprador TEXT NOT NULL,
	comentarioVendedor TEXT NOT NULL,
	calificacionComprador INTEGER NOT NULL,
	calificacionVendedor INTEGER NOT NULL
);

CREATE TABLE retiro (
	idRetiro INTEGER NOT NULL PRIMARY KEY
);

CREATE TABLE envioPostal (
	direccion TEXT NOT NULL,

	idRetiro INTEGER NOT NULL PRIMARY KEY,
	FOREIGN KEY(idRetiro) REFERENCES retiro(idRetiro)
);

CREATE TABLE retiroPersonal (
	idRetiro INTEGER NOT NULL PRIMARY KEY,
	FOREIGN KEY(idRetiro) REFERENCES retiro(idRetiro)
);

CREATE TABLE compra (
	idCompra INTEGER NOT NULL PRIMARY KEY,
	fecha DATE NOT NULL,

	idUsuario INTEGER NOT NULL,
	idPago INTEGER NOT NULL,
	idCalificacion INTEGER NOT NULL,
	idPublicacionFinalizada INTEGER NOT NULL,
	FOREIGN KEY(idUsuario) REFERENCES usuario(idUsuario),
	FOREIGN KEY(idPago) REFERENCES pago(idPago),
	FOREIGN KEY(idCalificacion) REFERENCES calificacion(idCalificacion),
	FOREIGN KEY(idPublicacionFinalizada) REFERENCES publicacionFinalizada(idPublicacion)
);

CREATE TABLE item (
	idItem INTEGER NOT NULL PRIMARY KEY,

	idPublicacion INTEGER NOT NULL,
	FOREIGN KEY(idPublicacion) REFERENCES publicacion(idPublicacion)
);

CREATE TABLE producto (
	idItem INTEGER NOT NULL PRIMARY KEY,
	nombreCategoria TEXT NOT NULL,

	FOREIGN KEY(idItem) REFERENCES item(idItem),
	FOREIGN KEY(nombreCategoria) REFERENCES categoriaProducto(nombreCategoria)
);

CREATE TABLE categoriaProducto (
	nombreCategoria TEXT NOT NULL PRIMARY KEY,
	nombreCategoriaPadre TEXT,
	FOREIGN KEY(nombreCategoriaPadre) REFERENCES categoriaProducto(nombreCategoriaPadre)
);

CREATE TABLE servicio (
	precioPorHora INTEGER NOT NULL,

	idItem INTEGER NOT NULL PRIMARY KEY,
	FOREIGN KEY(idItem) REFERENCES item(idItem)
);

CREATE TABLE tipoServicio (
	nombre TEXT NOT NULL PRIMARY KEY,

	nombreTipoPadre TEXT,
	FOREIGN KEY(nombreTipoPadre) REFERENCES tipoServicio(nombreTipoPadre)
);

CREATE TABLE publicacion (
	idPublicacion INTEGER NOT NULL PRIMARY KEY,
	titulo TEXT NOT NULL,

	idTipo INTEGER NOT NULL,
	idUsuario INTEGER NOT NULL,
	FOREIGN KEY(idTipo) REFERENCES tipoPublicacion(idTipo),
	FOREIGN KEY(idUsuario) REFERENCES usuario(idUsuario)
);

CREATE TABLE favoritoUsuarioPublicacion (
	idUsuario INTEGER NOT NULL,
	idPublicacion INTEGER NOT NULL,
	PRIMARY KEY(idUsuario, idPublicacion),
	FOREIGN KEY(idUsuario) REFERENCES usuario(idUsuario),
	FOREIGN KEY(idPublicacion) REFERENCES publicacion(idPublicacion)
);

CREATE TABLE visitaUsuarioPublicacion (
	idUsuario INTEGER NOT NULL,
	idPublicacion INTEGER NOT NULL,
	PRIMARY KEY(idUsuario, idPublicacion),
	FOREIGN KEY(idUsuario) REFERENCES usuario(idUsuario),
	FOREIGN KEY(idPublicacion) REFERENCES publicacion(idPublicacion)
);

CREATE TABLE preguntaUsuarioPublicacion (
	idPregunta INTEGER NOT NULL,
	pregunta TEXT NOT NULL,
	respuesta TEXT,

	idUsuario INTEGER NOT NULL,
	idPublicacion INTEGER NOT NULL,
	PRIMARY KEY(idUsuario, idPublicacion, idPregunta),
	FOREIGN KEY(idUsuario) REFERENCES usuario(idUsuario),
	FOREIGN KEY(idPublicacion) REFERENCES publicacion(idPublicacion)
);

CREATE TABLE tipoPublicacion (
	idTipo INTEGER NOT NULL PRIMARY KEY,
	nombre TEXT NOT NULL,
	comision FLOAT NOT NULL,
	nivel INTEGER NOT NULL,
	costo INTEGER NOT NULL,
	caducidad DATE NOT NULL
);

CREATE TABLE publicacionVentaDirecta (
	idPublicacion INTEGER NOT NULL PRIMARY KEY,
	FOREIGN KEY(idPublicacion) REFERENCES publicacion(idPublicacion)
);

CREATE TABLE publicacionSubasta (
	idPublicacion INTEGER NOT NULL PRIMARY KEY,
	FOREIGN KEY(idPublicacion) REFERENCES publicacion(idPublicacion)
);

CREATE TABLE ofertaUsuarioSubasta (
	precio INTEGER NOT NULL,
	fechaOferta DATE NOT NULL,

	idUsuario INTEGER NOT NULL,
	idSubasta INTEGER NOT NULL,
	PRIMARY KEY(idUsuario, idSubasta, fechaOferta),
	FOREIGN KEY(idUsuario) REFERENCES usuario(idUsuario),
	FOREIGN KEY(idSubasta) REFERENCES subasta(idPublicacion)
);

CREATE TABLE publicacionVigente (
	idPublicacion INTEGER NOT NULL PRIMARY KEY,
	FOREIGN KEY(idPublicacion) REFERENCES publicacion(idPublicacion)
);

CREATE TABLE publicacionFinalizada (
	idPublicacion INTEGER NOT NULL PRIMARY KEY,
	FOREIGN KEY(idPublicacion) REFERENCES publicacion(idPublicacion)
);
