drop database Libreria;

create database Libreria;

use Libreria;
use NegocioBd;


create table Proveedores (
Id_ProveedorEditorial int identity,
CodigoEditorial char(8) primary key,
Nombre_Editorial varchar(50)NOT NULL,
Direccion_Editorial varchar (100) NOT NULL,
TelefonoEditorial varchar (12)
);

create table Lector(
IdLector int  identity,
CodigoLector char(8) primary key,
Nombre_Lector varchar (25),
Apellido_Lector varchar(25),
Edad int check(Edad>=12),
Direccion varchar(50),
Telefono varchar (12)
);


create table GeneroLiterario (
IdGenero int identity,
Genero_Literario char(20) primary key
);

create table Categoria (
IdCategoria int identity,
Categoria char(20) primary key
);

create table Subgenero_Literario (
IdSubgenero int identity,
Subgenero char(20) primary key
);

create table Escritor (
IdEscritor int identity,
Codigo_Escritor char(8) primary key,
Nombre_Escritor varchar(50)NOT NULL,
Apellido_Escritor varchar (50),
Pais_Escritor varchar(50)NOT NULL,
);

create table DatosEscritor(
IdDatosEscritor int primary key identity,
Codigo_Escritor char(8),
Fecha_Nacimiento date,
Lugar_Nacimiento varchar (50),
Fecha_Deceso date,
Lugar_Deceso varchar (50),
Biografia varchar (500)

FOREIGN KEY (Codigo_Escritor) REFERENCES Escritor(Codigo_Escritor)
);

create table Libro (
Id_Libros int identity,
Codigo_Libro char(8) primary key,
CodigoEditorial char(8),
Titulo varchar(100)NOT NULL,
Codigo_Escritor char(8),
A�o_Publicacion varchar(12),
Categoria char(20),
Genero_Literario char (20),
Subgenero char(20),
Rese�a varchar (700),
Precio money,
Cantidad int,
Disponibilidad varchar (30)

FOREIGN KEY (CodigoEditorial) REFERENCES Proveedores(CodigoEditorial),
FOREIGN KEY (Categoria) REFERENCES Categoria(Categoria),
FOREIGN KEY (Genero_Literario) REFERENCES GeneroLiterario(Genero_Literario),
FOREIGN KEY (Subgenero) REFERENCES Subgenero_Literario(Subgenero),
FOREIGN KEY (Codigo_Escritor) REFERENCES Escritor(Codigo_Escritor)
);

create table EstadoLibros(
IdEstado int primary key identity,
Codigo_Libro char(8) not null,
Estado varchar (20) not null,
Descripcion varchar (200),

FOREIGN KEY (Codigo_Libro) REFERENCES Libro(Codigo_Libro)
);


create table Cliente(
IdCliente int identity,
CodigoCliente char(8)primary key,
NombreCliente varchar (30)not null,
ApellidoCliente varchar(30)not null,
Edad int check(Edad>=12)not null,
Direccion varchar(50),
Telefono varchar (12)
);

create table FormaDePago(
IdFormadePago int primary key identity,
Pago varchar (15)
);

drop table Venta;

create table Venta(
IdVenta int primary key identity,
Codigo_Libro char(8),
CodigoCliente char(8),
FechaCompra date,
IdFormadePago int,
Cantidad_Libros int,
Precio_Unitario money,
FOREIGN KEY (Codigo_Libro) REFERENCES Libro(Codigo_Libro),
FOREIGN KEY (CodigoCliente) REFERENCES Cliente(CodigoCliente),
FOREIGN KEY (IdFormadePago) REFERENCES FormaDePago(IdFormadePago)
);



create table Prestamo (
IdPrestamo int primary key identity,
CodigoLector char(8),
Codigo_Libro char(8),
FechaPrestamo date,
FechaDevolucion date,
Devuelto varchar (2) default 'No'

FOREIGN KEY (CodigoLector) REFERENCES Lector(CodigoLector),
FOREIGN KEY (Codigo_Libro) REFERENCES Libro(Codigo_Libro),
);


-----Editoriales----
INSERT INTO Proveedores VALUES(  '867tSant','Santillana','87 Avenida Norte #311, Colonia Escal�n, San Salvador', '2352-9297');
INSERT INTO Proveedores VALUES(  '75t4Pens','Pensar','Ave. Rep�blica Federal de Alemania y Calle Ram�n Belloso, Lote 4, Col., Escal�n, San Salvador Cp', '2264-4034');
INSERT INTO Proveedores VALUES(  'Lis6753s','Editorial Lis','MQXX+HQ8, San Salvador', '2557-4591');
INSERT INTO Proveedores VALUES(  'Nue674','Nuevo Mundo',' 1a Calle Pte. #2221, San Salvador', '2261-1047');
INSERT INTO Proveedores VALUES(  'r4MA4rt','Rama','Residencial San Luis, Av. 4, Block 1, # 13, San Salvador CP, 1101', '2274-6437');

