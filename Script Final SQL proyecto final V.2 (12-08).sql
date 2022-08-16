/* SCRIPT DB ESCUELAS ARGENTINAS BRIAN FROSSASCO - */

CREATE SCHEMA Escuelas_Argentinas4;

USE Escuelas_Argentinas4;

#PERMISO PARA ELIMINAR DATOS
SET foreign_key_checks=0;

/* TABLA PROVINCIAS */
        
CREATE TABLE IF NOT EXISTS Provincias(
	IdProvin INT NOT NULL auto_increment UNIQUE PRIMARY KEY,
		Nombre VARCHAR (255) NOT NULL,
		Region VARCHAR (255) NOT NULL);
        
        
/* TABLA ESPECIALIDAD */        
        
CREATE TABLE IF NOT EXISTS Especialidad(
	IdEspeciali_ INT NOT NULL auto_increment UNIQUE PRIMARY KEY,
		TipoEspec VARCHAR (255) NOT NULL);

/* TABLA NIVELES EDUCATIVOS */

CREATE TABLE IF NOT EXISTS Niveles_Educativos(
	IdNivel INT NOT NULL auto_increment UNIQUE PRIMARY KEY,
		Nivel VARCHAR (255) NOT NULL);

/* TABLA MODALIDADES EDUCATIVAS */

CREATE TABLE IF NOT EXISTS Modalidades_Educativas(
	IdModalidad INT NOT NULL auto_increment UNIQUE PRIMARY KEY,
		Tipo VARCHAR (255) NOT NULL);
        

/* TABLA TIPO DE CURSADA */

CREATE TABLE IF NOT EXISTS Tipo_de_Cursada(
	IdTipCurs_ INT NOT NULL auto_increment UNIQUE PRIMARY KEY,
		TipoCurs VARCHAR (255) NOT NULL);
        
/* TABLA TURNO */

CREATE TABLE IF NOT EXISTS Turno(
	IdTurno INT NOT NULL auto_increment UNIQUE PRIMARY KEY,
		Turno VARCHAR (255) NOT NULL);
        
/* TABLA ESCUELAS */  
      
CREATE TABLE IF NOT EXISTS Escuelas(
	Cue_Escuela INT NOT NULL UNIQUE PRIMARY KEY,
		NumEscuela VARCHAR (255) NULL,
        Nombre VARCHAR (255) NOT NULL,
        Calle VARCHAR (255) NOT NULL,
        Num_Calle VARCHAR (255) NULL,
        Cod_postal VARCHAR (255) NOT NULL,
        Telefono VARCHAR (255) NULL,
        Email VARCHAR (255) null,
        IdProvin INT NOT NULL,
        IdModalidad INT NOT NULL,
        IdNivel INT NOT NULL,
			FOREIGN KEY (IdProvin) REFERENCES Escuelas_Argentinas4.Provincias(IdProvin),
			FOREIGN KEY (IdModalidad) REFERENCES Escuelas_Argentinas4.Modalidades_Educativas(IdModalidad) ,
			FOREIGN KEY (IdNivel) REFERENCES Escuelas_Argentinas4.Niveles_Educativos(IdNivel)
            ON DELETE cascade ON UPDATE cascade);
            
/* TABLA DOCENTES */

CREATE TABLE IF NOT EXISTS Docentes(
	Id_Cuit VARCHAR(50) NOT NULL PRIMARY KEY UNIQUE,
		Nombre VARCHAR (255) NOT NULL,
		Apellido VARCHAR (255) NOT NULL,
		Edad INT NOT NULL,
		Dni varchar (50) NOT NULL,
		Años_Docenc INT NOT NULL,
		Matricu varchar (50) NOT NULL ,
		IdNivel INT NOT NULL,
		IdEspeciali_ INT NOT NULL,
		Cue_Escuela INT NOT NULL,
			FOREIGN KEY (IdNivel) REFERENCES Escuelas_Argentinas4.Niveles_Educativos (IdNivel) ,
			FOREIGN KEY (IdEspeciali_) REFERENCES Escuelas_Argentinas4.Especialidad (IdEspeciali_) ,
            FOREIGN KEY (Cue_Escuela) REFERENCES Escuelas_Argentinas4.Escuelas (Cue_Escuela)
            ON DELETE cascade ON UPDATE cascade);
            
/* TABLA MATERIAS */
 
CREATE TABLE IF NOT EXISTS Materias(
	IdMateria INT NOT NULL PRIMARY KEY UNIQUE auto_increment,
		Materia VARCHAR (255) NOT NULL,
		Durac_Horas INT NOT NULL,
		IdTipCurs_ INT NOT NULL,
		IdTurno INT NOT NULL,
		Id_Cuit VARCHAR (50) NOT NULL,
		Cue_Escuela INT NOT NULL,
			FOREIGN KEY (IdTipCurs_) REFERENCES Escuelas_Argentinas4.Tipo_de_Cursada (IdTipCurs_) ,
			FOREIGN KEY (IdTurno) REFERENCES Escuelas_Argentinas4.Turno (IdTurno) ,
            FOREIGN KEY (Id_Cuit) REFERENCES Escuelas_Argentinas4.Docentes (Id_Cuit) ,
            FOREIGN KEY (Cue_Escuela) REFERENCES Escuelas_Argentinas4.Escuelas (Cue_Escuela)
            ON DELETE cascade ON UPDATE cascade);
 

/* TABLA LOCALIDAD */

CREATE TABLE IF NOT EXISTS Localidad(
	IdLocalidad INT NOT NULL auto_increment UNIQUE PRIMARY KEY,
		IdProvin INT NOT NULL,	
		Localidad VARCHAR (255) NOT NULL,
        Cue_Escuela INT NOT NULL UNIQUE,
			FOREIGN KEY (IdProvin) REFERENCES Escuelas_Argentinas4.Provincias(IdProvin) ,
			FOREIGN KEY (Cue_Escuela) REFERENCES Escuelas_Argentinas4.Escuelas(Cue_Escuela)
            ON DELETE cascade ON UPDATE cascade);   

/*Query Insert Into Tabla Turno*/    
            
INSERT INTO Turno (`IdTurno`,`Turno`) VALUES (1,'Mañana');
INSERT INTO Turno (`IdTurno`,`Turno`) VALUES (2,'Tarde');
INSERT INTO Turno (`IdTurno`,`Turno`) VALUES (3,'Noche');
INSERT INTO Turno (`IdTurno`,`Turno`) VALUES (4,'Mañana_Tarde_Noche');
INSERT INTO Turno (`IdTurno`,`Turno`) VALUES (5,'Mañana_Tarde');
INSERT INTO Turno (`IdTurno`,`Turno`) VALUES (6,'Mañana_Noche');
INSERT INTO Turno (`IdTurno`,`Turno`) VALUES (7,'Tarde_Noche');				
            
  /*Query Insert Into Tabla tipo_de_cursada*/     

INSERT INTO tipo_de_cursada (`IdTipCurs_`,`TipoCurs`) VALUES (1,'Anual');
INSERT INTO tipo_de_cursada (`IdTipCurs_`,`TipoCurs`) VALUES (2,'Bimestral');
INSERT INTO tipo_de_cursada (`IdTipCurs_`,`TipoCurs`) VALUES (3,'Trimestral');
INSERT INTO tipo_de_cursada (`IdTipCurs_`,`TipoCurs`) VALUES (4,'Cuatrimestral');
INSERT INTO tipo_de_cursada (`IdTipCurs_`,`TipoCurs`) VALUES (5,'Semestral');

/*Query Insert Into Tabla provincias*/ 

INSERT INTO provincias (`IdProvin`,`Nombre`,`Region`) VALUES (1,'Caba','AMBA');
INSERT INTO provincias (`IdProvin`,`Nombre`,`Region`) VALUES (2,'GBA','AMBA');
INSERT INTO provincias (`IdProvin`,`Nombre`,`Region`) VALUES (3,'Interior_Buenos Aires','Pampas');
INSERT INTO provincias (`IdProvin`,`Nombre`,`Region`) VALUES (4,'Catamarca','Noroeste');
INSERT INTO provincias (`IdProvin`,`Nombre`,`Region`) VALUES (5,'Chaco','Litoral');
INSERT INTO provincias (`IdProvin`,`Nombre`,`Region`) VALUES (6,'Chubut','Patagonia');
INSERT INTO provincias (`IdProvin`,`Nombre`,`Region`) VALUES (7,'Córdoba','Sierras');
INSERT INTO provincias (`IdProvin`,`Nombre`,`Region`) VALUES (8,'Corrientes','Litoral');
INSERT INTO provincias (`IdProvin`,`Nombre`,`Region`) VALUES (9,'Entre Ríos','Litoral');
INSERT INTO provincias (`IdProvin`,`Nombre`,`Region`) VALUES (10,'Formosa','Litoral');
INSERT INTO provincias (`IdProvin`,`Nombre`,`Region`) VALUES (11,'Jujuy','Noroeste');
INSERT INTO provincias (`IdProvin`,`Nombre`,`Region`) VALUES (12,'La Pampa','Pampas');
INSERT INTO provincias (`IdProvin`,`Nombre`,`Region`) VALUES (13,'La Rioja','Noroeste');
INSERT INTO provincias (`IdProvin`,`Nombre`,`Region`) VALUES (14,'Mendoza','Cuyo');
INSERT INTO provincias (`IdProvin`,`Nombre`,`Region`) VALUES (15,'Misiones','Litoral');
INSERT INTO provincias (`IdProvin`,`Nombre`,`Region`) VALUES (16,'Neuquén','Patagonia');
INSERT INTO provincias (`IdProvin`,`Nombre`,`Region`) VALUES (17,'Río Negro','Patagonia');
INSERT INTO provincias (`IdProvin`,`Nombre`,`Region`) VALUES (18,'Salta','Noroeste');
INSERT INTO provincias (`IdProvin`,`Nombre`,`Region`) VALUES (19,'San Juan','Cuyo');
INSERT INTO provincias (`IdProvin`,`Nombre`,`Region`) VALUES (20,'San Luis','Cuyo');
INSERT INTO provincias (`IdProvin`,`Nombre`,`Region`) VALUES (21,'Santa Cruz','Patagonia');
INSERT INTO provincias (`IdProvin`,`Nombre`,`Region`) VALUES (22,'Santa Fe','Litoral');
INSERT INTO provincias (`IdProvin`,`Nombre`,`Region`) VALUES (23,'Santiago del Estero','Noroeste');
INSERT INTO provincias (`IdProvin`,`Nombre`,`Region`) VALUES (24,'Tierra del Fuego, Antártida e Islas del Atlántico Sur','Extremo Austral');
INSERT INTO provincias (`IdProvin`,`Nombre`,`Region`) VALUES (25,'Tucumán','Noroeste');

/*Query Insert Into Tabla niveles_educativos*/ 

INSERT INTO niveles_educativos (`IdNivel`,`Nivel`) VALUES (1,'Inicial');
INSERT INTO niveles_educativos (`IdNivel`,`Nivel`) VALUES (2,'Primaria');
INSERT INTO niveles_educativos (`IdNivel`,`Nivel`) VALUES (3,'Secundaria');
INSERT INTO niveles_educativos (`IdNivel`,`Nivel`) VALUES (4,'Superior');
INSERT INTO niveles_educativos (`IdNivel`,`Nivel`) VALUES (5,'Inicial_Primaria');
INSERT INTO niveles_educativos (`IdNivel`,`Nivel`) VALUES (6,'Inicial_Primaria_Secundaria');
INSERT INTO niveles_educativos (`IdNivel`,`Nivel`) VALUES (7,'Inicial_Primaria_Secundaria_Superior');
INSERT INTO niveles_educativos (`IdNivel`,`Nivel`) VALUES (8,'Inicial_Secundaria');
INSERT INTO niveles_educativos (`IdNivel`,`Nivel`) VALUES (9,'Inicial_Superior');
INSERT INTO niveles_educativos (`IdNivel`,`Nivel`) VALUES (10,'Primaria_Secundaria');
INSERT INTO niveles_educativos (`IdNivel`,`Nivel`) VALUES (11,'Primaria_Secundaria_Superior');
INSERT INTO niveles_educativos (`IdNivel`,`Nivel`) VALUES (12,'Primaria_Superior');
INSERT INTO niveles_educativos (`IdNivel`,`Nivel`) VALUES (13,'Secundaria_Superior');
INSERT INTO niveles_educativos (`IdNivel`,`Nivel`) VALUES (14,'Inicial_Secundaria_Superior');
INSERT INTO niveles_educativos (`IdNivel`,`Nivel`) VALUES (15,'Inicial_Primaria_Superior');

/*Query Insert Into Tabla modalidades_educativas*/ 

INSERT INTO modalidades_educativas (`IdModalidad`,`Tipo`) VALUES (1,'tecnico profesional');
INSERT INTO modalidades_educativas (`IdModalidad`,`Tipo`) VALUES (2,'artistica');
INSERT INTO modalidades_educativas (`IdModalidad`,`Tipo`) VALUES (3,'especial');
INSERT INTO modalidades_educativas (`IdModalidad`,`Tipo`) VALUES (4,'permanente de jóvenes y adultos');
INSERT INTO modalidades_educativas (`IdModalidad`,`Tipo`) VALUES (5,'rural');
INSERT INTO modalidades_educativas (`IdModalidad`,`Tipo`) VALUES (6,'intercultural bilingüe');
INSERT INTO modalidades_educativas (`IdModalidad`,`Tipo`) VALUES (7,'privacion de la libertad');
INSERT INTO modalidades_educativas (`IdModalidad`,`Tipo`) VALUES (8,'domiciliaria');
INSERT INTO modalidades_educativas (`IdModalidad`,`Tipo`) VALUES (9,'hospitalaria');
INSERT INTO modalidades_educativas (`IdModalidad`,`Tipo`) VALUES (10,'comun');

/*Query Insert Into Tabla Especialidad*/ 

INSERT INTO especialidad (`IdEspeciali_`,`TipoEspec`) VALUES (1,'inicial');  
INSERT INTO especialidad (`IdEspeciali_`,`TipoEspec`) VALUES (2,'primaria'); 
INSERT INTO especialidad (`IdEspeciali_`,`TipoEspec`) VALUES (3,'secundaria'); 
INSERT INTO especialidad (`IdEspeciali_`,`TipoEspec`) VALUES (4,'inicial-primaria-secundaria'); 
INSERT INTO especialidad (`IdEspeciali_`,`TipoEspec`) VALUES (5,'inicial-primaria'); 
INSERT INTO especialidad (`IdEspeciali_`,`TipoEspec`) VALUES (6,'inicial-secundaria'); 		
INSERT INTO especialidad (`IdEspeciali_`,`TipoEspec`) VALUES (7,'primaria-secundaria'); 	

/*Query Insert Into Tabla Escuelas*/ 

INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (907,'737','Linkbridge','31 Browning Junction','5614','5044','982 619 9518','csoarsd3@yahoo.com',6,8,2);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (2034,'144','Zoozzy','2 Quincy Alley','2215','','695 437 8577','kbernardetgd@example.com',10,7,2);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (3841,'366','Divavu','225 Kenwood Street','4004','65110','573 842 1422','shaithej@miitbeian.gov.cn',16,7,6);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (4380,'423','Zazio','37887 Brickson Park Alley','9928','39970-000','452 765 7950','rstampe14@homestead.com',17,1,7);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (6220,'672','Quinu','93948 Evergreen Plaza','1307','9002','298 719 0588','ticzokvitzlo@google.it',18,2,7);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (6261,'241','Dazzlesphere','35401 Lake View Center','6510','5100','954 149 6223','ehendriks8x@oaic.gov.au',15,7,5);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (7015,'257','Shufflebeat','82 Crownhardt Plaza','5243','','398 604 5189','sfiggins8i@delicious.com',19,4,3);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (9542,'497','Fliptune','88951 School Court','1128','54801','815 146 9673','timmeri4@nhs.uk',8,1,7);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (9954,'545','Agivu','1 Blue Bill Park Pass','607','','110 335 1427','esiderfinn3@canalblog.com',1,1,4);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (10823,'438','Voonix','7059 Lindbergh Court','7047','','692 537 4178','bstentifordgj@wired.com',24,8,6);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (11020,'707','Ozu','981 Sloan Place','1746','391448','484 189 5446','ssparshutt83@meetup.com',14,8,7);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (11745,'141','Twitternation','46 Esker Road','9181','164051','635 100 9148','cscholer6t@barnesandnoble.com',23,1,15);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (13383,'32','Mita','04496 Cherokee Drive','959','','695 260 1683','kmoensfh@geocities.com',23,2,7);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (13590,'439','Kayveo','93 Carioca Lane','8157','453380','518 880 6459','mgrahlmanshb@amazonaws.com',3,8,13);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (15637,'108','Photobean','59 Mayfield Junction','2747','','259 612 8550','wfairbrassgz@netlog.com',5,3,8);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (19332,'55','Yozio','189 Moose Place','4706','','794 643 4980','abiggerstaffik@goo.gl',13,3,11);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (20707,'304','Skimia','70755 Artisan Center','216','752 26','424 643 3290','jkibardgx@de.vu',10,4,2);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (21210,'753','Flipbug','93 Eagan Drive','189','','820 874 8246','llibrerosf9@jigsy.com',9,9,12);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (22319,'874','Twitterlist','951 La Follette Place','3767','','286 661 5901','mleads24@shutterfly.com',24,9,8);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (23108,'340','Twitterlist','8249 Anzinger Avenue','2930','','636 265 0097','chubatsch1j@cpanel.net',22,4,9);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (24717,'816','Innotype','179 Novick Avenue','8167','','155 953 1967','kduffellm9@independent.co.uk',6,1,2);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (25013,'494','Thoughtsphere','0922 School Parkway','5857','3733','701 205 4561','gmcelane4g@loc.gov',20,5,9);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (25964,'869','Kimia','35 Roth Way','1853','','706 264 5751','troscherod@ow.ly',5,7,7);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (27332,'387','Midel','44 Arapahoe Drive','2689','','628 338 6999','dmailel9@pinterest.com',25,8,6);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (27351,'320','Buzzshare','4 Tennessee Trail','2735','14-420','846 166 3847','lmeeus1b@bizjournals.com',7,1,15);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (28202,'830','Roodel','73290 Hallows Trail','522','','912 384 6618','ibulbrook5i@wufoo.com',12,9,6);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (28293,'544','Tambee','08592 Little Fleur Lane','601','3009','656 896 3853','egristf3@ebay.com',19,5,9);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (30409,'407','Rhyloo','105 Corben Park','1925','','258 990 9767','vmoenfr@mapquest.com',2,1,12);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (30428,'409','Muxo','3052 Helena Court','9391','','285 802 2541','tsparwellhm@theguardian.com',3,5,9);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (31391,'124','JumpXS','2 Ronald Regan Terrace','6251','4600-596','292 853 8723','tspeedingcd@cafepress.com',8,6,2);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (32084,'331','Buzzshare','9 Hermina Lane','5952','','453 517 8916','sbracey36@craigslist.org',13,3,2);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (32352,'629','Zoomdog','89899 Fulton Place','6422','185','303 515 1723','ccordye6@dropbox.com',6,4,3);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (33193,'528','Kwideo','25 Banding Alley','8485','412008','418 792 6390','pmcmanus3s@nature.com',3,9,15);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (33775,'819','Cogibox','0265 Continental Lane','1078','35588-000','733 769 1334','kstallionoq@livejournal.com',7,1,15);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (33839,'991','Rhyzio','15 Hoepker Trail','1720','','998 412 4958','jmacdermandek@livejournal.com',23,1,15);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (36267,'590','Flashset','0 Reinke Alley','7823','','154 521 7600','rmacaless3b@auda.org.au',24,9,9);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (36331,'309','Photobug','0274 Loftsgordon Drive','3067','','932 686 1909','eholtow@buzzfeed.com',19,4,15);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (37240,'92','Latz','9 Anzinger Way','2594','142609','526 450 0645','tbreslinv@webs.com',25,1,7);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (38058,'140','Tanoodle','83719 Grayhawk Plaza','7511','','586 828 5104','enieseld9@bing.com',7,9,5);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (40704,'869','Innojam','121 Saint Paul Center','5534','','418 920 1114','melstonehk@nymag.com',2,3,6);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (40805,'741','Demizz','4 Garrison Crossing','3122','169309','267 772 5128','mkurtonbe@vimeo.com',4,5,15);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (40919,'961','Realfire','120 Esch Junction','3955','97240','971 361 9059','ssaurinmq@weibo.com',16,1,5);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (47762,'436','Kwilith','3274 Crest Line Place','456','','899 395 9933','osymerso3@altervista.org',5,2,1);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (51135,'711','Voonix','6 Anderson Drive','6587','369-1872','751 237 2082','cyewen27@foxnews.com',20,4,14);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (51978,'87','Fiveclub','7 Homewood Road','8613','','858 550 8832','jpontain1v@nba.com',19,2,12);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (52905,'473','Kimia','290 Mandrake Court','5340','42-660','887 132 3252','ggarretl6@apache.org',14,3,3);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (52906,'447','Oloo','74 Golf View Place','7259','','636 988 0461','mchampnessbg@usgs.gov',9,2,10);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (53813,'133','Photofeed','7 Arkansas Parkway','5952','','141 760 9555','mfeldmann7o@zimbio.com',22,4,5);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (54185,'530','Jaxspan','0 Menomonie Place','4760','','183 543 1049','kyelding64@examiner.com',18,1,3);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (55113,'958','Twitterbridge','7 Glendale Plaza','6286','','759 250 2517','jpridmorecr@twitter.com',14,5,13);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (55970,'713','InnoZ','92341 Spaight Alley','3413','','332 388 3834','adaintyrj@prweb.com',6,7,2);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (55986,'803','Yodoo','203 Dixon Alley','816','157305','546 455 7155','kbrobeckr5@cpanel.net',2,8,12);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (57176,'536','Skimia','39750 Dixon Pass','1056','18200-000','271 704 7274','rfullagerij@samsung.com',24,5,8);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (58386,'540','Mudo','88054 Twin Pines Lane','1691','','618 309 5036','pvalentinuzzi1t@yandex.ru',8,3,12);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (60976,'779','Chatterpoint','56 Eastwood Point','2642','105 17','961 528 6474','crobothamo7@hubpages.com',15,4,3);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (61719,'520','Fliptune','0669 Declaration Junction','463','75240 CEDEX 05','623 469 5855','knodes2x@is.gd',23,5,13);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (62438,'84','Avamba','861 Springview Crossing','557','','455 911 8301','bgentilrr@sciencedaily.com',12,4,8);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (62675,'556','Skinte','69656 Sachs Parkway','521','70762','220 545 2827','jstangeei@adobe.com',13,3,9);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (62757,'160','Eidel','7434 Ronald Regan Alley','4044','','543 978 8897','brobbieph@discuz.net',7,9,6);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (62913,'568','Vidoo','51510 Morningstar Court','2950','','663 452 9948','ulongfieldn4@tuttocitta.it',7,8,9);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (63418,'21','Realpoint','66689 Boyd Drive','9578','8513','138 925 4912','bberriball9d@networkadvertising.org',6,4,2);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (63542,'873','Feedbug','74 Fair Oaks Circle','7108','792 52','828 664 9421','cchillesra@go.com',8,4,6);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (63726,'949','Realcube','6457 Westerfield Road','1532','','801 958 7710','bwhittlesea87@cornell.edu',9,5,12);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (68157,'766','Skinder','60891 Vernon Point','8920','252608','206 842 7258','harnaldh3@paypal.com',7,1,8);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (68703,'177','Topdrive','688 Loomis Circle','6244','157812','889 431 9846','dwenhamjl@gov.uk',2,3,2);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (69565,'966','Oyoyo','611 Maywood Place','4762','7213','329 397 6438','rdanaharft@biblegateway.com',21,7,15);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (69710,'224','Linkbuzz','2 Mcguire Drive','8929','','258 826 8032','mmackenneyc3@weibo.com',4,3,4);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (69858,'208','Wikivu','0 Londonderry Plaza','4236','6932','589 795 6391','ltrevillion13@theatlantic.com',5,3,2);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (70739,'999','Livetube','471 Debra Center','1346','5805','672 697 6348','greynaldslh@ovh.net',15,6,12);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (76074,'447','Jamia','8726 Kennedy Park','141','68-132','243 828 8375','mtixall37@edublogs.org',9,5,7);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (77053,'132','Quinu','88 Mesta Center','8770','232059','987 931 8148','dcookmanmn@mapy.cz',9,9,11);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (78578,'534','Mita','8 North Crossing','5140','84977 CEDEX','237 663 5807','kcarhartcp@shutterfly.com',24,4,15);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (79374,'669','Kwideo','85052 Elgar Alley','4616','','990 124 9171','nbathoe9i@infoseek.co.jp',24,3,3);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (80106,'458','Voomm','483 Texas Terrace','9588','38-533','628 258 7800','tphilpinop@squarespace.com',3,4,11);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (87051,'422','Kazu','4716 Arrowood Drive','31','','945 948 4864','wlafontaine2e@upenn.edu',8,1,1);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (87628,'383','Kazio','3 Gale Drive','4977','','318 155 6413','elabrone6b@sbwire.com',19,4,14);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (87954,'592','Zoomzone','04 Scofield Alley','9543','9650-245','775 731 4249','mbushenpb@bloglovin.com',23,1,15);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (88426,'727','Flashspan','201 High Crossing Street','3301','','256 789 9440','apercival3u@npr.org',17,2,11);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (94123,'926','Dabshots','4065 Vera Street','475','G7K','839 768 2879','cjerke60@irs.gov',6,2,4);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (98648,'711','Divape','3 Del Mar Crossing','5095','','683 612 0399','sfeltham6a@mac.com',14,5,6);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (98929,'334','Wikido','40080 Sachtjen Crossing','763','','876 637 0222','mbenediktsson7l@livejournal.com',19,6,12);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (101885,'120','Vipe','44 Riverside Parkway','6074','','916 471 5365','pcona7@amazon.de',15,5,2);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (102357,'590','Zoonder','5839 Derek Alley','6458','30703','424 216 0469','lstaddomep@aol.com',18,1,6);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (102624,'100','Zoovu','2429 Spenser Park','8215','L-8396','700 672 3895','obernadzkika@toplist.cz',12,9,4);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (104635,'167','Linklinks','0 Village Green Terrace','1103','8421','390 205 0398','wcosstickat@unesco.org',8,2,5);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (104974,'519','Skinix','6 Monterey Junction','760','','905 336 4847','cidemb@miibeian.gov.cn',10,2,2);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (105349,'440','Demimbu','25621 Vermont Road','8341','','705 264 0456','fdemsey7f@unblog.fr',16,6,7);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (106709,'97','Dazzlesphere','65 Rusk Terrace','6444','80100','292 910 6397','dgeelyj9@nhs.uk',4,5,2);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (109145,'772','Skinte','11 Morning Street','5188','3718','131 363 4425','ecockrillq6@shutterfly.com',6,1,14);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (111617,'406','Feedmix','79371 Farragut Plaza','5115','31416','912 386 1076','cbaudainsci@liveinternet.ru',2,9,1);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (114146,'915','Kazu','3500 Acker Trail','2601','','326 805 8500','kcartmanjm@tinyurl.com',16,5,15);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (114480,'476','Jazzy','62369 Sommers Parkway','9813','','690 804 9197','sbardaydo@t.co',23,2,9);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (115187,'503','Meedoo','06904 Dixon Lane','9961','665770','145 809 3618','cgoomesm5@theguardian.com',15,9,3);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (115191,'181','Muxo','7 Lillian Road','5088','252257','448 984 9298','eprinne2w@gmpg.org',18,4,7);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (115204,'420','Plambee','5994 Maryland Crossing','2382','','121 107 8204','bpeggramq9@nyu.edu',18,9,2);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (115531,'900','Omba','40350 Maywood Drive','5956','10740','780 696 4972','rkochlink5@google.co.uk',16,1,5);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (116186,'439','Chatterbridge','9972 6th Hill','4947','V8C','939 401 6204','vsabertont@networkadvertising.org',8,7,8);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (118308,'877','Quinu','28 2nd Trail','9675','11110','160 616 4885','nsarverj6@census.gov',14,4,5);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (119871,'800','Leexo','3 Nobel Circle','7378','','294 228 2578','gpedersenhf@vimeo.com',15,1,9);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (120194,'40','Yacero','99 Drewry Lane','1707','','663 807 4213','wtwinn8u@fema.gov',6,7,7);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (120615,'701','Skyble','16 Shopko Parkway','1402','155 33','649 320 4718','mmcgavinpr@geocities.jp',2,3,1);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (123424,'640','Avamba','0 Memorial Center','4844','','539 266 2662','adurden4k@prnewswire.com',2,1,5);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (127123,'679','Jabberbean','4 Ruskin Terrace','9415','','321 548 4198','lolrenshaw7g@4shared.com',12,4,9);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (129829,'309','Skivee','60752 Grover Alley','5052','3313','148 244 9050','estainsbyjr@blogtalkradio.com',21,8,5);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (131931,'20','Topicstorm','8 Esker Point','1094','','408 602 6786','dmcnairfy@uol.com.br',7,7,4);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (133622,'154','Mydeo','5452 Namekagon Junction','9614','65911 CEDEX 9','104 789 5074','wkivlehan9c@dot.gov',25,9,10);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (134325,'352','Ozu','9696 Lindbergh Drive','4546','1239','178 369 2791','lvanyashin70@baidu.com',16,6,7);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (134695,'90','Blogtag','5 International Alley','8053','4600','301 302 3145','cdenisevichie@tiny.cc',19,2,13);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (134745,'135','Yodoo','1779 Oakridge Place','5742','','754 718 3170','rlightwingoj@123-reg.co.uk',7,8,7);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (135418,'792','Rhybox','72 Burrows Hill','2644','11005','409 230 1399','abogeysh7@eepurl.com',13,1,15);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (135488,'458','Katz','1 Hauk Pass','2667','','999 760 9538','tsigarscu@senate.gov',11,5,12);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (136176,'24','Thoughtbeat','14 Bashford Trail','4245','','293 625 5749','lspavenf4@dropbox.com',7,9,15);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (136414,'998','Yoveo','6643 Mallory Street','5202','','746 389 3916','saytonpy@weather.com',10,8,13);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (136889,'418','Trunyx','048 Doe Crossing Road','9999','4327','511 401 2135','hloraitew@youtube.com',13,9,1);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (137294,'230','Avamm','069 2nd Center','7565','','249 370 2330','lpellingar5m@loc.gov',7,4,6);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (138473,'568','Skimia','9008 Harper Road','8886','','329 620 2335','tbignalk6@sitemeter.com',13,3,1);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (140770,'598','Photospace','697 Mariners Cove Terrace','7270','','343 254 0925','alambiedn@bbb.org',6,2,13);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (141713,'790','Flashspan','1869 Golden Leaf Point','7144','','224 435 7420','ppylkynytonj8@weebly.com',8,3,10);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (142043,'219','Demimbu','04796 Boyd Alley','534','','603 113 9445','lguidoni3v@japanpost.jp',2,5,9);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (143742,'601','Abata','9 Waywood Point','5472','','573 293 1725','dmcskeaganpj@surveymonkey.com',9,4,12);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (145921,'639','Livetube','53104 Moland Place','9494','93658','709 570 5951','pcumok@mit.edu',11,4,7);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (146619,'352','Kamba','325 Anderson Way','9811','7800-009','588 314 6009','bbumpassbi@bloglovin.com',2,6,13);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (151781,'285','Mymm','834 Elgar Trail','5855','','613 877 7367','hwrathmallid@unc.edu',25,5,12);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (152786,'813','Gabspot','45607 Caliangt Park','775','86700-000','231 266 2376','psandeybb@trellian.com',24,5,11);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (153796,'169','Devify','044 Mockingbird Way','3372','','933 477 0703','smaitlandae@friendfeed.com',18,7,14);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (155628,'344','Meemm','870 Walton Place','5736','','350 596 2196','nthaimpu@tumblr.com',2,4,14);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (156034,'348','Kare','98372 Saint Paul Lane','7666','','448 640 2593','asabatermx@theguardian.com',2,9,3);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (156287,'151','Devshare','79 Twin Pines Terrace','1691','','373 552 7846','rtilforda3@cbslocal.com',5,5,3);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (158006,'63','Jabberbean','03569 Springview Alley','8545','','398 757 7186','rhallattmj@mozilla.org',3,6,14);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (159524,'388','Mydo','153 Longview Place','8485','140732','262 136 4087','fminkinm1@tinyurl.com',13,5,12);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (161672,'182','Avaveo','4 Mendota Point','4038','3714','227 686 3672','mbankes17@cdbaby.com',16,8,2);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (162096,'920','Avamm','46795 Jackson Place','9240','','410 422 8257','dfidelera8@paypal.com',1,9,14);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (162585,'876','Edgepulse','853 Warner Park','7826','','907 170 8940','jglennonfc@google.ru',9,2,3);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (163184,'429','Youtags','7 Autumn Leaf Drive','4198','4890-341','648 855 0676','dfaughnanko@cocolog-nifty.com',24,8,4);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (164516,'563','Brainsphere','963 Kinsman Way','9706','','145 504 7063','sheindledv@google.fr',6,3,12);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (165596,'644','Flashdog','22820 Jenifer Pass','5581','','654 284 8893','gfeavearyearo1@weibo.com',10,3,4);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (167577,'725','Devpoint','30 Judy Park','8285','','587 965 9755','mnawtonb0@washingtonpost.com',10,3,6);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (170512,'91','Livepath','37 Manley Avenue','1926','','985 551 6940','mblackboroughh8@soundcloud.com',2,5,7);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (174317,'655','Kwinu','12 Green Pass','5787','','802 735 1151','amanhoodjg@bloglovin.com',23,1,7);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (174351,'620','Vimbo','4 Northfield Lane','6089','','749 481 8323','cmatitiahogb@slashdot.org',19,3,13);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (175951,'530','Edgewire','6360 Clyde Gallagher Terrace','6886','75185','972 382 4748','hlongbone4n@hud.gov',20,8,7);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (178747,'177','Twinder','1 Dahle Street','9837','','970 329 7303','djaycoxbm@epa.gov',9,1,8);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (181738,'796','Meetz','16181 Mockingbird Junction','2772','','879 991 2511','cpaoletti8k@odnoklassniki.ru',7,7,4);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (182565,'650','Realcube','20732 Pond Parkway','6664','','896 885 6945','hingqd@cdbaby.com',9,2,15);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (185203,'848','Riffpedia','2459 Shasta Terrace','1913','','124 800 5780','cstrettlell@networkadvertising.org',6,1,3);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (186539,'399','Minyx','62666 Scoville Alley','5167','','314 344 6948','ieastopec6@youtube.com',13,9,3);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (187942,'249','Teklist','42858 Lotheville Trail','4619','1330','918 425 4837','zderuggiero3p@merriam-webster.com',3,4,11);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (187989,'59','Janyx','9217 Charing Cross Terrace','7308','8301','639 696 5811','dshaplandqy@va.gov',14,6,11);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (189235,'440','Fanoodle','961 Birchwood Parkway','802','','518 667 4311','nchansonqe@si.edu',8,2,10);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (190269,'33','Gigabox','0 Nobel Street','737','735 43','893 956 5500','dchicchetto28@upenn.edu',5,4,12);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (192719,'54','Myworks','64717 Killdeer Drive','7034','5711','531 204 6017','edowseykj@google.de',19,7,9);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (193148,'711','Vinte','35784 Elka Lane','823','63101','510 266 9627','bbarrass23@51.la',12,6,10);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (194699,'924','Blogtag','56 Butternut Way','1916','21040 CEDEX','903 875 7548','mkerink7@apple.com',25,6,13);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (194759,'435','Tagfeed','7160 Messerschmidt Drive','5162','4990-690','304 454 2187','mtayloob@cnn.com',10,8,7);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (195417,'413','Browsedrive','7 Laurel Street','5678','14140','671 183 1895','mpedersenc4@wikia.com',15,6,4);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (196726,'137','Livetube','77 Manley Avenue','1532','','764 690 3096','ktregentjs@livejournal.com',11,9,7);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (199773,'234','Dynabox','2 Bunting Alley','2481','7500','845 100 8176','jrobbej0@hexun.com',13,2,11);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (200277,'962','Ozu','833 Springs Junction','8330','','192 850 2940','nmullinerj@purevolume.com',11,2,13);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (200360,'497','Shuffledrive','1 Chinook Court','9771','2712','525 927 4188','rreang5@bandcamp.com',8,4,9);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (200412,'150','Centizu','1725 Crownhardt Point','7405','','515 300 7138','skruschovn0@prnewswire.com',15,7,14);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (200838,'926','Livetube','32441 Novick Place','617','','748 314 0494','dderyebarrett4v@cyberchimps.com',3,8,7);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (201928,'438','Dabjam','344 Grim Hill','7989','949-6212','314 147 6035','barmstrong5f@uiuc.edu',6,9,11);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (202138,'617','Shufflester','1 Miller Parkway','4234','960','662 619 6306','fhansonqh@uol.com.br',7,3,10);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (202460,'252','Avamm','17844 Oxford Circle','3699','','270 152 1513','ebassindalep1@1und1.de',13,1,15);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (202735,'109','Aimbo','72194 Ramsey Street','7581','171053','895 814 3972','unovotnen6@cbsnews.com',16,6,8);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (203413,'217','Leexo','126 Mitchell Circle','6380','238603','548 247 4317','bferencowicze2@dion.ne.jp',21,2,8);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (204760,'436','Skynoodle','81 Graceland Hill','6239','','694 785 1391','fnettlesg0@surveymonkey.com',17,5,11);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (205210,'905','Omba','45 2nd Hill','8075','','681 129 5359','wcowing8w@about.me',6,8,9);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (207056,'867','Podcat','51 Melody Lane','8678','178057','629 716 3755','mmassotn8@nationalgeographic.com',3,3,15);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (207128,'868','Edgeify','9 Roxbury Way','8470','','354 775 6205','ccroal5k@quantcast.com',23,8,8);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (209710,'240','Quatz','734 Melby Center','8844','','606 831 8728','eestevez3g@ucla.edu',3,9,14);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (210120,'900','Voomm','48 Spenser Street','1928','83174 CEDEX','491 526 7300','tgooley1q@bluehost.com',10,2,10);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (210617,'313','Rhynyx','22011 Prairieview Hill','4707','','533 665 2176','jshillingtonm@thetimes.co.uk',1,4,3);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (211099,'931','DabZ','1 Onsgard Circle','4194','5413','302 838 7628','chuglandbz@opera.com',15,6,4);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (212589,'752','DabZ','81016 Glacier Hill Plaza','6177','416325','744 498 0474','cremon3y@ameblo.jp',6,5,2);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (215072,'898','Jabberbean','2 Veith Road','2977','','893 190 5568','ctremontana5g@princeton.edu',8,2,7);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (215154,'131','Muxo','72765 Porter Point','372','2530-342','885 444 9893','ccoda6c@pagesperso-orange.fr',7,3,11);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (215168,'901','Fadeo','7842 Sage Place','2865','11803','934 874 9683','cradbournmd@narod.ru',14,6,9);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (220412,'740','Babbleblab','50364 Beilfuss Street','6183','','587 388 8112','dlittler89@wordpress.org',20,2,7);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (220447,'389','Yambee','31 Grasskamp Point','4411','25215 CEDEX','633 784 3779','mcomerforda5@sun.com',5,8,11);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (220945,'465','Digitube','4 Mayfield Place','5032','','628 718 5278','clintsgf@cbslocal.com',6,3,7);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (222080,'749','Midel','321 Mariners Cove Pass','4026','','917 674 0065','fmatzaitishh@wisc.edu',14,6,6);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (223657,'282','Camimbo','3394 Mariners Cove Place','832','','797 717 7159','msherynk9@ucla.edu',12,4,3);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (225342,'266','Trudeo','76493 Mariners Cove Hill','8242','2114','313 563 3844','wchampkinskn@blogspot.com',19,3,4);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (225598,'6','Wikizz','7 Hansons Circle','4789','42-240','661 911 3043','wlongegaom@statcounter.com',9,8,7);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (226032,'619','Wikizz','228 Daystar Plaza','9451','','620 287 1446','lblakslandk4@acquirethisname.com',5,4,2);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (226743,'794','Kayveo','67999 Burrows Crossing','9660','857 42','758 417 4490','vtrancklebc@vimeo.com',8,9,13);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (227910,'117','Rhyloo','88049 Grayhawk Way','8006','','553 359 5970','enottondy@phpbb.com',8,4,4);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (229775,'876','Kwimbee','60240 Amoth Junction','8358','1665','446 423 0976','lhewlings77@army.mil',5,1,12);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (231620,'283','Realpoint','74982 Linden Alley','7385','','325 516 3484','akuhwalda7@hatena.ne.jp',18,6,5);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (231919,'712','Kare','9658 Dakota Way','3803','9510','460 346 6341','hattreedbr@macromedia.com',3,1,10);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (233464,'84','Katz','015 Oxford Circle','2165','2510-325','388 971 5108','whaszardef@time.com',16,5,5);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (234928,'445','Npath','70000 Thompson Junction','3081','880','126 198 4366','gpiercey9u@gizmodo.com',20,5,1);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (236331,'485','Meemm','7663 Hayes Circle','5538','111 95','212 932 5504','trebertjk@constantcontact.com',16,3,2);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (236745,'17','Photobean','8128 Mallard Junction','6733','','911 191 1226','bmatterdacens@tripadvisor.com',9,3,9);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (237088,'898','Zoomlounge','053 Rowland Place','3165','55560-000','538 675 5784','jallmark34@lycos.com',6,7,6);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (237442,'757','Youbridge','9849 Paget Street','9061','','954 599 5950','mreuble9e@nydailynews.com',1,3,12);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (237890,'442','Trilith','7 Northview Street','1585','','819 237 2656','fproudlerdi@java.com',16,6,8);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (238426,'655','Divape','00 Eagan Court','7944','76140','190 812 2896','nspohror@cafepress.com',18,8,12);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (239694,'302','Tazzy','92184 Fallview Park','5423','','660 254 7048','pwillmottdj@imdb.com',24,4,13);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (241192,'303','Edgeclub','6437 Surrey Plaza','1947','','259 627 8514','crainy1k@army.mil',17,2,10);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (241854,'639','Twimm','25 Riverside Parkway','823','456950','798 344 5991','fbecconsall7r@shareasale.com',16,6,9);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (243867,'167','Kamba','5 Stephen Road','5813','','687 884 6138','gwooler11@t.co',12,2,11);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (245904,'251','Chatterpoint','45 4th Parkway','7981','','324 155 7305','bsemeradova1z@timesonline.co.uk',8,2,11);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (247539,'971','Fadeo','5 Crest Line Plaza','4326','59101','392 427 4729','cgladhill4j@google.co.uk',3,3,15);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (248137,'437','Roomm','336 Washington Park','5719','','811 176 9243','sciotto8q@dion.ne.jp',4,4,11);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (249930,'101','Zoonoodle','756 Weeping Birch Court','9110','','151 457 4729','swinsomno@typepad.com',12,9,8);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (251362,'3','Shufflebeat','24473 Manufacturers Parkway','3874','','466 602 1834','bmacallesterr8@google.com.hk',14,1,8);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (253608,'698','Skaboo','7505 Melby Plaza','1124','64080 CEDEX','425 334 3498','rmatschekqf@reddit.com',21,3,15);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (255660,'73','Kayveo','70547 Division Street','2209','18720-000','146 698 4348','sgodlipb5@pen.io',15,6,2);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (257926,'797','Eadel','0 Homewood Street','7765','','348 486 5514','ttroupoy@home.pl',3,2,5);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (259985,'290','Reallinks','85507 Oakridge Center','401','2594','299 545 0906','ckilborn7d@yellowpages.com',16,3,5);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (260869,'443','Muxo','0 Granby Plaza','6841','B12','318 954 4499','ktewkesburynd@yahoo.com',24,1,11);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (261368,'833','Dazzlesphere','42 Fremont Alley','7603','','856 884 7243','pturriim@ameblo.jp',21,9,5);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (261866,'617','Gabcube','9817 Maywood Drive','172','85950-000','309 665 4074','jhyndleym0@instagram.com',16,8,13);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (263254,'255','Tavu','372 Pepper Wood Plaza','6826','7600','911 541 1079','afidell4a@edublogs.org',19,7,11);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (266464,'66','Katz','9 Anhalt Street','192','','496 298 4120','dkingabyfs@cnbc.com',23,6,10);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (269056,'282','Voonix','4 Stoughton Circle','5245','','619 836 5477','mvannahfn@github.io',11,3,11);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (269751,'594','Viva','33 Gerald Lane','8516','','219 733 2687','aallgood10@ameblo.jp',2,1,10);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (273230,'802','Youtags','52 Haas Circle','5727','7455','634 416 3666','bmarnso8@domainmarket.com',17,8,11);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (274876,'764','Rhynyx','1747 Londonderry Street','1633','77014 CEDEX','368 813 2077','rfinlasone4@virginia.edu',10,8,8);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (275750,'813','Yozio','7178 Glacier Hill Circle','7220','60801','347 283 3685','cdowsingq3@bluehost.com',14,5,7);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (277251,'725','Zoomzone','43730 Graedel Plaza','7703','','779 457 4784','ptrodden3o@opera.com',11,8,7);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (277314,'697','Gabtype','4211 Florence Way','1678','','698 118 8077','dkerrey1p@si.edu',19,4,13);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (277540,'271','Shufflebeat','05 Bartelt Lane','8653','','404 322 8973','bmushethy@tripadvisor.com',23,8,2);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (277854,'774','Meevee','86125 Kenwood Point','5952','46-040','688 310 2126','frapagt@yale.edu',1,1,9);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (280296,'43','Wikibox','8758 Blue Bill Park Drive','8266','25390','305 286 5577','akach5w@biglobe.ne.jp',20,6,2);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (281107,'225','Skipfire','6 Becker Terrace','791','3450-205','879 420 6234','medmed5b@un.org',16,3,6);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (281300,'466','Topicshots','5 Gulseth Place','6543','86430-000','251 378 8827','acasarili3f@answers.com',12,6,4);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (281315,'121','Skalith','1 Summerview Way','319','6022','632 949 5218','dilemfp@sfgate.com',8,2,9);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (282009,'856','Quinu','558 Arizona Avenue','5775','','894 947 5256','nlackeyedx@liveinternet.ru',2,6,1);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (282681,'323','Jetwire','7086 Messerschmidt Drive','3657','V8C','406 922 1071','rdeetlofgh@flavors.me',10,4,12);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (284219,'554','Tekfly','0 Shasta Pass','1579','614097','961 657 7693','xhorning2p@auda.org.au',20,8,11);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (284248,'76','Wordify','56141 Lakewood Drive','6286','798 43','454 173 2228','cwaszczykowski63@rakuten.co.jp',8,1,9);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (285841,'772','Dabfeed','22043 Spaight Road','3463','','717 473 1146','dmingok2@google.fr',25,3,4);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (287790,'434','Topdrive','462 Maple Alley','1676','','563 950 5655','ttibbsch@jugem.jp',5,9,4);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (290618,'309','Roomm','51682 Hintze Road','2860','32-865','685 244 5069','hambrosoli6e@thetimes.co.uk',7,6,3);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (290687,'504','Youspan','5956 Victoria Center','1899','','419 422 7516','abaldick3c@merriam-webster.com',14,3,4);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (290946,'91','Flipbug','03 Lyons Pass','9375','','680 545 0647','rdillamorejj@oracle.com',8,5,6);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (291274,'625','Yodel','3119 Ronald Regan Hill','2979','623036','132 532 0953','gavrahamovm8@businesswire.com',7,5,10);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (291577,'239','Babbleset','9047 Dryden Place','4271','','923 170 0647','hthredderey@deliciousdays.com',8,9,14);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (291979,'989','Vidoo','88502 Monterey Lane','8381','','259 953 9789','egoltonnz@sphinn.com',7,3,5);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (292035,'940','Twiyo','567 Atwood Center','1994','','846 445 7402','hjikyllsg9@youtube.com',8,7,13);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (294304,'95','Topdrive','0716 Kings Alley','5278','366311','750 725 4041','vgiannottigu@sakura.ne.jp',24,5,9);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (295054,'859','Skipstorm','93265 Anderson Avenue','2653','','513 643 5067','apickwellaq@mysql.com',12,8,5);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (295156,'170','Divape','6 Lien Way','617','22-300','186 547 3078','kcavanaghr6@feedburner.com',9,4,1);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (295799,'106','Jabbercube','64278 Amoth Drive','1137','','714 659 6726','szealandercl@answers.com',5,2,3);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (297713,'10','Jetwire','56658 Nobel Terrace','6673','671950','788 310 9307','rmergued8@adobe.com',23,3,4);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (298200,'975','Mynte','8 Fieldstone Place','2372','','137 381 6622','gwhybornel5@kickstarter.com',14,3,8);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (300116,'695','Demizz','200 Carberry Way','5098','31512','360 431 8472','mruoff7p@unicef.org',17,7,13);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (300921,'389','Abatz','270 Mayfield Pass','7511','','148 502 5502','ltourryiq@un.org',11,2,14);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (303079,'890','Skivee','105 Utah Park','8539','','648 763 0996','crendellbp@cnn.com',7,4,6);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (305071,'801','Twitternation','29 Loftsgordon Pass','1161','9401','352 187 7737','nfeldbergdl@japanpost.jp',17,1,3);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (305258,'880','Quamba','7334 Elmside Drive','5163','4002','664 604 2854','pmoorcroftbx@ted.com',8,1,7);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (307337,'861','Mybuzz','7252 Comanche Hill','5971','','369 242 0475','sgovenlockgo@cmu.edu',12,3,7);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (307953,'818','Quire','09670 Rowland Park','1384','','605 442 6638','cshahh9@globo.com',22,2,6);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (308984,'514','Fivechat','70361 Myrtle Avenue','6081','','617 263 5310','lsawkinsi5@marriott.com',12,6,13);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (314940,'879','Browseblab','07 Barnett Center','8144','4715-477','151 529 0856','ncopas38@tinypic.com',10,8,1);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (317301,'377','Yoveo','13 Main Point','5048','','196 418 1692','sdunkerklk@dot.gov',22,1,12);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (317639,'732','Latz','61 Randy Crossing','7558','89790-000','156 420 8265','pwilcotar@webnode.com',21,7,10);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (318037,'202','Zazio','579 Talisman Lane','3110','','987 718 3559','sramme1u@istockphoto.com',20,7,10);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (318963,'565','Zoozzy','6929 Arapahoe Point','5448','','939 970 4479','hjobeyab@cafepress.com',6,9,11);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (320987,'3','Divape','16 Buell Pass','9820','','589 931 6458','fbissexgm@geocities.com',13,8,7);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (321105,'139','Chatterpoint','45209 Brown Junction','6593','','793 658 2687','mgengeqs@google.ru',16,1,14);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (321527,'520','JumpXS','75 Sycamore Point','9921','31106','404 667 3025','jsidnellls@163.com',5,9,1);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (323025,'563','Photobug','1256 Farmco Hill','725','6715','176 880 3612','obrinsdenev@shop-pro.jp',11,2,13);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (323882,'695','Flipopia','4689 Bartelt Point','4777','29563 CEDEX 9','621 158 7287','gcadigan7x@phpbb.com',10,3,14);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (324232,'339','Wikivu','61 Blue Bill Park Parkway','8579','','778 382 3468','lsuttonkk@stanford.edu',6,3,2);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (324833,'983','Tambee','9 Maywood Avenue','715','','344 727 4399','adimariaku@dion.ne.jp',20,1,12);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (325951,'614','Skaboo','891 Russell Parkway','1876','','515 869 5403','vgrimwade3r@elegantthemes.com',11,9,10);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (327154,'708','Jamia','025 Melody Alley','5258','85754','520 423 0204','btome9k@forbes.com',5,6,8);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (327161,'943','Voolith','6185 Portage Center','1012','','688 930 4433','mhornung4m@pbs.org',21,2,4);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (327993,'856','Youtags','9656 Continental Drive','247','','531 677 2406','mrunnettrp@cmu.edu',21,6,1);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (328351,'610','Topiczoom','9 Artisan Pass','616','','677 373 2677','vwaren8z@parallels.com',11,8,2);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (328679,'271','Mymm','0 Westridge Trail','8351','141662','126 295 6185','gwormleightonz@baidu.com',7,4,6);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (329214,'988','Dynazzy','557 Mccormick Parkway','1421','','888 510 8272','ahustings91@time.com',19,2,10);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (333335,'395','Ozu','3788 Eggendart Lane','5773','27-440','711 860 2774','gcosley86@ustream.tv',5,2,15);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (333942,'527','Zoombox','5 Mcbride Lane','2884','613648','954 981 7961','ggiacopelol0@europa.eu',4,1,15);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (334453,'684','Devcast','0 Carioca Circle','6546','20784','301 947 8076','esalzbergnn@ucoz.com',7,5,8);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (336078,'902','Jabberbean','03177 Old Gate Circle','4243','162811','814 222 8647','pantragc5@pbs.org',2,2,2);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (336233,'790','Tanoodle','4744 Homewood Street','5754','2311','750 259 7104','tbartolomeocz@nps.gov',21,8,5);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (337231,'255','Eare','0468 Maywood Circle','2857','162399','472 889 3812','pspilstedkt@alexa.com',1,2,9);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (338146,'876','Devpoint','19 Chive Drive','5812','','315 599 7722','mharringtonrn@berkeley.edu',6,6,11);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (341577,'702','Jetwire','615 Barby Alley','4967','','704 547 6901','echarlwoodp0@phpbb.com',24,3,12);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (342253,'106','Skaboo','80504 Eastlawn Street','6829','','123 596 4502','zjeramsc1@booking.com',21,3,14);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (342620,'298','Gabvine','16 Thierer Circle','7376','','855 375 5932','relgram9j@nymag.com',24,9,1);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (342799,'690','Linklinks','7285 Tony Drive','3853','3249','302 569 8550','mpalfrie8a@nasa.gov',17,9,10);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (343022,'409','Bluejam','470 Pankratz Point','7137','','919 985 6608','rbreedep6@state.gov',25,6,12);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (344116,'630','Kwimbee','9 7th Center','3926','','784 226 4332','livushkin2f@upenn.edu',15,2,9);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (344361,'432','Mydo','20990 Moulton Place','1293','08-443','910 378 8996','scars3z@xinhuanet.com',14,1,14);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (344386,'375','Divavu','807 Orin Drive','4221','','712 787 0611','blongfutnb@cam.ac.uk',13,4,12);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (345793,'390','Photospace','64278 Everett Court','8374','696 61','555 742 3460','joddey1o@csmonitor.com',5,1,7);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (346502,'264','Gigaclub','75196 Continental Trail','1167','','763 960 1758','sthairs7n@reuters.com',13,3,4);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (350077,'995','Feedfish','99623 High Crossing Court','915','21290','410 164 7204','mkeillohby@gov.uk',23,6,9);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (352663,'159','Jabberstorm','67 Gina Crossing','7247','634003','123 124 3272','gkurtheo@networksolutions.com',20,2,12);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (355665,'720','Avamba','1 Dixon Center','9237','','314 577 8956','bmanuellia@wikia.com',4,4,7);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (355922,'633','Wikibox','467 3rd Trail','2100','','884 470 2735','erippen5y@lulu.com',20,9,12);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (358092,'177','Jabberbean','8880 Karstens Road','3312','','604 621 8656','smanginoti0@theguardian.com',16,8,3);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (359276,'955','Brightbean','087 Anzinger Pass','62','','646 480 3410','ubedward8p@nymag.com',5,8,4);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (361335,'383','Pixope','56 Summer Ridge Street','4187','','980 753 2074','jdemeyerp4@statcounter.com',17,6,2);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (361415,'948','DabZ','7 Lotheville Alley','3222','','557 977 1933','tscartifield2b@whitehouse.gov',25,2,7);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (362675,'641','Realblab','2 Riverside Court','485','','243 686 4935','rwillcott59@washingtonpost.com',5,9,6);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (364409,'205','Oyoyo','35856 Knutson Avenue','2120','20000','128 814 0786','meakly8@chron.com',1,7,10);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (364899,'654','Chatterpoint','8 Barby Drive','2378','','774 974 6884','krunnaclesao@addtoany.com',3,1,8);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (364907,'965','Devpulse','6 Victoria Center','7554','','487 512 5982','jsegoegi@mit.edu',15,2,9);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (365295,'493','Youfeed','24643 Fallview Way','9606','','564 217 1870','gpo4c@fotki.com',10,4,12);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (365505,'242','Eire','10840 Victoria Parkway','1819','','218 166 1675','jbaldwinr9@cbsnews.com',11,3,3);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (365802,'631','Riffpath','27 Schiller Hill','1448','4800-230','217 586 0923','bchestnut47@bbc.co.uk',12,7,2);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (368784,'425','Dablist','960 Ramsey Crossing','7005','83-034','398 620 2895','amasarrat3d@ibm.com',17,6,1);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (369003,'191','Lajo','8707 Everett Terrace','4757','','117 730 0930','sdyasnm@berkeley.edu',18,7,3);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (369252,'107','Jaxworks','9 Erie Court','1773','MD-5233','373 189 7788','gexcell3t@state.gov',10,7,2);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (370211,'211','Tagopia','332 Stoughton Drive','3807','','912 813 2636','wdolligoncg@timesonline.co.uk',24,5,3);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (370888,'124','Youbridge','2 Clarendon Court','9771','19-411','240 551 5868','tgutteridgeg@ox.ac.uk',19,3,7);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (371827,'714','Flipopia','284 Eliot Lane','2722','','252 995 8656','tdrohanhz@berkeley.edu',7,8,12);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (372375,'803','Voonyx','0286 Dryden Court','763','','573 104 9849','lbuistjp@wikimedia.org',18,3,1);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (373888,'672','Dabvine','625 Mandrake Pass','5599','','389 141 1501','acrone19@drupal.org',6,3,7);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (374696,'110','Cogidoo','787 Brickson Park Trail','6855','376','227 762 9761','cthringe5@mail.ru',20,2,3);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (375546,'453','Babbleblab','426 Menomonie Circle','8267','','834 597 0878','ptrobeydu@exblog.jp',13,1,9);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (379295,'940','Lazzy','3 Sunbrook Avenue','885','','638 748 3392','pcotterillp3@tmall.com',23,5,14);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (381259,'974','Pixope','4 Basil Road','4726','','419 985 9745','priddett26@rakuten.co.jp',12,6,12);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (382508,'944','Topiczoom','553 Melby Avenue','1073','38-533','204 731 6549','twoodyer4t@upenn.edu',21,1,13);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (385878,'398','Quimm','9 Vermont Alley','4870','49518','616 908 4110','mdelhayjn@google.co.jp',17,5,11);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (387629,'90','Topiczoom','4 Golf Circle','458','92077 CEDEX','198 614 8970','kwadsworthi2@paginegialle.it',23,1,1);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (387647,'963','Twimm','4921 Pond Crossing','7901','','300 704 0293','aleathart2y@twitpic.com',7,6,2);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (388244,'810','Feedfish','49 Swallow Trail','3931','201018','408 967 9750','gwarbeysi6@aol.com',13,2,9);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (388944,'345','Youbridge','7179 School Street','7892','','725 854 2607','tdumpleton2@vistaprint.com',21,3,4);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (390306,'970','Aimbo','36557 Manufacturers Circle','5838','','145 383 3858','gharuardd4@freewebs.com',1,2,8);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (393346,'492','Voonix','42 Nova Park','1815','','536 110 1008','oneeds2j@vkontakte.ru',19,2,3);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (395537,'743','Flashspan','56458 Amoth Point','6086','37490-000','462 959 8675','abluschke5j@yellowpages.com',2,7,10);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (395608,'626','Feedbug','36 Kinsman Way','1590','','126 671 7256','mmulcahyq0@va.gov',11,2,6);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (396488,'899','Devpulse','405 Helena Avenue','2680','','544 984 4381','nwellings1d@desdev.cn',19,1,5);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (396523,'565','Devshare','02 Forster Parkway','5598','26-432','654 282 4462','cbickers4b@walmart.com',18,1,13);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (396901,'427','Wikido','773 Eliot Crossing','5065','','461 519 3200','lpitbladorc@netvibes.com',22,9,14);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (398874,'417','Skimia','59 Leroy Drive','1545','4630-025','181 445 7635','lcambellbu@imdb.com',21,3,3);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (399114,'893','Brightdog','5000 Tomscot Trail','3307','','185 555 8357','hmcrobb5q@acquirethisname.com',22,1,2);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (399541,'456','Twitternation','588 Monica Avenue','7664','','208 444 0472','jgreenhalf8s@usatoday.com',9,3,9);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (400112,'94','Feedmix','46479 Kropf Park','1349','','534 758 1146','eblinder7m@wufoo.com',13,3,6);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (401154,'93','Babbleblab','867 Bonner Street','6319','','310 606 7610','tmorat74@liveinternet.ru',22,1,3);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (401882,'720','Jaxworks','7 Jana Way','4316','','625 986 7128','mjoire9h@trellian.com',21,9,10);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (403089,'12','Topicblab','5903 Brickson Park Place','1678','1239','476 685 9542','acockshtt3x@pagesperso-orange.fr',14,3,11);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (404837,'814','Mynte','9 American Ash Drive','9522','','365 230 9468','ggietz6s@vistaprint.com',10,4,13);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (405449,'733','Riffpedia','49 Rusk Parkway','898','548 32','872 939 8442','ibalstonen9@vkontakte.ru',25,7,14);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (406564,'939','Meembee','5 Homewood Lane','9531','','887 360 8616','kdavio9@hugedomains.com',24,8,1);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (407671,'944','Dazzlesphere','3 High Crossing Court','12','','477 892 0969','sjickells6w@mediafire.com',15,8,15);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (408288,'915','Dynava','6 Leroy Drive','7122','','811 979 1944','cantushevqk@topsy.com',18,6,5);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (409008,'607','Fivebridge','5370 3rd Pass','2838','','325 460 8079','marpurqm@jigsy.com',10,4,4);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (409230,'6','Dablist','81 Becker Junction','8539','','628 583 5632','kspringette9@cam.ac.uk',19,4,4);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (410250,'866','Pixonyx','7 Nelson Street','1402','','620 931 1630','bnorthedge2g@123-reg.co.uk',5,7,13);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (410495,'350','Dabfeed','1466 Warbler Plaza','9280','','472 195 7153','ebonny7z@mozilla.com',18,9,14);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (410676,'704','Yadel','981 Fairfield Way','8371','','961 865 6537','rcallowme@friendfeed.com',4,7,7);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (411141,'413','Tazzy','70 Oriole Way','6422','13155 CEDEX','891 860 7882','theeleydz@mozilla.org',18,3,1);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (411841,'618','Realcube','907 Southridge Avenue','4042','','877 835 6536','whaswellon@fotki.com',19,3,4);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (413642,'701','Eazzy','8170 Schurz Point','159','','539 907 9827','mgoor29@shinystat.com',20,1,15);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (413986,'515','Jayo','89642 Cascade Hill','4711','','485 556 6002','dhellisdr@businessweek.com',16,4,4);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (416185,'616','Quatz','0 Bunting Trail','5266','','352 165 8015','dchaperling15@networksolutions.com',3,6,4);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (418928,'718','Brainbox','746 Pankratz Drive','6745','3733','724 742 9395','mtriggolqn@blinklist.com',17,4,15);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (420884,'64','Shuffledrive','622 Hagan Avenue','6056','862069','703 632 9566','awarbyshl@prweb.com',20,9,13);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (421078,'108','Lazzy','7451 Maple Wood Parkway','1058','438 01','406 426 9602','nkimmitth5@soundcloud.com',2,4,11);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (421588,'580','Skajo','2 Florence Road','2986','5291','682 779 4087','gkoenraadam@live.com',25,4,7);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (422060,'476','Tanoodle','7402 Manley Point','9888','353769','465 159 8793','amorriartyah@delicious.com',9,2,11);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (422761,'45','Miboo','76430 Vidon Avenue','628','','460 328 4883','scouchere0@mit.edu',11,1,10);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (424095,'246','Trilith','75626 Daystar Circle','184','','718 635 5507','hsavil58@rediff.com',2,1,3);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (424415,'153','Kanoodle','69 Green Ridge Parkway','6434','','651 776 5358','smoquincb@nyu.edu',23,7,11);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (424801,'101','Avamm','7695 Buell Plaza','1302','','358 607 0786','nveryfo@nymag.com',17,9,1);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (425811,'652','LiveZ','798 Lotheville Crossing','3556','','800 738 4798','roluneyfi@feedburner.com',2,1,13);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (426828,'390','Skaboo','52 Maywood Pass','7544','','953 997 9958','ejerrardn7@feedburner.com',19,9,14);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (429756,'736','Quimm','66240 Johnson Street','9594','','385 153 5673','lrobertot2r@bandcamp.com',5,2,6);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (430046,'708','Quinu','8470 Hudson Way','29','','830 253 8279','efahey8b@g.co',1,9,2);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (433250,'266','Babbleset','58214 Burrows Court','9706','','921 686 3905','wbernasek4d@spiegel.de',7,9,12);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (433361,'839','Yabox','14 Old Gate Avenue','6776','','851 667 1533','amassimioh@slashdot.org',4,6,15);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (434911,'220','Myworks','4713 Crest Line Court','6296','675 75','822 464 1253','bgath8r@sciencedaily.com',7,9,10);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (437313,'649','Youtags','9576 Maryland Trail','2036','','723 973 8818','qspandley7s@thetimes.co.uk',20,5,7);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (437588,'105','Kwideo','1535 Carpenter Pass','4823','','479 970 5439','rdemicoli75@hostgator.com',5,2,13);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (439488,'467','Dynabox','332 Londonderry Street','4634','673 31','446 551 2378','srosenbloomki@ebay.co.uk',14,9,10);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (441232,'211','Talane','13508 Mccormick Terrace','6435','','701 570 6443','kbaptie9n@tripod.com',23,9,2);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (442035,'345','Kamba','05927 Amoth Avenue','5991','14449','880 358 4463','cgonneau6r@rakuten.co.jp',14,6,12);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (442877,'462','Yabox','9 Manitowish Crossing','8593','','777 667 0973','lbavisterr3@google.ru',12,3,1);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (446652,'2','Podcat','1945 Meadow Ridge Road','8298','5113','514 122 1360','gklasslr@marriott.com',3,6,7);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (446720,'999','Yoveo','784 Arizona Park','9987','810','130 211 6213','ebagniuk9b@123-reg.co.uk',21,8,10);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (446988,'275','Brainbox','92 Anniversary Pass','2588','','974 281 6135','galwenjd@stumbleupon.com',12,6,9);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (447516,'77','Centidel','02 Sloan Point','5590','','142 383 7098','aricardetoe@stumbleupon.com',16,4,9);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (449431,'70','Twitterworks','150 Garrison Court','7384','','399 248 3715','uparadina0@is.gd',19,4,6);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (451251,'877','Fivespan','90415 Cordelia Point','552','','323 496 1297','cbenteaw@naver.com',2,4,12);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (456644,'215','Realcube','568 Iowa Way','2398','50140','894 220 6773','vluetydd@nba.com',21,7,3);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (459169,'487','Latz','34973 Monica Pass','5479','','432 159 3306','aboyesd0@arizona.edu',11,4,15);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (460866,'737','Zoombox','183 Forster Plaza','354','','308 822 3741','iantenm4@geocities.com',9,9,10);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (461573,'395','Feedbug','9 Westerfield Center','416','','800 373 0592','nmatley2h@businessinsider.com',22,2,1);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (462479,'910','Dynazzy','1 Pennsylvania Plaza','5273','781','449 725 2463','cmeachenf2@creativecommons.org',21,7,9);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (463498,'797','Devpulse','65227 Eliot Lane','2489','','540 265 4481','mgeeraert4@independent.co.uk',6,2,9);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (465057,'79','Eadel','36929 Mallory Junction','5668','35650-000','389 858 4818','rboyde9z@seesaa.net',16,6,5);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (466492,'764','Twinder','6418 Clyde Gallagher Junction','5173','','109 984 4331','afranktonfd@gnu.org',4,6,3);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (466587,'358','Tekfly','9855 Melody Center','641','69190-000','195 834 6479','lmasse51@cornell.edu',15,4,1);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (466796,'877','Blognation','3879 Manitowish Circle','3239','','987 978 2435','dfelippo@nationalgeographic.com',14,7,11);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (467291,'299','Topicware','32277 Northwestern Parkway','7354','57000-000','325 817 2646','egatchax@ox.ac.uk',20,1,10);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (468524,'174','Photobug','79109 Dexter Hill','4603','','879 920 9101','gverdung1@elegantthemes.com',17,2,6);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (468642,'793','Npath','0796 Armistice Plaza','4123','','535 360 0860','kloveringmf@paypal.com',10,2,13);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (468708,'416','Riffpath','55 Walton Avenue','4280','06-225','206 288 7633','elaydel4i@ocn.ne.jp',24,3,14);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (469472,'990','Photobug','75279 Stuart Trail','6048','','480 567 3235','lcappineerl2@friendfeed.com',14,2,3);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (469640,'809','Dazzlesphere','1572 Hintze Place','2476','','188 570 1733','jsachbl@washington.edu',21,4,4);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (470702,'187','Meevee','0866 Eastwood Lane','7424','10370','796 194 9338','bbevington8v@networkadvertising.org',12,2,11);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (472578,'332','Mydo','749 Merry Street','9967','685 24','240 870 0418','hwaistell6j@yahoo.com',4,7,5);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (472894,'684','Lajo','02 Armistice Parkway','9748','111 61','742 672 0568','afrangomh@cocolog-nifty.com',19,2,9);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (478482,'792','Gabtune','5 Buell Center','3166','','174 187 8102','cmanionq1@deliciousdays.com',10,6,5);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (480663,'478','Zoovu','7 Merry Alley','2358','55120','504 763 0884','edrain9a@bravesites.com',12,4,9);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (482668,'677','Jayo','73230 Sachtjen Hill','8078','','619 111 8236','lfoucardqv@ucsd.edu',3,8,14);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (483228,'903','Kimia','759 Iowa Crossing','6845','34114','239 772 8839','glockjv@upenn.edu',11,7,15);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (483455,'584','Skajo','38 Ramsey Junction','8634','157090','191 889 6075','jmalter78@msn.com',5,4,13);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (484308,'755','Skalith','830 Bobwhite Avenue','8949','','489 917 8386','mmaloneil@cargocollective.com',15,7,2);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (484519,'683','Innojam','683 Butterfield Point','4505','2785-025','663 952 1051','fwhileycs@unesco.org',15,8,8);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (487170,'742','Skajo','10042 American Ash Drive','9193','','344 617 6918','mlawsiy@unblog.fr',3,2,9);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (487781,'442','Roombo','57 Bunker Hill Junction','9869','','638 588 7514','bdriverla@ox.ac.uk',17,1,15);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (488274,'378','Dabshots','3567 Moose Plaza','3631','349 01','251 598 0863','wklosser1x@hibu.com',14,3,7);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (490231,'638','Katz','405 Elgar Crossing','3439','','738 134 9629','ldumbrillc9@chicagotribune.com',22,8,11);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (490761,'333','Kaymbo','55073 Annamark Junction','4363','','930 491 5808','csalvador5a@auda.org.au',24,9,5);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (494735,'494','Linklinks','4407 Carpenter Park','6159','59162-000','198 919 2015','mgimber31@amazon.com',22,1,6);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (495620,'205','Riffwire','94 Hoard Drive','7043','M4C','654 259 3881','estroulger44@wikia.com',24,9,4);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (495692,'938','Fadeo','38 Granby Junction','335','','820 698 7541','eyetmanf5@g.co',7,5,8);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (496059,'928','Dabshots','25599 Tennessee Point','9056','','573 706 1021','sygoect@spotify.com',22,1,11);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (500256,'153','Lazz','06 Knutson Avenue','5922','649140','581 364 0403','nconiffkb@senate.gov',21,2,10);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (500744,'529','Flipbug','7 Meadow Vale Drive','2990','','929 906 3730','ebalasd5@globo.com',4,1,8);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (501564,'595','Tambee','004 Caliangt Junction','6709','','229 687 8471','atordoff2t@reddit.com',17,2,14);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (503249,'10','Zava','73 Moland Road','272','76711','254 615 8259','mmeletti1r@infoseek.co.jp',5,1,13);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (503559,'834','Zooxo','9 Thackeray Parkway','8499','','302 547 7996','afairebrotherrl@jiathis.com',7,9,8);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (503590,'128','Eimbee','13116 Old Gate Place','4710','666-0137','520 257 2132','bbalintq8@gmpg.org',14,4,2);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (505379,'796','Ooba','252 Jay Junction','9768','','249 598 0558','qbrogilz@51.la',17,8,11);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (508893,'417','Devcast','2101 Armistice Center','1102','','857 107 4146','bmallya55@omniture.com',1,7,3);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (509053,'863','Photobug','7 Stuart Court','420','607914','866 957 2948','rsimehq@gnu.org',7,7,6);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (511914,'819','Viva','8 Hooker Crossing','4487','','802 853 5107','bgorglaf@stumbleupon.com',21,4,2);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (512196,'325','Agivu','079 Hudson Avenue','8644','649-6326','421 113 8341','zbosselff@ovh.net',23,4,3);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (514280,'609','Voomm','99557 Sunnyside Road','5257','82-400','703 407 2409','ykingcott4z@cmu.edu',23,5,9);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (514970,'847','Kamba','652 Starling Road','2362','7100','729 742 3919','tirono0@dmoz.org',12,4,5);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (516194,'442','Flipstorm','43592 Ramsey Plaza','3940','','953 650 2890','sallchornfx@boston.com',5,2,11);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (517235,'717','Eire','7841 Cascade Drive','3955','','897 202 7958','slowlessji@prweb.com',16,1,9);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (518458,'442','Dynabox','7 Cascade Trail','3936','9217','984 728 1771','ccoupeip@alexa.com',18,8,6);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (519366,'920','Realblab','9 Kenwood Center','5825','','632 610 2908','lwardhough7u@naver.com',21,8,10);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (519921,'729','Thoughtstorm','2253 Bayside Crossing','2139','','848 926 0864','ldonan4y@mayoclinic.com',25,8,6);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (521101,'151','Rhyloo','729 Clove Trail','8784','','673 548 8478','mpleagerqi@ucsd.edu',16,6,4);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (522697,'589','Oyoloo','97500 Wayridge Alley','5022','','238 504 1744','jwhiscard5u@abc.net.au',12,5,3);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (523659,'980','Oyoloo','01537 Gulseth Trail','8068','6407','669 992 5819','rreilyag@bandcamp.com',20,6,14);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (525117,'929','Trilia','34 Hauk Hill','7928','','166 776 3799','mtregona6d@mayoclinic.com',9,3,14);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (526903,'159','Chatterpoint','17099 Blackbird Park','45','','135 364 3762','abrogini1l@ucoz.ru',21,8,14);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (529365,'81','Jabbertype','36 Hudson Road','5025','164210','346 832 1120','pfrankbo@shinystat.com',22,4,15);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (530589,'379','Teklist','8 American Ash Hill','7842','87-302','740 780 8068','dsandyfirthnl@uol.com.br',6,8,7);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (530844,'512','Demimbu','693 Rutledge Parkway','9260','','556 627 1696','gmabbuttrm@springer.com',14,5,8);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (531200,'490','Jaxnation','0853 Duke Crossing','3032','','213 259 7858','hdaoute8@nbcnews.com',18,6,5);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (531496,'381','JumpXS','3270 Nova Way','1050','65765-000','940 979 7293','rmelhuishl4@reuters.com',14,4,11);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (532972,'746','Lajo','8 Sutherland Drive','1222','999-0436','719 424 6763','brigneyez@stanford.edu',18,2,13);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (533022,'47','Skalith','89160 Sycamore Plaza','7052','','686 812 5881','edivver9y@disqus.com',23,7,3);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (533291,'968','Youbridge','3 Sheridan Pass','5278','242760','435 178 7528','cdortonkw@simplemachines.org',17,2,14);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (534543,'506','Divanoodle','313 Blaine Point','8990','4775-224','528 847 3196','javrahamian4e@google.com.au',12,2,14);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (535326,'20','Meemm','42 Harper Pass','9250','','302 751 8799','edunphy9l@icio.us',15,1,5);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (535524,'71','Layo','4 Crescent Oaks Court','1045','','581 177 7336','abendare2z@newyorker.com',1,3,6);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (536535,'645','Thoughtstorm','952 Golf View Alley','5441','','265 293 8688','vmacmillan3l@nymag.com',18,2,6);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (536809,'198','Vimbo','50282 Kim Hill','4346','','139 402 4488','nstigers6g@blogtalkradio.com',21,4,4);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (537952,'322','Oyoba','3 Mesta Center','8148','33-160','596 447 1634','cguiver41@columbia.edu',8,4,2);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (538527,'279','Quinu','57129 Ryan Junction','6636','','489 221 0994','ppeddenb1@state.gov',23,7,5);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (538641,'673','Trupe','09 Sunnyside Street','1693','','317 850 3672','cwerlocknq@bing.com',19,8,12);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (538932,'981','Eazzy','06 Toban Circle','6792','2419','621 786 1999','ybollardln@mediafire.com',3,7,1);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (539582,'589','Realblab','84305 Stephen Center','4090','','920 775 1736','fmewrcikre@princeton.edu',10,2,7);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (540318,'551','Linkbridge','1003 Esker Way','7815','550','246 447 9113','sbarkess7q@umn.edu',20,6,12);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (541049,'29','Eidel','96 Hagan Avenue','7665','588 62','669 222 7581','rronayneqx@mlb.com',5,9,9);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (542819,'539','Flashset','0 Mcbride Hill','8948','329-2165','139 656 5304','bdoagng@prnewswire.com',8,2,1);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (545560,'991','Ntags','15 Messerschmidt Alley','8424','','344 216 1857','tparadisb9@chron.com',10,9,7);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (547409,'184','Brainsphere','805 Rieder Park','2314','293 35','266 708 8840','efarnill9g@tinyurl.com',18,9,6);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (548314,'970','Aimbo','88574 Anhalt Drive','1595','430901','696 378 3168','ltregoningr7@nydailynews.com',25,3,2);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (550500,'776','Flipstorm','26413 Pawling Lane','7912','368530','224 269 7479','aralstonee@gmpg.org',8,9,8);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (552014,'96','Realfire','327 Briar Crest Road','9046','783 46','177 201 7387','ftomaszekmg@bloglines.com',16,8,12);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (553277,'782','Skipstorm','12046 Logan Park','66','6433','534 471 5978','jlawryma@multiply.com',1,8,15);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (554817,'540','Fivespan','4 Stephen Drive','6258','1444','125 989 4731','gbussettint@jimdo.com',2,3,7);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (556380,'972','Gigashots','8619 Mitchell Hill','4566','2712','866 772 6661','ashugg66@wiley.com',4,4,10);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (558286,'871','Vimbo','11081 Bultman Crossing','6769','75188 CEDEX 04','790 762 6079','jknoxir@addtoany.com',10,3,12);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (559116,'342','Oozz','4 Clarendon Way','9164','','610 808 2259','kkiddyfl@purevolume.com',21,3,4);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (561191,'947','Thoughtstorm','7198 Mcguire Street','2557','','491 764 2838','bcasburn4r@miibeian.gov.cn',4,6,12);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (562355,'779','Blognation','087 Independence Court','239','','317 804 1280','dwiltonp8@youtube.com',11,6,13);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (562452,'516','Quaxo','6 Shasta Park','2924','72100','930 607 5334','lstears7h@vimeo.com',24,2,7);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (562797,'243','Babblestorm','5 Welch Terrace','6009','68-130','988 777 2251','hcrowchera4@wikispaces.com',25,5,2);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (562957,'712','Voolia','384 Florence Terrace','1665','41340','730 668 5733','tgreypw@jalbum.net',7,8,2);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (565800,'167','Twitternation','620 Gerald Lane','9310','771 24','854 470 6784','ssoutherand1@is.gd',1,2,4);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (567776,'668','Yambee','47515 Warrior Point','9456','','729 677 2255','rcrowcum8y@indiatimes.com',2,1,13);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (568968,'975','Realpoint','27 Crowley Drive','4629','352275','803 250 6184','dscougalos@shinystat.com',25,9,5);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (570230,'305','Realcube','49227 Forster Pass','4691','334 52','776 736 2427','gshearstone1y@ca.gov',2,1,15);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (570281,'880','Katz','57 Corscot Center','1690','','873 492 9692','aedland12@blogs.com',14,2,14);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (570769,'924','Skyvu','64255 Thompson Place','3031','176008','675 149 2320','gwilsherek3@furl.net',2,7,1);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (574286,'256','Aimbu','4 Corben Circle','4271','','236 296 6334','cfackrell4f@unc.edu',6,3,11);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (574345,'493','Yakijo','79505 Fairfield Drive','1399','1185','373 840 6223','nargentmk@wikia.com',13,3,11);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (575391,'885','Minyx','3 Holmberg Trail','1633','42-262','440 358 4486','edundonia@apple.com',1,5,3);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (576847,'638','Youopia','0984 Dakota Circle','4075','47923 CEDEX 9','597 777 3084','abeaudry3j@elpais.com',11,2,4);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (578108,'49','Skinix','5 John Wall Junction','4026','','406 598 7719','jaspalldt@bravesites.com',9,5,14);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (578612,'68','Cogidoo','4536 Mallard Parkway','2069','','707 783 9989','mschiellap@quantcast.com',12,5,15);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (579603,'222','Blogtag','41 Montana Street','2398','','405 537 3513','asimpkin7w@wordpress.org',5,8,1);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (580128,'207','Youspan','1 Barby Avenue','4298','170513','108 704 2202','gmackilroelc@tinypic.com',7,9,6);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (582309,'326','Skiptube','74 Waxwing Junction','3500','','319 388 4746','mojeda2m@purevolume.com',9,8,13);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (582672,'82','Oba','2 Coleman Trail','8163','361606','916 294 0918','dyakovlevau@odnoklassniki.ru',13,5,11);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (583318,'776','Ainyx','14263 Blaine Way','6192','97500','856 496 8846','ofollacaroml@wordpress.org',3,6,4);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (587593,'789','Edgeclub','435 Fair Oaks Point','4932','63-440','601 865 2942','gmacgilrewy6n@dmoz.org',24,8,9);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (588115,'749','Realfire','0853 Hermina Crossing','5774','4625-220','922 322 8354','grewanne@pinterest.com',23,9,11);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (590336,'481','Agimba','8 Thompson Pass','8945','','304 639 3118','jmccloughenak@studiopress.com',15,9,2);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (592459,'412','Layo','13 Susan Lane','4282','','728 902 5021','heccersley6z@utexas.edu',1,6,11);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (592695,'348','Divanoodle','673 Declaration Lane','2056','6037','948 242 8380','avettorej7@indiegogo.com',22,8,1);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (593346,'230','Devbug','64 Tony Trail','6378','T7E','150 319 3535','ssextenr@wikimedia.org',3,5,6);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (595713,'808','Tekfly','2 Moose Trail','507','','237 732 3564','pfayneeb@answers.com',18,4,7);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (597297,'685','Oba','66958 Toban Center','336','9025','952 408 6388','iquickendenjc@google.com.hk',21,1,15);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (597484,'160','Zazio','742 Cordelia Road','7825','397855','719 858 4950','btankinjy@smugmug.com',7,2,11);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (598928,'407','Meevee','676 Kensington Avenue','5316','','222 169 7640','toshiel3a@addtoany.com',11,6,10);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (602493,'735','Photojam','57 Scofield Park','3186','','888 440 6933','hrapinkq@histats.com',7,5,1);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (602771,'661','Blogpad','78736 Anthes Center','7206','149 81','152 338 8615','afranceld@ustream.tv',23,3,2);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (602873,'885','Vimbo','8 Pepper Wood Place','6759','352857','238 960 0556','aelvenf6@businesswire.com',16,6,13);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (603162,'707','Fadeo','22 Maywood Avenue','2986','','453 815 4458','ahulcoop1m@hud.gov',10,8,10);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (603434,'626','Midel','04675 Hudson Way','857','185035','751 548 3182','sstollenwerck1i@discovery.com',2,3,7);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (605269,'366','Skilith','81269 Farmco Lane','389','5250','655 592 8530','bbernardoux4s@blogs.com',8,5,1);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (605423,'48','DabZ','266 Waywood Court','7601','','527 611 3998','nricoaldmt@army.mil',8,5,13);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (606158,'145','Meevee','848 Elka Street','6839','','290 218 6586','ependrymz@globo.com',12,9,12);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (606538,'387','Oyondu','225 Sloan Lane','5856','','564 271 3164','rdeancywillis2l@census.gov',2,3,12);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (607223,'394','Twitterbridge','3 Melrose Hill','6113','','678 430 8665','uledford97@alexa.com',16,5,15);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (607455,'572','Fivechat','252 Clyde Gallagher Way','3363','','297 905 0286','rmeesonmo@wp.com',14,2,10);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (607464,'131','Chatterpoint','9112 Michigan Circle','1833','','810 671 4121','dcluleyrk@google.com.au',7,4,2);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (608083,'658','Babblestorm','7 Longview Park','3689','2635-230','956 869 1683','vlingardg8@cloudflare.com',13,8,8);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (609978,'92','Oloo','8 Tennyson Terrace','604','3335','995 173 6440','gfoggo9@irs.gov',9,7,9);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (611889,'624','Meeveo','010 Morrow Crossing','5441','','243 210 4430','gdaintreeet@statcounter.com',19,8,12);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (612525,'537','Flipopia','05 Buena Vista Road','6880','461 37','135 660 4316','icantwell6h@state.gov',16,3,8);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (613184,'399','Tazz','327 Buhler Center','2272','7207','247 722 4830','acoad9r@vistaprint.com',13,1,3);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (614359,'995','Jamia','2596 Monterey Circle','1905','','977 445 0751','kwingatenj@hexun.com',17,4,14);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (614740,'60','Twimm','6537 Hazelcrest Avenue','9904','','204 658 9426','rhoundsond@seattletimes.com',14,6,9);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (616050,'285','Tagtune','0343 Northland Parkway','322','601380','639 878 4263','spelferht@xrea.com',21,3,15);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (617966,'205','Bluezoom','0 Dovetail Avenue','1525','64-500','341 393 8561','lnajerari@aboutads.info',4,7,2);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (618084,'770','Rhycero','5155 Graedel Street','3502','','935 854 9827','cbuggsk0@ocn.ne.jp',25,8,1);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (619405,'941','Kazu','5678 Eastlawn Crossing','124','','782 554 6838','pgiamo8h@toplist.cz',14,6,2);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (621347,'391','Devbug','0687 Sunfield Terrace','6242','','878 307 0706','rberceros1h@parallels.com',24,4,3);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (621550,'574','Kimia','14 Donald Avenue','9908','17140','312 232 7140','mkohlertog@blog.com',1,3,2);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (622901,'135','Flashspan','94250 Ryan Plaza','2533','2512','363 251 7059','chorsefield5h@skyrock.com',25,8,1);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (626724,'851','Edgeclub','37 Melrose Drive','1992','57047','362 757 3093','bhackingecy@wix.com',11,6,3);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (627745,'136','Yakidoo','47318 Dottie Drive','6920','','589 794 3979','nlocknerly@aboutads.info',2,2,6);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (629220,'54','Podcat','7 Debs Way','4247','53277','360 142 3648','gdarmody45@geocities.com',24,9,10);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (629370,'145','Yoveo','63745 Maple Wood Center','741','','513 114 1569','ntintonif@themeforest.net',15,4,5);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (629552,'651','Flashspan','21 Springview Way','3457','','169 814 6571','atouson3k@squidoo.com',2,9,8);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (632596,'362','Jabberbean','9 Shopko Court','1729','152730','761 350 2314','cleadstonemv@cdbaby.com',21,3,15);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (634122,'996','Youtags','1270 Oriole Alley','2061','','852 124 0899','odobrovolny5t@uol.com.br',16,6,11);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (635623,'259','Midel','52 Blaine Center','8076','','494 341 5147','tsaintpierreiu@prweb.com',17,5,12);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (635923,'912','Wikido','381 Manitowish Lane','4011','35160-000','407 843 1133','nmilesop9q@moonfruit.com',7,9,7);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (638540,'950','Tagtune','55376 Duke Avenue','1565','40618','502 531 9847','bgorhardtm6@nba.com',24,9,6);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (640198,'184','Yabox','7009 Mayfield Pass','5682','','193 561 8543','afishleeho@va.gov',1,5,1);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (642011,'667','Skyvu','038 Shasta Drive','2493','','943 471 1449','nsima8g@t.co',18,9,1);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (646322,'351','Livetube','39 Clarendon Parkway','6467','69367 CEDEX 07','923 326 7475','kolynnp7@canalblog.com',23,6,1);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (647598,'543','Aimbo','28347 Graceland Hill','727','','157 113 5388','kkinsetm7@mashable.com',3,7,14);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (651274,'189','JumpXS','4920 Moland Place','4274','40101','914 242 1925','jendeo6@imageshack.us',15,5,13);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (653017,'304','Buzzbean','91268 Cherokee Road','5521','','262 116 1330','floughan2n@google.com.hk',4,8,7);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (654030,'644','Brightbean','8 Pepper Wood Circle','6688','5470-206','810 555 0600','bhearley49@twitpic.com',1,4,10);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (654797,'554','Skinder','6 Holmberg Street','2547','','144 300 1498','dkeesman7t@digg.com',22,8,9);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (655222,'960','Wikibox','668 Marcy Junction','7326','1495-005','838 769 9641','jitchingham30@rambler.ru',24,2,12);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (657616,'106','Izio','001 Cascade Crossing','5221','42-311','924 755 4253','rdionisiov@biglobe.ne.jp',16,2,1);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (659141,'865','Twimbo','49 Basil Street','2342','678620','206 128 7829','blarrethj@aboutads.info',6,9,15);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (659616,'758','Yoveo','7671 Gateway Park','2740','37445-000','836 277 7313','wrojaskc@nhs.uk',13,5,2);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (659859,'975','Roombo','7624 Sherman Way','5298','400 29','543 730 8162','pmcgilbenjz@icio.us',22,1,11);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (661688,'350','Realcube','2 4th Point','3032','453150','799 436 7377','sguidera9x@infoseek.co.jp',17,1,7);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (661738,'924','Skinder','9 Eagan Circle','4356','','572 771 4658','sgiannassial@joomla.org',21,8,9);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (663605,'227','Ooba','48423 Russell Way','5889','','648 497 7160','mterrillbs@bluehost.com',12,9,3);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (663784,'706','Bubblebox','7244 International Street','1768','','224 472 1115','amillingtonc8@mysql.com',25,3,9);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (666881,'516','Oyondu','8589 Dakota Lane','8756','257 08','761 978 5839','jdillowjq@mtv.com',18,1,15);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (668607,'525','Wordify','87465 Mayfield Center','1080','','444 957 9540','jlandon3e@bloglines.com',16,6,1);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (670696,'518','Divape','46371 Park Meadow Point','5503','','186 656 3095','ksporleer@statcounter.com',11,9,4);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (671598,'688','Photofeed','03 Hudson Crossing','2801','','184 524 4761','sdmtrovic5c@economist.com',15,7,8);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (676570,'615','Kwideo','8 Burning Wood Hill','5310','97387 CEDEX','996 395 6367','vbarnfatheriv@goodreads.com',24,2,15);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (678982,'331','Roodel','82513 Maple Court','8374','','276 850 2550','svarnalsg2@flickr.com',13,1,1);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (680340,'254','Edgetag','20923 7th Way','6681','13700-000','261 522 1660','dlumber95@irs.gov',7,1,10);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (681082,'672','Browsetype','02462 Milwaukee Hill','2351','7505','862 337 5864','hlustediw@xing.com',11,6,2);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (681124,'604','Myworks','27427 Garrison Circle','5905','63-510','850 117 3440','tdenleyqc@51.la',16,7,10);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (686150,'916','Oyonder','89 Eggendart Center','5172','','567 477 5751','bbroinlichnv@fc2.com',24,8,3);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (687740,'268','Skinder','235 Westridge Park','1987','','593 988 6557','rlefrankdw@prweb.com',3,7,6);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (688065,'62','Twitterworks','10644 Duke Center','5861','','624 911 3769','rpidgen2a@hud.gov',13,4,8);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (692390,'249','Blogtags','47409 Green Point','9196','613840','460 863 6987','vrunge5e@vk.com',7,8,10);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (693311,'339','Oyondu','6 Carpenter Center','7239','','476 125 9500','sullrichnp@facebook.com',17,2,9);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (693402,'361','Trilith','3312 Waubesa Way','2273','','382 518 2171','mpleasanceq4@usnews.com',2,4,14);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (696276,'419','Yakidoo','6883 Marquette Point','8261','','498 318 6610','sandrysekai@nymag.com',6,6,10);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (696675,'811','Browsetype','0 Maple Wood Crossing','3725','','818 369 0619','gdybella1@guardian.co.uk',12,3,6);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (696758,'944','Mydeo','9 Marcy Lane','9585','9711','750 985 9986','amcgrillnw@com.com',13,3,7);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (698443,'619','Oyoyo','51749 Sage Park','5638','14940-000','227 614 6754','vsheirlawhe@imgur.com',22,3,10);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (699573,'176','Vitz','40831 Texas Point','4075','','718 261 4972','jglasspooleg3@ox.ac.uk',16,1,2);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (700035,'232','Vinte','98 Larry Court','4009','MD-5114','571 450 2200','draynardl8@bigcartel.com',17,3,11);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (702486,'251','Riffpedia','89 Mosinee Court','8834','','483 433 2656','rbaudinellidp@reverbnation.com',4,5,2);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (703054,'691','Jabbersphere','40165 Crest Line Trail','7281','','367 513 6500','jmeiningergg@cdc.gov',13,6,5);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (703498,'636','Yodo','47494 Butterfield Park','6747','','273 608 5434','pclementson50@smh.com.au',4,5,10);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (703779,'612','Kwimbee','8 Commercial Point','8234','L8P','647 904 6445','mbaldenq2@hexun.com',19,2,6);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (703847,'12','Yodo','01065 Larry Point','9084','','718 255 4292','pcursey5o@ucsd.edu',13,9,13);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (708989,'995','Skynoodle','8 Kingsford Trail','5558','','853 571 8821','acyseleyic@t-online.de',17,8,8);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (709731,'144','Feedbug','52 Utah Place','7598','50700','906 381 0443','lrustmanib@youtube.com',11,6,8);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (712050,'214','Ailane','28373 Dahle Circle','7226','453019','337 300 6827','arubenfeldpg@list-manage.com',16,7,1);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (712805,'914','Chatterpoint','21 Bayside Terrace','452','34745','407 484 6784','csammonds57@twitpic.com',6,7,5);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (714308,'747','Thoughtstorm','5253 Prairie Rose Point','1115','593 01','130 109 8076','acrackett33@mit.edu',11,8,4);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (715607,'101','Bluejam','160 Troy Park','7629','5105','145 466 9569','fpowlq@cnet.com',22,9,8);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (717271,'73','Brightdog','34760 Rowland Pass','6637','7200-252','117 429 2801','fmorrisondq@unblog.fr',1,6,14);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (717673,'983','Oodoo','8 Elka Plaza','2356','','467 695 5283','twindramof@wordpress.com',11,3,10);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (717714,'220','Gigashots','165 Scoville Lane','5229','','106 829 8723','abossinghame@newyorker.com',5,7,3);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (720992,'36','Kare','261 Old Shore Point','753','','850 146 8201','mfrowingkg@home.pl',18,9,8);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (722086,'46','Leexo','1 Stuart Circle','3654','88804 CEDEX','116 109 1659','aszymonowicz85@utexas.edu',23,3,13);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (724240,'208','Meezzy','2 Hoffman Court','4846','368222','149 456 0548','abissellbw@engadget.com',5,7,8);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (725223,'693','Meedoo','5 Norway Maple Plaza','5329','82-103','893 858 0479','ppeasegodfw@vkontakte.ru',9,9,4);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (727400,'947','Browsecat','7752 Westridge Plaza','3307','','535 151 1113','rmardellqa@un.org',9,5,4);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (727839,'838','Zoomlounge','9 Derek Road','6577','','936 628 1075','itarranthw@sciencedirect.com',3,1,15);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (729800,'571','Flashset','773 Holy Cross Road','9610','4516','674 996 0113','bwimlettf7@wordpress.org',1,6,2);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (731394,'498','Tagtune','7271 Rigney Terrace','3704','47897','198 384 8039','bkinnier6o@wix.com',16,3,6);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (731593,'571','Roodel','3559 Tomscot Way','6515','5850','521 575 1774','adoylykr@comsenz.com',2,4,3);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (733146,'408','Youbridge','0 Vidon Hill','3927','580 01','809 344 2045','lplewrightqb@digg.com',23,1,14);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (734869,'648','Quimba','2 Susan Parkway','8087','142308','931 689 3179','smcgeffenmc@wix.com',25,1,10);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (734899,'387','Topicblab','31 Ilene Circle','2966','','621 652 1223','msparkwill1s@omniture.com',3,7,9);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (738541,'712','Kazio','26143 Anthes Pass','5593','','530 214 7616','estithe2c@forbes.com',20,6,12);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (739741,'304','Devshare','0455 Brickson Park Center','7570','P75','806 871 6337','spaulusch94@indiegogo.com',15,3,12);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (739757,'210','Photobug','6 Dennis Plaza','8444','3808','314 794 2297','wbonicellimm@rediff.com',3,6,14);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (739995,'169','Demivee','0010 Sullivan Circle','1265','','706 243 6279','bcuseckgl@altervista.org',11,2,6);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (740199,'839','Twitternation','349 Aberg Street','371','','340 994 8800','velgram2k@wikipedia.org',20,5,2);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (740249,'993','Oyoloo','273 Mifflin Junction','3417','13834 CEDEX','227 332 7750','kkyngdonpd@arizona.edu',11,7,6);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (740611,'692','Izio','42 Dakota Point','85','85800-000','375 925 5983','cmadgecq@unc.edu',23,9,1);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (741075,'269','Kare','12487 Swallow Terrace','1251','62-620','598 277 1872','cthomblesonw@tmall.com',7,7,4);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (741763,'850','Rhyloo','7228 Maryland Center','8292','13293 CEDEX 08','830 361 7309','hzoreneu@t-online.de',16,9,3);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (744243,'741','Jaloo','874 Toban Court','1150','','771 857 3998','pgullammi@dagondesign.com',23,3,7);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (744438,'913','Oyoloo','5 Upham Junction','4029','','333 797 8811','cbeateyou@dagondesign.com',15,3,15);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (745042,'722','Agimba','47588 Gulseth Road','2397','62984','718 470 0264','agoodrightco@irs.gov',24,7,11);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (745366,'740','Twimm','27 Wayridge Alley','5109','J7A','471 390 5446','evardey5s@tinyurl.com',14,5,2);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (753661,'342','Quire','254 Straubel Street','791','47-180','287 289 6370','mtetla93@businessweek.com',9,7,6);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (754950,'195','Edgeblab','87 Pleasure Park','9960','52600','421 939 4826','njirasj4@cornell.edu',22,2,7);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (755326,'677','Eire','8207 Badeau Trail','289','','449 532 7557','hvallercc@github.io',7,7,12);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (756386,'819','Yombu','179 Grim Plaza','5375','','749 543 5991','pcrustp5@weibo.com',25,6,5);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (756913,'203','Shuffledrive','175 Waubesa Junction','2152','357859','230 689 2496','gthurlbecku@rakuten.co.jp',6,2,2);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (756940,'782','Voomm','6494 Monica Center','9736','','872 458 0720','kharwell40@mediafire.com',4,3,10);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (759803,'726','Devify','91 Tennyson Trail','4477','232 24','279 330 6042','cbrownseya9@cam.ac.uk',1,2,14);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (760066,'380','Jayo','83 Kennedy Road','1006','13870-000','911 127 0631','dfishlockkh@ft.com',23,3,9);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (760192,'582','Meetz','588 Northwestern Way','2478','4620-526','518 867 1575','gmadrejb@friendfeed.com',25,7,12);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (760720,'455','Tagcat','48 Chinook Hill','1243','58110','726 747 7003','melsegoodeh@auda.org.au',7,3,8);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (762521,'895','Oloo','27101 Rowland Alley','9905','249275','550 175 9521','gdachhs@phpbb.com',9,8,8);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (763579,'680','Thoughtsphere','08 Menomonie Street','2387','6711','174 607 2973','ejerdein4x@lycos.com',4,7,6);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (764715,'16','Fiveclub','82940 Village Plaza','5295','1325','348 610 2425','speetdf@cbc.ca',19,3,4);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (767071,'883','Linktype','97835 Derek Drive','8073','20414 CEDEX 9','422 348 0843','icourage98@forbes.com',16,9,11);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (768652,'958','Roomm','1 Fremont Alley','6458','','351 728 8561','pdiblingkv@myspace.com',21,2,9);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (769283,'388','Oodoo','298 Pearson Circle','252','','951 529 4244','pmackinnonb@twitter.com',17,2,2);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (771663,'989','Kare','0 Shopko Way','9172','','308 616 0041','nkiwitzf@printfriendly.com',8,4,6);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (772049,'51','Oyope','429 Emmet Court','5517','','404 255 4510','hgoodinson1e@jugem.jp',7,8,1);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (773900,'843','Trudeo','811 Merchant Street','6447','14900-000','171 643 6078','akelbykd@deviantart.com',24,8,6);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (775761,'140','Jatri','58 Mariners Cove Terrace','7669','','457 823 8987','mkolispi@networkadvertising.org',23,9,5);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (777390,'90','Blogspan','14 Sherman Park','8195','','151 865 3469','ktodarinipz@japanpost.jp',10,5,14);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (778450,'237','Thoughtmix','2277 Ridgeview Hill','3465','76200-000','477 630 2829','dfieldb7@smugmug.com',8,5,15);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (781430,'339','Mudo','59 Homewood Lane','6743','','636 126 9674','gkilmaryok@weebly.com',2,7,12);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (781613,'522','Blognation','680 Parkside Pass','1578','76101 CEDEX','197 307 1271','jjaggard7y@blinklist.com',22,9,13);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (781899,'404','Snaptags','7 Truax Crossing','565','32-064','484 660 9382','lmaccartanio@google.cn',5,4,1);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (783658,'377','Zoomcast','32943 Merry Alley','7897','','964 481 6095','erapifk@businessinsider.com',3,9,3);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (785491,'149','Photobean','765 Scofield Circle','929','','743 244 9331','awarlowoi@senate.gov',17,6,3);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (785716,'876','Browsedrive','77 Havey Parkway','7422','','914 984 3742','cbendalloa@businessinsider.com',22,1,2);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (787481,'77','Bubbletube','02246 Bay Crossing','8990','19139','752 784 8261','mvalentine7a@microsoft.com',5,7,8);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (791056,'480','Abatz','1844 Lighthouse Bay Court','8016','399373','567 620 1556','tnyleslu@soup.io',5,5,3);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (792055,'418','Realfire','0722 Westend Parkway','9296','','930 740 3638','hbarochkx@liveinternet.ru',18,8,13);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (792458,'870','Skinte','5178 Cherokee Center','5722','','317 868 2936','cdibartolomeobt@tripadvisor.com',1,2,3);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (793062,'99','Jabberstorm','3 Bartillon Point','1201','6464','280 725 2374','nenneverb3@vk.com',6,3,12);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (793723,'746','Ntags','11 1st Parkway','5246','353650','680 759 9067','asimkor2@blog.com',16,4,1);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (795043,'371','Eazzy','742 Eggendart Trail','5612','430910','753 212 4993','jmenezes76@ameblo.jp',12,4,1);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (797379,'150','Tagpad','03 Dixon Way','4992','','169 613 5676','cvancasselbq@ebay.co.uk',15,6,2);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (798318,'70','Brainsphere','595 Karstens Circle','8342','','772 338 4537','mgladdishda@disqus.com',20,7,3);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (801200,'36','Nlounge','73339 Randy Alley','2928','','615 283 2740','aandrickn1@linkedin.com',6,1,7);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (802067,'834','Teklist','73 Fuller Center','3590','','502 892 5005','vscrigmourp@facebook.com',4,4,2);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (804727,'160','Gabspot','564 Bayside Street','1794','2417','253 958 7728','kandreenh@example.com',15,3,15);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (805395,'788','Flashdog','7 Fordem Way','2785','2400-013','920 493 0203','jriddalljx@fda.gov',8,9,4);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (806861,'47','Wordware','8 Farragut Court','5422','','285 252 6840','npymca@prlog.org',19,7,12);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (809277,'48','Jazzy','4 Pepper Wood Park','801','','689 378 4337','kpopovhc@scribd.com',17,5,1);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (809372,'814','Agivu','5 Lyons Way','4087','','575 640 0072','cnotmanna@discovery.com',11,8,6);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (809999,'824','Livepath','6 Maple Wood Crossing','8354','13170','173 644 3020','edolanh2@arstechnica.com',25,6,10);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (815577,'216','Tagpad','79866 Anthes Street','6474','','954 643 7452','dkarolowskije@squarespace.com',14,5,8);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (819936,'900','Leexo','78 Kedzie Plaza','2385','423031','217 403 8242','mpomfretel@discovery.com',11,2,14);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (820089,'915','Skivee','660 Annamark Point','3977','','189 235 0254','cbrungerfv@sina.com.cn',2,8,13);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (820730,'486','Tambee','96112 Hoffman Terrace','9346','84120','801 293 4881','npawelseg@goo.ne.jp',22,1,5);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (821845,'455','Zoozzy','571 Almo Drive','4034','','730 209 6265','vstuartoz@ca.gov',13,4,3);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (822545,'426','Podcat','97553 Red Cloud Road','2200','LN6','670 107 9439','ivautreqq@wunderground.com',8,7,1);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (823519,'656','Centizu','174 Melrose Street','9838','','999 636 7361','phapke4u@blogger.com',14,1,11);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (824286,'985','Devcast','29 Victoria Park','7045','','339 737 5766','fzamorab8@wsj.com',8,4,13);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (826373,'635','Jabbersphere','63305 Marquette Park','3948','45650-000','233 980 8160','rdonhardtlw@shutterfly.com',18,4,15);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (826754,'886','Demimbu','61 Fuller Place','1186','3374','906 781 0128','dkirrens6k@addthis.com',22,1,15);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (827231,'468','Oyondu','93 Briar Crest Court','6214','','112 127 3117','eplakay@army.mil',10,3,8);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (827463,'673','Fadeo','2 Michigan Lane','6786','','533 303 5185','jgreenway8t@china.com.cn',15,2,1);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (828311,'793','Trudoo','0 Buena Vista Court','4419','','660 160 8944','kpontehv@nyu.edu',4,1,3);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (828954,'141','Kwilith','7 Orin Crossing','1654','','334 433 6975','mcranfield3m@vimeo.com',7,8,13);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (829436,'854','Meevee','36 Evergreen Street','5712','','165 714 6636','lgoodbournpv@prweb.com',2,8,13);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (829622,'255','Jabbersphere','3034 Mandrake Way','5730','','455 231 4696','gceeleyaa@vinaora.com',23,2,1);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (829871,'57','Zoombox','84772 Dorton Center','5305','','602 791 6240','rconnopmr@google.cn',3,6,1);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (830272,'684','Twitterlist','96 Cherokee Avenue','3921','76105','817 575 3495','ddelbergue0@sina.com.cn',14,7,7);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (833704,'621','Kaymbo','55 Quincy Hill','4824','','772 305 0316','eswaine6f@a8.net',1,2,11);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (836353,'588','Camimbo','4 Michigan Lane','3244','4501','665 336 7838','sstaden7j@google.fr',5,5,11);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (841654,'361','Quimm','38 Hazelcrest Road','9725','2670-755','376 956 8542','aovitz8f@dagondesign.com',6,6,1);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (842477,'34','InnoZ','348 Dottie Pass','9199','','462 516 0524','acarolibn@sakura.ne.jp',6,6,10);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (843189,'542','Wikibox','3 Red Cloud Plaza','6459','','771 638 1585','tcavillaiz@upenn.edu',4,6,8);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (843455,'657','Yotz','1298 Eastlawn Center','8053','111711','370 288 1020','hcalrowl3@google.pl',15,4,6);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (844985,'390','Roodel','87 Tony Junction','3602','','724 770 8470','niversonbf@webeden.co.uk',17,1,6);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (845583,'918','Yombu','8 Spaight Street','5366','21460','368 397 5930','dherculesfb@woothemes.com',23,3,15);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (845632,'686','Jaxworks','7 Pleasure Alley','6717','','859 731 8546','mgehringjf@issuu.com',5,5,11);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (846833,'754','Demizz','3049 Kensington Junction','7764','','727 596 3760','tthridgould3h@goodreads.com',14,1,14);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (847030,'977','Mita','6178 Morningstar Street','9660','','342 440 5507','imcquilkin6p@about.me',8,7,8);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (847558,'930','Feednation','2 Fallview Hill','9700','5050-223','799 135 4993','rkennion3n@webeden.co.uk',12,4,13);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (849371,'887','Zoomdog','32 Blue Bill Park Park','564','','760 328 4528','rbrecone3@ezinearticles.com',7,1,2);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (850476,'627','Gigabox','74677 Bluejay Drive','424','','230 656 8232','bsearightjh@census.gov',9,1,1);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (850621,'729','Skyble','5 Blaine Place','6573','44880-000','202 335 1516','brodrigoh@dailymotion.com',25,9,4);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (852694,'901','Kayveo','489 Maple Court','1973','','390 541 7670','alippett7k@microsoft.com',12,8,15);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (853110,'88','Oba','4016 Derek Crossing','3620','52460','607 797 3153','sdaybornee7@merriam-webster.com',25,5,1);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (853915,'965','Bubblebox','7340 Golf View Parkway','7333','7015','278 155 1209','rpostlethwaitecm@who.int',3,1,14);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (856232,'750','Trunyx','59800 La Follette Court','399','3382','269 152 0151','hpasley4o@msn.com',24,4,5);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (859181,'696','Skivee','09381 Vahlen Lane','1498','7420','604 803 1750','mcheakn2@illinois.edu',8,4,12);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (859260,'596','Blogpad','69701 Kingsford Way','5064','','876 783 6088','eloveredgeqo@flickr.com',15,1,2);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (862069,'192','Kayveo','17 Bobwhite Hill','8528','','890 745 8869','jguerriero82@networksolutions.com',10,4,14);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (864167,'241','Jaloo','215 Dottie Crossing','6860','','924 396 0608','jwhighteq@reddit.com',3,3,5);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (866481,'929','Chatterbridge','53754 Holmberg Trail','9768','696 30','973 287 4171','lgrossql@google.com.hk',9,5,13);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (866513,'596','Rhybox','0 Victoria Terrace','5145','','308 425 0334','cphippspt@bloglines.com',3,8,12);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (867464,'531','Muxo','4463 La Follette Place','3212','662622','355 741 5250','kwharltondm@newsvine.com',4,6,10);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (867599,'531','Jabbersphere','6 Starling Parkway','8274','','378 618 2367','jgiabuzzib6@about.com',19,9,8);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (868832,'373','Voonte','4 Forest Run Place','9423','62-571','441 297 3558','tdavidi5r@thetimes.co.uk',13,9,5);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (869272,'830','Plajo','5 Lakewood Gardens Junction','6390','23237','804 277 4180','mtompsett5x@answers.com',8,6,12);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (870282,'702','Voolia','56473 Reinke Center','5963','52181','751 543 1725','jleport18@dedecms.com',9,4,6);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (871317,'73','Thoughtbeat','3439 Fairfield Lane','7245','','622 476 7082','eclynter7c@digg.com',14,7,10);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (871592,'999','Skyvu','2819 Ridge Oak Junction','8676','T9J','620 675 0931','gkurdanikl@amazon.co.jp',11,4,8);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (871641,'656','Meejo','1 Kensington Point','8915','69-200','896 544 1404','tskipsey72@usnews.com',2,6,5);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (871707,'987','Divanoodle','79362 Stuart Road','6926','5414','608 627 3456','jgildersi3@go.com',17,3,9);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (872764,'826','Gabspot','9 Prairie Rose Center','2944','','582 859 5476','hbookmw@list-manage.com',19,3,6);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (873521,'273','Fatz','559 Stang Road','7453','','164 588 4348','smaccafferylp@amazon.co.jp',23,5,5);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (874126,'367','Tagpad','506 Erie Alley','3279','47893','295 460 3939','corchardit@fema.gov',5,5,6);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (874604,'986','Wordify','0 Hovde Terrace','6706','','613 501 4025','isowden79@nsw.gov.au',6,6,10);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (874884,'847','Brainbox','66 Hoffman Junction','7753','','212 679 6537','efearekz@mashable.com',19,9,14);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (875858,'825','Wikivu','4222 Superior Avenue','8688','','300 969 6240','rlongmatehr@hatena.ne.jp',3,3,10);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (876292,'973','Photojam','6 Spohn Way','882','47304 CEDEX','210 276 1075','smayne9m@loc.gov',1,3,2);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (877808,'223','Youopia','67324 Sunnyside Plaza','5493','','706 607 3376','gbloanpk@home.pl',5,1,13);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (879537,'774','Viva','74847 Rockefeller Center','9438','4335','192 557 8443','dvanzon7b@phpbb.com',24,4,12);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (880698,'196','Photospace','47 Gateway Circle','424','','325 380 1657','agentnerea@quantcast.com',17,3,1);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (881249,'839','Tagtune','5661 Doe Crossing Crossing','9446','952-0317','305 165 4603','skinforth3q@google.cn',13,5,6);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (881397,'185','Babblestorm','1153 Spohn Point','73','425479','179 235 6395','kscougallgr@cmu.edu',16,6,7);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (883970,'930','Topdrive','670 Almo Plaza','2943','','741 992 1718','cwhiskero4@google.com',4,5,8);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (885623,'195','Oyope','188 Forster Trail','808','39271','753 662 3803','tkinneyas@twitter.com',4,5,5);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (886370,'833','Zoonder','2 Jackson Place','3028','762018','994 713 7294','dkalker6v@geocities.com',12,8,8);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (886708,'359','Avaveo','975 Sunfield Crossing','8036','','445 191 6351','dduckerin5d@shop-pro.jp',17,7,2);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (889328,'841','Quinu','86 Old Gate Road','720','64187','816 139 9436','cspenleyem@bravesites.com',3,6,15);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (891287,'851','Voolia','1 Scofield Drive','137','675 02','543 814 7384','sschrieves6q@quantcast.com',21,1,13);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (892269,'478','Devcast','468 Orin Road','3675','','878 602 6786','bbirtwistle5v@facebook.com',5,8,2);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (892276,'518','Cogidoo','077 Stuart Trail','7395','433300','830 393 9342','kolden43@google.com.br',4,8,10);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (892515,'641','Skipstorm','934 Rigney Hill','6719','','963 191 9007','qpierrepont56@fc2.com',24,5,13);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (892921,'746','Wikibox','87318 Cordelia Drive','9074','69405-000','324 408 4149','adiioriojt@newyorker.com',19,5,13);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (893332,'903','Jabbersphere','879 Saint Paul Junction','893','','335 248 1374','sgreathead9p@apple.com',10,6,14);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (894906,'547','Linklinks','57 Express Center','1370','','554 164 0747','bmcgilvra8n@soundcloud.com',5,6,6);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (895433,'774','Trunyx','79787 La Follette Plaza','4369','','380 149 9150','mkirdschce@ebay.co.uk',6,2,15);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (896027,'59','Edgetag','32555 7th Court','7982','P3L','690 950 6414','tcarnierck@nifty.com',7,3,6);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (899377,'582','Devify','7386 Bunker Hill Pass','1861','151609','573 702 8768','pfidal1a@bing.com',9,8,10);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (899663,'398','Meeveo','32 Hovde Terrace','1840','','160 838 9264','bklementzkp@addthis.com',11,9,12);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (901583,'717','Talane','8 Hooker Park','9138','601120','665 252 7985','alileyf0@sphinn.com',23,9,4);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (903191,'152','Buzzster','3 Browning Point','4619','','970 148 1478','adeleany@yolasite.com',9,8,10);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (905053,'733','Ooba','1428 Acker Hill','172','87066 CEDEX 2','530 621 2840','ggrace5p@deviantart.com',23,3,4);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (905815,'638','Voomm','020 Sachtjen Junction','8004','','914 327 2671','cbecerro8l@chronoengine.com',12,7,2);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (908255,'350','Eazzy','6 School Lane','8085','','264 513 2412','bleydon99@google.ru',14,5,3);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (910904,'891','Digitube','860 Graceland Junction','1145','1103','367 499 9121','snewey3@upenn.edu',10,5,6);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (910931,'699','Gigashots','5991 Valley Edge Center','9296','','521 854 5434','snuemannx@ft.com',3,6,10);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (911143,'253','Babbleblab','42165 Warrior Place','3897','','230 991 8133','nmursellfa@yolasite.com',23,4,5);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (911432,'352','Livetube','76 Ryan Road','1440','','511 930 2554','apeppetts@census.gov',4,9,8);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (912978,'621','Kwilith','19603 Springview Drive','1776','568 92','301 787 5237','aharknessfz@sciencedirect.com',18,5,9);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (917732,'540','Bubbletube','3 Fulton Court','9618','1040','665 927 9864','cfranzolimy@tiny.cc',9,2,5);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (918032,'358','Voolith','457 Old Shore Road','1125','665302','586 667 2543','hschustl7i@narod.ru',6,1,7);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (919310,'200','Bubbletube','360 Valley Edge Park','7592','56640-000','855 336 6864','odanko9w@bloglovin.com',3,5,13);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (919486,'805','Dabtype','2025 Hanover Plaza','1068','14000-000','727 310 3058','ohaddacksg4@yandex.ru',16,6,6);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (920183,'976','Shufflebeat','20 Onsgard Street','2624','','902 689 2273','aeilles2v@cisco.com',10,4,3);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (920763,'279','Digitube','79654 Monterey Park','2821','','298 311 3435','hmcgoon1g@opera.com',19,1,4);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (921623,'562','Kamba','1 Valley Edge Alley','3122','','942 987 5777','hosmantes@archive.org',13,3,11);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (923148,'551','Feedmix','3 Cascade Terrace','8652','','180 116 3846','mpalleb2@naver.com',13,2,5);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (924912,'132','Yodel','98 Boyd Court','7438','','550 172 7393','clowselygp@mtv.com',6,6,13);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (926567,'539','Gevee','66154 Huxley Circle','3828','51253','679 584 1461','gcroysdaledg@ifeng.com',23,6,3);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (928553,'250','Leenti','9751 Rigney Trail','8296','5144','308 394 9527','hpechacekle@telegraph.co.uk',10,5,9);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (930778,'200','Meezzy','70 Clove Terrace','3197','','966 944 4377','dsherwillrq@unesco.org',14,8,4);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (931341,'345','Zoomzone','665 Mendota Alley','9962','','393 916 2952','cmcgeachie6@census.gov',11,2,14);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (931663,'94','Lazz','98 Northfield Point','3265','','706 993 8239','rschreinerba@creativecommons.org',11,1,9);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (932151,'708','Devpoint','2 Kim Center','2680','','692 848 2719','ljosipovitz4l@newsvine.com',19,9,7);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (932502,'642','Photospace','95575 Clarendon Crossing','3221','6017','964 642 3357','ggiorgin5@time.com',22,8,2);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (934205,'181','Voomm','3 Twin Pines Road','8859','','447 857 4344','sspearsgk@booking.com',8,6,15);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (936850,'41','Vinte','6 Burrows Parkway','6336','','246 968 6329','wlonghirstd2@blogger.com',25,1,5);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (938603,'970','Browsebug','27 Oak Center','6308','','156 401 4264','jkraftnx@census.gov',12,4,8);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (938806,'754','Youbridge','1 Sauthoff Road','6504','','295 829 4882','mgolsworthy8o@bizjournals.com',15,1,7);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (939684,'769','Jaxnation','327 Lawn Park','4002','','708 568 1620','dgoodladcw@aboutads.info',23,7,3);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (941129,'952','Skibox','896 Fallview Avenue','3327','8118','232 618 6806','fbullmanfu@ocn.ne.jp',11,5,4);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (941831,'832','Oyoloo','52 Summer Ridge Hill','4624','114 79','330 391 7171','pduiguidh4@histats.com',15,2,6);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (942300,'551','Livepath','8245 Sycamore Way','4446','2621','745 264 9979','kovenspa@tmall.com',16,2,3);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (945903,'319','Snaptags','26875 Burrows Avenue','3344','69-210','681 671 5443','gcaddend7@goo.ne.jp',8,4,9);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (946318,'841','Skynoodle','2188 Morning Road','6316','','987 742 3541','bdumbeltonqr@nationalgeographic.com',16,3,7);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (946608,'333','Youspan','791 Nobel Pass','3626','','167 500 1775','bgoodladaz@typepad.com',8,4,8);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (951551,'842','Dabfeed','04 Butternut Way','8730','1602','308 260 8178','psquibef8@zimbio.com',1,5,12);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (954022,'351','Meezzy','47316 Veith Trail','797','','152 444 2645','fmaynardli@g.co',4,1,7);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (956509,'193','Edgetag','383 Lakewood Place','4950','','704 999 8240','mbevissms@constantcontact.com',6,3,9);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (958402,'701','Buzzshare','7189 Pepper Wood Avenue','104','','152 521 8854','nmccrannn@umich.edu',13,6,3);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (962374,'825','Fivespan','64 Roxbury Way','8557','','573 623 8915','bbisphamks@smugmug.com',23,3,13);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (962383,'747','Voomm','89 Di Loreto Circle','4805','','167 896 2786','tpattinie1@com.com',17,5,4);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (963152,'145','Dynabox','7 Waywood Crossing','2116','','927 152 8256','jpiriei1@fc2.com',19,1,13);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (963781,'309','Demizz','3 Ryan Circle','7588','','255 953 1669','vmountfordr4@amazon.de',24,5,9);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (967911,'385','Edgeify','65535 Meadow Vale Parkway','1415','','770 600 6524','ecrallan48@wordpress.com',10,8,6);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (973065,'950','Cogidoo','75020 Luster Point','9957','76-020','853 968 3651','rsperwell4h@nsw.gov.au',25,5,4);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (974118,'896','Voonder','9 Homewood Lane','5675','','799 559 7910','cyeowellqj@fotki.com',17,3,15);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (976187,'440','Jaloo','19 Rusk Alley','3909','6262','444 540 5378','kfoyein@indiegogo.com',24,2,12);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (976209,'488','Photobug','9 Delaware Street','8599','','224 599 3720','bzini6y@tinypic.com',25,9,15);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (976226,'368','Babblestorm','11773 Brentwood Crossing','9126','','788 897 9493','tmelsonad@huffingtonpost.com',13,6,2);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (978700,'333','Riffpedia','0874 Gulseth Junction','6269','','300 294 5183','pmanssuer6m@sciencedaily.com',10,1,8);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (981016,'969','Latz','6211 Welch Place','7032','','170 132 2493','lgaukrodgefq@skype.com',13,5,14);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (984208,'32','Rhynoodle','24 6th Alley','9554','','557 164 1631','sscones2i@blinklist.com',5,2,7);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (984705,'238','Oyope','7 Green Ridge Alley','7314','','279 974 1216','grosenbusch69@biblegateway.com',24,1,15);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (985748,'37','Jayo','7156 Fair Oaks Street','6224','','736 531 6772','nastillix@instagram.com',7,7,14);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (986872,'316','Brightdog','93116 Veith Junction','6432','','912 925 7443','emcqueenl7@homestead.com',4,3,1);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (987000,'840','Camimbo','9 Johnson Place','374','617110','279 160 8097','clarwellbd@prlog.org',5,2,2);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (987609,'825','Blognation','9776 Lerdahl Pass','3350','9222','721 815 7221','jgorgl1c@php.net',15,4,7);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (990088,'421','Jetpulse','6848 Thierer Place','5928','','920 457 7878','efishpooleot@com.com',2,9,15);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (990546,'134','Meevee','3261 Logan Pass','5922','','849 288 9707','isnoddin4w@java.com',16,6,3);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (991649,'9','Voonix','003 Badeau Place','1675','98000','821 861 1376','msallan80@paypal.com',19,7,1);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (992391,'885','Linkbridge','4553 La Follette Way','2715','6185-255','264 127 3688','vfinessydc@skyrock.com',10,1,3);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (993066,'408','Teklist','02 Alpine Junction','85','','314 188 7211','slomis6l@addthis.com',21,9,2);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (994038,'624','Skinix','0892 Parkside Trail','8676','9325-124','639 284 3441','dcalam46@technorati.com',24,2,15);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (994908,'2','Zoombeat','3872 Eagan Road','8822','35160-000','194 960 3116','klapthorne71@ycombinator.com',25,3,6);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (995121,'898','Zoozzy','4 Crest Line Street','1266','687047','113 778 8891','kwandtkeke@census.gov',25,4,5);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (995228,'133','Bubblemix','6 Coleman Pass','4383','','945 965 2724','nfilchakov5z@privacy.gov.au',23,8,1);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (998163,'824','Ailane','860 Harper Circle','1808','55468','882 239 1391','cgerleitq@bloglines.com',8,5,8);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (999103,'384','Photofeed','35 Clarendon Hill','8416','257 01','923 768 2022','mleborgnege@uol.com.br',9,9,13);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (999671,'620','Devify','7522 Mariners Cove Center','4611','','905 441 7852','alaughren5l@salon.com',20,5,15);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (140000800,'1','ESCUELA NOCTURNA REPUBLICA DEL PARAGUAY','AVENIDA COLON 2772 ALTO ALBERDI BARRIO ALTO ALBERDI','2772','5003','0351-4337805','-',7,4,6);


