BEGIN TRANSACTION;

INSERT INTO usuario VALUES(0, "Arenales", 1111, "Quilmes", "44445454", "juan@gmail.com", 1);
INSERT INTO usuario VALUES(1, "Rivadavia", 3333, "Moron", "0303456", "miguel@gmail.com", 1);
INSERT INTO usuario VALUES(2, "Compumundo", 2000, "San Isidro", "44446666", "compumundo@gmail.com", 0);

INSERT INTO particular VALUES(0, "Juan", "Perez", 35353535);
INSERT INTO particular VALUES(1, "Miguel", "Maurizio", 36363636);

INSERT INTO categoriaEmpresa VALUES("comidas", null);
INSERT INTO categoriaEmpresa VALUES("electronica", null);
INSERT INTO categoriaEmpresa VALUES("computacion", "electronica");

INSERT INTO empresa VALUES(0, "20454545459", "Compumundo SA", "computacion");

INSERT INTO factura VALUES(0, '2016-04-01', 1000, 1);
INSERT INTO factura VALUES(1, '2016-05-01', 3500, 1);
INSERT INTO factura VALUES(2, '2016-02-01', 100000, 2);

INSERT INTO subscripcion VALUES(0, '2016-04-01', 2);
INSERT INTO subscripcion VALUES(1, '2016-05-01', 0);

--
INSERT INTO tipoPublicacion VALUES("Libre!", 0, 0, 0, 2);
INSERT INTO tipoPublicacion VALUES("Bronce", 2, 1, 0, 8);
INSERT INTO tipoPublicacion VALUES("Plata", 4, 2, 0, 8);
INSERT INTO tipoPublicacion VALUES("Oro", 8, 3, 0, 8);
INSERT INTO tipoPublicacion VALUES("RubiDeOriente", 0, 4, 10000, 4);

INSERT INTO publicacion VALUES(0, "Combo bicicleta", '2016-04-15', 5000, 0, 1, "Libre!", 1);
INSERT INTO publicacion VALUES(1, "Computadora", '2016-03-20', 15000, 0, 1, "RubiDeOriente", 2);
INSERT INTO publicacion VALUES(2, "Super Maceta", '2016-03-10', 10, 1, 1, "Bronce", 0);
INSERT INTO publicacion VALUES(3, "Mega Computadora", '2016-03-21', 18000, 0, 1, "RubiDeOriente", 2);
INSERT INTO publicacion VALUES(4, "Silla", '2016-01-01', 15, 0, 0, "Libre!", 1);

INSERT INTO categoriaProducto VALUES("Hogar", null);
INSERT INTO categoriaProducto VALUES("Jardin", "Hogar");
INSERT INTO categoriaProducto VALUES("Mueble", "Hogar");
INSERT INTO categoriaProducto VALUES("Electronica", null);
INSERT INTO categoriaProducto VALUES("Computacion", "Electronica");
INSERT INTO categoriaProducto VALUES("Deporte", null);

INSERT INTO tipoServicio VALUES("Instalacion", null);
INSERT INTO tipoServicio VALUES("Ensenanza", null);
INSERT INTO tipoServicio VALUES("InstalacionComputador", "Instalacion");

INSERT INTO item VALUES(0, "Bicicleta", 0, 0);
INSERT INTO item VALUES(1, "Inflador Bicicleta", 0, 0);
INSERT INTO item VALUES(2, "Computadora Modelo 1", 0, 1);
INSERT INTO item VALUES(3, "Impresora", 0, 1);
INSERT INTO item VALUES(4, "Maceta", 0, 2);
INSERT INTO item VALUES(5, "Computadora Modelo 2", 0, 3);
INSERT INTO item VALUES(6, "Instalacion de PC", 1, 3);
INSERT INTO item VALUES(7, "Silla", 0, 4);

INSERT INTO producto VALUES(0, "Deporte");
INSERT INTO producto VALUES(1, "Deporte");
INSERT INTO producto VALUES(2, "Computacion");
INSERT INTO producto VALUES(3, "Computacion");
INSERT INTO producto VALUES(4, "Jardin");
INSERT INTO producto VALUES(5, "Computacion");
INSERT INTO producto VALUES(7, "Hogar");

INSERT INTO servicio VALUES(6, 200, "InstalacionComputador");

--

INSERT INTO pago VALUES(0, 20, 0);
INSERT INTO pago VALUES(1, 15000, 1);
INSERT INTO pago VALUES(2, 18000, 0);
INSERT INTO pago VALUES(3, 5000, 1);

INSERT INTO pagoTarjeta VALUES(1, 2344567812345678, 12);
INSERT INTO pagoTarjeta VALUES(3, 1234567827834456, 6);

INSERT INTO calificacion VALUES(0, "No me gusto el producto", null, 2, null);
INSERT INTO calificacion VALUES(1, "Todo bien", "Pone 10!", 9, 5);
INSERT INTO calificacion VALUES(2, "Aceptable", "Ok", 7, 7);
INSERT INTO calificacion VALUES(3, null, null, null, null);

INSERT INTO retiro VALUES(0, 0);
INSERT INTO retiro VALUES(1, 0);
INSERT INTO retiro VALUES(2, 1);
INSERT INTO retiro VALUES(3, 1);

INSERT INTO envioPostal VALUES(2, "Arenales 1111");
INSERT INTO envioPostal VALUES(3, "Compumundo 2000");

INSERT INTO compra VALUES(0, 0, 0, 0, 2, 2);
INSERT INTO compra VALUES(1, 1, 2, 1, 1, 3);
INSERT INTO compra VALUES(2, 0, 1, 2, 0, 1);
INSERT INTO compra VALUES(3, 2, 3, 3, 3, 0);

--

INSERT INTO ofertaUsuarioSubasta VALUES(1, 2, '2016-03-12', 20);
INSERT INTO ofertaUsuarioSubasta VALUES(2, 2, '2016-03-11', 18);

INSERT INTO visitaUsuarioPublicacion VALUES(1, 2, '2016-03-12');
INSERT INTO visitaUsuarioPublicacion VALUES(2, 2, '2016-03-11');
INSERT INTO visitaUsuarioPublicacion VALUES(2, 0, '2016-04-18');
INSERT INTO visitaUsuarioPublicacion VALUES(0, 1, '2016-03-25');
INSERT INTO visitaUsuarioPublicacion VALUES(1, 3, '2016-03-21');

INSERT INTO favoritoUsuarioPublicacion VALUES(1, 3);
INSERT INTO favoritoUsuarioPublicacion VALUES(2, 0);

INSERT INTO pregunta VALUES(0, "La impresora tiene scanner?", null, 0, 1);
INSERT INTO pregunta VALUES(1, "Instalacion incluida?", "Si", 1, 3);


COMMIT;