SELECT * from Proveedores order by Id_ProveedorEditorial asc;

----Categoria----
INSERT INTO Categoria VALUES( 'Cient�ficos');
INSERT INTO Categoria VALUES( 'Literatura');
INSERT INTO Categoria VALUES( 'Ling��sticos');
INSERT INTO Categoria VALUES( 'Biografias');
INSERT INTO Categoria VALUES( 'Referencias');
INSERT INTO Categoria VALUES( 'Informacion');
INSERT INTO Categoria VALUES( 'Recreativos');
INSERT INTO Categoria VALUES( 'Juveniles');
INSERT INTO Categoria VALUES( 'Religion');
INSERT INTO Categoria VALUES( 'Enciclopedias');

SELECT * from Categoria order by IdCategoria asc;

-----Generos----
INSERT INTO GeneroLiterario VALUES( 'Narrativo');
INSERT INTO GeneroLiterario VALUES( 'Lirico');
INSERT INTO GeneroLiterario VALUES( 'Dramatico');
INSERT INTO GeneroLiterario VALUES( 'Didactico');

SELECT * from GeneroLiterario order by IdGenero asc;


-----SubGeneros---
INSERT INTO Subgenero_Literario VALUES( 'Epicas');
INSERT INTO Subgenero_Literario VALUES( 'Epopeyas');
INSERT INTO Subgenero_Literario VALUES( 'Cantares');
INSERT INTO Subgenero_Literario VALUES( 'Poesia');
INSERT INTO Subgenero_Literario VALUES( 'Cuento');
INSERT INTO Subgenero_Literario VALUES( 'Novela');
INSERT INTO Subgenero_Literario VALUES( 'Fabula');
INSERT INTO Subgenero_Literario VALUES( 'Ensayo');
INSERT INTO Subgenero_Literario VALUES( 'Didactico');
INSERT INTO Subgenero_Literario VALUES( 'Policial');
INSERT INTO Subgenero_Literario VALUES( 'Terror');
INSERT INTO Subgenero_Literario VALUES( 'Ciencia Ficcion');
INSERT INTO Subgenero_Literario VALUES( 'Cronica');
INSERT INTO Subgenero_Literario VALUES( 'Tratado');
INSERT INTO Subgenero_Literario VALUES( 'Articulo');
INSERT INTO Subgenero_Literario VALUES( 'Filosofia');

SELECT * from Subgenero_Literario order by IdSubgenero asc;

-----Escritores---

INSERT INTO Escritor VALUES(  'EAP674','Edgar ','Allan Poe', 'EE-UU');
INSERT INTO Escritor VALUES(  'AR7ur','Arthur ','Conan Doyle', 'Reino Unido');
INSERT INTO Escritor VALUES(  'CriAgh','Agatha ','Christie', 'Inglaterra');
INSERT INTO Escritor VALUES(  'FD6Y7','Fiodor ','Dostoyevski', 'Rusia');
INSERT INTO Escritor VALUES(  'Alb3RtC','Albert ','Camus', 'Francia');
INSERT INTO Escritor VALUES(  'GGM345','Gabriel ','Garcia Marquez', 'Colombia');
INSERT INTO Escritor VALUES(  'Jor63Lb','Jorge Luis','Borjes', 'Argentina');
INSERT INTO Escritor VALUES(  'EH743','Ernest ','Hemingway', 'EE-UU');
INSERT INTO Escritor VALUES(  'FK6T54','Franz ','Kafka', 'Austria');
INSERT INTO Escritor VALUES(  'OW87SY','Oscar ','Wilde', 'Irlanda');
INSERT INTO Escritor VALUES(  'MDC4543','Miguel ','De Cervantes Saavedra', 'Espa�a');
INSERT INTO Escritor VALUES(  'JV20000','Julio ','Verne', 'Francia');
INSERT INTO Escritor VALUES(  'JC55tar','Julio ','Cort�zar', 'Argentina');
INSERT INTO Escritor VALUES(  'GO7764s','George ','Orwell', 'Britanico');
INSERT INTO Escritor VALUES(  'LTyay6','Leon ','Tolstoi', 'Rusia');
INSERT INTO Escritor VALUES(  'FGL768y','Federico ','Garcia Lorca', 'Espa�a');
INSERT INTO Escritor VALUES(  'NP6yaer','Pablo ','Neruda', 'Chile');
INSERT INTO Escritor VALUES(  'HV6553t','Victor ','Hugo', 'Francia');
INSERT INTO Escritor VALUES(  'TC5ta47','Truman ','Capote', 'EE-UU');
INSERT INTO Escritor VALUES(  'AI55AAC','Isaac ','Asimov', 'Rusia-EE-UU');
INSERT INTO Escritor VALUES(  'HCB765b','Henry ','Charles Bukowski', 'Aleman-EE-UU');

SELECT * from Escritor order by IdEscritor asc;

