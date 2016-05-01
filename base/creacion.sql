.bail ON
.echo ON
.headers ON
.mode column

PRAGMA foreign_keys = ON

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
	FOREIGN KEY(idUsuario) REFERENCES usuario(idUsuario),
);

CREATE TABLE pago (
	idPago INTEGER NOT NULL PRIMARY KEY,
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

CREATE TABLE compra (
	idCompra INTEGER NOT NULL PRIMARY KEY,
	fecha DATE NOT UNLL,

	idPago INTEGER NOT NULL,
	idCalificacion INTEGER NOT NULL,
	-- idPublicacion INTEGER NOT NULL
	FOREIGN KEY(idPago) REFERENCES pago(idPago),
	FOREIGN KEY(idCalificacion) REFERENCES calificacion(idCalificacion),
	-- FOREIGN KEY(idPublicacion) REFERENCSE publicacion(idPublicacion)
);