/*Query Insert Into Tabla Docentes*/ 

INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('20007005091','Mack','Hakey',36,'15778960',6,'3794',5,7,134325);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('20015888973','Eadith','Drewitt',40,'38927296',5,'9885',10,2,38058);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('20074247989','Rudolf','Sproat',65,'26754474',14,'9363',13,4,595713);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('20188514148','Nikolaus','Curtois',34,'20998834',21,'3843',3,3,145921);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('20192741481','Esdras','Pendock',33,'32927064',18,'9147',12,5,115531);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('20202605822','Rhys','Pardi',64,'38601531',10,'3805',4,3,468642);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('20231064092','Peri','Storres',27,'23181325',23,'9458',13,7,938806);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('20232576510','Sigmund','Fairbank',53,'32256056',17,'2281',10,4,364409);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('20239124950','Hadley','Clerc',54,'32748766',4,'3766',3,4,883970);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('20239129027','Rickie','Gorelli',25,'36228909',4,'8882',1,4,856232);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('20257313518','Shurlocke','Saltmarsh',58,'34585091',23,'3646',10,7,472894);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('20262037391','Jerrylee','Swire',20,'30717086',17,'8053',12,4,733146);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('20262379245','Alic','Sturgeon',40,'35761995',20,'9395',13,1,826754);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('20270916692','Elisabeth','Pettifer',43,'22029716',10,'7214',10,6,190269);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('20315339873','Benny','Sly',42,'32148006',7,'5615',4,5,416185);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('20328249425','Quincey','Swate',49,'28787258',16,'2048',14,5,370211);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('20337905848','Raf','Tireman',65,'18187636',14,'2584',1,2,994908);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('20347553113','Broddy','Zupone',49,'15494888',15,'1064',9,3,36267);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('20386677246','Liuka','Kelbie',43,'23193636',1,'1839',12,6,291577);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('20387909156','Joan','Lascell',21,'18574009',19,'3631',4,2,413986);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('20402841207','Georges','Celler',41,'31686013',6,'3009',10,7,284248);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('20403810472','Jerald','Brixham',59,'24708932',22,'7182',12,4,553277);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('20468164927','Darin','Pilsbury',43,'39217218',17,'5663',11,4,470702);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('20495687649','Jacintha','Gudyer',20,'35487981',6,'7417',6,2,892515);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('20538688912','Joete','Angrave',43,'26940797',9,'3439',11,3,274876);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('20571548562','Hilly','Hum',60,'34749883',29,'2700',13,1,305071);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('20572590499','Lise','Avramovsky',27,'33121638',30,'5616',8,2,693402);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('20587751025','Ines','Dunkerton',59,'22120859',27,'2145',14,3,626724);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('20622698727','Cecilius','Kuban',26,'25742400',16,'1404',1,3,280296);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('20629588370','Had','Angless',60,'35054306',26,'1065',10,7,6261);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('20686549421','Hy','Darycott',33,'30552612',27,'4771',8,3,401882);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('20728686484','Noll','Poyser',52,'37547914',29,'2169',15,7,344361);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('20874225434','Gertruda','Yeliashev',46,'22563922',19,'9047',15,5,995121);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('20890654041','Durward','Koubu',27,'15952473',25,'3279',10,2,593346);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('20916966818','Sheeree','Dibbert',56,'16183948',5,'5233',3,1,236331);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('20942046724','Rinaldo','Hatherleigh',63,'23675362',3,'6596',1,6,663605);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('20954574782','Levi','Downes',23,'31908139',11,'8044',3,1,462479);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('20960329005','Andrei','Walshe',56,'36045299',19,'1213',7,7,20707);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('21026757921','Gradey','Baggallay',39,'34048833',20,'5613',3,6,500256);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('21028621709','Lucias','Haverson',27,'34930928',23,'1578',4,2,508893);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('21036594304','Jeanie','Drugan',48,'29119577',21,'7691',2,3,237088);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('21074211066','Hanni','Buckner',42,'27286002',19,'2341',4,7,307953);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('21081172210','Cobbie','Treasaden',48,'31759886',16,'4741',15,6,919310);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('21085446629','Carney','Jarrell',27,'16556021',12,'6750',11,3,459169);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('21089959457','Cece','Nuemann',22,'37486356',18,'6426',15,5,239694);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('21105832698','Dannel','Bakeup',48,'32225347',15,'1776',14,6,871592);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('21119031856','Roxy','Kusick',28,'37358031',9,'4492',5,7,632596);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('21151328662','Laure','Kilban',46,'32593031',2,'5916',12,7,756940);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('21178984465','Harold','Hanford',58,'36985678',1,'7761',12,2,850476);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('21204964344','Halette','Stanion',46,'23478902',29,'7793',7,4,911143);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('21209353295','Earvin','Keyte',61,'15564873',6,'6307',7,1,441232);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('21229249121','Leena','Thormwell',36,'29548447',25,'2936',6,5,635623);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('21278635165','Nana','Brinicombe',30,'32958294',20,'4593',15,4,934205);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('21309033346','Marlo','Matous',43,'32399424',1,'5836',6,1,277540);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('21374636310','Marven','Tandey',47,'15743580',13,'5517',7,4,841654);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('21382071159','Lida','Briscam',61,'25968124',4,'8382',11,6,11745);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('21387739051','Ruttger','Korfmann',65,'29028187',18,'5593',3,5,570230);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('21398197816','Tallie','Kevern',55,'37523561',9,'4359',1,2,358092);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('21407671046','Goldy','Balffye',22,'35420340',1,'7042',15,4,291979);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('21415315624','Sibeal','O\'Hallagan',35,'26930334',21,'6126',13,5,773900);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('21452519627','Kaitlyn','Dallosso',22,'39449443',8,'1483',7,6,829622);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('21452856260','Ardath','MacAnelley',55,'36473834',26,'5781',11,5,487781);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('21462828435','Eldon','Greim',55,'30305571',11,'2004',15,6,141713);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('21561213704','Marice','Mattin',35,'33439753',11,'7987',7,3,88426);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('21577913301','Gabbie','Rein',47,'19781204',11,'3143',2,7,422060);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('21608795785','Gaylene','Ciottoi',25,'21797421',25,'9976',4,3,257926);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('21611404362','Stacie','Baiss',46,'34973926',10,'9552',5,1,962383);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('21611898846','Jeddy','Diego',30,'18917347',17,'5723',12,2,165596);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('21664289855','Arlen','O\'Deegan',35,'34548639',9,'8231',9,4,55970);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('21668387860','Nara','Goode',62,'38196647',25,'9610',4,2,797379);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('21692091855','Conny','Huxstep',58,'19055635',15,'3230',5,5,307337);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('21692868928','Linnell','Oloman',45,'17502118',18,'9195',11,1,333942);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('21714125389','Chuck','Verissimo',32,'16015541',5,'4675',4,5,297713);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('21729759408','Madeline','Rampley',24,'24992918',5,'7952',3,4,910931);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('21770933523','Myrilla','Sudran',25,'37240990',16,'5634',5,3,28293);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('21797487860','Philis','De Luna',30,'19300283',7,'1236',9,1,200360);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('21800987157','Carolan','Cussins',30,'32329549',26,'2465',3,7,533291);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('21813809421','Brant','Rackam',58,'35521671',29,'6754',5,3,321105);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('21828649088','Orsa','Street',41,'38581405',5,'4329',2,2,365295);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('21915959464','Cybill','Zolini',21,'21630922',24,'9922',13,1,212589);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('21937436259','Laurel','Briatt',26,'24129067',12,'6294',7,4,211099);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('21960944279','Burnard','Priel',29,'22357061',24,'6150',4,6,740611);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('21982199655','Janeen','Papierz',34,'33457307',9,'3824',6,4,193148);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('21991507262','Jaquenetta','Brenton',64,'28308069',27,'1535',4,1,466796);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('22008926243','Mariel','Stovell',31,'31975796',4,'5409',4,1,181738);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('22017806189','Shaylyn','Gerardi',38,'32539398',8,'7259',2,1,871317);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('22025427949','Niko','Roff',56,'28377504',8,'5202',3,2,621347);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('22036423239','Merna','Bywater',58,'16453226',20,'8224',10,1,846833);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('22038086255','Josefa','Beaument',55,'19405587',11,'5104',7,3,781899);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('22058119279','Elizabeth','Wasiela',60,'32280422',28,'6288',9,3,976187);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('22084816423','Sheba','Aslin',43,'15137132',19,'7424',11,2,986872);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('22088758761','Shirline','Terzi',48,'22960088',15,'2194',6,6,115204);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('22091397322','Ariadne','Drezzer',47,'23633718',25,'2543',11,4,503249);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('22111295707','Dido','Bertholin',45,'20990975',11,'9997',7,7,798318);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('22124546464','Othilie','Otham',27,'34898228',21,'9843',6,3,133622);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('22144476566','Bill','Dodsley',27,'21737582',21,'7637',15,7,47762);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('22168255259','Quintina','Hugueville',44,'23655631',6,'9434',1,5,210617);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('22196593133','Danni','Menzies',42,'32259941',3,'8509',2,7,874604);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('22247250180','Saleem','Bastick',65,'24496826',17,'7563',14,4,985748);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('22256144089','Reinwald','McGinny',44,'38423491',11,'8784',10,3,33775);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('22276759480','Sula','Crumby',35,'36221746',2,'3313',12,2,696758);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('22330954519','Maurie','Moxom',23,'19314680',11,'3194',15,3,769283);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('22355930825','Aleta','Spraggs',25,'36339959',15,'1405',8,6,738541);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('22378623438','Reeba','Coggin',30,'28229950',28,'8347',15,3,342620);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('22403458894','Kai','Eastham',57,'22436848',3,'9979',7,2,613184);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('22410071911','Ashton','Espinas',23,'34638454',7,'1899',8,3,372375);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('22498565729','Christean','Bayman',55,'37301107',4,'3714',7,3,880698);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('22513933328','Kevan','Cuttles',51,'35647326',21,'1016',1,2,105349);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('22548466203','Angel','McLewd',28,'37806931',15,'4511',10,4,300116);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('22584897885','Willi','Pargiter',33,'33928880',24,'4926',3,7,109145);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('22595787508','Dal','Cestard',40,'23060822',18,'3133',14,3,700035);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('22648155691','Kaja','Heskins',39,'23431107',23,'9485',2,7,702486);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('22660055939','Fidelia','Sweetland',56,'21852104',28,'9401',2,3,456644);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('22660689995','Bernarr','Lamartine',40,'29383804',18,'3245',10,1,403089);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('22663811737','Wernher','Stiller',27,'35159054',28,'4027',8,2,62757);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('22681009693','Emerson','Caughtry',27,'17975777',15,'1708',4,6,618084);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('22731030136','Thaxter','Gaskoin',62,'30582792',10,'2823',12,5,253608);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('22762795466','Laurette','Geator',28,'37179898',6,'3836',13,2,260869);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('22763369129','Ram','Adamovitz',61,'39217898',14,'4369',12,6,355665);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('22783726564','Randa','Harrowsmith',47,'33933933',30,'8308',6,2,847030);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('22833580084','Brandise','Dominelli',63,'24004628',3,'8711',2,3,287790);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('22848998789','Tye','Dunkerk',50,'18692379',12,'1279',13,3,987000);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('22857762946','Dulcia','Cowin',30,'19187313',6,'5501',11,7,845632);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('22888258761','Aubrey','Woolgar',39,'21602244',27,'7822',15,6,398874);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('22938362590','Sallyanne','MacBarron',35,'34879109',28,'3056',1,3,225598);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('22998916642','Alex','Hammer',41,'32135800',15,'5076',10,2,7015);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('23013282053','Eugenio','Simmonett',47,'33613708',23,'8863',10,3,509053);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('23030130173','Vergil','Oldis',32,'34132546',2,'6150',13,6,763579);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('23052545880','Malissa','De Ath',54,'23340801',23,'6621',6,3,410250);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('23103942438','Prudi','Allridge',44,'25421742',11,'6823',13,4,175951);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('23142516233','Myca','Hydes',29,'25907319',29,'4753',15,3,905815);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('23150965934','Amanda','Branney',39,'21973478',26,'2689',11,1,828954);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('23156078449','Cross','Stenet',38,'24277838',4,'4223',13,2,946608);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('23163880689','Melva','Matissoff',51,'16129260',23,'3267',6,3,525117);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('23179831605','Enrika','Rathbourne',42,'37443080',18,'1261',5,7,205210);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('23186542127','Mano','Marti',25,'34528064',19,'7106',15,3,51978);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('23197168327','Rodrigo','Ceci',52,'34902179',3,'7382',9,5,61719);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('23297711169','Jennica','Maunders',64,'25461724',2,'4234',8,5,843455);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('23341266988','Magdalen','Gilardengo',36,'17657850',6,'5004',14,7,756913);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('23351375454','Innis','Buyers',25,'15015548',19,'3728',4,5,739995);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('23363507938','Ruthe','Dugood',42,'27232785',14,'1842',9,3,892269);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('23401963051','Carree','Bezzant',24,'16998538',8,'7870',14,1,760192);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('23405503350','Penelope','Attewill',49,'20747467',9,'6061',11,1,496059);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('23439968924','Darnell','Cristoforo',48,'34593744',21,'2054',3,4,699573);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('23445034872','Tommy','Grgic',43,'39396698',20,'7509',11,7,867599);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('23498677458','Roosevelt','Ceschi',23,'29883977',9,'9149',11,3,114480);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('23501562795','Vidovic','MattiCCI',25,'24737932',5,'7038',2,3,63726);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('23515367912','Vasilis','Barlee',56,'15546996',10,'4458',9,3,355922);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('23519626769','Belva','McDonnell',40,'19823619',26,'7895',9,1,140770);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('23563705156','Meredeth','Sully',44,'26022624',6,'9870',6,1,336078);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('23571195296','Symon','Kiley',33,'35293495',28,'5136',4,7,536809);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('23586248091','Dall','Prigmore',48,'36359908',3,'4160',11,2,135418);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('23597940378','Heda','Landsberg',60,'26655078',13,'4114',1,6,27332);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('23599778044','Lettie','Double',26,'33165577',1,'6760',13,7,762521);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('23654964150','Rachael','MacFadzan',52,'19174262',1,'5722',12,3,565800);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('23663492237','Earl','Roja',50,'24852990',9,'8125',13,7,668607);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('23669190394','Dee dee','Wheatcroft',46,'35794696',25,'8343',10,5,845583);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('23750013171','Ernest','Curlis',30,'33401876',12,'8439',2,6,365505);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('23789893917','Kakalina','Neachell',54,'15941917',28,'8387',14,6,156287);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('23799592510','Joy','Emblem',53,'26895513',6,'5102',10,5,231620);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('23815712697','Beckie','Iacobacci',44,'18020836',16,'8639',15,7,740199);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('23863415146','Brewster','Fidell',60,'35442787',30,'8025',5,4,876292);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('23868105006','Brady','Pafford',41,'35241953',21,'3011',4,6,987609);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('23874410592','Carola','Lasham',30,'16717442',3,'1484',11,7,136176);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('23947900060','Gordy','Lyngsted',56,'35670591',7,'2480',7,6,545560);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('23994946104','Tadeas','Ondrus',51,'23937602',7,'9917',2,4,60976);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('24008501857','Samaria','Kirdsch',61,'24403140',13,'8863',10,7,580128);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('24013416968','Kathy','Schoular',65,'16159077',13,'8464',4,7,603434);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('24040291677','Harry','Belden',54,'17676095',4,'2755',1,2,123424);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('24040636455','Lexis','Thurner',52,'21252944',26,'6970',2,4,654797);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('24053446190','Adiana','Gartin',20,'18050417',19,'4204',4,6,870282);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('24091892363','Joanie','Stennet',60,'39161233',2,'2088',15,1,547409);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('24142946693','Jarrad','Flockhart',45,'39726328',9,'4539',14,3,535326);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('24152002768','Deeann','Macrow',56,'15055880',12,'1786',12,6,80106);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('24181765492','Jaquelin','Mobius',59,'32801245',13,'9158',11,7,210120);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('24218568000','Laure','Inker',41,'24437345',30,'6235',10,1,223657);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('24236886922','Burch','Grigoryev',24,'25037819',21,'2526',5,3,62438);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('24259402784','Davide','Eberz',31,'36064370',1,'1837',11,3,119871);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('24313974355','Shela','Fincham',65,'28737667',22,'3087',4,3,98929);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('24348680839','Laurette','Longhorne',55,'29385368',17,'5563',11,6,136889);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('24383603682','Pippy','Osbidston',47,'30346564',23,'2245',10,2,556380);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('24396976606','Annnora','Regi',44,'37183828',29,'5255',5,6,809277);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('24399405866','Izzy','Hughman',29,'23629220',16,'9442',10,5,308984);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('24424260699','Toby','Hortop',64,'15987405',22,'1088',14,5,725223);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('24438867771','Linell','Mawdsley',39,'36026885',19,'5221',14,2,220447);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('24447357370','Brandyn','Huke',53,'25972211',29,'8244',13,1,692390);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('24462881441','Carlynn','Cruce',41,'35822925',28,'5096',15,2,587593);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('24487779763','Angy','Hourigan',57,'35385467',15,'7169',15,2,822545);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('24498325807','Adams','Croot',39,'35592701',6,'4812',5,2,174351);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('24509318779','Doralyn','Hegg',31,'27287266',7,'9156',12,4,269751);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('24514214972','Ignaz','Fouracre',56,'27792030',17,'3486',11,6,200277);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('24535158051','Ilysa','Mayhead',33,'21435777',6,'6473',5,6,329214);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('24549008516','Lesli','Maccree',41,'35060428',17,'5728',5,4,538527);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('24555620162','Marjy','Hanscome',50,'31767216',8,'5094',8,2,295799);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('24560685665','Merrill','Routhorn',55,'26295531',9,'8991',4,2,185203);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('24649399830','Shurwood','Corzor',39,'36948960',26,'1615',14,3,318963);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('24696114781','Krispin','Louch',32,'37829613',26,'3559',1,3,281107);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('24702566478','Tove','Kardos',52,'31323973',25,'9885',5,5,874126);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('24719525142','Reilly','Rehm',54,'19475008',12,'6203',8,1,111617);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('24721448601','Abby','Danzig',48,'20669184',4,'2549',15,4,676570);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('24722031815','Maurine','Pray',40,'37232007',11,'4108',7,4,69710);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('24736828463','Rosalyn','Parysiak',61,'19605258',17,'6453',2,1,446652);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('24786394265','Jonathan','O\'Driscoll',38,'27047471',16,'5112',8,3,259985);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('24793025080','Ettie','Bowsher',21,'30016353',25,'4253',13,1,24717);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('24805475910','Rosalie','Addess',44,'29194433',5,'5853',1,5,956509);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('24858898211','Hildegarde','Tybalt',25,'33693820',7,'9306',1,3,951551);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('24885680799','Germaine','Lutman',61,'35581336',6,'4209',1,7,871707);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('24898751045','Gaile','Anselm',63,'28788152',18,'2344',1,5,410676);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('24933507725','Alair','Aleavy',51,'37369934',1,'3581',3,4,537952);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('24939209119','Johnny','Rennolds',62,'27999554',14,'9445',13,2,687740);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('24967832057','Drona','Campkin',37,'27566531',12,'6653',5,6,409230);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('24987957975','Lavina','Ronchka',44,'21492858',4,'9102',3,4,136414);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('25021934387','Honoria','Blasetti',25,'30849708',5,'2829',14,6,341577);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('25039990361','Goldia','Dorgan',31,'36910757',28,'6272',8,4,405449);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('25069109966','Forrester','Thorowgood',42,'33614522',14,'2446',14,2,939684);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('25104703289','Gunner','Cammidge',28,'16970516',10,'1166',6,4,783658);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('25230604682','Veronique','Gatchell',55,'18081971',26,'8748',13,5,640198);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('25237376782','Dominica','Doornbos',49,'39752563',7,'4245',9,1,76074);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('25252421282','Sergent','Bowdery',43,'33556656',30,'3915',3,7,430046);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('25268025965','Michaela','Kinghorn',60,'20104926',23,'9911',2,1,421078);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('25277711209','Lani','Joinson',34,'20091869',10,'9554',2,4,785491);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('25284068003','Dodi','O\'Suaird',50,'17741979',11,'6244',3,6,862069);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('25317646848','Rudolfo','Shelvey',64,'26859449',20,'8428',2,3,281300);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('25319364495','Vic','Hooke',45,'27523211',2,'3566',10,6,847558);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('25342895939','Hermon','MacCole',47,'28707335',23,'1689',10,7,143742);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('25352858602','Meryl','Furmage',49,'38964843',25,'9116',6,5,612525);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('25372650763','Elke','Avery',30,'38020908',18,'5335',6,3,447516);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('25436286916','Elvina','Dutteridge',50,'39238796',17,'7825',7,7,833704);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('25477210160','Paulie','Duchesne',46,'32749169',6,'1953',13,2,829871);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('25496780062','Nanny','Aldham',29,'20003188',6,'5223',15,6,468708);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('25499723019','Tynan','Gamell',43,'38934632',8,'9432',6,4,516194);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('25516559147','Faun','Sickert',20,'24507597',8,'5113',14,3,859260);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('25564473017','Umeko','Moughtin',50,'27008354',2,'2747',11,6,911432);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('25574630797','Waring','Hackforth',56,'29426683',2,'9227',4,5,802067);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('25584869536','Alexandrina','Lindenstrauss',44,'37457007',7,'7834',7,5,200412);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('25608268134','Danie','Gilham',58,'32718438',28,'9444',5,3,540318);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('25619330913','Nanette','MacDermand',38,'22201343',30,'6164',10,6,978700);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('25638728295','Gwennie','Jaggs',50,'34495347',23,'5658',13,6,729800);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('25643430914','Prisca','Brackley',27,'31992090',4,'5484',1,7,151781);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('25676923329','Gaby','Kasperski',41,'17407841',18,'8741',11,7,893332);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('25691097126','Harriett','Pidgeley',41,'32683071',2,'1730',8,1,999671);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('25726231482','Stanislas','Roalfe',37,'38344404',21,'5328',12,3,449431);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('25735968385','Cybill','Kensley',61,'18774824',1,'5708',10,4,962374);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('25758862193','Bell','Rackstraw',42,'22784419',12,'5294',1,7,28202);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('25802609893','Eadie','Wheatman',64,'17642351',11,'8125',10,1,830272);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('25843235009','Latrina','Gligorijevic',58,'22787679',21,'6396',6,5,899377);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('25843940901','Artus','Sabatier',47,'39296349',23,'7456',14,5,295156);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('25844946208','Morly','Matussow',63,'21603968',1,'1566',3,5,785716);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('25869246948','Alys','Marler',33,'35151757',8,'3865',10,5,9954);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('25873980411','Ermentrude','Seamon',59,'28705764',21,'3611',1,4,517235);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('25883507181','Charis','Verity',27,'39051720',3,'4691',12,4,406564);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('25894365435','Melantha','Caroli',57,'39575002',14,'8282',4,3,490761);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('25929746287','Tony','Powelee',48,'37786238',1,'6470',6,5,514970);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('25941827109','Germana','Puttock',46,'24400620',22,'5384',14,4,991649);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('25965198061','Ginelle','Maundrell',64,'24864475',1,'1931',9,3,926567);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('25967923045','Eveline','Dagnall',35,'16263094',16,'5901',15,5,425811);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('25977668144','Bartholomeus','Townsend',49,'33868059',26,'7488',7,5,582309);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('25979025296','Isobel','Dunbavin',48,'15340967',9,'1302',15,4,538932);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('26049004157','Alleyn','Aime',24,'29233999',12,'9751',6,7,461573);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('26071888829','Jeniffer','Mault',65,'37161171',28,'3778',11,1,505379);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('26112740524','Trevor','Corzor',56,'19028864',18,'3820',8,2,548314);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('26118625760','Fayina','Janusik',64,'33961377',28,'1086',12,7,731593);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('26131807495','Ardella','Sutterby',33,'18872531',17,'3131',8,7,466492);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('26144406817','Cariotta','Randal',34,'32582593',16,'5791',13,1,686150);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('26163298420','Talya','Kilpin',34,'20279691',27,'7126',11,6,404837);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('26176948534','Sheena','Slesser',32,'33036084',14,'7955',11,1,153796);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('26182018413','Dori','Kearley',22,'29114661',12,'4867',15,2,602873);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('26245451037','Farand','Keune',51,'26419901',19,'9136',4,3,463498);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('26249531156','Inessa','Candlin',42,'22577122',26,'7058',11,1,359276);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('26289056742','Kikelia','Juste',39,'19491661',13,'2433',6,6,629552);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('26300882946','Ashlen','Butterly',62,'38486188',10,'1015',9,6,874884);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('26315312283','Concordia','Boken',59,'15196750',21,'7099',9,2,290687);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('26338276068','Miles','Normadell',23,'24247800',27,'8624',10,1,156034);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('26350583201','Thekla','O\'Tuohy',29,'36205481',30,'2874',12,1,942300);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('26377082025','Anita','Crampton',35,'26850867',9,'2826',1,4,993066);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('26428633983','Courtnay','Challenor',31,'26435137',15,'3867',3,5,292035);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('26432554095','Cariotta','Vasechkin',62,'32335169',7,'4856',8,1,681082);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('26453174987','Alexis','Perroni',53,'34658277',21,'1739',14,6,194759);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('26469857663','Trueman','Stanney',30,'38025819',6,'9853',7,4,570281);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('26526499413','Faith','McGibbon',48,'17820453',22,'1287',7,7,344386);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('26531822693','Romy','Tappor',23,'18675146',22,'3820',5,7,19332);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('26547537314','Giustina','Tyght',25,'26225260',28,'6075',13,7,478482);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('26555721853','Jeane','MacCarrick',27,'21710358',24,'9584',3,7,891287);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('26563315436','Jojo','Alyukin',35,'32378295',23,'5639',10,4,512196);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('26597144062','Javier','Rutherfoord',50,'28634815',11,'3661',10,6,13383);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('26601719946','Taddeo','Laxe',33,'22511384',6,'7799',5,7,87954);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('26626319427','De witt','Ickeringill',20,'19319912',27,'2544',7,1,40704);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('26645372796','Tannie','Falconer-Taylor',45,'28910415',26,'8545',10,6,116186);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('26666529266','Nye','Hartlebury',44,'22603798',25,'3502',12,3,263254);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('26671570807','Claudio','Barribal',26,'36606642',22,'4557',8,2,530589);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('26709860726','Zed','Hawkswood',40,'20227736',14,'3306',10,3,611889);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('26719633421','Korella','Gallone',42,'21101250',28,'9024',11,6,336233);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('26730427811','Jade','Sustins',49,'17994286',16,'8208',3,2,261368);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('26781620829','Venita','Dwyr',55,'27495330',20,'9744',5,4,826373);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('26791321579','Roselle','Earie',54,'17612081',25,'4833',6,2,381259);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('26850677375','Adrian','De Hooge',53,'17819390',6,'3408',12,3,373888);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('26853254523','Kiri','Eyton',41,'18521016',13,'4234',9,7,824286);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('26888425248','Donny','Allender',34,'27739261',7,'2193',4,2,55986);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('26899397836','Tailor','Janjusevic',31,'36630797',11,'1226',10,7,574345);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('26938805376','Decca','Timmons',64,'21638253',26,'8331',10,2,984208);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('26985421987','Britt','Golding',53,'29382024',14,'3191',4,5,850621);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('26986452972','Hymie','Vasin',44,'19409821',27,'6613',12,4,614359);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('27004595801','Rubia','Grishunin',42,'20545052',7,'9763',1,4,963781);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('27059468045','Lonee','Gatch',32,'18217899',22,'2329',15,5,162585);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('27070128709','Benjy','Beste',57,'17255805',1,'1406',10,1,607223);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('27078047533','Zorah','Moriarty',40,'30594817',26,'5834',14,3,202735);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('27101371269','Windham','Leyman',26,'37166313',5,'5464',14,7,659141);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('27128861468','Lamont','Alliband',59,'33582540',7,'7925',4,5,541049);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('27144218703','Sutherlan','Rivalant',65,'29708714',10,'9764',12,5,590336);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('27162934491','Martha','Ekins',20,'39351265',7,'1143',10,5,79374);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('27176667156','Mort','De Marchi',64,'30677754',11,'6112',15,3,521101);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('27179668516','Parsifal','Domleo',42,'28498431',22,'4296',3,7,426828);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('27194245621','Reynold','Assard',45,'22728075',10,'1716',9,7,771663);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('27212425235','Lurleen','Oldcroft',50,'33887843',17,'1510',11,7,30409);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('27220416075','Cathrine','Rizzardi',63,'25249329',12,'8394',13,5,51135);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('27232767117','Felicio','Fozard',37,'16025870',11,'5094',6,3,602493);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('27264449438','Tracy','Demkowicz',54,'25607638',5,'6869',11,7,222080);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('27291506563','Dwayne','Jenken',28,'28117709',11,'7278',4,3,539582);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('27317821394','Ilario','Curness',53,'35634256',25,'2592',10,1,717271);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('27370010687','Elka','Sacase',36,'18023024',12,'7958',11,1,204760);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('27403299754','Irma','Shewsmith',21,'36274576',26,'7904',9,1,531200);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('27509300542','Bert','Wesker',36,'19394260',29,'8405',2,3,11020);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('27552263933','Reta','Lewsie',59,'38567096',26,'8544',4,1,754950);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('27555001820','Alyss','Camm',37,'39097011',14,'6576',5,5,325951);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('27584395807','Padgett','Clark',39,'26674450',27,'2121',1,5,990546);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('27613227644','Jada','Botton',60,'26311478',7,'5779',9,5,666881);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('27618168959','Graeme','MacShirrie',25,'33340975',2,'4336',14,4,992391);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('27627758684','Alfy','Lingard',27,'23732901',14,'8348',13,2,411141);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('27697198879','Clair','Jansky',41,'35209302',11,'7072',13,1,642011);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('27725062554','Dorelle','Gerald',37,'32274699',16,'1312',12,4,741075);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('27734405986','Holden','Gerry',53,'33267458',23,'4205',4,4,562797);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('27786301123','Darci','Bussey',33,'27098530',26,'9476',6,1,731394);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('27789469159','Thomasin','Angelo',53,'16065485',28,'3534',12,7,9542);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('27792827356','Penelopa','Bignal',49,'21964427',7,'9494',9,3,777390);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('27818336328','Kiri','Olley',45,'18668305',23,'3824',14,4,324232);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('27844886072','Dael','Leas',53,'37588713',7,'1501',1,6,881397);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('27851025301','Kellina','Bardwall',65,'23651571',11,'3859',7,1,919486);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('27884075889','Peg','Colum',38,'28362489',13,'7411',11,3,281315);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('27888304428','Mariquilla','Adamik',21,'23673285',14,'6173',11,6,905053);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('27930095462','Reynold','Roskilly',41,'21097322',4,'6994',13,4,744243);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('28010418282','Ki','Emor',46,'29631249',15,'9330',6,7,793062);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('28088309503','Philis','Calam',25,'32408853',27,'5661',10,6,764715);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('28103121004','Octavius','Balham',20,'26421598',29,'5563',2,1,225342);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('28131717098','Devin','Onions',45,'32317674',28,'1113',2,3,369252);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('28139559675','Elena','Cattonnet',61,'31282119',10,'6882',12,7,990088);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('28142238499','Darlene','Gooderick',26,'25332568',20,'6673',4,6,727400);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('28143185166','Randa','Hacking',22,'30036025',4,'7897',3,2,717673);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('28161303777','Vina','Enoch',24,'16311041',14,'4006',11,2,793723);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('28163015608','Nanette','Monkleigh',45,'15940420',20,'8797',7,2,408288);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('28174292989','Amity','Churcher',35,'35744711',10,'3996',13,3,382508);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('28216370000','Harper','Lambotin',62,'33907940',4,'4646',6,5,946318);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('28269151122','Traver','Eustace',56,'21940984',7,'5875',6,1,739741);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('28306190178','Adolphe','De Ferrari',59,'32042165',9,'7109',7,7,646322);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('28356120313','Brigg','Blundin',38,'32775745',15,'2040',15,7,342253);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('28405405307','Devy','Jeppensen',35,'24063542',19,'9872',4,5,424801);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('28418676356','Oralie','Oloshkin',52,'29831366',18,'1204',10,3,277854);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('28476737007','Mauricio','Syphus',28,'23314292',19,'1027',1,5,853110);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('28482968638','Keane','Cummungs',61,'35056208',27,'6663',7,6,57176);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('28497593193','Karlotta','Presley',60,'15895575',19,'2614',8,4,300921);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('28531234025','Blithe','Tennet',61,'27930561',12,'3711',5,2,680340);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('28589902198','Rene','Vaines',45,'23712382',4,'4945',8,5,562452);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('28596349502','Rochette','Chevalier',40,'26268125',16,'5666',6,3,465057);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('28600361948','Keelby','Meas',64,'23807441',19,'9111',2,2,127123);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('28672953123','Cherilyn','Brachell',22,'28487386',8,'6594',7,7,483455);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('28695427895','Kaylil','Dolling',47,'33154879',3,'5210',12,3,744438);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('28703117866','Wolf','Gavaran',20,'34406159',28,'9545',7,2,21210);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('28730456860','Philippine','Sapsed',31,'27965937',13,'4118',3,1,781613);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('28746818202','Carolee','Gambell',50,'28991647',20,'5503',11,3,370888);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('28776448239','Sella','McNair',54,'38383257',3,'2820',2,2,345793);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('28874587886','Royall','Bockmann',26,'37506348',1,'9977',1,5,597297);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('28893110391','Orlando','von Hagt',25,'24799686',20,'6168',3,2,142043);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('28931434946','Homerus','Tuff',46,'31981035',27,'6351',1,4,930778);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('28963743740','Valaria','Treadger',53,'37516881',30,'9429',7,5,437588);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('28965323716','Clevie','Gerner',58,'24665720',4,'3506',2,7,606538);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('28966132849','Kilian','Colson',56,'32949599',26,'7272',2,3,468524);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('28968390155','Nikolaus','Spring',40,'39786896',8,'6132',8,4,552014);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('28980739322','Stacee','Janning',64,'29938903',28,'8615',8,3,396488);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('28985748264','Cathrin','Myrick',48,'33053529',14,'4245',15,2,195417);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('28989891772','Shermie','Saunier',24,'16919279',24,'2916',2,4,484519);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('29036933794','Hephzibah','Vass',59,'38197237',2,'5055',8,7,753661);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('29056630706','Barty','Tacker',51,'27683144',12,'8430',15,7,522697);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('29063008645','Urbano','Dowles',55,'16553122',2,'9214',1,3,809372);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('29102024117','Faber','Essel',29,'31404017',21,'7955',5,5,393346);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('29109341866','Vi','Sherston',52,'34066876',14,'5979',4,4,795043);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('29118358860','Caty','Halegarth',23,'33190879',30,'8284',7,5,295054);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('29148313730','Adey','Woolnough',42,'34981520',19,'9370',5,3,158006);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('29167537196','Andy','Wooderson',57,'30900178',20,'2793',9,3,578612);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('29223541752','Becky','Buswell',31,'17244944',23,'4125',4,1,275750);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('29264577894','Kelcy','Currey',55,'34664393',11,'4382',3,5,350077);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('29264978939','Hilde','Leyton',24,'19210647',26,'9498',9,5,87051);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('29276534501','Ebenezer','Lugden',27,'29102048',19,'2291',13,3,6220);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('29299108668','Tedmund','Hain',31,'26268537',10,'1992',2,4,698443);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('29303200718','Daven','Woodruff',48,'38910251',23,'4652',1,6,68157);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('29313789765','Kimble','Manser',53,'22920310',22,'4455',12,2,907);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('29338383034','Lesli','Dell\'Abbate',55,'26907919',15,'8961',3,6,442877);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('29379828857','Chrisse','Jandel',23,'29663248',19,'8577',10,4,241192);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('29390164413','Sergeant','Tuckerman',51,'20913789',19,'5874',10,1,10823);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('29407044296','Phillipp','Harrisson',42,'25935356',9,'7474',15,6,958402);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('29428115883','Meggi','Frizzell',39,'26265013',11,'7420',1,7,954022);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('29459794135','Cynthea','McGlade',51,'39435662',18,'7146',12,6,31391);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('29468338425','Towny','Papachristophorou',45,'26856483',18,'4051',9,3,853915);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('29519280695','Dennison','Ebbage',44,'37160826',12,'8239',5,7,722086);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('29525101216','Dun','Holleran',32,'31989464',2,'4649',13,6,161672);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('29529678548','Eloisa','Nesbeth',49,'34804975',8,'4686',7,1,346502);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('29530812867','Elli','Aikin',45,'21205985',5,'5714',8,4,609978);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('29572940257','Rubie','Sloegrave',29,'16090996',20,'6196',14,5,32352);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('29649029744','Erasmus','Rigardeau',42,'15279461',11,'9969',6,3,324833);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('29659932591','Rosabel','Glencrash',45,'36868191',15,'4122',15,2,908255);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('29730440945','Rheta','Jozefczak',46,'32022659',23,'8662',9,3,844985);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('29771013139','Rheta','Handrick',41,'24608269',30,'8030',12,7,333335);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('29780328756','Kliment','O\'Skehan',42,'22195182',1,'4867',4,1,40805);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('29837898229','Toddy','Kenwell',56,'36789300',19,'2909',8,5,866481);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('29858738694','Cybill','Blackaller',22,'34329176',11,'4007',2,2,4380);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('29862134093','Pedro','Rockell',55,'26632465',20,'9774',3,1,614740);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('29889008268','Rafaela','Hurcombe',33,'23407740',30,'8555',2,7,327993);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('29924594464','Nanny','Pennycock',42,'18544434',24,'4515',2,7,120194);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('29937353251','Stu','Chartres',56,'37485896',27,'6819',8,5,202460);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('29945238049','Madeleine','Fullbrook',30,'19208167',1,'3961',6,6,298200);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('29963304094','Desmond','Bexon',37,'16782174',9,'2264',12,3,918032);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('30070730565','Padraic','Standage',28,'39592029',17,'8655',15,7,712805);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('30148126344','Jasper','Biggin',26,'24302957',16,'2668',9,2,54185);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('30186162629','Berky','Roebuck',27,'39514997',6,'8793',8,2,30428);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('30213148863','Shay','Cleobury',39,'26773711',11,'3084',8,6,480663);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('30217739186','Corby','McMains',48,'37674061',10,'1709',14,2,305258);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('30232045936','Delcine','Charrette',45,'23944406',9,'8599',13,4,792458);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('30234677138','Delano','Bawle',21,'33155504',3,'2322',2,3,32084);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('30301828264','Rockey','Cake',25,'19623556',28,'5235',6,1,651274);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('30311184205','Laurel','Phizackerly',31,'38961336',22,'1944',3,3,923148);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('30367552686','Christos','Mathan',39,'20844743',26,'2841',14,5,526903);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('30375939406','Luis','Garey',26,'17538327',21,'2935',11,3,196726);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('30377514504','Audra','Prickett',59,'32015058',9,'8375',13,7,775761);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('30393728178','Fabian','McClurg',44,'26720161',8,'6395',1,5,164516);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('30460275257','Horatia','Kohen',59,'33971450',20,'2426',12,4,815577);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('30466554485','Sofia','Shalcros',58,'27365855',27,'2457',12,4,422761);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('30508943260','Addy','Purchon',62,'37718665',10,'7910',5,1,920183);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('30522569920','Leone','Fransson',31,'16501144',29,'8677',11,1,199773);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('30523346973','Vanya','Seeney',22,'20826843',15,'8364',1,6,229775);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('30524039748','Germain','Lygo',29,'37661888',3,'6846',1,6,561191);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('30567058652','Cord','Cassie',41,'33244199',10,'6203',7,1,484308);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('30606506540','Mitchael','Dell Casa',56,'19375565',6,'6600',9,6,469640);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('30626186861','Jordan','Probate',48,'23277653',27,'6542',1,7,433250);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('30628190502','Brande','Doogue',60,'27979296',25,'7905',10,2,924912);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('30646955513','Marshal','Greenly',52,'39425594',2,'8330',14,3,597484);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('30696554631','Garnette','Clapison',43,'18088349',3,'6096',10,1,578108);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('30717172978','Erica','Cree',44,'27216452',8,'1437',4,4,931341);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('30737271841','Shane','McAmish',43,'15053675',5,'3160',10,7,245904);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('30757062612','Alejandro','Olrenshaw',59,'31828893',24,'3029',3,3,518458);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('30768832014','Starlene','McNeilley',42,'35548937',25,'4049',14,3,338146);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('30865536633','Patric','Quinevan',54,'22612939',22,'3596',12,7,787481);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('30865694330','Sheryl','Corrie',61,'25764582',14,'5740',2,7,369003);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('30918187269','Bartholomeus','Greendale',29,'25653048',3,'9089',1,7,159524);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('30948057518','Dory','Limpenny',41,'22870908',11,'4843',12,7,490231);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('31027128437','Hedy','Oak',63,'16915212',1,'8101',8,5,189235);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('31032964198','Suzann','Spendlove',45,'28861949',18,'9218',11,5,58386);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('31038869609','Adelaida','Morgan',35,'39171084',27,'3678',11,5,892921);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('31042338926','Florri','Pley',25,'23728407',14,'1489',1,1,98648);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('31047838234','Alvis','Canario',30,'30350105',16,'4404',7,4,446720);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('31094063708','Clareta','Learoyde',55,'33394414',3,'7778',12,1,282009);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('31111612766','Nicholas','Drake',47,'39526249',3,'7858',11,2,53813);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('31128806720','Tory','Greatreax',62,'28366641',10,'2146',9,1,266464);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('31210154434','Raven','Reason',45,'29957949',28,'5735',2,6,237890);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('31213801863','Lena','Lilleyman',63,'21652298',11,'5737',13,6,941129);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('31215680214','Tonie','Phillpot',60,'24586593',4,'7568',7,5,446988);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('31261481480','Wanids','Paddefield',55,'36097520',27,'5285',4,5,598928);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('31313688796','Lea','Probin',54,'39907267',2,'9992',12,6,101885);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('31394608973','Colman','Wooster',29,'28497439',8,'5911',9,3,809999);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('31431309711','Franny','Norssister',37,'38762680',10,'3438',2,6,606158);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('31459888705','Selestina','Emby',59,'25679838',8,'6700',5,6,482668);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('31486650746','Lorita','Bahl',61,'35582373',13,'5820',2,4,886708);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('31505206305','Mendie','Syder',39,'17019077',19,'2894',14,4,364899);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('31559782623','Kandace','Maddinon',41,'33171387',29,'6056',4,7,203413);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('31603623720','Joshuah','Cicci',37,'38110110',3,'3797',1,7,995228);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('31604172212','Ely','Fossord',27,'16828955',20,'5310',5,3,892276);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('31674691529','Boothe','LeEstut',39,'31825573',28,'3112',4,1,163184);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('31710146485','Peggi','Prando',45,'17169115',17,'8865',15,3,343022);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('31710149693','Marsh','Dri',59,'31978522',6,'2808',9,6,186539);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('31722341590','Noella','Poulter',40,'34169596',27,'8588',12,4,368784);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('31760321198','Langsdon','Donohue',49,'25195671',7,'3427',8,2,27351);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('31797133974','Virgil','Calcutt',64,'27059936',28,'3071',3,4,867464);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('31859518192','Aleen','Curcher',33,'27225931',25,'7408',12,4,843189);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('31937185969','Ebonee','Heasly',63,'26922463',1,'5610',11,1,215072);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('31959733933','Mignon','Skipton',41,'17981163',19,'6668',5,1,634122);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('31960321180','Hayward','Connikie',60,'39841541',16,'8634',1,4,791056);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('31977433016','Kristy','Pietrowicz',59,'35608318',19,'4734',5,2,63542);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('31986633640','Leo','Haslen',26,'35442174',24,'5298',9,5,472578);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('31995689393','Raviv','Puckey',58,'29891663',17,'6143',3,3,409008);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('31998737272','Gaston','Shurmer',22,'16530002',9,'1033',7,3,483228);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('32007052568','Thurstan','Sherry',48,'24543095',22,'2878',5,5,693311);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('32020295041','Aldon','MacCarroll',53,'30299166',30,'4830',13,2,282681);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('32027776520','Cassius','Canadas',48,'16997937',1,'7425',4,6,875858);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('32036075280','Donal','Roberti',41,'28631511',18,'6938',5,1,558286);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('32097134945','Melinda','Coulthard',45,'24933337',9,'2125',5,4,627745);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('32141778925','Stillmann','Crady',51,'17654053',18,'6524',5,7,187942);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('32153155997','Rochella','Sowerby',45,'39500844',15,'4642',15,2,187989);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('32156320838','Flora','Bing',29,'36040873',12,'1357',14,6,131931);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('32210791009','Staci','Fownes',43,'38678938',28,'4527',1,1,616050);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('32237315129','Gretchen','Shulem',33,'25859758',3,'2923',14,6,872764);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('32268930360','Annabelle','Larratt',44,'22345972',13,'4658',10,6,588115);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('32269297433','Keri','Wildsmith',59,'34513703',14,'5473',11,7,487170);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('32277900570','Rebecka','Horry',65,'27970369',13,'2288',14,6,836353);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('32278353028','Channa','Jedrysik',62,'24337657',2,'1168',6,5,703779);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('32281910649','Byrom','Northing',63,'34339118',22,'6909',4,3,681124);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('32299292119','Cordy','Marrington',63,'31389623',4,'2370',9,7,114146);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('32314010262','Joellyn','Raith',50,'34830503',21,'9637',11,5,421588);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('32352174125','Meredith','Jedrzaszkiewicz',20,'35676199',30,'6486',9,2,976226);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('32365806050','Weston','Wolfinger',48,'29576386',25,'7026',12,1,36331);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('32376061005','Shawnee','Fromant',40,'17945024',15,'6179',8,1,629220);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('32403919110','Karleen','Sansum',25,'18310929',30,'7125',10,7,115191);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('32411320044','Marna','Neighbour',27,'37513968',3,'3574',13,7,568968);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('32411545707','Elden','Zorro',64,'16421603',24,'7444',6,2,215168);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('32420053116','Shurlock','Biasi',59,'32805158',3,'3331',10,4,407671);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('32440783939','Valeria','Malimoe',30,'24533263',6,'6471',15,6,317639);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('32442477035','Maximilian','Middell',50,'27905056',21,'3436',3,6,653017);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('32446358028','Eben','Deaves',29,'19977056',30,'7572',4,3,182565);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('32489572125','Jamey','Routham',41,'28871054',20,'4006',12,7,37240);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('32499957293','Josi','Atthowe',62,'31490837',28,'3410',6,6,910904);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('32517235872','Jamaal','Hamshar',40,'35773976',19,'7707',13,3,364907);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('32556264636','Pippa','Rillett',35,'16569843',16,'2539',1,6,375546);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('32586491871','Brianna','Taberner',63,'30031825',24,'2114',15,2,437313);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('32639915514','Heidie','Prattin',38,'22967731',24,'6975',6,3,574286);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('32644214448','Crichton','Huffey',29,'30885561',5,'5852',13,3,303079);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('32694443321','Skipp','Sarra',33,'20641581',26,'3403',1,5,945903);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('32705103422','Efren','Whitwood',38,'26711693',27,'2568',12,5,2034);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('32750654302','Chrysler','Kelley',52,'28970065',15,'7750',9,5,859181);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('32782023576','Baron','Kisby',41,'37233899',23,'7917',8,1,886370);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('32838607559','Harrie','Theyer',41,'29829069',10,'2757',2,3,912978);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('32844867965','Othella','Daintith',37,'26216002',10,'5689',12,2,434911);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('32845140127','Locke','MacCaughey',34,'29111895',18,'9555',6,1,22319);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('32859060596','Kathe','Nelm',45,'36076586',16,'5095',12,6,607464);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('32872116247','Mirabella','Maund',49,'31504315',6,'5658',4,2,759803);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('32905957181','Emmerich','Corbyn',29,'21654891',28,'2474',5,5,562957);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('32921129844','Xenia','Nusche',52,'29289018',17,'9607',6,6,503559);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('32961854838','Berty','Hinchcliffe',45,'32567658',26,'9635',13,6,25964);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('33021952784','Johnnie','Eymor',63,'17250044',14,'3409',12,5,294304);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('33035407316','Jacky','Chaney',31,'31027873',21,'9750',8,5,269056);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('33040196304','Alene','Follows',30,'31858129',8,'4709',3,1,659859);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('33066891414','Juieta','Lilion',23,'29098051',26,'3982',11,7,655222);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('33082772186','Merrill','Cubitt',48,'27249047',7,'1299',2,6,52906);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('33144992427','Garrick','Pimblotte',56,'39743203',11,'1777',2,2,717714);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('33167415998','Bibbye','Danahar',64,'15601860',21,'7569',4,4,534543);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('33180715371','Samaria','Stallworthy',40,'26183413',10,'9680',1,3,342799);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('33188373317','Issi','Lamball',58,'32570858',7,'8602',5,4,291274);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('33188409273','Jacquelynn','Banton',59,'22418488',29,'1937',6,3,501564);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('33207111406','Rhody','Vila',65,'20513517',9,'8779',2,6,727839);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('33294487799','Penrod','Warden',61,'31412226',4,'5558',6,4,932502);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('33302186573','Arni','Kightly',43,'33610098',26,'6298',14,3,243867);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('33309298824','Fremont','Cameli',43,'28122690',7,'5816',15,7,248137);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('33326568092','Kurt','Stokes',38,'19808253',12,'1925',11,3,63418);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('33333405806','Tadeo','Sutherel',41,'35635985',26,'7290',11,3,215154);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('33342759247','Meris','Jendrich',56,'19323057',16,'4710',7,4,760066);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('33346694855','Garvy','Ruddiforth',48,'24427002',5,'6618',12,3,361335);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('33357670854','Luella','Wackly',26,'21165606',23,'6405',10,1,328679);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('33393852513','Padget','Greenhalf',20,'33952740',3,'6469',6,7,155628);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('33493276829','Ninnette','Crathern',54,'26738097',13,'5324',14,3,661688);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('33516075890','Madelena','Purkess',43,'39883027',21,'5577',5,5,605269);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('33582407672','Ashleigh','Tewkesbury.',39,'23612002',13,'6938',7,1,362675);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('33611203731','Lennie','Coulthard',49,'25604232',20,'9127',12,7,152786);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('33626440360','Glennie','Horbath',55,'32471602',15,'2678',9,7,106709);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('33632316890','Ara','Hamblin',28,'34423307',30,'5212',3,2,635923);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('33743175853','Storm','Winstanley',63,'15811912',29,'6722',13,6,500744);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('33780851019','Marianne','Elsom',22,'34426280',4,'6632',9,2,68703);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('33792685864','Harmony','Romayne',26,'39247635',29,'3670',12,1,62913);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('33797746578','Feliza','MacGilmartin',64,'30508840',7,'1705',8,5,801200);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('33864152452','Shell','Ware',34,'28045127',15,'7948',14,7,442035);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('33893814326','Mallory','Brennenstuhl',29,'17441375',30,'8800',2,4,562355);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('33920994522','Rosana','Mathivon',22,'26752683',3,'9175',6,3,178747);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('33942367592','Sapphira','McIlwraith',43,'25029186',21,'1942',15,2,70739);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('33950649253','Berne','Dumblton',60,'21636915',4,'8006',4,1,52905);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('34011031674','Javier','Capinetti',43,'30966872',11,'4067',12,7,638540);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('34018936803','Randee','Perutto',34,'35716114',19,'1893',7,2,981016);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('34022471278','Marji','Surtees',30,'25397819',30,'3777',13,3,104974);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('34043704289','Benn','Carillo',22,'23860132',26,'8058',6,4,317301);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('34064454821','Dasha','Fussen',44,'39681607',26,'6781',1,2,894906);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('34076221673','Sigmund','Simnell',44,'18130754',26,'8176',13,5,931663);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('34154799339','Flori','Walbrook',32,'25298051',1,'8156',9,5,134695);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('34191615128','Keefe','Wanklyn',51,'16960667',20,'5789',15,2,137294);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('34206515577','Rollo','Stailey',30,'17514136',8,'4584',15,1,740249);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('34230062568','Belita','Degg',36,'18988822',2,'8721',9,4,895433);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('34238491716','Joe','Rammell',24,'39071105',27,'5136',13,1,261866);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('34249106794','Caresse','Strut',50,'15788361',17,'1857',2,4,344116);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('34276071306','Arnoldo','Martusov',23,'22427214',14,'7869',1,2,819936);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('34306410298','Lucian','Vallentine',25,'31505837',14,'8027',4,3,903191);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('34313894259','Larine','Sillick',38,'23891984',6,'2680',4,7,820730);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('34400738925','Wendall','Mewha',62,'27526736',24,'9055',11,3,337231);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('34422849459','Arnold','Barajas',27,'16285314',5,'1529',11,5,984705);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('34465017194','Loretta','Jellard',64,'24585054',1,'6561',4,3,321527);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('34480498819','Brennen','Domsalla',43,'26815359',4,'5623',14,5,451251);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('34489962914','Dodie','Exter',60,'27894829',23,'6673',15,1,879537);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('34499885117','Ange','Stormouth',34,'28764474',1,'2974',12,3,284219);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('34529633993','Amie','Mc Dermid',46,'29080982',9,'4425',2,5,374696);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('34543851673','Deena','Maultby',36,'23376664',22,'2399',1,7,778450);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('34564093705','Jerrie','Fulger',38,'23614285',12,'9127',14,7,530844);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('34574883928','Robinetta','Lambarth',58,'30554377',18,'5971',2,3,538641);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('34584223674','Feliza','Pirri',36,'36504225',16,'4794',4,6,823519);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('34592867782','Wilburt','Bouzek',27,'24190214',3,'1421',15,5,974118);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('34642116251','Roobbie','Gilgryst',55,'18819592',27,'6676',2,7,410495);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('34651963262','Charlean','Brandel',44,'37552699',7,'3786',3,1,467291);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('34658724197','Cordell','Mougin',65,'17007541',4,'2134',15,5,617966);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('34714870319','Doralynne','Schulkins',20,'34798352',1,'8047',14,2,873521);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('34715653177','Cynthia','Kaiser',38,'29270106',20,'1062',13,3,237442);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('34719726846','Darsey','Yurikov',28,'39053824',21,'7937',1,3,659616);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('34751569809','Sullivan','Hassewell',20,'34632136',8,'2669',14,5,200838);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('34759992526','Brigitte','Boutton',22,'15042216',24,'9608',1,2,647598);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('34769773756','Chick','Stampfer',49,'22890164',23,'6037',5,1,714308);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('34772177447','Ragnar','Loughan',34,'20671702',24,'6930',11,6,621550);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('34776938175','Oliver','Gilffillan',25,'17820020',1,'8310',1,7,842477);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('34798721547','Town','Keningley',25,'23314240',16,'4126',1,4,866513);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('34840200992','Gunther','Gioan',22,'30229430',25,'2709',6,5,576847);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('34889234970','Timofei','Mateescu',36,'23694217',24,'7960',11,6,314940);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('34897774819','Jessamine','Haquin',41,'37970372',17,'1839',3,5,23108);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('34919623574','Ed','Wallwork',50,'33395674',14,'4863',8,6,371827);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('34931075831','Son','Ingon',21,'22026824',5,'1388',8,2,869272);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('34964625643','Kristoforo','Olechnowicz',36,'39724319',4,'5220',7,1,582672);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('34981990004','Decca','Hartlebury',47,'35100569',9,'6050',8,4,829436);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('34984613637','Elmer','Duchateau',58,'18697007',28,'1246',4,6,901583);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('34992034833','Sephira','Besemer',52,'21247614',15,'9091',12,1,395537);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('35063393569','Sax','Matisoff',64,'37656972',8,'5788',6,6,881249);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('35099243685','Wally','Cayley',24,'19407168',9,'9366',7,6,821845);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('35102103355','Liliane','Mahoney',40,'18286357',18,'5904',6,3,532972);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('35120157935','Borg','Mantione',65,'35910564',23,'1533',9,2,201928);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('35121394943','Alfred','Vuittet',44,'31071611',24,'2060',9,4,579603);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('35177562463','Giraldo','Vlasyev',26,'25650687',10,'5911',6,1,708989);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('35198298057','Rafa','Paddock',49,'17815019',13,'4096',5,1,420884);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('35312456952','Humphrey','Walkling',25,'28529456',17,'6657',9,5,388944);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('35325523654','Matthias','Netting',22,'21932427',29,'7675',6,4,233464);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('35357692168','Berkeley','Ruben',36,'16779231',1,'3243',15,3,622901);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('35377944838','Lotti','Brimilcombe',44,'33777472',29,'3071',8,7,619405);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('35411562498','Hillier','Lubomirski',41,'39742935',14,'7979',8,2,202138);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('35426722430','Minne','Kupka',63,'23434994',19,'6487',4,2,575391);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('35508875004','Marla','Coleyshaw',23,'20805507',15,'3876',15,5,104635);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('35528727549','Hadria','McDarmid',20,'24972904',23,'1624',2,5,767071);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('35538096369','Jodie','Brawson',53,'32725761',1,'5653',6,5,533022);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('35569656991','Juliet','Saddington',22,'25947445',8,'5800',11,6,542819);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('35595143464','Sim','McCutheon',54,'28686632',14,'4170',10,6,469472);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('35635630566','Kitty','Lubomirski',37,'24675251',15,'2346',3,3,226032);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('35659680141','Corbet','Beahan',37,'22109736',30,'1713',13,7,720992);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('35664390486','Taite','Mc Gaughey',56,'37817984',8,'5695',15,3,135488);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('35741175389','Samuel','Luscott',36,'15003901',13,'1668',15,4,805395);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('35755887047','Ignatius','Trueman',35,'20631020',6,'8206',2,2,323025);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('35777431226','Shea','Brosio',23,'22495449',7,'2964',6,1,352663);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('35786645633','Melisande','Bromfield',39,'20656449',14,'2680',12,2,227910);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('35793080560','Bert','Berwick',56,'22814175',2,'8994',2,3,607455);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('35801871269','Fania','Milward',39,'35124435',17,'5733',4,6,889328);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('35830653292','Toma','Bresman',40,'29794774',14,'5654',9,3,608083);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('35849203486','Ignaz','Runnacles',27,'32787344',21,'4308',9,5,247539);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('35865866483','Glad','Papes',61,'23014447',14,'5003',13,4,277314);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('35874977276','Saba','Hanford',24,'20106778',26,'2430',7,1,25013);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('35891790009','Carolan','Truckett',32,'17294172',17,'5738',3,7,523659);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('35900121803','Baily','Arnaudi',45,'32190680',23,'4792',14,1,603162);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('35904874867','Loralie','Pyke',46,'35917665',3,'4999',11,7,94123);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('35907572246','Amy','Al Hirsi',48,'33876335',7,'1602',11,7,162096);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('35968279487','Court','Wyd',53,'29903621',2,'2800',10,1,220412);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('35985318687','Rafaela','Matussov',32,'27084756',25,'9288',9,3,536535);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('36035340618','Courtnay','Tolomelli',27,'23514577',9,'3486',7,7,62675);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('36050843336','Katya','Chittenden',62,'35663187',10,'3005',3,4,40919);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('36067218695','Tobie','Ribey',44,'33365975',7,'9788',11,7,514280);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('36077159564','Maribel','Coite',45,'37102021',5,'4516',2,5,424415);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('36077844777','Fairleigh','Proffer',44,'37581961',11,'5091',13,1,519366);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('36090661208','Zabrina','Jennaroy',27,'29216117',13,'2389',14,5,709731);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('36127915473','Deni','Davall',56,'37997614',11,'8684',6,7,781430);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('36129552728','Aymer','Soreau',36,'27145035',30,'7835',2,2,327161);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('36131603862','Stacia','Creddon',46,'30717328',14,'7713',10,6,226743);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('36161779241','Teddi','Ragdale',62,'23665507',10,'5087',14,2,661738);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('36179213781','Deedee','Hedaux',42,'17312961',13,'8353',11,2,550500);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('36179952101','Alisa','Nind',56,'17673651',21,'8785',7,2,827231);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('36185879026','Prudi','Franzelini',47,'28118878',27,'4519',1,2,938603);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('36186219100','Roxanne','Hazelgreave',22,'25005223',28,'8174',2,1,102357);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('36186949757','Rickie','Crehan',51,'34277041',13,'9225',2,6,194699);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('36218622954','Daryl','Davidesco',61,'26759040',1,'8507',8,1,277251);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('36262722221','Ethelda','Dabner',57,'19168212',22,'8258',3,4,255660);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('36274850016','Tonye','Bauldry',57,'17134403',30,'7817',1,4,703847);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('36274951782','Clayborn','Sandlin',65,'33218501',27,'1029',9,2,433361);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('36333671411','Lotty','Condell',52,'24100419',22,'9771',6,6,973065);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('36357515111','Brittan','Orts',22,'37133511',15,'8363',6,6,703498);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('36374927032','Tamar','Panyer',62,'19767589',30,'9280',10,1,696675);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('36386298273','Cordie','Hazelhurst',28,'37156996',30,'9498',9,5,77053);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('36403826115','Claudine','Ashlin',20,'15788127',27,'7718',3,7,529365);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('36443316912','Clio','Czajka',41,'38436836',4,'9107',13,2,33193);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('36485151995','Pall','Stoakes',52,'17044168',29,'1721',3,5,466587);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('36485460084','Emogene','Cubbino',21,'39199000',2,'7920',13,5,146619);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('36501430888','Jesus','Griffith',62,'23137008',17,'8930',14,5,792055);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('36596782685','Rebecka','Bousler',49,'21893842',12,'7868',14,1,87628);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('36597842339','Dalia','Newlands',33,'39828589',17,'1714',5,4,78578);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('36601202771','Audra','Eshelby',59,'19529870',2,'2128',2,3,400112);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('36615126738','Willyt','Pahl',62,'24649885',24,'9202',4,4,967911);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('36656494574','Rey','Butlin',24,'29949858',3,'9607',4,4,921623);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('36693333980','Siward','Karolczyk',59,'27258731',6,'5124',4,1,852694);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('36724810374','Thorin','Scranedge',53,'23050596',19,'6912',3,1,745366);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('36864786118','Rochester','Gleave',33,'17231328',1,'5695',9,5,629370);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('36876670032','Dev','Wedon',65,'35022450',16,'1132',3,2,401154);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('36878305437','Siusan','Huge',63,'34370789',29,'2212',13,4,503590);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('36882673237','Prudence','Di Biagio',30,'16133523',29,'3945',12,5,820089);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('36884411254','Glyn','Lattos',43,'30009042',7,'6152',12,3,804727);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('36890593142','Any','Kliemke',32,'29161471',30,'1469',4,6,806861);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('36899815878','Trip','Merioth',47,'23161036',13,'6880',8,1,290618);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('37009617051','Michele','Hiscoke',49,'22164712',13,'5248',3,2,411841);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('37027569494','Jacky','Minot',63,'27880126',3,'8746',6,2,678982);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('37162335341','Giraud','Ragg',53,'32477141',12,'3576',5,6,657616);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('37164009156','Bent','Walesby',23,'27777091',1,'7422',10,5,712050);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('37196144583','Esma','Helmke',31,'34404166',19,'6568',15,7,917732);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('37237807580','Phip','MacKeeg',65,'24790901',23,'8674',12,4,327154);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('37301035536','Mandie','Bleakman',58,'24490612',1,'8946',13,4,755326);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('37317729965','Jeffrey','Maccrae',36,'25265957',29,'6871',9,6,932151);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('37320781712','Florencia','Burnsell',60,'35739388',20,'2178',14,7,102624);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('37338866563','Olivero','Mirams',28,'24920183',5,'7809',1,4,495620);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('37340028985','Weber','Brick',39,'38266802',15,'4425',5,1,231919);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('37345846277','Felizio','Matanin',51,'27359226',25,'9261',13,2,290946);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('37354198434','Gasparo','Legen',57,'36389099',28,'1856',6,7,220945);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('37369203090','Kristopher','Coldrick',21,'38298984',30,'4721',2,5,385878);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('37425697198','Ivar','Kenealy',42,'18922248',8,'1648',14,6,115187);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('37431344659','Wilt','Murtell',58,'34233213',25,'5148',1,3,424095);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('37442325239','Raviv','Coughtrey',21,'30272638',23,'5502',11,6,494735);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('37442993004','Sharona','Tant',55,'36723447',3,'2820',9,1,688065);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('37444253833','Frieda','Reddell',47,'30752326',4,'7440',1,2,390306);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('37459754025','Dominik','Lismore',63,'18720373',13,'7674',9,7,827463);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('37465999776','Margaretha','McIlriach',42,'16406195',25,'2955',14,5,251362);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('37551435005','Tyne','Nickolls',20,'37745693',17,'5032',13,4,739757);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('37562873315','Gretchen','Sutterby',52,'35942158',24,'5875',1,4,994038);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('37599779172','Parsifal','Proudman',59,'15600028',29,'2440',1,6,554817);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('37626039296','Leeanne','MacDonald',22,'26482514',24,'1267',10,2,741763);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('37674222170','Cathryn','Antuoni',29,'37451865',1,'5991',11,5,15637);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('37699590949','Arley','Hailwood',38,'36414843',12,'6048',5,5,138473);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('37722326344','Bev','Dureden',57,'36346993',20,'2103',1,1,864167);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('37761490185','Kent','Heaker',23,'29726978',21,'5254',12,7,531496);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('37767603844','Clarie','Tivnan',47,'20284840',19,'5776',10,7,318037);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('37790496332','Kenn','Curtayne',52,'28653352',12,'5294',8,7,936850);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('37817850349','Frank','Beames',65,'23956589',28,'1953',6,5,605423);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('37825903939','Meggy','Dalgardno',36,'24329194',30,'7277',2,6,120615);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('37839339708','Celestia','Elson',65,'32427869',15,'7259',9,4,849371);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('37869902290','Abdel','Stothard',47,'24414591',12,'2506',7,4,361415);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('37881173841','Cly','Darton',32,'19418743',26,'3114',1,3,323882);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('37896261184','Quintana','Gilbert',43,'29781858',12,'2367',15,3,249930);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('37919706653','Ibrahim','O\'Hdirscoll',27,'35213236',2,'4526',15,5,334453);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('37976255635','Filmer','Galvan',36,'28915874',17,'9888',12,5,273230);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('37981053584','Norman','Meugens',23,'20458172',19,'1590',11,3,756386);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('37996435252','Julianna','Wilton',61,'21702240',4,'7108',10,7,118308);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('37998911608','Christos','Cecchetelli',36,'17102394',9,'6677',2,3,395608);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('38024439627','Loydie','Eldrett',54,'39475361',6,'6112',2,3,734899);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('38043694913','Johny','Prendergrast',51,'18639998',2,'4946',9,6,696276);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('38075601917','Averill','Gatch',54,'26950478',27,'5010',11,3,495692);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('38090734033','Barbe','Basley',28,'38546676',1,'3775',1,5,703054);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('38104872407','Rici','Sykora',44,'27877214',4,'7006',15,1,174317);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('38191795752','Tobye','Jencey',62,'32505284',23,'8011',4,7,379295);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('38227054184','Carmel','Bellward',30,'35644548',15,'5131',3,2,511914);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('38227787667','Salomi','Robens',45,'30608862',24,'9797',13,1,602771);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('38241413280','Montague','Jozef',59,'35673741',1,'4456',2,1,999103);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('38257151577','Liv','Schirok',49,'39045846',3,'6561',1,5,745042);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('38276104439','Sigrid','Scalia',54,'27870536',25,'6961',7,1,670696);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('38280897542','Egor','Loble',52,'32175659',19,'7672',15,3,238426);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('38372302856','Buck','Stennings',28,'22784653',27,'9239',15,1,3841);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('38422815033','Kathi','Chue',39,'20290792',5,'4886',4,2,998163);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('38462447156','Conroy','Eyeington',42,'23689411',26,'7525',5,4,234928);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('38518087991','Barrett','Hatchett',62,'20888843',29,'1413',5,6,592459);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('38543750274','Sukey','Twort',59,'38180323',18,'2992',6,2,418928);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('38549655261','Tadd','Orr',61,'28394510',16,'5264',7,4,828311);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('38588814725','Lena','Tidy',60,'27126037',2,'9839',9,6,899663);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('38640154562','Ham','Swales',59,'28507052',25,'2602',5,1,236745);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('38708060802','Jimmy','Kuzma',52,'29387695',11,'2274',4,6,192719);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('38757685610','Thatcher','Badsworth',48,'26771747',7,'9316',14,5,241854);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('38781400011','Marleen','Fere',26,'37198276',22,'3580',6,3,928553);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('38798737930','Fredra','Portsmouth',39,'16519727',13,'9093',12,1,69565);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('38810021952','Noble','Sebyer',29,'33414623',14,'1482',14,2,129829);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('38830587755','Nicola','Shakesby',62,'36513842',14,'3286',11,5,209710);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('38834032027','Garfield','Suffield',28,'33878864',23,'9430',15,5,387629);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('38843485627','Nita','Lewcock',39,'20514020',15,'8478',12,1,963152);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('38882789318','Elvina','Hourstan',25,'22265115',17,'7438',5,1,33839);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('38921413232','Arnoldo','Duval',29,'25528157',2,'1139',7,7,439488);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('38927986758','Raine','Mumbeson',59,'38382303',30,'1686',9,6,941831);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('38932217526','Cynde','Tincombe',63,'39759718',21,'6816',9,2,13590);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('38963424423','Eleonore','Slott',49,'27672736',12,'2257',11,4,285841);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('39008696381','Cecilio','Fieldstone',25,'20115928',20,'3445',13,5,868832);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('39030369715','Marya','Stihl',25,'28532279',24,'3274',14,3,592695);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('39033467116','Curcio','Michurin',46,'23777551',13,'5787',13,7,885623);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('39034257042','Faye','Quenell',35,'33015587',25,'3809',15,4,328351);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('39038954002','Rayshell','Reck',35,'35709891',5,'6776',13,2,170512);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('39058549855','Orelee','Lundy',36,'27418972',3,'2468',12,5,207056);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('39081844151','Stanislaus','Gathwaite',26,'16709430',29,'2869',13,4,388244);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('39082195205','Anton','Greetland',22,'31521741',21,'5579',4,2,207128);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('39110998166','Maxim','Dietzler',38,'16823385',5,'9509',3,6,734869);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('39118787348','Reynold','Murley',64,'15950341',6,'7238',13,6,429756);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('39128766886','Hunfredo','Everingham',58,'20651130',16,'7368',8,3,396523);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('39136884042','Westleigh','Rosenhaupt',57,'16314149',23,'1929',5,5,134745);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('39171220521','Lucie','Hansen',47,'29137955',17,'7218',6,1,55113);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('39185678288','Noell','Soonhouse',49,'27665102',1,'3602',13,6,559116);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('39191131578','Yvette','Eggar',54,'19921767',30,'2293',2,5,488274);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('39220572186','Israel','Leader',65,'33182718',2,'8975',8,7,583318);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('39244452908','Davide','Laviste',64,'38877835',7,'4754',7,4,663784);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('39296092455','Ramona','Adger',63,'33646698',10,'5114',6,4,519921);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('39319953823','Jecho','Oliveras',22,'15579949',13,'2755',12,1,671598);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('39446933635','Renie','Willerson',60,'29135596',11,'5280',5,3,772049);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('39450465400','Letitia','Wiggett',61,'16781529',15,'5471',11,1,976209);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('39481133071','Viki','Redier',23,'21950462',1,'8774',6,5,871641);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('39496326713','Ede','Serrell',33,'25408944',16,'4600',11,3,760720);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('39522834503','Petey','Swales',25,'37008769',19,'3527',4,7,715607);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('39531762243','Clyde','Bartod',25,'38408089',10,'6705',4,5,896027);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('39545061281','Evangeline','Avraham',60,'33717676',14,'6677',7,1,654030);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('39568808316','Hoyt','Sproul',38,'30538433',12,'7130',9,5,570769);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('39592355891','Leonard','Bricksey',21,'36359641',29,'7997',15,7,877808);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('39604903251','Bryanty','Pointing',58,'25800349',23,'9238',8,2,724240);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('39647482183','Minerva','Lawling',40,'24185150',26,'9763',13,1,399114);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('39666897967','Scarface','Elson',27,'22766694',7,'6472',14,2,365802);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('39671881465','Tarrance','Dearing',57,'36405884',10,'9627',15,2,768652);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('39676532633','Estrella','Ogilvie',41,'37805847',17,'6785',5,4,167577);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('39735100407','Allan','Barles',28,'21045651',11,'9204',13,4,396901);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('39790660091','Eldon','Lilleman',49,'19776543',20,'3086',4,6,320987);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('39806165743','Dniren','Benbrick',55,'28356404',9,'5720',7,1,413642);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('39872768240','Austina','Hymus',21,'31326733',29,'1929',14,6,387647);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('39875777035','Teddi','Sweetman',49,'37146458',26,'4274',9,3,399541);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('39889150782','Gerhard','Kulas',48,'31210215',5,'9109',13,1,460866);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('39908195408','Kora','Chittey',54,'18610989',28,'8250',1,2,920763);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('39955690224','Travers','Gerlack',50,'29892422',16,'8017',8,3,69858);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('39965814470','Salli','Fynan',49,'17793656',6,'7794',14,5,535524);
INSERT INTO Docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('39984181697','Meredith','McCathie',51,'19466018',6,'9405',13,1,567776);