-----Datos escritor---
INSERT INTO DatosEscritor VALUES(  'EAP674','19/01/1809 ','Boston','07/10/1849','Baltimore', 'Fue un escritor, poeta, cr�tico y periodista rom�ntico estadounidense, generalmente reconocido Maestro universal del relato corto, del cual fue uno de los primeros practicantes en su pa�s. Fue renovador de la novela g�tica, recordado especialmente por sus cuentos de terror. Considerado el inventor del relato detectivesco, contribuy� asimismo con varias obras al g�nero emergente de la ciencia ficci�n.');
INSERT INTO DatosEscritor VALUES(  'AR7ur','22/05/1859','Edimburgo','07/07/1930','Crowborough', 'Fue un escritor y m�dico brit�nico, creador del c�lebre detective de ficci�n Sherlock Holmes. Fue un autor prol�fico cuya obra incluye relatos de ciencia ficci�n, novela hist�rica, teatro y poes�a.');
INSERT INTO DatosEscritor VALUES(  'CriAgh','15/09/1890 ','Tourquey','12/01/1976','Wallingford', 'Fue una escritora y dramaturga brit�nica especializada en el g�nero policial, por cuyo trabajo tuvo reconocimiento a nivel internacional.? A lo largo de su carrera, public� 66 novelas policiales, 6 novelas rosas y 14 historias cortas bajo el pseud�nimo de Mary Westmacott.');
INSERT INTO DatosEscritor VALUES(  'FD6Y7','11/11/1821','Mosc�','09/02/1881','San Petersburgo', 'Fue uno de los principales escritores de la Rusia zarista, cuya literatura explora la psicolog�a humana en el complejo contexto pol�tico, social y espiritual de la sociedad rusa del siglo xix. Es considerado uno de los m�s grandes escritores de Occidente y de la literatura universal.');
INSERT INTO DatosEscritor VALUES(  'Alb3RtC','07/11/1913','Mondovi','04/01/1960','Villeblevin', 'Fue un novelista, ensayista, dramaturgo, fil�sofo y periodista franc�s nacido en Argelia francesa. Su pensamiento se desarrolla bajo el influjo de los razonamientos filos�ficos de Schopenhauer, Nietzsche y el existencialismo alem�n. Se le ha atribuido la conformaci�n del pensamiento filos�fico conocido como absurdismo');
INSERT INTO DatosEscritor VALUES(  'GGM345','06/03/1927','Magdalena','17/04/2014','CDMX', 'Fue un escritor y periodista colombiano. Reconocido principalmente por sus novelas y cuentos, tambi�n escribi� narrativa de no ficci�n, discursos, reportajes, cr�ticas cinematogr�ficas y memorias. Fue conocido como Gabo, y familiarmente y por sus amigos como Gabito.');
INSERT INTO DatosEscritor VALUES(  'Jor63Lb','24/08/1899 ','Buenos Aires','14/06/1986','Ginebra', 'Fue un destacado escritor de cuentos, poemas y ensayos argentino, extensamente considerado una figura clave tanto para la literatura en habla hispana como para la literatura universal. Tambi�n fue bibliotecario, profesor, conferencista, cr�tico literario y traductor.');
INSERT INTO DatosEscritor VALUES(  'EH743','21/06/1899 ','Illinois','02/06/1961','Idaho', 'fue un escritor y periodista estadounidense, uno de los principales novelistas y cuentistas del siglo XX. Su estilo sobrio tuvo una gran influencia sobre la ficci�n del siglo XX, mientras que su vida de aventuras y su imagen p�blica dej� huellas en las generaciones posteriores.');
INSERT INTO DatosEscritor VALUES(  'FK6T54','03/06/1883','Praga','03/06/1924','Austria', 'Fue un escritor bohemio en lengua alemana. Su obra, una de las m�s influyentes de la literatura universal, es una de las pioneras en la fusi�n de elementos realistas con fant�sticos, y tiene como principales temas los conflictos paternofiliales, la ansiedad, el existencialismo, la brutalidad f�sica y psicol�gica, la culpa, la filosof�a del absurdo, la burocracia y las transformaciones espirituales.');
INSERT INTO DatosEscritor VALUES(  'OW87SY','16/10/1854','Dublin','30/11/1900','Paris', 'Es considerado uno de los dramaturgos m�s destacados del Londres victoriano tard�o; adem�s, fue una celebridad de la �poca debido a su gran y aguzado ingenio. Hoy en d�a, es recordado por sus epigramas, sus cuentos, sus obras de teatro, su �nica novela El retrato de Dorian Gray, y la tragedia de su encarcelamiento, seguida de su muerte prematura.');
INSERT INTO DatosEscritor VALUES(  'MDC4543','29/09/1547','Alcal�','22/03/1616','Madrid', 'Es ampliamente considerado una de las m�ximas figuras de la literatura espa�ola. Fue el autor de El ingenioso hidalgo don Quijote de la Mancha, novela conocida habitualmente como El Quijote, que lo llev� a ser mundialmente conocido y a la cual muchos cr�ticos han descrito como la primera novela moderna, as� como una de las mejores obras de la literatura universal.');
INSERT INTO DatosEscritor VALUES(  'JV20000','08/02/1828','Nantes','24/03/1905','Amiens', 'Fue un escritor, poeta y dramaturgo franc�s c�lebre por sus novelas de aventuras y por su profunda influencia en el g�nero literario de la ciencia ficci�n.');
INSERT INTO DatosEscritor VALUES(  'JC55tar','26/08/1914','Ixelles','12/02/1984','Paris', 'Fue un escritor y traductor argentino; este �ltimo oficio lo desempe�� para la Unesco y varias editoriales.? Sin renunciar a su nacionalidad argentina, opt� por la francesa en 1981, en protesta contra la dictadura militar en su pa�s.');
INSERT INTO DatosEscritor VALUES(  'GO7764s','25/06/1903','Motihari,','21/01/1950','Londres', 'Fue un novelista, periodista, ensayista y cr�tico brit�nico nacido en la India, cuyo nombre era Eric Arthur Blair, fue conocido mundialmente por su novelas dist�picas Rebeli�n en la granja (1945) y 1984 (1950).');
INSERT INTO DatosEscritor VALUES(  'LTyay6','28/08/1828 ','Tula','20/11/1910','L�petsk',' Fue un novelista ruso, considerado uno de los escritores m�s importantes de la literatura mundial. Sus dos obras m�s famosas, Guerra y paz y Ana Kar�nina, est�n consideradas como la c�spide del realismo ruso, junto a obras de Fi�dor Dostoyevski. Recibi� m�ltiples nominaciones para el Premio Nobel de Literatura todos los a�os de 1902 a 1906.');
INSERT INTO DatosEscritor VALUES(  'FGL768y','05/06/1898 ','Granada','18/08/1936','Granada','Fue un poeta, dramaturgo y prosista espa�ol. Adscrito a la generaci�n del 27, fue el poeta de mayor influencia y popularidad de la literatura espa�ola del siglo xx y como dramaturgo se lo considera una de las cimas del teatro espa�ol del siglo xx. Fue asesinado por el bando sublevado un mes despu�s del golpe de Estado que provoc� el inicio de la guerra civil espa�ola.');
INSERT INTO DatosEscritor VALUES(  'NP6yaer','12/07/1904 ','Parral','23/09/1973','Santiago', 'Cuyo nombre fue Ricardo Eli�cer Neftal� Reyes Basoalto. Es considerado entre los m�s destacados e influyentes artistas de su siglo; adem�s de haber sido senador de la rep�blica chilena, miembro del Comit� Central del Partido Comunista (PC), precandidato a la presidencia de su pa�s y embajador en Francia. Entre sus m�ltiples reconocimientos, destacan el Premio Nobel de Literatura en 1971 y un doctorado honoris causa por la Universidad de Oxford.');
INSERT INTO DatosEscritor VALUES(  'HV6553t','26/02/1802 ','Besanz�n','22/05/1885','Paris', 'Fue un poeta, dramaturgo y novelista rom�ntico franc�s, considerado como uno de los m�s importantes en lengua francesa. Tambi�n fue un pol�tico e intelectual comprometido e influyente en la historia de su pa�s y de la literatura del siglo XIX. Era hermano de los tambi�n escritores Eug�ne Hugo y Abel Hugo.');
INSERT INTO DatosEscritor VALUES(  'TC5ta47','30/09/1924','Nueva Orleans','25/08/1984','Los Angeles', 'fue un literato y periodista estadounidense, autor de la novela Breakfast at Tiffany�s (Desayuno en Tiffany�s) (1958) y su novela-documento In Cold Blood (A sangre fr�a) (1966).');
INSERT INTO DatosEscritor VALUES(  'AI55AAC','20/12/1919 ','Rusia','02/01/1920','New York City', 'Fue un escritor y profesor de bioqu�mica en la facultad de medicina de la universidad de Boston de origen ruso, nacionalizado estadounidense, conocido por ser un prol�fico autor de obras de ciencia ficci�n, historia y divulgaci�n cient�fica. Su obra m�s famosa es la Saga de la Fundaci�n, tambi�n conocida como Trilog�a o Ciclo de Tr�ntor, que forma parte de la serie del Imperio Gal�ctico y que m�s tarde combin� con su otra gran serie sobre los robots.');
INSERT INTO DatosEscritor VALUES(  'HCB765b','16/08/1920 ','Andernach','09/03/1944','Los Angeles','Fue un representante del realismo sucio y es considerado como un �poeta maldito�, debido a su excesivo alcoholismo, pobreza y bohemia. La obra literaria de Bukowski est� fuertemente influida por la atm�sfera de la ciudad de Los �ngeles, donde pas� la mayor parte de su vida. Hoy en d�a es considerado uno de los escritores m�s influyentes de la literatura estadounidense y uno de los s�mbolos del �realismo sucio� y de la literatura independiente.');

