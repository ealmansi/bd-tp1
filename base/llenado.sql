.bail ON
.echo ON

PRAGMA foreign_keys = ON;

BEGIN TRANSACTION;

-- Usuarios.

INSERT OR REPLACE INTO usuario VALUES(0, "Arenales", 1111, "Quilmes", "44445454", "juan@gmail.com", 1);
INSERT OR REPLACE INTO usuario VALUES(1, "Rivadavia", 3333, "Moron", "0303456", "miguel@gmail.com", 1);
INSERT OR REPLACE INTO usuario VALUES(2, "Compumundo", 2000, "San Isidro", "44446666", "compumundo@gmail.com", 0);

INSERT OR REPLACE INTO particular VALUES(0, "Juan", "Perez", 35353535);
INSERT OR REPLACE INTO particular VALUES(1, "Miguel", "Maurizio", 36363636);

INSERT OR REPLACE INTO categoriaEmpresa VALUES("comidas", NULL);
INSERT OR REPLACE INTO categoriaEmpresa VALUES("electronica", NULL);
INSERT OR REPLACE INTO categoriaEmpresa VALUES("computacion", "electronica");

INSERT OR REPLACE INTO empresa VALUES(2, "20454545459", "Compumundo SA", "computacion");

INSERT OR REPLACE INTO factura VALUES(0, '2016-04-01', 1000, 1);
INSERT OR REPLACE INTO factura VALUES(1, '2016-05-01', 3500, 1);
INSERT OR REPLACE INTO factura VALUES(2, '2016-02-01', 100000, 2);

INSERT OR REPLACE INTO suscripcionRubiOriente VALUES(0, '2016-04-01', 2);
INSERT OR REPLACE INTO suscripcionRubiOriente VALUES(1, '2016-05-01', 0);

-- Publicaciones.

INSERT OR REPLACE INTO tipoPublicacion VALUES("Libre!", 0, 0, 0, 2);
INSERT OR REPLACE INTO tipoPublicacion VALUES("Bronce", 2, 0, 1, 8);
INSERT OR REPLACE INTO tipoPublicacion VALUES("Plata", 4, 0, 2, 8);
INSERT OR REPLACE INTO tipoPublicacion VALUES("Oro", 8, 0, 3, 8);
INSERT OR REPLACE INTO tipoPublicacion VALUES("RubiDeOriente", 0, 10000, 4, 4);

INSERT OR REPLACE INTO publicacion VALUES(0, "Combo bicicleta", '2016-04-15', 5000, "Libre!", 1, 0, 1);
INSERT OR REPLACE INTO publicacion VALUES(1, "Computadora", '2016-03-20', 15000, "RubiDeOriente", 1, 0, 2);
INSERT OR REPLACE INTO publicacion VALUES(2, "Super Maceta", '2016-03-10', 10, "Bronce", 1, 1, 0);
INSERT OR REPLACE INTO publicacion VALUES(3, "Mega Computadora", '2016-03-21', 18000, "RubiDeOriente", 1, 0, 2);
INSERT OR REPLACE INTO publicacion VALUES(4, "Silla", '2016-01-01', 15, "Libre!", 0, 0, 1);

INSERT OR REPLACE INTO publicacionFinalizada VALUES (0);
INSERT OR REPLACE INTO publicacionFinalizada VALUES (1);
INSERT OR REPLACE INTO publicacionFinalizada VALUES (2);
INSERT OR REPLACE INTO publicacionFinalizada VALUES (3);

INSERT OR REPLACE INTO categoriaProducto VALUES("Hogar", null);
INSERT OR REPLACE INTO categoriaProducto VALUES("Jardin", "Hogar");
INSERT OR REPLACE INTO categoriaProducto VALUES("Mueble", "Hogar");
INSERT OR REPLACE INTO categoriaProducto VALUES("Electronica", null);
INSERT OR REPLACE INTO categoriaProducto VALUES("Computacion", "Electronica");
INSERT OR REPLACE INTO categoriaProducto VALUES("Deporte", null);

INSERT OR REPLACE INTO tipoServicio VALUES("Instalacion", null);
INSERT OR REPLACE INTO tipoServicio VALUES("Ensenanza", null);
INSERT OR REPLACE INTO tipoServicio VALUES("InstalacionComputador", "Instalacion");