/*Query Insert Into Tabla Materias*/ 

INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (16,'Ciencias Naturales',2,4,4,'25802609893',830272);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (18,'Matematica',2,1,5,'35312456952',388944);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (19,'Geografia',4,1,2,'32499957293',910904);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (20,'Ciencias Sociales',4,1,5,'26245451037',463498);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (22,'Contabilidad',6,1,4,'30717172978',931341);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (23,'Informatica',4,5,4,'31313688796',101885);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (24,'Arte',2,3,1,'20232576510',364409);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (25,'Matematica',4,1,5,'25883507181',406564);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (26,'Educacion Fisica',6,5,4,'22763369129',355665);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (27,'Lengua y Literatura',2,1,5,'22330954519',769283);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (29,'Ciencias Naturales',2,1,5,'29862134093',614740);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (30,'Matematica',4,4,4,'33144992427',717714);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (31,'Ciencias Naturales',2,1,4,'27194245621',771663);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (32,'Historia',6,4,4,'28746818202',370888);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (33,'Matematica',2,1,1,'26985421987',850621);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (35,'Ciencias Sociales',4,1,4,'24514214972',200277);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (36,'Lengua y Literatura',2,1,4,'20188514148',145921);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (38,'Informatica',2,1,5,'22168255259',210617);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (39,'Arte',4,1,4,'29407044296',958402);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (41,'Educacion Fisica',5,1,4,'25574630797',802067);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (42,'Lengua y Literatura',5,1,1,'38422815033',998163);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (43,'Ciencias Sociales',5,5,4,'20890654041',593346);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (44,'Ciencias Naturales',5,3,4,'25564473017',911432);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (45,'Matematica',5,1,4,'26645372796',116186);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (46,'Ciencias Naturales',2,1,5,'23341266988',756913);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (47,'Historia',2,5,5,'32489572125',37240);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (48,'Matematica',4,1,4,'27725062554',741075);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (49,'Geografia',2,4,5,'21729759408',910931);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (51,'Lengua y Literatura',6,1,5,'33357670854',328679);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (52,'Contabilidad',2,5,2,'24509318779',269751);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (53,'Informatica',4,3,5,'33302186573',243867);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (54,'Arte',2,4,4,'26469857663',570281);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (55,'Matematica',6,1,4,'39955690224',69858);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (56,'Educacion Fisica',2,4,4,'29858738694',4380);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (57,'Lengua y Literatura',4,1,1,'20315339873',416185);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (59,'Ciencias Naturales',4,1,4,'29525101216',161672);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (60,'Matematica',6,4,4,'24053446190',870282);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (61,'Ciencias Naturales',2,1,5,'26850677375',373888);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (62,'Historia',6,4,5,'25843235009',899377);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (63,'Matematica',2,1,4,'31760321198',27351);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (64,'Geografia',4,1,5,'23868105006',987609);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (65,'Ciencias Sociales',4,1,2,'28980739322',396488);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (66,'Lengua y Literatura',4,1,5,'39446933635',772049);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (68,'Informatica',4,1,4,'39908195408',920763);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (69,'Arte',2,1,4,'22025427949',621347);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (70,'Matematica',4,1,1,'24013416968',603434);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (71,'Educacion Fisica',6,1,4,'34897774819',23108);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (72,'Lengua y Literatura',2,5,4,'29379828857',241192);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (73,'Ciencias Sociales',4,1,4,'30367552686',526903);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (74,'Ciencias Naturales',2,4,5,'35900121803',603162);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (76,'Ciencias Naturales',2,1,5,'28776448239',345793);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (77,'Historia',6,5,2,'35865866483',277314);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (78,'Matematica',2,3,5,'24181765492',210120);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (79,'Geografia',4,4,4,'22091397322',503249);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (80,'Ciencias Sociales',4,1,4,'38024439627',734899);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (81,'Lengua y Literatura',2,4,4,'31032964198',58386);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (82,'Contabilidad',4,1,1,'37767603844',318037);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (83,'Informatica',2,1,4,'23186542127',51978);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (85,'Matematica',6,1,4,'39191131578',488274);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (86,'Educacion Fisica',5,5,5,'21387739051',570230);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (87,'Lengua y Literatura',5,1,5,'30737271841',245904);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (91,'Ciencias Naturales',2,5,4,'21982199655',193148);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (92,'Historia',2,3,5,'32845140127',22319);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (94,'Geografia',2,1,4,'26791321579',381259);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (95,'Ciencias Sociales',4,4,5,'27220416075',51135);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (96,'Lengua y Literatura',6,1,2,'20270916692',190269);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (97,'Contabilidad',2,1,5,'39806165743',413642);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (98,'Informatica',4,1,4,'37442993004',688065);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (99,'Arte',2,1,4,'37869902290',361415);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (100,'Matematica',6,4,4,'22355930825',738541);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (102,'Lengua y Literatura',4,1,4,'29264978939',87051);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (103,'Ciencias Sociales',4,1,4,'34249106794',344116);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (104,'Ciencias Naturales',4,1,4,'23052545880',410250);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (105,'Matematica',6,1,5,'26049004157',461573);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (106,'Ciencias Naturales',2,1,5,'26938805376',984208);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (107,'Historia',6,5,4,'29102024117',393346);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (108,'Matematica',2,3,4,'23815712697',740199);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (109,'Geografia',4,1,4,'28965323716',606538);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (110,'Ciencias Sociales',4,5,4,'25977668144',582309);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (111,'Lengua y Literatura',4,1,5,'32442477035',653017);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (113,'Informatica',4,1,4,'34499885117',284219);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (115,'Matematica',4,1,4,'39118787348',429756);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (117,'Lengua y Literatura',2,1,4,'33188409273',501564);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (119,'Ciencias Naturales',2,1,4,'30508943260',920183);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (120,'Matematica',4,1,4,'32403919110',115191);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (121,'Ciencias Naturales',2,4,4,'23197168327',61719);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (122,'Historia',6,1,5,'39872768240',387647);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (123,'Matematica',2,1,5,'39965814470',535524);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (124,'Geografia',4,1,4,'33066891414',655222);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (125,'Ciencias Sociales',4,1,4,'37442325239',494735);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (127,'Contabilidad',4,5,4,'34769773756',714308);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (128,'Informatica',2,3,5,'21036594304',237088);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (130,'Matematica',6,1,4,'30234677138',32084);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (131,'Educacion Fisica',5,5,4,'25237376782',76074);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (132,'Lengua y Literatura',5,1,4,'34889234970',314940);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (134,'Ciencias Naturales',5,1,2,'31261481480',598928);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (135,'Matematica',5,1,5,'20347553113',36267);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (136,'Ciencias Naturales',2,5,4,'26315312283',290687);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (137,'Historia',4,3,4,'31722341590',368784);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (138,'Matematica',6,4,4,'23663492237',668607);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (139,'Geografia',5,1,1,'25317646848',281300);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (140,'Ciencias Sociales',5,4,5,'38830587755',209710);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (141,'Lengua y Literatura',5,1,4,'22036423239',846833);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (143,'Informatica',5,1,2,'34840200992',576847);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (144,'Arte',2,4,5,'26289056742',629552);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (145,'Matematica',2,1,4,'35985318687',536535);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (146,'Educacion Fisica',4,4,4,'23150965934',828954);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (147,'Lengua y Literatura',2,1,4,'25319364495',847558);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (148,'Ciencias Sociales',4,1,1,'36218622954',277251);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (149,'Ciencias Naturales',6,1,4,'32141778925',187942);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (150,'Matematica',2,1,4,'35063393569',881249);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (151,'Ciencias Naturales',4,4,4,'27555001820',325951);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (152,'Historia',2,1,5,'36443316912',33193);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (153,'Matematica',6,1,5,'28131717098',369252);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (154,'Geografia',2,1,4,'21561213704',88426);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (155,'Ciencias Sociales',4,1,4,'28893110391',142043);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (157,'Contabilidad',6,1,1,'22660689995',403089);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (158,'Informatica',2,4,4,'21915959464',212589);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (159,'Arte',6,1,4,'20728686484',344361);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (160,'Matematica',2,1,4,'21151328662',756940);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (161,'Educacion Fisica',4,5,5,'24933507725',537952);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (163,'Ciencias Sociales',4,4,4,'31604172212',892276);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (164,'Ciencias Naturales',6,1,5,'37338866563',495620);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (165,'Matematica',4,4,4,'32376061005',629220);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (166,'Ciencias Naturales',2,1,5,'37562873315',994038);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (167,'Historia',4,1,2,'39666897967',365802);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (168,'Matematica',6,1,5,'36615126738',967911);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (169,'Geografia',2,3,4,'39545061281',654030);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (170,'Ciencias Sociales',4,4,4,'26666529266',263254);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (171,'Lengua y Literatura',2,1,4,'39128766886',396523);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (172,'Contabilidad',4,4,1,'21828649088',365295);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (173,'Informatica',2,1,4,'30626186861',433250);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (174,'Arte',6,1,4,'33167415998',534543);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (175,'Matematica',2,1,4,'32639915514',574286);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (176,'Educacion Fisica',4,1,5,'35874977276',25013);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (177,'Lengua y Literatura',4,4,5,'36333671411',973065);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (178,'Ciencias Sociales',2,1,4,'25496780062',468708);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (179,'Ciencias Naturales',6,1,5,'35849203486',247539);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (180,'Matematica',2,1,2,'24040291677',123424);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (181,'Ciencias Naturales',4,1,5,'37317729965',932151);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (182,'Historia',4,1,4,'36129552728',327161);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (183,'Matematica',2,1,4,'23103942438',175951);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (184,'Geografia',4,5,4,'20239129027',856232);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (187,'Contabilidad',6,5,4,'30524039748',561191);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (188,'Informatica',5,1,4,'33516075890',605269);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (189,'Arte',5,4,5,'28174292989',382508);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (190,'Matematica',5,1,4,'34584223674',823519);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (191,'Educacion Fisica',5,4,5,'34751569809',200838);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (192,'Lengua y Literatura',5,1,2,'27584395807',990546);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (193,'Ciencias Sociales',2,4,5,'23030130173',763579);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (194,'Ciencias Naturales',2,1,4,'39296092455',519921);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (195,'Matematica',4,1,4,'36067218695',514280);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (196,'Ciencias Naturales',2,1,4,'36357515111',703498);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (197,'Historia',4,1,1,'36485151995',466587);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (201,'Lengua y Literatura',2,1,5,'21028621709',508893);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (202,'Contabilidad',6,1,5,'20495687649',892515);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (203,'Informatica',2,1,4,'30070730565',712805);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (204,'Arte',4,5,5,'37431344659',424095);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (205,'Matematica',4,3,5,'33582407672',362675);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (206,'Educacion Fisica',4,1,4,'25894365435',490761);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (207,'Lengua y Literatura',6,1,5,'24696114781',281107);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (208,'Ciencias Sociales',2,5,5,'39319953823',671598);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (209,'Ciencias Naturales',6,1,4,'31486650746',886708);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (210,'Matematica',2,4,5,'24447357370',692390);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (211,'Ciencias Naturales',4,1,2,'35120157935',201928);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (212,'Historia',4,1,5,'31937185969',215072);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (213,'Matematica',4,5,4,'35357692168',622901);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (214,'Geografia',6,3,4,'25758862193',28202);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (215,'Ciencias Sociales',2,4,4,'34992034833',395537);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (216,'Lengua y Literatura',2,1,1,'39082195205',207128);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (217,'Contabilidad',4,4,4,'25691097126',999671);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (218,'Informatica',2,1,4,'34191615128',137294);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (220,'Matematica',6,1,5,'36274850016',703847);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (221,'Educacion Fisica',2,4,5,'27888304428',905053);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (222,'Lengua y Literatura',4,1,4,'39647482183',399114);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (223,'Ciencias Sociales',2,4,4,'39008696381',868832);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (224,'Ciencias Naturales',6,1,4,'36724810374',745366);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (225,'Matematica',2,1,4,'31959733933',634122);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (226,'Ciencias Naturales',4,1,5,'29056630706',522697);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (227,'Historia',4,1,5,'23363507938',892269);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (228,'Matematica',4,4,4,'20622698727',280296);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (229,'Geografia',6,1,5,'34931075831',869272);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (230,'Ciencias Sociales',2,1,2,'23515367912',355922);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (231,'Lengua y Literatura',6,1,5,'31603623720',995228);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (232,'Contabilidad',2,1,4,'35904874867',94123);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (235,'Matematica',4,4,1,'20402841207',284248);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (236,'Educacion Fisica',6,1,4,'30148126344',54185);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (238,'Ciencias Sociales',2,5,4,'24383603682',556380);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (241,'Ciencias Naturales',2,1,4,'34422849459',984705);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (242,'Historia',4,4,4,'31042338926',98648);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (243,'Matematica',2,1,4,'36596782685',87628);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (244,'Geografia',4,1,4,'33333405806',215154);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (245,'Ciencias Sociales',2,1,5,'23163880689',525117);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (246,'Lengua y Literatura',6,1,5,'36899815878',290618);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (247,'Contabilidad',2,5,4,'25436286916',833704);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (248,'Informatica',4,1,5,'23571195296',536809);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (249,'Arte',4,4,2,'25352858602',612525);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (251,'Educacion Fisica',4,1,4,'31986633640',472578);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (252,'Lengua y Literatura',2,5,4,'20262379245',826754);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (253,'Ciencias Sociales',4,3,4,'26377082025',993066);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (254,'Ciencias Naturales',6,4,1,'25619330913',978700);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (255,'Matematica',5,1,4,'24462881441',587593);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (256,'Ciencias Naturales',5,4,4,'27786301123',731394);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (257,'Historia',5,1,4,'22783726564',847030);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (258,'Matematica',5,1,5,'26555721853',891287);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (259,'Geografia',5,1,5,'33864152452',442035);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (260,'Ciencias Sociales',2,1,4,'26163298420',404837);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (261,'Lengua y Literatura',2,4,4,'21382071159',11745);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (263,'Informatica',2,1,4,'32782023576',886370);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (264,'Arte',4,1,5,'32420053116',407671);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (266,'Educacion Fisica',2,1,4,'39450465400',976209);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (267,'Lengua y Literatura',4,1,1,'38518087991',592459);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (268,'Ciencias Sociales',2,5,5,'20007005091',134325);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (269,'Ciencias Naturales',6,3,4,'20337905848',994908);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (270,'Matematica',2,1,5,'39481133071',871641);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (272,'Historia',4,1,5,'36876670032',401154);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (273,'Matematica',4,4,4,'28963743740',437588);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (274,'Geografia',6,1,4,'29109341866',795043);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (275,'Ciencias Sociales',2,4,4,'30523346973',229775);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (276,'Lengua y Literatura',6,1,1,'28672953123',483455);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (277,'Contabilidad',2,4,4,'22196593133',874604);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (278,'Informatica',4,1,4,'30865536633',787481);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (279,'Arte',4,1,4,'34489962914',879537);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (280,'Matematica',4,1,5,'22017806189',871317);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (281,'Educacion Fisica',6,1,5,'24786394265',259985);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (283,'Ciencias Sociales',2,1,4,'22513933328',105349);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (284,'Ciencias Naturales',4,1,4,'28600361948',127123);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (285,'Matematica',6,1,1,'28589902198',562452);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (286,'Ciencias Naturales',2,1,4,'29963304094',918032);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (287,'Historia',4,1,4,'32277900570',836353);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (288,'Matematica',2,5,4,'36693333980',852694);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (289,'Geografia',4,3,5,'24313974355',98929);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (290,'Ciencias Sociales',2,1,5,'36601202771',400112);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (291,'Lengua y Literatura',6,1,4,'29529678548',346502);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (292,'Contabilidad',2,5,5,'31111612766',53813);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (293,'Informatica',4,1,4,'22548466203',300116);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (294,'Arte',4,4,5,'25608268134',540318);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (295,'Matematica',2,1,2,'38757685610',241854);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (296,'Educacion Fisica',4,1,5,'32586491871',437313);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (297,'Lengua y Literatura',2,5,4,'24040636455',654797);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (298,'Ciencias Sociales',4,3,4,'36077844777',519366);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (300,'Matematica',5,1,1,'35121394943',579603);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (301,'Ciencias Naturales',5,4,4,'37881173841',323882);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (302,'Historia',5,1,4,'28730456860',781613);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (303,'Matematica',5,4,4,'34642116251',410495);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (304,'Geografia',5,1,5,'25941827109',991649);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (306,'Lengua y Literatura',2,1,4,'25284068003',862069);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (307,'Contabilidad',4,4,5,'27509300542',11020);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (309,'Arte',4,1,5,'29519280695',722086);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (310,'Matematica',6,1,4,'29771013139',333335);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (311,'Educacion Fisica',2,1,4,'23501562795',63726);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (313,'Ciencias Sociales',2,1,1,'35968279487',220412);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (314,'Ciencias Naturales',6,1,4,'33180715371',342799);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (315,'Matematica',2,1,4,'25252421282',430046);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (319,'Geografia',6,4,5,'21374636310',841654);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (320,'Ciencias Sociales',2,1,2,'27697198879',642011);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (321,'Lengua y Literatura',6,1,5,'35377944838',619405);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (322,'Contabilidad',2,5,4,'22998916642',7015);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (324,'Arte',4,4,4,'22008926243',181738);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (325,'Matematica',4,1,1,'23142516233',905815);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (327,'Lengua y Literatura',4,1,4,'34064454821',894906);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (328,'Ciencias Sociales',2,1,4,'20231064092',938806);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (329,'Ciencias Naturales',4,1,5,'26249531156',359276);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (330,'Matematica',6,5,5,'33309298824',248137);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (331,'Ciencias Naturales',2,1,4,'32844867965',434911);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (332,'Historia',4,4,5,'39875777035',399541);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (333,'Matematica',2,1,5,'37459754025',827463);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (334,'Geografia',4,4,4,'29924594464',120194);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (335,'Ciencias Sociales',2,1,5,'20468164927',470702);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (336,'Lengua y Literatura',6,4,5,'23179831605',205210);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (337,'Contabilidad',2,1,4,'20629588370',6261);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (338,'Informatica',4,1,5,'39984181697',567776);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (339,'Arte',4,1,2,'39034257042',328351);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (341,'Educacion Fisica',4,4,4,'24535158051',329214);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (343,'Ciencias Sociales',4,1,4,'29036933794',753661);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (344,'Ciencias Naturales',6,1,1,'28269151122',739741);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (345,'Matematica',5,1,4,'28531234025',680340);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (347,'Historia',5,5,4,'27070128709',607223);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (348,'Matematica',5,3,5,'35528727549',767071);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (349,'Geografia',5,1,5,'29659932591',908255);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (350,'Ciencias Sociales',2,1,4,'30213148863',480663);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (351,'Lengua y Literatura',4,5,4,'31047838234',446720);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (352,'Contabilidad',6,1,4,'22124546464',133622);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (353,'Informatica',5,4,4,'33326568092',63418);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (354,'Arte',5,1,5,'34715653177',237442);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (356,'Educacion Fisica',5,5,4,'24091892363',547409);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (357,'Lengua y Literatura',5,3,4,'20686549421',401882);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (358,'Ciencias Sociales',2,4,4,'27162934491',79374);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (359,'Ciencias Naturales',2,1,5,'22378623438',342620);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (360,'Matematica',4,4,2,'37237807580',327154);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (361,'Ciencias Naturales',2,1,5,'24142946693',535326);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (362,'Historia',4,4,4,'23863415146',876292);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (363,'Matematica',6,1,4,'21209353295',441232);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (365,'Ciencias Sociales',4,1,1,'25676923329',893332);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (366,'Lengua y Literatura',2,4,5,'33632316890',635923);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (367,'Contabilidad',6,1,4,'22403458894',613184);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (370,'Matematica',4,1,5,'38462447156',234928);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (372,'Lengua y Literatura',2,1,4,'21081172210',919310);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (373,'Ciencias Sociales',6,1,4,'33493276829',661688);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (374,'Ciencias Naturales',2,1,1,'35538096369',533022);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (375,'Matematica',4,1,4,'28596349502',465057);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (376,'Ciencias Naturales',4,5,4,'25726231482',449431);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (377,'Historia',4,1,4,'36374927032',696675);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (379,'Geografia',4,1,5,'23789893917',156287);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (380,'Ciencias Sociales',2,1,4,'27734405986',562797);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (381,'Lengua y Literatura',4,5,4,'24438867771',220447);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (383,'Informatica',2,4,1,'23799592510',231620);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (384,'Arte',4,1,4,'35907572246',162096);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (385,'Matematica',2,4,4,'32872116247',759803);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (386,'Educacion Fisica',4,1,4,'21452519627',829622);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (387,'Lengua y Literatura',2,1,5,'24649399830',318963);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (389,'Ciencias Naturales',2,1,4,'32352174125',976226);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (390,'Matematica',4,5,5,'26176948534',153796);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (391,'Ciencias Naturales',4,1,4,'38227054184',511914);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (392,'Historia',2,4,5,'35891790009',523659);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (393,'Matematica',6,1,2,'21577913301',422060);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (394,'Geografia',2,1,5,'38043694913',696276);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (396,'Lengua y Literatura',4,3,4,'27144218703',590336);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (397,'Contabilidad',2,4,4,'36161779241',661738);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (398,'Informatica',4,1,1,'32314010262',421588);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (400,'Matematica',4,1,4,'31505206305',364899);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (401,'Educacion Fisica',6,1,4,'29167537196',578612);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (402,'Lengua y Literatura',5,1,5,'29118358860',295054);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (403,'Ciencias Sociales',5,1,5,'32440783939',317639);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (404,'Ciencias Naturales',5,4,4,'39033467116',885623);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (405,'Matematica',5,1,5,'35508875004',104635);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (406,'Ciencias Naturales',5,1,2,'34964625643',582672);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (408,'Matematica',2,1,4,'34480498819',451251);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (409,'Geografia',4,1,4,'34651963262',467291);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (410,'Ciencias Sociales',2,1,4,'36179952101',827231);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (411,'Lengua y Literatura',4,5,1,'23156078449',946608);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (412,'Contabilidad',6,3,4,'39676532633',167577);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (413,'Informatica',2,1,4,'24549008516',538527);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (414,'Arte',4,5,4,'30311184205',923148);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (415,'Matematica',2,1,5,'28010418282',793062);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (417,'Lengua y Literatura',2,1,5,'36262722221',255660);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (418,'Ciencias Sociales',4,4,2,'23445034872',867599);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (419,'Ciencias Naturales',4,1,5,'34543851673',778450);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (420,'Matematica',4,4,4,'26853254523',824286);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (421,'Ciencias Naturales',6,1,4,'23947900060',545560);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (422,'Historia',2,1,4,'34076221673',931663);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (423,'Matematica',6,1,1,'33611203731',152786);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (424,'Geografia',2,1,4,'36131603862',226743);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (425,'Ciencias Sociales',4,4,4,'22848998789',987000);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (426,'Lengua y Literatura',4,1,4,'29780328756',40805);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (427,'Contabilidad',4,1,5,'29730440945',844985);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (428,'Informatica',6,1,5,'33082772186',52906);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (430,'Matematica',2,1,5,'36485460084',146619);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (433,'Ciencias Sociales',4,1,5,'30606506540',469640);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (434,'Ciencias Naturales',6,1,5,'33920994522',178747);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (435,'Matematica',2,5,4,'34776938175',842477);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (436,'Ciencias Naturales',4,1,5,'36403826115',529365);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (437,'Historia',2,4,2,'32644214448',303079);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (438,'Matematica',6,1,5,'21668387860',797379);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (439,'Geografia',2,1,4,'37340028985',231919);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (440,'Ciencias Sociales',4,5,4,'20942046724',663605);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (441,'Lengua y Literatura',4,3,4,'30232045936',792458);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (442,'Contabilidad',4,4,1,'22888258761',398874);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (444,'Arte',2,4,4,'39604903251',724240);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (445,'Matematica',6,1,4,'30217739186',305258);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (446,'Educacion Fisica',2,4,5,'29264577894',350077);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (447,'Lengua y Literatura',4,1,5,'21937436259',211099);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (449,'Ciencias Naturales',4,1,4,'28356120313',342253);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (451,'Ciencias Naturales',4,1,4,'24722031815',69710);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (452,'Historia',2,1,5,'28985748264',195417);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (453,'Matematica',4,1,5,'23563705156',336078);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (454,'Geografia',6,1,4,'31710149693',186539);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (456,'Lengua y Literatura',4,1,4,'39244452908',663784);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (457,'Contabilidad',2,1,5,'30948057518',490231);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (458,'Informatica',4,1,2,'36890593142',806861);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (459,'Arte',2,1,5,'36077159564',424415);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (460,'Matematica',6,5,4,'37301035536',755326);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (461,'Educacion Fisica',2,1,4,'29459794135',31391);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (462,'Lengua y Literatura',4,4,4,'34230062568',895433);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (464,'Ciencias Naturales',2,1,5,'20328249425',370211);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (465,'Matematica',4,5,4,'22833580084',287790);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (466,'Ciencias Naturales',2,3,5,'24719525142',111617);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (468,'Matematica',6,1,5,'39531762243',896027);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (469,'Geografia',5,4,4,'24555620162',295799);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (470,'Ciencias Sociales',5,1,4,'29468338425',853915);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (472,'Contabilidad',5,1,1,'38257151577',745042);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (473,'Informatica',5,1,4,'36597842339',78578);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (474,'Arte',2,5,4,'21960944279',740611);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (475,'Matematica',2,1,4,'39171220521',55113);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (476,'Educacion Fisica',4,4,5,'28989891772',484519);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (477,'Lengua y Literatura',2,1,5,'23405503350',496059);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (478,'Ciencias Sociales',4,1,4,'35664390486',135488);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (480,'Matematica',2,3,4,'25069109966',939684);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (482,'Historia',2,1,4,'20587751025',626724);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (483,'Matematica',6,4,4,'26719633421',336233);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (484,'Geografia',2,1,4,'21085446629',459169);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (485,'Ciencias Sociales',4,1,5,'23654964150',565800);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (486,'Lengua y Literatura',4,1,5,'37790496332',936850);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (487,'Contabilidad',4,1,4,'29313789765',907);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (488,'Informatica',6,4,5,'37444253833',390306);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (489,'Arte',2,1,4,'33743175853',500744);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (491,'Educacion Fisica',2,1,2,'32694443321',945903);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (492,'Lengua y Literatura',4,1,5,'21714125389',297713);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (493,'Ciencias Sociales',4,1,4,'20015888973',38058);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (494,'Ciencias Naturales',4,1,4,'22111295707',798318);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (496,'Ciencias Naturales',4,3,1,'27618168959',992391);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (497,'Historia',2,1,4,'22660055939',456644);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (499,'Geografia',6,1,4,'28088309503',764715);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (500,'Ciencias Sociales',2,4,5,'25965198061',926567);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (502,'Contabilidad',2,4,4,'31210154434',237890);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (503,'Informatica',4,1,5,'21089959457',239694);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (505,'Matematica',6,1,5,'20571548562',305071);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (506,'Educacion Fisica',2,1,4,'31797133974',867464);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (507,'Lengua y Literatura',4,1,4,'23519626769',140770);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (508,'Ciencias Sociales',4,1,4,'23498677458',114480);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (509,'Ciencias Naturales',2,4,1,'22648155691',702486);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (510,'Matematica',4,1,4,'27317821394',717271);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (511,'Ciencias Naturales',2,1,4,'20387909156',413986);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (513,'Matematica',6,1,5,'30696554631',578108);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (514,'Geografia',5,1,4,'32556264636',375546);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (515,'Ciencias Sociales',5,5,5,'30393728178',164516);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (516,'Lengua y Literatura',5,3,2,'24939209119',687740);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (517,'Contabilidad',5,1,5,'31094063708',282009);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (518,'Informatica',5,1,4,'35786645633',227910);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (519,'Arte',2,5,4,'27627758684',411141);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (520,'Matematica',2,1,4,'30466554485',422761);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (521,'Educacion Fisica',4,4,1,'21611404362',962383);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (522,'Lengua y Literatura',2,1,4,'31559782623',203413);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (523,'Ciencias Sociales',4,1,4,'37839339708',849371);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (524,'Ciencias Naturales',6,5,4,'20538688912',274876);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (525,'Matematica',2,3,5,'34529633993',374696);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (526,'Ciencias Naturales',4,4,5,'29572940257',32352);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (527,'Historia',2,1,4,'28476737007',853110);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (528,'Matematica',6,4,5,'27403299754',531200);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (529,'Geografia',2,1,5,'24967832057',409230);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (530,'Ciencias Sociales',4,4,4,'22498565729',880698);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (531,'Lengua y Literatura',4,1,5,'20074247989',595713);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (534,'Arte',2,4,5,'36179213781',550500);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (535,'Matematica',6,1,2,'35325523654',233464);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (536,'Educacion Fisica',2,1,5,'34313894259',820730);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (537,'Lengua y Literatura',4,1,4,'39496326713',760720);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (538,'Ciencias Sociales',4,1,4,'36035340618',62675);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (539,'Ciencias Naturales',4,4,4,'38372302856',3841);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (540,'Matematica',6,1,1,'38882789318',33839);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (541,'Ciencias Naturales',4,1,4,'34276071306',819936);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (542,'Historia',2,1,4,'35801871269',889328);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (544,'Geografia',6,5,5,'35777431226',352663);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (545,'Ciencias Sociales',2,1,5,'36186219100',102357);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (546,'Lengua y Literatura',4,4,4,'37722326344',864167);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (547,'Contabilidad',2,1,4,'38276104439',670696);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (548,'Informatica',4,1,4,'36656494574',921623);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (549,'Arte',2,5,4,'26709860726',611889);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (550,'Matematica',6,3,5,'37626039296',741763);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (551,'Educacion Fisica',2,4,5,'35755887047',323025);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (552,'Lengua y Literatura',4,1,4,'24348680839',136889);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (554,'Ciencias Naturales',2,1,1,'20386677246',291577);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (555,'Matematica',4,1,5,'35102103355',532972);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (556,'Ciencias Naturales',2,1,4,'34984613637',901583);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (558,'Matematica',6,5,2,'20954574782',462479);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (559,'Geografia',5,1,5,'21770933523',28293);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (560,'Ciencias Sociales',5,4,4,'23874410592',136176);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (561,'Lengua y Literatura',5,1,4,'38075601917',495692);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (562,'Contabilidad',5,1,4,'26182018413',602873);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (563,'Informatica',5,5,1,'25638728295',729800);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (564,'Arte',2,3,4,'24858898211',951551);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (565,'Matematica',4,4,4,'28703117866',21210);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (566,'Educacion Fisica',6,1,4,'21204964344',911143);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (567,'Lengua y Literatura',5,4,5,'23669190394',845583);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (568,'Ciencias Sociales',5,1,5,'27059468045',162585);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (569,'Ciencias Naturales',5,1,4,'26131807495',466492);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (571,'Ciencias Naturales',5,1,4,'26563315436',512196);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (573,'Matematica',2,1,4,'26597144062',13383);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (574,'Geografia',4,1,4,'25967923045',425811);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (576,'Lengua y Literatura',4,1,5,'25104703289',783658);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (577,'Contabilidad',6,1,5,'39185678288',559116);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (579,'Arte',4,5,5,'33035407316',269056);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (580,'Matematica',2,3,4,'28405405307',424801);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (581,'Educacion Fisica',6,1,5,'27884075889',281315);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (582,'Lengua y Literatura',2,5,2,'34018936803',981016);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (583,'Ciencias Sociales',4,1,5,'27212425235',30409);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (584,'Ciencias Naturales',4,4,4,'31128806720',266464);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (585,'Matematica',6,1,4,'38798737930',69565);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (586,'Ciencias Naturales',2,4,4,'31213801863',941129);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (587,'Historia',6,1,1,'36882673237',820089);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (588,'Matematica',2,4,4,'24424260699',725223);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (589,'Geografia',4,1,4,'25499723019',516194);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (590,'Ciencias Sociales',4,1,4,'32156320838',131931);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (591,'Lengua y Literatura',4,1,5,'32838607559',912978);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (592,'Contabilidad',6,1,5,'27370010687',204760);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (593,'Informatica',4,4,4,'28966132849',468524);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (594,'Arte',2,1,5,'37027569494',678982);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (595,'Matematica',4,1,2,'23439968924',699573);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (596,'Educacion Fisica',6,1,5,'27851025301',919486);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (597,'Lengua y Literatura',2,1,4,'21797487860',200360);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (600,'Matematica',4,3,1,'35830653292',608083);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (601,'Ciencias Naturales',2,1,4,'26428633983',292035);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (603,'Matematica',2,5,4,'24498325807',174351);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (605,'Ciencias Sociales',4,4,4,'32705103422',2034);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (606,'Lengua y Literatura',2,1,5,'38241413280',999103);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (607,'Contabilidad',6,1,2,'37354198434',220945);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (608,'Informatica',2,5,5,'38090734033',703054);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (609,'Arte',4,3,4,'32020295041',282681);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (610,'Matematica',4,4,4,'32517235872',364907);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (611,'Educacion Fisica',2,1,4,'29390164413',10823);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (612,'Lengua y Literatura',4,4,1,'21278635165',934205);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (613,'Ciencias Sociales',2,1,4,'23351375454',739995);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (614,'Ciencias Naturales',4,4,4,'39790660091',320987);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (616,'Ciencias Naturales',5,4,5,'21692091855',307337);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (617,'Historia',5,1,5,'30628190502',924912);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (619,'Geografia',5,1,5,'27844886072',881397);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (621,'Lengua y Literatura',2,1,4,'28418676356',277854);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (622,'Contabilidad',2,1,5,'33021952784',294304);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (625,'Matematica',4,1,5,'20960329005',20707);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (627,'Lengua y Literatura',2,1,5,'37674222170',15637);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (630,'Matematica',6,4,4,'31394608973',809999);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (631,'Ciencias Naturales',2,1,1,'29303200718',68157);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (632,'Historia',4,1,4,'38927986758',941831);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (633,'Matematica',4,5,4,'25268025965',421078);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (635,'Ciencias Sociales',6,4,5,'23586248091',135418);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (636,'Lengua y Literatura',2,1,5,'39038954002',170512);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (637,'Contabilidad',6,4,4,'21074211066',307953);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (639,'Arte',4,1,4,'38932217526',13590);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (640,'Matematica',4,1,4,'24396976606',809277);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (642,'Lengua y Literatura',6,4,5,'29299108668',698443);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (643,'Ciencias Sociales',2,1,4,'24259402784',119871);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (645,'Matematica',4,1,4,'27264449438',222080);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (647,'Historia',4,1,2,'27101371269',659141);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (648,'Matematica',6,1,5,'26626319427',40704);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (649,'Geografia',2,4,4,'35198298057',420884);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (650,'Ciencias Sociales',4,1,4,'30186162629',30428);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (652,'Contabilidad',6,1,1,'25230604682',640198);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (654,'Arte',4,1,4,'23013282053',509053);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (655,'Matematica',4,1,5,'32027776520',875858);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (656,'Educacion Fisica',4,5,2,'23599778044',762521);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (657,'Lengua y Literatura',6,3,5,'32210791009',616050);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (659,'Ciencias Naturales',6,5,4,'38549655261',828311);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (660,'Matematica',2,1,4,'33207111406',727839);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (662,'Historia',4,1,4,'21309033346',277540);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (663,'Matematica',4,4,4,'34919623574',371827);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (664,'Geografia',6,1,4,'21398197816',358092);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (665,'Ciencias Sociales',4,4,5,'38843485627',963152);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (666,'Lengua y Literatura',2,1,5,'38834032027',387629);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (667,'Contabilidad',4,1,4,'24885680799',871707);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (668,'Informatica',6,1,4,'27789469159',9542);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (669,'Arte',2,1,4,'24399405866',308984);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (670,'Matematica',4,4,1,'39081844151',388244);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (674,'Ciencias Naturales',6,1,5,'35426722430',575391);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (675,'Matematica',2,1,5,'36090661208',709731);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (676,'Ciencias Naturales',4,5,4,'35177562463',708989);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (677,'Historia',4,3,5,'25643430914',151781);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (678,'Matematica',2,1,4,'34154799339',134695);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (679,'Geografia',4,1,5,'36864786118',629370);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (683,'Informatica',5,1,4,'28482968638',57176);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (684,'Arte',5,1,4,'26531822693',19332);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (685,'Matematica',5,5,1,'30567058652',484308);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (686,'Educacion Fisica',5,3,4,'26730427811',261368);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (687,'Lengua y Literatura',5,4,4,'22058119279',976187);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (688,'Ciencias Sociales',2,1,4,'22038086255',781899);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (689,'Ciencias Naturales',2,4,5,'30757062612',518458);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (690,'Matematica',4,1,5,'28497593193',300921);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (691,'Ciencias Naturales',2,4,4,'32036075280',558286);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (693,'Matematica',6,4,2,'24702566478',874126);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (694,'Geografia',2,1,5,'21229249121',635623);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (695,'Ciencias Sociales',4,4,4,'24721448601',676570);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (696,'Lengua y Literatura',2,1,4,'26432554095',681082);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (697,'Contabilidad',6,1,4,'22247250180',985748);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (698,'Informatica',2,1,1,'32269297433',487170);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (699,'Arte',4,1,4,'31859518192',843189);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (700,'Matematica',4,4,4,'30522569920',199773);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (704,'Ciencias Naturales',6,1,5,'27552263933',754950);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (706,'Ciencias Naturales',4,1,5,'37996435252',118308);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (707,'Historia',4,4,4,'39030369715',592695);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (708,'Matematica',4,1,4,'21462828435',141713);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (709,'Geografia',6,1,4,'33626440360',106709);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (711,'Lengua y Literatura',2,3,4,'23401963051',760192);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (712,'Contabilidad',4,4,4,'28874587886',597297);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (713,'Informatica',6,1,4,'31215680214',446988);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (714,'Arte',2,4,5,'30460275257',815577);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (715,'Matematica',4,1,5,'22857762946',845632);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (716,'Educacion Fisica',2,1,4,'38104872407',174317);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (717,'Lengua y Literatura',4,1,5,'21178984465',850476);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (718,'Ciencias Sociales',2,1,5,'25873980411',517235);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (719,'Ciencias Naturales',6,5,4,'37345846277',290946);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (720,'Matematica',2,1,5,'20916966818',236331);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (721,'Ciencias Naturales',4,4,5,'33780851019',68703);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (722,'Historia',4,1,4,'32299292119',114146);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (723,'Matematica',2,1,5,'37369203090',385878);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (725,'Ciencias Sociales',2,3,5,'22410071911',372375);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (726,'Lengua y Literatura',4,4,4,'27613227644',666881);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (727,'Contabilidad',6,1,4,'38810021952',129829);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (728,'Informatica',5,4,4,'30375939406',196726);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (729,'Arte',5,1,1,'31038869609',892921);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (731,'Educacion Fisica',5,1,4,'31998737272',483228);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (733,'Ciencias Sociales',2,4,5,'35741175389',805395);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (734,'Ciencias Naturales',2,1,5,'30646955513',597484);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (735,'Matematica',4,1,4,'33040196304',659859);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (736,'Ciencias Naturales',2,1,4,'22681009693',618084);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (738,'Matematica',6,1,4,'38963424423',285841);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (739,'Geografia',2,1,5,'39568808316',570769);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (740,'Ciencias Sociales',4,5,5,'35635630566',226032);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (741,'Lengua y Literatura',2,3,4,'20192741481',115531);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (742,'Contabilidad',6,1,4,'37699590949',138473);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (743,'Informatica',2,5,1,'36186949757',194699);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (745,'Matematica',4,4,4,'24218568000',223657);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (746,'Educacion Fisica',4,1,5,'37320781712',102624);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (747,'Lengua y Literatura',6,4,2,'21026757921',500256);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (748,'Ciencias Sociales',2,1,5,'34719726846',659616);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (749,'Ciencias Naturales',6,4,4,'21415315624',773900);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (750,'Matematica',2,1,4,'20874225434',995121);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (752,'Historia',4,1,1,'35659680141',720992);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (753,'Matematica',4,1,4,'33342759247',760066);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (754,'Geografia',6,4,4,'38921413232',439488);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (755,'Ciencias Sociales',4,1,4,'38708060802',192719);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (756,'Lengua y Literatura',2,1,5,'27818336328',324232);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (757,'Contabilidad',4,1,5,'21105832698',871592);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (759,'Arte',2,1,4,'28103121004',225342);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (760,'Matematica',4,5,4,'31674691529',163184);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (761,'Educacion Fisica',2,3,1,'38588814725',899663);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (762,'Lengua y Literatura',4,1,4,'27232767117',602493);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (763,'Ciencias Sociales',2,1,4,'26118625760',731593);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (764,'Ciencias Naturales',6,5,4,'25735968385',962374);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (765,'Matematica',2,1,5,'34400738925',337231);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (766,'Ciencias Naturales',4,4,5,'29649029744',324833);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (767,'Historia',4,1,4,'39671881465',768652);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (768,'Matematica',2,1,5,'21800987157',533291);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (769,'Geografia',4,5,4,'36501430888',792055);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (771,'Lengua y Literatura',4,4,2,'26300882946',874884);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (772,'Contabilidad',6,1,5,'21692868928',333942);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (774,'Arte',5,1,4,'35595143464',469472);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (775,'Matematica',5,4,4,'23297711169',843455);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (776,'Educacion Fisica',5,1,1,'37761490185',531496);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (777,'Lengua y Literatura',5,4,4,'29945238049',298200);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (778,'Ciencias Sociales',2,1,4,'33950649253',52905);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (779,'Ciencias Naturales',4,4,4,'22084816423',986872);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (780,'Matematica',6,1,5,'22595787508',700035);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (781,'Ciencias Naturales',5,1,5,'23597940378',27332);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (782,'Historia',5,1,4,'21452856260',487781);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (784,'Geografia',5,4,2,'24008501857',580128);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (785,'Ciencias Sociales',5,1,5,'38227787667',602771);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (786,'Lengua y Literatura',2,1,4,'38781400011',928553);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (789,'Arte',2,5,1,'33942367592',70739);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (790,'Matematica',4,1,4,'29428115883',954022);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (792,'Lengua y Literatura',2,1,4,'34043704289',317301);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (793,'Ciencias Sociales',4,1,5,'24560685665',185203);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (795,'Matematica',6,3,5,'25979025296',538932);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (796,'Ciencias Naturales',2,4,2,'29276534501',6220);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (797,'Historia',4,1,5,'34714870319',873521);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (798,'Matematica',4,4,4,'39522834503',715607);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (799,'Geografia',6,1,4,'24736828463',446652);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (800,'Ciencias Sociales',2,1,4,'34465017194',321527);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (802,'Contabilidad',2,5,4,'31960321180',791056);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (804,'Arte',4,4,4,'26781620829',826373);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (806,'Educacion Fisica',6,4,5,'32097134945',627745);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (807,'Lengua y Literatura',4,1,4,'26071888829',505379);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (808,'Ciencias Sociales',2,4,5,'34238491716',261866);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (809,'Ciencias Naturales',4,1,5,'30918187269',159524);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (812,'Historia',4,1,5,'39889150782',460866);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (813,'Matematica',2,4,4,'37425697198',115187);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (814,'Geografia',4,1,5,'34011031674',638540);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (815,'Ciencias Sociales',2,1,2,'34759992526',647598);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (816,'Lengua y Literatura',6,1,5,'33188373317',291274);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (817,'Contabilidad',2,1,4,'24793025080',24717);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (818,'Informatica',4,1,4,'20403810472',553277);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (819,'Arte',4,5,4,'34022471278',104974);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (820,'Matematica',2,3,1,'39110998166',734869);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (821,'Educacion Fisica',6,1,4,'32411545707',215168);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (822,'Lengua y Literatura',2,1,4,'24898751045',410676);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (823,'Ciencias Sociales',4,5,4,'20202605822',468642);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (824,'Ciencias Naturales',4,1,5,'28968390155',552014);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (825,'Matematica',2,4,5,'20257313518',472894);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (826,'Ciencias Naturales',4,1,4,'27930095462',744243);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (827,'Historia',2,1,4,'29148313730',158006);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (828,'Matematica',4,5,4,'26899397836',574345);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (829,'Geografia',6,3,4,'39220572186',583318);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (830,'Ciencias Sociales',5,4,5,'37551435005',739757);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (831,'Lengua y Literatura',5,1,5,'36386298273',77053);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (832,'Contabilidad',5,4,4,'35793080560',607455);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (834,'Arte',5,4,4,'36050843336',40919);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (835,'Matematica',2,1,5,'25477210160',829871);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (836,'Educacion Fisica',2,4,2,'24805475910',956509);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (837,'Lengua y Literatura',4,1,5,'37817850349',605423);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (839,'Ciencias Naturales',4,1,4,'21119031856',632596);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (840,'Matematica',6,1,4,'32237315129',872764);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (841,'Ciencias Naturales',2,1,1,'26338276068',156034);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (842,'Historia',4,1,5,'37196144583',917732);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (843,'Matematica',2,4,4,'31431309711',606158);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (844,'Geografia',6,1,5,'25584869536',200412);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (845,'Ciencias Sociales',2,1,2,'33797746578',801200);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (846,'Lengua y Literatura',4,1,5,'32750654302',859181);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (847,'Contabilidad',4,1,4,'25869246948',9954);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (848,'Informatica',4,5,4,'33792685864',62913);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (849,'Arte',6,1,4,'33294487799',932502);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (850,'Matematica',2,4,1,'27078047533',202735);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (851,'Educacion Fisica',6,1,4,'27179668516',426828);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (852,'Lengua y Literatura',2,1,4,'39058549855',207056);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (853,'Ciencias Sociales',4,5,4,'25039990361',405449);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (854,'Ciencias Naturales',4,3,5,'29063008645',809372);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (855,'Matematica',4,4,5,'26526499413',344386);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (857,'Historia',2,4,4,'22762795466',260869);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (858,'Matematica',2,1,4,'32268930360',588115);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (860,'Ciencias Sociales',2,1,4,'35569656991',542819);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (861,'Lengua y Literatura',4,1,4,'36884411254',804727);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (863,'Informatica',2,1,5,'26986452972',614359);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (865,'Matematica',2,1,4,'26671570807',530589);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (866,'Educacion Fisica',6,1,5,'30865694330',369003);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (867,'Lengua y Literatura',2,5,4,'37919706653',334453);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (868,'Ciencias Sociales',4,3,5,'37896261184',249930);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (869,'Ciencias Naturales',4,4,2,'32007052568',693311);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (870,'Matematica',4,1,5,'34574883928',538641);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (872,'Historia',2,1,4,'38640154562',236745);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (873,'Matematica',6,1,4,'37599779172',554817);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (875,'Ciencias Sociales',4,1,4,'26144406817',686150);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (876,'Lengua y Literatura',4,4,4,'22276759480',696758);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (877,'Contabilidad',4,1,4,'36185879026',938603);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (878,'Informatica',6,1,5,'34306410298',903191);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (879,'Arte',4,1,5,'21407671046',291979);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (880,'Matematica',2,1,4,'25929746287',514970);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (881,'Educacion Fisica',4,1,5,'21611898846',165596);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (883,'Ciencias Sociales',2,5,5,'22144476566',47762);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (884,'Ciencias Naturales',4,3,4,'20239124950',883970);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (886,'Ciencias Naturales',4,5,4,'30301828264',651274);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (887,'Historia',2,1,1,'23994946104',60976);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (888,'Matematica',6,4,4,'37976255635',273230);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (889,'Geografia',2,1,4,'29530812867',609978);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (890,'Ciencias Sociales',4,4,4,'25844946208',785716);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (891,'Lengua y Literatura',4,1,5,'26453174987',194759);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (893,'Informatica',4,1,5,'32961854838',25964);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (894,'Arte',2,1,2,'25372650763',447516);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (895,'Matematica',4,1,5,'28143185166',717673);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (896,'Educacion Fisica',6,1,4,'34772177447',621550);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (897,'Lengua y Literatura',5,4,4,'36274951782',433361);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (898,'Ciencias Sociales',5,1,4,'25277711209',785491);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (899,'Ciencias Naturales',5,1,1,'39136884042',134745);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (900,'Matematica',5,1,4,'36127915473',781430);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (902,'Historia',2,1,4,'22938362590',225598);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (903,'Matematica',2,5,5,'37009617051',411841);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (905,'Ciencias Sociales',2,1,4,'24152002768',80106);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (906,'Lengua y Literatura',4,1,5,'22256144089',33775);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (907,'Contabilidad',6,5,5,'38280897542',238426);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (908,'Informatica',2,1,4,'32411320044',568968);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (909,'Arte',4,4,5,'28139559675',990088);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (910,'Matematica',2,1,5,'28695427895',744438);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (911,'Educacion Fisica',6,1,4,'37162335341',657616);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (912,'Lengua y Literatura',2,5,5,'32365806050',36331);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (914,'Ciencias Naturales',4,4,5,'21608795785',257926);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (915,'Matematica',4,1,4,'35099243685',821845);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (916,'Ciencias Naturales',6,4,4,'25021934387',341577);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (917,'Historia',2,1,4,'29937353251',202460);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (919,'Geografia',2,1,4,'38191795752',379295);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (920,'Ciencias Sociales',4,4,4,'33346694855',361335);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (921,'Lengua y Literatura',4,1,4,'37981053584',756386);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (922,'Contabilidad',4,4,5,'31710146485',343022);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (923,'Informatica',6,1,5,'28306190178',646322);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (924,'Arte',4,1,4,'33893814326',562355);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (926,'Educacion Fisica',4,1,4,'26350583201',942300);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (927,'Lengua y Literatura',6,4,4,'26601719946',87954);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (929,'Ciencias Naturales',4,1,5,'34206515577',740249);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (932,'Historia',2,5,1,'37164009156',712050);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (933,'Matematica',6,1,5,'22663811737',62757);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (934,'Geografia',2,4,4,'30377514504',775761);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (935,'Ciencias Sociales',4,1,5,'25342895939',143742);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (936,'Lengua y Literatura',4,1,2,'39592355891',877808);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (940,'Matematica',4,1,4,'21991507262',466796);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (943,'Ciencias Sociales',5,1,4,'37825903939',120615);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (945,'Matematica',5,1,5,'34798721547',866513);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (946,'Ciencias Sociales',5,1,5,'33393852513',155628);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (947,'Lengua y Literatura',2,1,4,'34981990004',829436);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (948,'Contabilidad',2,4,4,'32905957181',562957);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (950,'Arte',2,1,1,'24987957975',136414);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (951,'Matematica',4,1,4,'27792827356',777390);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (952,'Educacion Fisica',6,1,4,'37998911608',395608);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (953,'Lengua y Literatura',2,1,4,'26547537314',478482);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (954,'Ciencias Sociales',4,1,5,'32278353028',703779);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (955,'Ciencias Naturales',2,5,5,'29223541752',275750);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (956,'Matematica',6,3,4,'20572590499',693402);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (958,'Historia',4,5,4,'22584897885',109145);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (960,'Geografia',4,4,2,'36878305437',503590);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (961,'Ciencias Sociales',6,1,5,'22088758761',115204);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (962,'Lengua y Literatura',2,4,4,'28142238499',727400);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (963,'Contabilidad',6,1,4,'20262037391',733146);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (964,'Informatica',2,4,4,'32281910649',681124);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (965,'Arte',4,1,1,'32446358028',182565);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (966,'Matematica',4,1,4,'31027128437',189235);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (967,'Educacion Fisica',4,1,4,'22731030136',253608);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (969,'Ciencias Sociales',4,4,5,'35411562498',202138);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (970,'Ciencias Naturales',2,1,5,'27176667156',521101);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (971,'Matematica',4,1,4,'34592867782',974118);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (972,'Educacion Fisica',6,1,5,'28163015608',408288);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (973,'Lengua y Literatura',2,1,2,'29837898229',866481);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (974,'Ciencias Sociales',4,1,5,'31995689393',409008);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (975,'Ciencias Naturales',2,5,4,'38543750274',418928);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (976,'Matematica',4,3,4,'25516559147',859260);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (978,'Historia',6,1,1,'24487779763',822545);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (979,'Matematica',2,5,4,'28216370000',946318);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (980,'Geografia',4,1,4,'21813809421',321105);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (983,'Contabilidad',4,1,4,'31459888705',482668);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (985,'Arte',4,3,2,'27128861468',541049);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (986,'Matematica',6,4,5,'32153155997',187989);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (990,'Ciencias Naturales',5,4,1,'28161303777',793723);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (991,'Matematica',5,1,4,'29338383034',442877);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (992,'Educacion Fisica',2,4,4,'27004595801',963781);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (993,'Lengua y Literatura',4,1,4,'26888425248',55986);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (994,'Ciencias Sociales',6,4,5,'25843940901',295156);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (995,'Ciencias Naturales',5,1,5,'26112740524',548314);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (996,'Matematica',5,1,4,'37465999776',251362);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (997,'Ciencias Naturales',5,1,5,'23750013171',365505);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (998,'Historia',5,1,5,'31977433016',63542);
INSERT INTO Materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (1000,'Geografia',2,1,5,'39735100407',396901);