SELECT * from DatosEscritor order by IdDatosEscritor asc;

drop table Libro;
----Libros----
INSERT INTO Libro VALUES( 'Nev4mre', '867tSant','El Cuervo','EAP674', '29/01/1945','Literatura','Narrativo', 'Terror','El texto narra la misteriosa visita de un cuervo parlante a la casa de un amante afligido, y del lento descenso hacia la locura de este �ltimo. El amante, que a menudo se ha identificado como un estudiante, llora la p�rdida de su amada, Leonora. El cuervo negro, posado sobre un busto de Palas Atenea, parece azuzar su sufrimiento con la constante repetici�n de las palabras �Nunca m�s� (Nevermore). En el poema, Poe hace alusi�n al folclore y a varias obras cl�sicas.', 50.00,14, 'Disponible');
INSERT INTO Libro VALUES( 'EAPh65S', '867tSant','The Stories of Edgar Allan Poe (Stories)','EAP674', '1973','Literatura','Narrativo', 'Terror','Un recopilatorio de los escritos mas famosos del considerado Pilar del terror, serie de cuentos entre los que destacan "El gato negro", "Elm corazon delator" y muchos otros cuentos de renombre.', 60.00, 25,'Disponible');
INSERT INTO Libro VALUES( 'Sh3rLock', '75t4Pens','Las aventuras de Sherlock Holmes','AR7ur', '14/10/1892','Literatura','Narrativo', 'Policial','Es una colecci�n de doce cuentos escritos por Arthur Conan Doyle, en los que el personaje principal es el detective de ficci�n Sherlock Holmes. En general las historias se solidarizan con las injusticias sociales y tratan de corregirlas. A Holmes se le presenta como alguien que ofrece un nuevo sentido de justicia.', 60.00,30, 'Disponible');
INSERT INTO Libro VALUES( 'AvEnEs4', '75t4Pens','Estudio en escarlata','AR7ur', '1887','Literatura','Narrativo', 'Policial','La historia comienza en 1878, cuando el Dr. John Watson se encuentra con un viejo amigo, Stamford. Watson se vio obligado a retirarse por una herida de guerra y, al recuperarse, fue v�ctima del tifus. Ahora est� buscando un lugar para vivir, porque no puede seguir con su estilo de vida actual. Stamford revela que un conocido suyo, Sherlock Holmes, est� buscando a alguien para compartir el alquiler en un piso en la calle Baker, en el 221 B. As� terminan conoci�ndose Sherlock y el doctor Watson.', 80.00,10, 'Disponible');
INSERT INTO Libro VALUES( '4SignACd', '75t4Pens','El signo de los cuatro','AR7ur', '1890','Literatura','Narrativo', 'Policial','En Inglaterra, a fines del siglo XIX, Tras la misteriosa desaparici�n de su padre, Mary empieza a recibir valiosas perlas de un remitente desconocido. Despu�s de un prolongado silencio, el generoso personaje da se�ales de vida y quiere que Mary se re�na con �l. La joven pide ayuda a Sherlock Holmes para que la acompa�e.', 80.00,6, 'Disponible');

