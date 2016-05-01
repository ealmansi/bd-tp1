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

	idPago INTEGER NOT NULL,
	idCalificacion INTEGER NOT NULL,
	idPublicacion INTEGER NOT NULL,
	FOREIGN KEY(idPago) REFERENCES pago(idPago),
	FOREIGN KEY(idCalificacion) REFERENCES calificacion(idCalificacion)
	FOREIGN KEY(idPublicacion) REFERENCES publicacion(idPublicacion)
);

CREATE TABLE item (
	idItem INTEGER NOT NULL PRIMARY KEY,

	idPublicacion INTEGER NOT NULL
	-- FOREIGN KEY(idPublicacion) REFERENCES publicacion(idPublicacion)
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