/*Query Insert Into Tabla Localidad*/ 

INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (1,3,'san miguel del monte',32352);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (2,3,'arrecifes',374696);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (3,2,'san justo',540318);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (5,7,'cordoba capital',462479);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (6,7,'villa maria',446720);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (7,7,'alta gracia',234928);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (8,7,'cordoba capital',202138);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (9,7,'general belgrano',917732);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (10,7,'la falda',910904);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (14,4,'ancasti',574345);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (15,5,'resistencia',403089);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (16,5,'colonia elisa',134325);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (18,5,'resistencia',764715);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (19,10,'formosa capital',187942);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (21,10,'el colorado',554817);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (22,1,'agronomia',951551);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (23,1,'san telmo',229775);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (26,2,'kilometro 548',225342);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (27,3,'colonia el cacique lloron',336233);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (28,4,'legua 41',804727);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (29,5,'las chacras',538932);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (31,7,'villa quilino',622901);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (32,8,'quilino',259985);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (33,9,'carrenleufu',942300);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (34,10,'lago blanco',556380);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (35,11,'villa santos tesei',200360);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (36,12,'hurlingham',28293);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (37,13,'william c. morris',342799);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (38,14,'oratorio morante',129829);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (39,15,'godoy',609978);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (40,16,'campo la victoria',826754);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (41,17,'villa mercedes',856232);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (50,1,'rinconadillas',161672);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (51,2,'salado',109145);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (52,3,'abdon castro tolay',25013);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (53,4,'santuario de tres pozos',418928);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (54,5,'tolarito',739757);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (55,6,'28 de julio',305258);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (59,4,'las chacras',136889);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (60,5,'malargue',879537);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (62,7,'luanco',836353);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (63,8,'las leñas',729800);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (64,9,'el chacay',134695);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (69,14,'el vatro',140000800);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (75,6,'pata mora',907);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (76,7,'rio grande',6261);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (77,8,'los corrales',715607);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (78,9,'el carapacho',446652);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (79,10,'la valenciana',928553);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (80,11,'los molles',605269);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (81,1,'mogotes asperos',421588);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (82,2,'ojo de agua',211099);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (83,3,'estancia de guadalupe',871707);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (84,4,'san felipe',192719);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (85,5,'tres lomas',70739);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (86,6,'la argentina',731593);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (89,9,'estacion berreta',932502);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (90,10,'el chalten',281315);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (91,11,'el arbolito',592695);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (93,13,'colonia la perla',976187);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (94,14,'sarasa',523659);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (95,15,'pearson',553277);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (96,1,'colon',793062);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (98,3,'villa cacique',763579);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (99,4,'el sauce',323025);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (101,6,'benito juarez',69858);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (102,7,'coronel rodolfo bunge',853915);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (103,1,'lopez',514970);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (104,2,'san antonio',613184);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (105,3,'el luchador',69565);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (108,6,'los conquistadores',859181);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (109,7,'gancedo',273230);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (110,8,'la bolsa',199773);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (111,9,'laborde',681082);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (113,11,'mojotoro',263254);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (114,12,'islas de vaqueros',941129);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (115,13,'santa gertrudis',187989);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (116,14,'la calderilla',104635);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (117,15,'los sauces',63418);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (120,2,'el gallinato',6220);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (121,3,'campo alegre',597297);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (122,4,'la falda de san antonio',518458);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (123,5,'el hueco',987609);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (125,7,'la carrera',305071);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (126,8,'pomancillo',231919);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (127,9,'villa las pirquitas',696758);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (128,10,'collagasta',470702);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (129,1,'san jose',115531);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (130,2,'pomancillo oeste',135418);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (131,3,'pomancillo este',118308);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (134,6,'villa alfredo fortabat',215168);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (135,7,'cuartel ii - aeropuerto',809999);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (136,8,'espigas',195417);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (137,9,'recalde',442035);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (139,11,'el porvenir',621550);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (140,12,'sierras bayas',787481);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (142,2,'chacras de pibuel',364409);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (145,5,'calera avellaneda',334453);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (146,6,'el mirador',350077);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (147,7,'san quilco',845583);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (149,9,'sierra chica',869272);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (150,10,'las piedritas',280296);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (151,11,'villa la serrania',102357);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (152,1,'iturregui',321527);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (153,2,'villa monica',111617);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (154,3,'blancagrande',300116);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (156,5,'colonia hinojo',483228);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (157,6,'mapis',712805);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (161,1,'san gregorio',885623);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (162,2,'rocha',651274);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (164,4,'colonia nievas',638540);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (165,5,'la parda',562957);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (166,6,'san jacinto',874126);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (167,7,'la providencia',731394);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (169,9,'pourtale',385878);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (170,10,'la moderna',456644);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (171,11,'san antonio',709731);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (173,13,'los chilenos',926567);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (175,1,'colonia iturraspe',870282);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (176,2,'colonia la posta',853110);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (177,3,'arequito',754950);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (178,4,'san jose de aguilar',629220);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (180,6,'lizoite',9542);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (181,7,'la soledad',480663);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (182,8,'hornillos',998163);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (183,9,'el puesto',626724);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (184,10,'la falda',760720);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (185,11,'rodeo pampa',247539);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (186,12,'pucara',275750);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (187,13,'la huerta',745042);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (188,14,'campo la paz',193148);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (190,2,'san francisco',889328);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (191,3,'san jose',3841);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (192,4,'abra de santa cruz',62675);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (193,5,'santa cruz',562452);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (195,7,'santa victoria',175951);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (197,9,'antigal',830272);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (199,11,'san felipe',238426);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (200,12,'santa cruz de aguilar',503249);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (201,13,'mecoyita',106709);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (202,14,'acoyte',820730);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (203,1,'rio piedras',327154);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (204,2,'lumbreras',145921);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (207,5,'lihuel calel',40919);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (208,1,'puelches',583318);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (209,2,'general lagos',991649);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (210,3,'pampa la porteña',843455);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (211,4,'corzuela norte',159524);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (212,5,'san antonio',328679);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (213,6,'colonia juan lavalle',734869);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (214,7,'pampa zappa',37240);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (216,9,'campo canton',899377);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (217,10,'pampa alsina',632596);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (219,12,'la cienaga',483455);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (220,13,'las aguadas',55986);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (221,14,'tala verde',68703);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (222,15,'el puesto',337231);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (223,16,'los molles',336078);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (224,17,'cañadon seco',11745);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (225,18,'la escalera',529365);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (226,19,'la torrecita',40805);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (227,20,'huaco',580128);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (228,21,'villa sanagasta',202735);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (229,22,'adrogue',570769);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (230,1,'jose marmol',207056);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (231,2,'san jose',603434);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (232,3,'rafael calzada',388244);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (233,4,'claypole',77053);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (235,6,'burzaco',203413);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (236,7,'malvinas argentinas',533291);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (237,8,'glew',762521);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (238,9,'longchamps',115191);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (239,10,'don orione',68157);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (240,1,'san francisco solano',568968);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (241,2,'bell ville',602873);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (242,3,'colonia compiani',793723);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (243,4,'caleta olivia',422060);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (244,5,'nueva vizcaya',756913);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (245,6,'tortuguitas',582672);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (246,7,'del viso',294304);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (248,9,'garza',724240);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (249,10,'la vigia',550500);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (250,11,'la vuelta',11020);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (252,13,'santa felisa',597484);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (253,14,'la soledad',791056);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (254,15,'la caldera',33193);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (255,16,'los indios',212589);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (256,1,'la concepcion',819936);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (257,2,'la rojera',881397);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (258,3,'la beba',548314);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (259,4,'barrio las margaritas',795043);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (261,6,'las polvaredas',892276);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (262,7,'la vuelta chica',712050);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (263,8,'hunter',661688);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (264,9,'villa manuel pomar',13590);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (265,10,'la tigra',241854);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (267,12,'estacion sol de mayo',901583);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (268,13,'rafael obligado',616050);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (269,14,'villa parque cecir',509053);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (270,15,'la verde',333942);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (271,16,'san basilio',692390);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (272,17,'villa general mitre',284219);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (273,1,'san roque',987000);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (274,2,'cerro pelado',291274);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (276,4,'florida negra',352663);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (279,7,'suardi',500256);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (280,8,'colonia san jose',867464);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (281,9,'alonso',918032);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (282,10,'volcan de yacoraite',115187);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (283,11,'yacoraite',297713);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (284,12,'huacalera',659141);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (285,13,'la toma',995121);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (287,15,'calle angosta',886370);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (288,1,'newton',420884);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (290,3,'chas',468708);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (292,5,'la verde',344361);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (293,6,'gorchs',60976);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (294,7,'el descanso',472894);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (295,8,'colonia el salado',236331);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (296,9,'lavalle',941831);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (298,11,'la loma',411141);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (299,12,'rincon de santa lucia',741763);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (300,13,'rincon de soto',680340);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (301,1,'enrique urien',740249);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (302,2,'la viruela',760066);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (303,3,'la manuela',919486);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (305,5,'campo colla',27351);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (306,6,'las higueritas',602771);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (307,7,'coronel rodriguez',773900);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (308,8,'santa clara de buena vista',698443);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (309,9,'el mojon',655222);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (310,10,'el guanaco',120615);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (311,1,'la maza',57176);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (312,2,'santa catalina',255660);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (313,3,'la piedra blanca',370888);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (314,4,'agua de oro',767071);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (315,5,'pozo de molina',194699);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (316,6,'pozo del simbol',295156);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (317,7,'el jordan',759803);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (318,8,'la barranca',805395);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (319,9,'pozo de las ollas',233464);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (320,10,'punta del monte',220447);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (321,11,'la victoria',215154);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (322,12,'san miguel',999103);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (323,13,'alto de fierro',666881);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (325,15,'la penca',608083);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (326,16,'san antonio',396523);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (327,17,'la victoria oeste',841654);
INSERT INTO Localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (329,19,'la victoria (e)',333335);