INSERT INTO Libro VALUES( 'El5abv3', '75t4Pens','El sabueso de los Baskerville','AR7ur', '1887','Literatura','Narrativo', 'Policial','La historia transcurre en 1889 cuando Sir Charles Baskerville es encontrado muerto en un sendero en el p�ramo de Devonshire, el doctor Mortimer acude a Londres para buscar la ayuda de Sherlock Holmes: lee a Holmes el manuscrito acerca de la maldici�n de los Baskerville, supuestamente iniciada con Hugo de Baskerville, matado por un sabueso infernal como castigo por su maldad.', 80.00,8, 'Disponible');
INSERT INTO Libro VALUES( 'VDTVoF', '75t4Pens','El valle del terror','AR7ur', '1915','Literatura','Narrativo', 'Policial','Es clara la influencia de esta obra en una posterior del escrito norteamericano Dashiell Hammet, titulada "Cosecha roja". Muchos consideran que "El valle del terror" anticipa a la novela negra como g�nero.', 80.00, 6,'Disponible');
INSERT INTO Libro VALUES( 'MOTOE53', 'Nue674','Asesinato en el Orient Express','CriAgh', '1934','Literatura','Narrativo', 'Policial','El detective privado H�rcules Poirot recibe un telegrama en el que se le pide que cancele sus compromisos y regrese a Inglaterra lo antes posible, por lo que decide viajar en el Orient Express que parte esa noche. Durante el viaje, Poirot conoce a un norteamericano llamado Ratchett, al que vio en el Tokatlian. Ratchett cree que su vida est� en peligro y quiere contratar a Poirot, pero este se niega .', 70.00, 9,'Disponible');
INSERT INTO Libro VALUES( 'AeecG76', 'Nue674','Asesinato en el campo de golf ','CriAgh', '1923','Literatura','Narrativo', 'Policial','Poirot recibe una carta de Francia con una petici�n de ayuda: el Sr. Renauld teme que su vida corra peligro, sin dejar claros los detalles de la situaci�n, y pide a Poirot que lo visite para investigar los acontecimientos. Poirot invita a su amigo Hastings y ambos parten inmediatamente para Merlinville-sur-Mer, en el litoral franc�s.', 45.00,4, 'Disponible');
INSERT INTO Libro VALUES( 'C&CFD5', 'r4MA4rt','Crimen y castigo','FD6Y7', '1866','Literatura','Narrativo', 'Novela','La historia narra la vida de Rodi�n Rask�lnikov, un estudiante en la capital de la Rusia Imperial, San Petersburgo. Este joven se ve obligado a suspender sus estudios por la miseria en la cual se ve envuelto, a pesar de los esfuerzos realizados por su madre Pulqueria y su hermana Dunia para enviarle dinero. Necesitado de financiaci�n para pagar sus gastos, hab�a recurrido a una anciana prestamista vil y ego�sta, en cuya casa empe�a algunos objetos de valor.', 90.00, 8,'Disponible');
INSERT INTO Libro VALUES( 'HKFd879', 'r4MA4rt','Los Hermanos Karamazov','FD6Y7', '1879','Literatura','Narrativo', 'Novela','Los hermanos Karam�zov es una novela filos�fica y psicol�gica ambientada en la Rusia del siglo XIX, que entra profundamente en los debates �ticos de Dios, el libre albedr�o y la moralidad. Es un drama espiritual de luchas morales relacionadas con la fe, la duda, el juicio y la raz�n, contra una Rusia en proceso de modernizaci�n, con una trama que gira en torno al tema del parricidio.', 90.00, 6,'Disponible');
INSERT INTO Libro VALUES( 'L�trngr', '867tSant','El extranjero','Alb3RtC', '1942','Literatura','Narrativo', 'Filosofia','El protagonista, el se�or Meursault, jam�s se manifestar� contra su ajusticiamiento ni mostrar� sentimiento alguno de injusticia, arrepentimiento o l�stima. La pasividad y el escepticismo frente a todo y todos recorre el comportamiento del protagonista: un sentido ap�tico de la existencia y aun de la propia muerte.', 85.00,5, 'Disponible');