INSERT OR REPLACE INTO item VALUES(0, 0, "Bicicleta", 0);
INSERT OR REPLACE INTO item VALUES(1, 0, "Inflador Bicicleta", 0);
INSERT OR REPLACE INTO item VALUES(2, 1, "Computadora Modelo 1", 0);
INSERT OR REPLACE INTO item VALUES(3, 1, "Impresora", 0);
INSERT OR REPLACE INTO item VALUES(4, 2, "Maceta", 0);
INSERT OR REPLACE INTO item VALUES(5, 3, "Computadora Modelo 2", 0);
INSERT OR REPLACE INTO item VALUES(6, 3, "Instalacion de PC", 1);
INSERT OR REPLACE INTO item VALUES(7, 4, "Silla", 0);

INSERT OR REPLACE INTO producto VALUES(0, "Deporte");
INSERT OR REPLACE INTO producto VALUES(1, "Deporte");
INSERT OR REPLACE INTO producto VALUES(2, "Computacion");
INSERT OR REPLACE INTO producto VALUES(3, "Computacion");
INSERT OR REPLACE INTO producto VALUES(4, "Jardin");
INSERT OR REPLACE INTO producto VALUES(5, "Computacion");
INSERT OR REPLACE INTO producto VALUES(7, "Hogar");

INSERT OR REPLACE INTO servicio VALUES(6, 200, "InstalacionComputador");

-- Compras.

INSERT OR REPLACE INTO pago VALUES(0, 20, 0);
INSERT OR REPLACE INTO pago VALUES(1, 15000, 1);
INSERT OR REPLACE INTO pago VALUES(2, 18000, 0);
INSERT OR REPLACE INTO pago VALUES(3, 5000, 1);

INSERT OR REPLACE INTO pagoTarjeta VALUES(1, 2, 2344567812345678);
INSERT OR REPLACE INTO pagoTarjeta VALUES(3, 3, 1234567827834456);

INSERT OR REPLACE INTO calificacion VALUES(0, 2, null, "No me gusto el producto", null);
INSERT OR REPLACE INTO calificacion VALUES(1, 9, 5, "Todo bien", "Pone 10!");
INSERT OR REPLACE INTO calificacion VALUES(2, 7, 7, "Aceptable", "Ok");
INSERT OR REPLACE INTO calificacion VALUES(3, null, null, null, null);

INSERT OR REPLACE INTO retiro VALUES(0, 0);
INSERT OR REPLACE INTO retiro VALUES(1, 0);
INSERT OR REPLACE INTO retiro VALUES(2, 1);
INSERT OR REPLACE INTO retiro VALUES(3, 1);

INSERT OR REPLACE INTO envioPostal VALUES(2, "Arenales 1111");
INSERT OR REPLACE INTO envioPostal VALUES(3, "Compumundo 2000");

INSERT OR REPLACE INTO compra VALUES(0, 0, 2, 0, 0, 2);
INSERT OR REPLACE INTO compra VALUES(1, 1, 3, 2, 1, 1);
INSERT OR REPLACE INTO compra VALUES(2, 0, 1, 1, 2, 0);
INSERT OR REPLACE INTO compra VALUES(3, 2, 0, 3, 3, 3);

-- Usuario - Publicación - Compra.

INSERT OR REPLACE INTO publicacionSubasta VALUES(2);

INSERT OR REPLACE INTO hizoOferta VALUES(1, 2, '2016-03-12', 20);
INSERT OR REPLACE INTO hizoOferta VALUES(2, 2, '2016-03-11', 18);

INSERT OR REPLACE INTO visito VALUES(1, 2, '2016-03-12');
INSERT OR REPLACE INTO visito VALUES(2, 2, '2016-03-11');
INSERT OR REPLACE INTO visito VALUES(2, 0, '2016-04-18');
INSERT OR REPLACE INTO visito VALUES(0, 1, '2016-03-25');
INSERT OR REPLACE INTO visito VALUES(1, 3, '2016-03-21');

INSERT OR REPLACE INTO marcoFavorita VALUES(1, 3);
INSERT OR REPLACE INTO marcoFavorita VALUES(2, 0);

INSERT OR REPLACE INTO pregunta VALUES(0, 0, 1, "La impresora tiene scanner?", null);
INSERT OR REPLACE INTO pregunta VALUES(1, 1, 3, "Instalacion incluida?", "Si");

COMMIT;