/* VIEWS */

/* Escuelas ubicadas en Córdoba*/

create or replace view Escuelas_de_Cordoba as 
(select NumEscuela as N°, e.Nombre as Escuela, p.nombre as Provincia, region
from escuelas as e
inner join provincias as p
on e.IdProvin = p.IdProvin
where p.nombre='cordoba'
order by region);

/*Cantidad de Escuelas de Cordoba*/

create or replace view Cant_Escuelas_de_Cordoba as
(select count(*) as escuelas_de_cordoba
from escuelas_de_cordoba);

/* Docentes que posean mas de 3 años de experiencia y enseñen en nivel primario en todo el país*/

create or replace view Docentes_Nivel_primario_3años as
(select Id_cuit,nombre,apellido,años_docenc,d.idnivel as N°nivel, Nivel
from docentes as d
inner join niveles_educativos as n
on d.IdNivel = n.IdNivel
where años_docenc >=3 and d.idnivel=2
order by años_docenc asc);

/*Promedio de Horas que se enseña matematica en las escuelas*/

create or replace view Matematica_Promedio_Horas as
(select materia,avg(durac_horas) as promedio_de_horas from materias where materia = 'Matematica');


/* Escuelas que no sean del AMBA*/

create or replace view Escuelas_Pais_sin_AMBA as
(select e.Cue_Escuela,e.nombre as escuela,calle,p.nombre as provincia,localidad,region
from Escuelas as e
join localidad as l
on e.cue_escuela = l.cue_escuela
join provincias as p
on p.idprovin = l.idprovin
where region not like ('AMBA')
order by p.nombre asc);