INSERT INTO Libro VALUES( 'Lp3st7', 'Lis6753s','La peste','Alb3RtC', '1947','Literatura','Narrativo', 'Filosofia','El narrador se presenta como un testigo de lo ocurrido durante la epidemia de peste que azot� a la ciudad de Or�n, siguiendo los pasos de cada uno de los personajes que de una u otra forma estuvieron involucrados en lo que signific� la enfermedad para el pueblo. El Doctor Rieux, m�dico de la ciudad, se sorprende tras la muerte de uno de sus pacientes, consultando a su colega el Dr. Castel. El cuadro cl�nico adem�s de la aparici�n paralela de centenares de ratas muertas en las calles de la ciudad alertan a los m�dicos ante la sospecha de un posible brote de peste bub�nica.', 67.00,3, 'Disponible');
INSERT INTO Libro VALUES( 'CADSGMM', '75t4Pens','Cien a�os de soledad','GGM345', '1982','Literatura','Narrativo', 'Novela','El libro narra la historia de la familia Buend�a a lo largo de siete generaciones en el pueblo ficticio de Macondo. Jos� Arcadio Buend�a y �rsula Iguar�n son un matrimonio de primos que se casaron llenos de presagios y temores por su parentesco y el mito existente en la regi�n de que su descendencia pod�a tener cola de cerdo', 30.00,4, 'Disponible');
INSERT INTO Libro VALUES( 'Fiicc44', '75t4Pens','Ficciones','Jor63Lb', '1944','Literatura','Narrativo', 'Cuento','Ficciones es un libro de cuentos escrito por Jorge Luis Borges, publicado en 1944 y compuesto de dos partes: El jard�n de senderos que se bifurcan y Artificios; posee dos pr�logos.', 70.00,2, 'Disponible');
INSERT INTO Libro VALUES( 'EHd9dm6', '867tSant','Don Qujote de la Mancha','MDC4543', '1605','Literatura','Narrativo', 'Novela','Es la primera obra genuinamente desmitificadora de la tradici�n caballeresca y cort�s por su tratamiento burlesco. Representa la primera novela moderna y la primera novela polif�nica; como tal, ejerci� un enorme influjo en toda la narrativa europea. Por considerarse �el mejor trabajo literario jam�s escrito�', 120.00,12, 'Disponible');
INSERT INTO Libro VALUES( 'Y0r0007', 'Lis6753s','Yo, robot','AI55AAC', '1950','Literatura','Narrativo', 'Ciencia Ficcion','Yo, robot es una colecci�n de relatos basados en las tres leyes de la rob�tica que son un compendio fijo e imprescindible de moral aplicable a supuestos robots inteligentes, con las que supuestamente nunca deber�a haber un conflicto si se cumplieran fielmente. Los relatos, no obstante, plantean diferentes situaciones en las que dichas "tres leyes" se cumplen, y aun as� plantean problemas, paradojas e ingeniosos ejercicios intelectuales a los que tendr�n que enfrentarse distintos especialistas en rob�tica.', 56.00,8, 'Disponible');

