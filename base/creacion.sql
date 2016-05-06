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

CREATE TABLE empresa (
	idUsuario INTEGER NOT NULL PRIMARY KEY,
	CUIT TEXT NOT NULL,
	razonSocial TEXT NOT NULL,
	idCategoriaEmpresa TEXT NOT NULL,
	FOREIGN KEY(idUsuario) REFERENCES domicilio(idUsuario),
	FOREIGN KEY(idCategoriaEmpresa) REFERENCES categoriaEmpresa(idCategoriaEmpresa)
);

CREATE TABLE categoriaEmpresa (
	nombre TEXT NOT NULL PRIMARY KEY,
	idCategoriaPadre TEXT,
	FOREIGN KEY(idCategoriaPadre) REFERENCES categoriaEmpresa(idCategoriaEmpresa)
);

CREATE TABLE particular (
	idUsuario INTEGER NOT NULL PRIMARY KEY,
	nombre TEXT NOT NULL,
	apellido TEXT NOT NULL,
	DNI INTEGER NOT NULL,
	FOREIGN KEY(idUsuario) REFERENCES usuario(idUsuario)
);

CREATE TABLE factura (
	idFactura INTEGER NOT NULL PRIMARY KEY,
	periodo DATE NOT NULL,
	deuda INTEGER NOT NULL,
	idUsuario INTEGER NOT NULL,
	FOREIGN KEY(idUsuario) REFERENCES usuario(idUsuario)
);

CREATE TABLE subscripcion (
	idSubscripcion INTEGER NOT NULL PRIMARY KEY,
	periodo DATE NOT NULL,
	idUsuario INTEGER NOT NULL,
	FOREIGN KEY(idUsuario) REFERENCES usuario(idUsuario)
);

CREATE TABLE pago (
	idPago INTEGER NOT NULL PRIMARY KEY,
	monto INTEGER NOT NULL,
	tipo INTEGER not NULL
);

CREATE TABLE pagoTarjeta (
	numeroTarjeta INTEGER NOT NULL,
	cuotas INTEGER NOT NULL,
	idPago INTEGER NOT NULL PRIMARY KEY,
	FOREIGN KEY(idPago) REFERENCES pago(idPago)
);

CREATE TABLE calificacion (
	idCalificacion INTEGER NOT NULL PRIMARY KEY,
	comentarioComprador TEXT,
	comentarioVendedor TEXT,
	calificacionComprador INTEGER,
	calificacionVendedor INTEGER
);

CREATE TABLE compra (
	idCompra INTEGER NOT NULL PRIMARY KEY,
	idUsuario INTEGER NOT NULL,
	idPago INTEGER NOT NULL,
	idCalificacion INTEGER NOT NULL,
	idRetiro INTEGER NOT NULL,
	idPublicacionFinalizada INTEGER NOT NULL,
	FOREIGN KEY(idUsuario) REFERENCES usuario(idUsuario),
	FOREIGN KEY(idPago) REFERENCES pago(idPago),
	FOREIGN KEY(idCalificacion) REFERENCES calificacion(idCalificacion),
	FOREIGN KEY(idPublicacionFinalizada) REFERENCES publicacionFinalizada(idPublicacion),
	FOREIGN KEY(idRetiro) REFERENCES retiro(idRetiro)
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

CREATE TABLE item (
	idItem INTEGER NOT NULL PRIMARY KEY,
	nombre TEXT NOT NULL,
	tipo INTEGER NOT NULL,
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
	FOREIGN KEY(nombreCategoriaPadre) REFERENCES categoriaProducto(nombreCategoria)
);

CREATE TABLE servicio (
	idItem INTEGER NOT NULL PRIMARY KEY,
	precioPorHora INTEGER NOT NULL,
	nombreServicio TEXT NOT NULL,
	FOREIGN KEY(idItem) REFERENCES item(idItem),
	FOREIGN KEY(nombreServicio) REFERENCES tipoServicio(nombre)
);

CREATE TABLE tipoServicio (
	nombre TEXT NOT NULL PRIMARY KEY,
	nombreTipoPadre TEXT,
	FOREIGN KEY(nombreTipoPadre) REFERENCES tipoServicio(nombreTipo)
);

CREATE TABLE publicacion (
	idPublicacion INTEGER NOT NULL PRIMARY KEY,
	titulo TEXT NOT NULL,
	fecha DATE NOT NULL,
	precio INTEGER NOT NULL,
	tipoVenta INTEGER NOT NULL,
	tipoVigencia INTEGER NOT NULL,
	nombreTipo TEXT NOT NULL,
	idUsuario INTEGER NOT NULL,
	FOREIGN KEY(nombreTipo) REFERENCES tipoPublicacion(nombre),
	FOREIGN KEY(idUsuario) REFERENCES usuario(idUsuario)
);

CREATE TABLE tipoPublicacion (
	nombre TEXT NOT NULL PRIMARY KEY,
	comision FLOAT NOT NULL,
	nivel INTEGER NOT NULL,
	costo INTEGER NOT NULL,
	caducidad DATE NOT NULL
);

CREATE TABLE favoritoUsuarioPublicacion (
	idUsuario INTEGER NOT NULL,
	idPublicacion INTEGER NOT NULL,
	PRIMARY KEY(idUsuario, idPublicacion),
	FOREIGN KEY(idUsuario) REFERENCES usuario(idUsuario),
	FOREIGN KEY(idPublicacion) REFERENCES publicacion(idPublicacion)
);

CREATE TABLE visitaUsuarioPublicacion (
	fecha DATE NOT NULL,
	idUsuario INTEGER NOT NULL,
	idPublicacion INTEGER NOT NULL,
	PRIMARY KEY(idUsuario, idPublicacion, fecha),
	FOREIGN KEY(idUsuario) REFERENCES usuario(idUsuario),
	FOREIGN KEY(idPublicacion) REFERENCES publicacion(idPublicacion)
);

CREATE TABLE pregunta (
	idPregunta INTEGER NOT NULL,
	pregunta TEXT NOT NULL,
	respuesta TEXT,
	idUsuario INTEGER NOT NULL,
	idPublicacion INTEGER NOT NULL,
	PRIMARY KEY(idPregunta),
	FOREIGN KEY(idUsuario) REFERENCES usuario(idUsuario),
	FOREIGN KEY(idPublicacion) REFERENCES publicacion(idPublicacion)
);

CREATE TABLE publicacionSubasta (
	idPublicacion INTEGER NOT NULL PRIMARY KEY,
	FOREIGN KEY(idPublicacion) REFERENCES publicacion(idPublicacion)
);

CREATE TABLE ofertaUsuarioSubasta (
	idUsuario INTEGER NOT NULL,
	idSubasta INTEGER NOT NULL,
	fechaOferta DATE NOT NULL,
	precio INTEGER NOT NULL,
	PRIMARY KEY(idUsuario, idSubasta, fechaOferta),
	FOREIGN KEY(idUsuario) REFERENCES usuario(idUsuario),
	FOREIGN KEY(idSubasta) REFERENCES subasta(idPublicacion)
);

CREATE TABLE publicacionFinalizada (
	idPublicacion INTEGER NOT NULL PRIMARY KEY,
	FOREIGN KEY(idPublicacion) REFERENCES publicacion(idPublicacion)
);