/*Cantidad de escuelas sin AMBA en el País*/

create or replace view Total_de_escuelas_sin_AMBA as
(select count(Escuela) from Escuelas_Pais_sin_AMBA);


/*Materia con menor cantidad de horas dictadas por clases (detectada en una escuela)*/

create or replace view Materia_Menor_Horas_Pais as
(Select materia,min(durac_Horas),m.Cue_escuela,e.nombre as Escuela,p.nombre as provincia
from Materias as m
join escuelas as e
on m.cue_escuela= e.Cue_Escuela
join localidad as l
on e.Cue_Escuela= l.Cue_Escuela
join provincias as p
on l.IdProvin = p.IdProvin
having min(durac_horas) < 4
order by p.nombre);

/*FUNCIONES ALMACENADAS*/
 
 /*Contar en cuantas escuelas se enseñan una matería en específico y la suma de horas en total de escuelas de la materia seleccionada */
 
 
 /*Función para contar en cuantas escuelas se enseña una materia específica*/

USE `escuelas_argentinas4`;
DROP function IF EXISTS `cantidad_de_materias`;
DELIMITER $$
CREATE FUNCTION `cantidad_de_materias`(f_materia char(255)) 
RETURNS int
READS SQL DATA
BEGIN
DECLARE resultado char (255);
set resultado = (select count(materia) 
from materias
where materia=f_materia);
RETURN resultado;
END$$
DELIMITER;