INSERT INTO Libro VALUES( 'FKM7am0', 'Nue674','La metamorfosis','FK6T54', '1915','Literatura','Narrativo', 'Novela','Una ma�ana, despu�s de un sue�o intranquilo, Gregorio Samsa trata de levantarse para asistir a su trabajo, pero se da cuenta de que durante la noche se ha transformado en un insecto; al darse cuenta de lo tarde que es, intenta comenzar sus actividades diarias habituales, pero al estar acostado sobre su espalda, no logra levantarse de la cama.', 80.00,24, 'Disponible');
INSERT INTO Libro VALUES( 'In73nc', 'Lis6753s',' Intenciones','OW87SY', '1891','Literatura','Dramatico', 'Ensayo','�Intenciones� es una colecci�n de ensayos en los que Oscar Wilde vierte toda su maestr�a a la hora de relatar sus ideas fundamentales sobre cr�tica y est�tica. Toda una declaraci�n de intenciones, que como es habitual en Wilde, no deja indiferente al lector.', 50.00,3, 'Disponible');
INSERT INTO Libro VALUES( '20pDucd', 'r4MA4rt','Veinte poemas de amor y una canci�n desesperada','NP6yaer', '1924','Literatura','Lirico', 'Poesia','La obra est� compuesta por veinte poemas de tem�tica amorosa, m�s un poema final titulado �La canci�n desesperada�. A excepci�n de este �ltimo, los poemas no tienen t�tulo.', 60.00, 1,'Disponible');
INSERT INTO Libro VALUES( 'Cr73r', '75t4Pens','Cartero','HCB765b', '1971','Literatura','Narrativo', 'Novela','Es la primera novela escrita por Bukowski en la que aparece su alter ego Henry Chinaski. La novela cubre su vida desde cerca de 1952 hasta su renuncia al Servicio Postal de los Estados Unidos tres a�os m�s tarde, y desde su regreso en 1958 hasta su renuncia final en 1969. Durante este tiempo, Chinaski/Bukowski trabaj� como cartero. Despu�s de renunciar, se manten�a apostando en carreras de caballos, pero finalmente vuelve al servicio postal para trabajar de distribuidor.', 69.99,3, 'Disponible');
INSERT INTO Libro VALUES( 'Mvj37r', 'Nue674','Mujeres','HCB765b', '1979','Literatura','Narrativo', 'Novela',' Narra las andanzas del protagonista Henry Chinaski(el alter ego del propio escritor), y su proceso de autoconocimiento que lo conducen al verdadero amor despu�s de-en palabras del cr�tico Fulvio Stinchelli, una verdadera marat�n de abuso sexual hacia incontables mujeres, la gran mayor�a j�venes; todo acompa�ado de un irreductible alcoholismo pr�digo en borracheras que ponen al protagonista en situaci�n desmedrada frente a sus amantes.', 67.00, 4,'Disponible');
INSERT INTO Libro VALUES( '20ldvs', '867tSant','20,000 leguas de viaje submarino','JV20000', '1870','Literatura','Narrativo', 'Ciencia Ficcion','Veinte mil leguas de viaje submarino es una obra narrada en primera persona por el profesor franc�s Pierre Aronnax, notable bi�logo que es hecho prisionero por el Capit�n Nemo y es conducido por los oc�anos a bordo del submarino Nautilus, en compa��a de su criado Conseil y el arponero canadiense Ned Land.', 88.00,2, 'Disponible');
INSERT INTO Libro VALUES( 'RgFgL43', 'Nue674','Romancero Gitano','FGL768y', '1928','Literatura','Lirico', 'Poesia','La obra refleja las penas de un pueblo que vive al margen de la sociedad y que se siente perseguido por los representantes de la autoridad, y por su lucha contra esa autoridad. Sin embargo, el propio Garc�a Lorca se�ala que su inter�s se centra no en describir una situaci�n concreta, sino en el choque que se da una y otra vez entre fuerzas encontradas: en un poema que describe la pugna entre la Guardia Civil y los gitanos, llamando a estos bandos respectivamente "romanos" y "cartagineses", para dar a entender esa permanencia del conflicto.', 90.00, 3,'Disponible');
INSERT INTO Libro VALUES( '4sanFr1', 'Nue674','A sangre fria','TC5ta47', '1966','Literatura','Narrativo', 'Novela',' A sangre fr�a explica c�mo una familia de un pueblo rural de Estados Unidos es asesinada sin ning�n sentido y c�mo los asesinos son capturados y sentenciados a pena de muerte.', 30.00,8, 'Disponible');