/*Función para contar horas por materia*/

USE `escuelas_argentinas4`;
DROP function IF EXISTS `Cant_de_horas`;
DELIMITER $$
USE `escuelas_argentinas4`$$
CREATE FUNCTION `Cant_de_horas` (f_materia CHAR (255))
RETURNS INT 
READS SQL DATA
BEGIN
DECLARE resultado INT;
set resultado = (select sum(durac_horas) 
from materias
where materia=f_materia);
RETURN resultado;
END$$
DELIMITER;

/*Ejemplo de ejecución*/

select cantidad_de_materias ('Ciencias Sociales'), cant_de_horas ('Ciencias Sociales');


/*Cant de escuelas por provincia*/

USE `escuelas_argentinas4`;
DROP function IF EXISTS `Cant_escuelas_provincia`;
DELIMITER $$
USE `escuelas_argentinas4`$$
CREATE FUNCTION `Cant_escuelas_provincia` (p_provincia CHAR (255))
RETURNS INT
reads sql data
BEGIN
DECLARE resultado CHAR(255);
Set resultado=(select count(e.nombre)
from escuelas as e
inner join provincias as p
on e.IdProvin = p.IdProvin
where p.nombre=p_provincia
);
RETURN resultado;
END$$
DELIMITER ;

/*Ejemplo de ejecución*/

select Cant_escuelas_provincia ('chaco');


/*comprobación*/

select count(e.nombre)
from escuelas as e
inner join provincias as p
on e.IdProvin = p.IdProvin
where p.nombre='chaco';

#STORED PROCEDURES

#STORE PROCEDURE 1
#Ordenamiento de tabla Escuelas ( CON ORDENAMIENTO Ascendente y Descendente)

USE Escuelas_Argentinas4;

DELIMITER $$

CREATE PROCEDURE `sp_escuela_order` (IN campo CHAR(255), IN tipo_ordenamiento ENUM ('ASC','DESC',''))

BEGIN 

-- validacion de campo
IF campo <> '' THEN	
	SET @escuela_order = CONCAT('ORDER BY ' , campo);
else	
	SET @escuela_order = '';
    end if;
   
   -- validacion  de ordenamiento
IF tipo_ordenamiento <> '' THEN	
	SET @tipo = CONCAT(' ' , tipo_ordenamiento );
else	
	SET @tipo = '';
    end if;    
    
   -- validacion de clausula
SET @clausula = CONCAT('select * FROM escuelas ', @escuela_order, @tipo);
PREPARE runSQL FROM @clausula;
EXECUTE runSQL;	   
DEALLOCATE PREPARE runSQL;
    
END
$$

#VALIDACION DE STORE PROCEDURE 1 
#SP CON PARAMETRO DE CAMPO ORDENADO Y PARAMETRO ASCENDENTE O DESCENDENTE

call sp_escuela_Order ('Calle','DESC');

#STORE PROCEDURE 2
-- SP QUE VERIFICA QUE LA MODALIDAD EDUCATIVA A INSERTAR NO ESTE REPETIDA
USE Escuelas_Argentinas4;

DELIMITER $$

CREATE PROCEDURE `sp_insert_incremental_modalidad` (IN p_modalidad VARCHAR (255))

BEGIN 
IF ( SELECT COUNT(*) from modalidades_educativas where tipo=p_modalidad) = 0 THEN
	SET @p_max_id_modalidad = (SELECT MAX(IdModalidad) FROM modalidades_educativas)+1; 
    INSERT INTO escuelas_argentinas4.modalidades_educativas VALUES (@p_max_id_modalidad,p_modalidad);
ELSE
    SELECT 'MODALIDAD YA AGREGADA';
END IF;

END
$$

#VALIDACION/COMPROBACION DE STORE PROCEDURE 2
#SP PARA INSERTAR PARAMETRO NO EXISTENTE EN LA TABLA MODALIDADES EDUCATIVAS

call sp_insert_incremental_modalidad ('Modalidad prueba');


#TRIGGERS

/*DOCENTES HISTORICOS ELIMINADOS*/
#EL SIGUIENTE TRIGGER CONTROLA LOS DOCENTES HISTORICOS QUE SON ELIMINADOS, REGISTRANDO LOS DATOS DEL DOCENTE ELIMINADO, EL USUARIO QUE LLEVO A CABO LA ACCION Y LA FECHA Y HORA DE DICHA ACCION.

#TABLA TRIGGER

CREATE TABLE IF NOT EXISTS Eliminacion_docentes (
	Id_Cuit VARCHAR (30),
    Nombre VARCHAR (255),
    Apellido VARCHAR (255),
    Edad INT,
    DNI VARCHAR (255),
    Matricu VARCHAR (255),
    Cue_Escuela INT,
    fecha DATE,
    hora TIME,
    usuario VARCHAR(100),
    BD VARCHAR(100)
    );

#SENTENCIA TRIGGER
CREATE TRIGGER DEL_BEF_datos_Docentes
BEFORE DELETE ON Docentes
FOR EACH ROW
INSERT into Eliminacion_docentes 
VALUES (OLD.Id_Cuit,OLD.Nombre,OLD.Apellido,OLD.Edad,OLD.Dni,OLD.Matricu,OLD.Cue_Escuela,curdate(),curtime(), USER(), DATABASE());

#COMPROBACION
Delete from docentes;

#NUEVAS ESCUELAS INSERTADAS
#Registra las nuevas escuelas agregadas en la Tabla Escuelas (Con fecha y Hora).

#TABLA TRIGGER
CREATE TABLE IF NOT EXISTS Nuevas_Escuelas (
        Fecha DATE,
        Hora TIME,
        Cue_Escuela INT NOT NULL UNIQUE PRIMARY KEY,
		NumEscuela VARCHAR (255) NULL,
        Nombre VARCHAR (255) NOT NULL,
        Calle VARCHAR (255) NOT NULL,
        Num_Calle VARCHAR (255) NULL,
        Cod_postal VARCHAR (255) NOT NULL,
        Telefono VARCHAR (255) NULL,
        Email VARCHAR (255) null,
        IdProvin INT NOT NULL,
        IdModalidad INT NOT NULL,
        IdNivel INT NOT NULL
        );      

#SENTENCIA TRIGGER
CREATE TRIGGER INS_AFT_Escuelas
AFTER INSERT ON escuelas
FOR EACH ROW
INSERT INTO Nuevas_Escuelas
VALUES (curdate(),curtime(),New.Cue_Escuela,New.NumEscuela, New.Nombre,New.Calle, New.Num_Calle,New.Cod_postal,
		New.Telefono,New.Email,New.IdProvin,New.IdModalidad,New.IdNivel); 

#COMPROBACION CON INSERT INTO     
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (36890023, 2, 'MEDIA 30', 'MANZONI',4876,'B1759','1143567434','Juanusi9876@gmail.com',2,4,2); 

--                                      --                                        --

#PERMISOS DE USUARIOS

use escuelas_argentinas4;

# USUARIO 1 (CON CONTRASEÑA)
CREATE USER userbd_escuelas@localhost identified by 'contraseña';

#SOLO PERMISO DE LECTURA EN LA BD (NO PERMITE INSERTAR, MODIFICAR, NI ELIMINAR DATOS DE LA BD)
GRANT SELECT ON escuelas_argentinas4.* TO userbd_escuelas@localhost;

# USUARIO 2 (CON CONTRASEÑA)
CREATE USER user2_escuelasargentinas4@localhost identified by 'prueba1234';

#PERMISO DE LECTURA,INSERCION Y MODIFICACION DE DATOS EN BD (SIN PERMISO DE ELIMINACION)
GRANT SELECT ON escuelas_argentinas4.* TO user2_escuelasargentinas4@localhost;
GRANT INSERT ON escuelas_argentinas4.* TO user2_escuelasargentinas4@localhost;
GRANT UPDATE ON escuelas_argentinas4.* TO user2_escuelasargentinas4@localhost;


--            			--					--						--
#SENTENCIAS TCL 

#SENTENCIA 1 
#Tabla Docentes

START TRANSACTION;
DELETE FROM Docentes where Nombre = 'Romina';

Rollback;
Commit;

select * from docentes;

#back up insert into (Docente Romina Caporale) 
#INSERT INTO docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('20288554194','Romina','Caporale',39,'28855419',11,'925',5,3,340000600);

#SENTENCIA 2
#Tabla Escuelas

Use escuelas_argentinas4;

START TRANSACTION;
INSERT INTO Escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (140000189,'23','COLEGIO CHIMANGO','AVENIDA CAMALEON 1435','1435','5000','0351-4567382','chimangoesc@cordoba.org.ar',7,11,3);
INSERT INTO Escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (153462534,'106','EMN 978','RECUERO 37','37','5000','0351-235689','abcas@cordoba.org.ar',7,12,5);
INSERT INTO Escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (158945674,'98','COLEGIO SANTA RITA','AMAICA 789','789','5000','0351-239045','santarita@cordoba.org.ar',7,3,2);
INSERT INTO Escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (151123453,'1','SANTA MARIA','COLO 345','345','5000','0351-456473','santamaria@cordoba.org.ar',7,10,4);
SAVEPOINT Lote_1;
INSERT INTO Escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (158869754,'64','ESCUELA 64 MONROE','MATIENZO 6634','6634','5000','0351-672398','monroe@cordoba.org.ar',7,9,2);
INSERT INTO Escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (169023944,'1','COLEGIO INGENIERO WHITE','WHITE 222','222','5000','0351-782364','ingeniero@cordoba.org.ar',7,9,4);
INSERT INTO Escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (169023955,'35','ESCUELA 35 DOLORES','DOLORES 67','67','5000','0351-882345','dolores@cordoba.org.ar',7,8,3);
INSERT INTO Escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (169023966,'1','COLEGIO LOS ALEROS','JUAN 168','168','5000','0351-673467','colegiolosaleros@cordoba.org.ar',7,11,2);
SAVEPOINT Lote_2;

#CONFIRMACION DE CANTIDAD DE ESCUELAS
Select count(*) from escuelas;

#EJECUCION DE ROLLBACK AL SAVEPOINT LOTE_1
ROLLBACK TO Lote_1;

#SENTENCIA DE ELIMINACION DE SAVEPOINT Lote_1
RELEASE SAVEPOINT Lote_1;

DROP USER userbd_escuelas@localhost;
DROP USER user2_escuelasargentinas4@localhost;


select * from materias;