SELECT * from Libro order by Id_Libros asc;

----Estado Libros----
INSERT INTO EstadoLibros VALUES(  'Nev4mre','Excelente ','Recien Adquirido');
INSERT INTO EstadoLibros VALUES(  'CADSGMM','Bueno ','Peque�os detalles');
INSERT INTO EstadoLibros VALUES(  'Mvj37r','Excelente ','Recien Adquirido');
INSERT INTO EstadoLibros VALUES(  '20pDucd','Excelente ','Recien Adquirido');
INSERT INTO EstadoLibros VALUES(  'El5abv3','Regular ','Hojas Maltratadas');
INSERT INTO EstadoLibros VALUES(  'In73nc','Excelente ','Recien Adquirido');
INSERT INTO EstadoLibros VALUES(  'RgFgL43','Excelente ','Recien Adquirido');
INSERT INTO EstadoLibros VALUES(  '4sanFr1','Excelente ','Recien Adquirido');
INSERT INTO EstadoLibros VALUES(  'Y0r0007','Da�ado ','Faltan Hojas');
INSERT INTO EstadoLibros VALUES(  'FKM7am0','Excelente ','Recien Adquirido');

SELECT * from EstadoLibros order by IdEstado asc;

----Formas de Pago Disponibles---
INSERT INTO FormaDePago VALUES( 'En efectivo');
INSERT INTO FormaDePago VALUES( 'Tarjeta Debito');
INSERT INTO FormaDePago VALUES( 'Tarjeta Credito');
INSERT INTO FormaDePago VALUES( 'Cheque');
INSERT INTO FormaDePago VALUES( 'Transferencia');
INSERT INTO FormaDePago VALUES( 'Bitcoin');
INSERT INTO FormaDePago VALUES( 'Tigo Money');

select * from FormaDePago;

----Lector----
INSERT INTO Lector VALUES(  'EAVL0843','Eduardo Antonio ','Vasquez Lopez',18,'San Ignacio', '7547-2472');
SELECT * from Lector;

----Cliente---
INSERT INTO Cliente VALUES(  'Vkaiido6','Kaiido ','Vasquez',18,'La Palma', '6178-2680');
INSERT INTO Cliente VALUES(  'VEduar21','Edgardo ','Mejia',13,'San Ignacio', '6453-2680');
INSERT INTO Cliente VALUES(  'K3V11N54','Kevin ','Alvarenga',18,'La Palma', '6178-6754');

SELECT * from Cliente;

----Venta----
select Codigo_Libro, Titulo, Cantidad, Precio from libro;

INSERT INTO Venta VALUES(  'Nev4mre','Vkaiido6 ','24/11/2021', 1,2,50.00);
INSERT INTO Venta VALUES(  '4SignACd','Vkaiido6 ','24/11/2021', 1,1,80.00);
INSERT INTO Venta VALUES(  '4sanFr1 ','Vkaiido6 ','24/11/2021', 1,1,30.00);
INSERT INTO Venta VALUES(  '20ldvs','Vkaiido6 ','24/11/2021', 1,1,88.00);
INSERT INTO Venta VALUES(  'Nev4mre','K3V11N54 ','24/11/2021', 1,1,50.00);

SELECT * from Venta;

----Total venta---
select sum(Precio_Unitario) as Total
from Venta
where CodigoCliente='Vkaiido6';

-----Actualizar Cantidad---
select (Titulo), (Cantidad) from Libro
where Codigo_Libro='Nev4mre';

update Libro
set Cantidad= 10
where Codigo_Libro = 'Nev4mre';

-----Prestamo---
INSERT INTO Prestamo VALUES(  'EAVL0843','Nev4mre ','24/11/2021','30/11/2021', 'NO');
INSERT INTO Prestamo VALUES(  'EAVL0843','RgFgL43 ','24/11/2021','30/11/2021', 'NO');
INSERT INTO Prestamo VALUES(  'EAVL0843','FKM7am0 ','24/11/2021','30/11/2021', 'NO');

SELECT * from Prestamo;

------Devolucion de libro----
update Prestamo
set Devuelto= 'SI'
where Codigo_Libro = 'Nev4mre';

select * from Prestamo;

-----Actualizar Cantidad---

select (Titulo), (Cantidad) from Libro
where Codigo_Libro='FKM7am0';

update Libro
set Cantidad= 23
where Codigo_Libro = 'FKM7am0';

select * from Libro where Codigo_Libro='FKM7am0';

----Actualizar Disponibilidad----

update Libro
set Disponibilidad= 'Disponible'
where Codigo_Libro = 'FKM7am0';