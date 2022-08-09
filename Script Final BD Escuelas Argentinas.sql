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
            );
            
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
            );
            
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
            );
 

/* TABLA LOCALIDAD */

CREATE TABLE IF NOT EXISTS Localidad(
	IdLocalidad INT NOT NULL auto_increment UNIQUE PRIMARY KEY,
		IdProvin INT NOT NULL,	
		Localidad VARCHAR (255) NOT NULL,
        Cue_Escuela INT NOT NULL UNIQUE,
			FOREIGN KEY (IdProvin) REFERENCES Escuelas_Argentinas4.Provincias(IdProvin) ,
			FOREIGN KEY (Cue_Escuela) REFERENCES Escuelas_Argentinas4.Escuelas(Cue_Escuela)
            );   

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

INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (20001100,'1','REPUBLICA ITALIANA','RIO CUARTO 1249 BOCA ','1249','1168','011-4301-0301','DEP_EPC19_DE4@BUE.EDU.AR',1,10,2);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (20001200,'1','JUAN MARIA GUTIERREZ','ROCHA 1226 BOCA ','1226','1166','011-4301-1020','DEP_EPC_DE04@BUE.EDU.AR',1,10,2);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (20001500,'1','EUSTAQUIO CARDENAS','SALTA 1226 CONSTITUCION ','1226','1137','011-4305-1244','DEAA_EP16_DE3@BUE.EDU.AR',1,10,3);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (60000100,'915','JARDÍN DE INFANTES Nº915 JAVIER VILLAFAÑE','TIRO FEDERAL 712  ','712','7300','02281-426487','jardin905azul@gmail.com',3,10,1);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (60000200,'2','ESCUELA DE EDUCACIÓN PRIMARIA Nº2 DOMINGO FAUSTINO SARMIENTO','COLON Y MITRE 498 ','498','7300','02281-42-3361','epnro2azul@yahoo.com.ar',3,10,2);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (60000300,'1','INSTITUTO PEDRO B. PALACIOS','VICTOR MARTINEZ Y OSVALDO SOSA 1946  ','1946','1757','011-4457-0054','info@ipbp.com.ar',2,10,2);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (60000400,'1','INSTITUTO JUANA DE IBARBOUROU','AV. ROJO 4415  ','4415','1757','011-4626-1051','jdeibarbourou@yahoo.com.ar',2,10,4);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (100000100,'435','ESCUELA N° 435 MARIA VICTORIA VAZQUEZ DE MARTINEZ','HUMAYA','1','4711','-','-',4,10,2);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (100000200,'429','Escuela Nº 429','LAS PIEDRAS BLANCAS','1','4715','383-4448824','-',4,10,2);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (100000300,'247','ESCUELA N° 247 MARISCAL SUCRE','LAS HORTENCIAS S/Nº CENTRO EL RODEO','1','4715','(3833-490122)','-',4,10,2);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (140000100,'1','COLEGIO LUTERANO CONCORDIA','AVENIDA SANTA ANA 2011 ALTO ALBERDI BARRIO ALTO ALBERDI','2011','5010','0351-4806783/4881258','colegiocordoba@iela.org.ar',7,10,2);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (140000200,'1','INSTITUTO LUTERANO CONCORDIA','AVENIDA SANTA ANA 2011 ALTO ALBERDI BARRIO ALTO ALBERDI','2011','5010','0351-4881258/4806783','colegiocordoba@iela.org.ar',7,10,3);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (140000300,'1','ESCUELA JOSE MARMOL','AVENIDA LOS PLATANOS 1346 LOS PLATANOS BARRIO LOS PLATANOS','1346','5010','0351-4347812','EE0410304@me.cba.gov.ar',7,10,2);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (140000700,'1','J.DE INF. JOSE JAVIER DIAZ','GARZON MACEDA 67 ALTO ALBERDI BARRIO ALTO ALBERDI','67','5003','0351-4337997','EE0410801@me.cba.gov.ar',7,10,1);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (140000800,'1','ESCUELA NOCTURNA REPUBLICA DEL PARAGUAY','AVENIDA COLON 2772 ALTO ALBERDI BARRIO ALTO ALBERDI','2772','5003','0351-4337805','-',7,4,6);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (140000900,'1','J.DE INF. BERNARDO DE MONTEAGUDO','AVENIDA SANTA ANA  3451 LOS PLATANOS BARRIO LOS PLATANOS','3451','5003','0351-4347869','EE0410834@me.cba.gov.ar',7,10,1);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (140001100,'1','ESCUELA ADOLFO VAN GELDEREN','CALLE PUBLICA  CHACRA DE LA MERCED CAMINO CHACRA DE LA MERCED KM 9','1','5013','0351-4349046','EE0410617@me.cba.gov.ar',7,10,2);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (220000100,'84','JARDIN DE INFANTES Nº 84 ALAS DE LIBERTAD','JULIO TORT 1400 NAZARENO ','1400','3500','0362 4-409680','jardinmaternal84@hotmail.com',5,10,1);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (220000101,'84','JARDIN DE INFANTES Nº 84 ALAS DE LIBERTAD','AV. EDISON 1060 VILLA LIBERTAD Func. CIFF Nº 15','1060','3500','-','jardinmaternal84@hotmail.com',5,10,1);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (220000200,'50','E.E.P. Nº   50','REPUBLICA DOMINICANA 1200 VILLA DON ANDRES Enttre CARRASCO, J. ACOSTA, HAITI','1200','3500','0362-177085','eep50chaco@hotmail.com',5,10,2);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (220000300,'45','JARDIN DE INFANTES Nº 45 MAESTRA SARA MARINO','ARBO Y BLANCO 1245 VILLA CENTENARIO VILLA CENTENARIO','1245','3500','0362-440923','jininn45@yanhoo.com.ar',5,10,1);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (340000500,'202','EPEP N° 202','EL BAÑADERO- RUTA PROVINCIAL N° 9','1','3603','(3704)-554606','juancuenca_43@hotmail.com',10,10,2);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (340000600,'229','EPEP N°229','SAN SIMON -RUTA N° 9','1','3603','-','-',10,10,2);
INSERT INTO escuelas (`Cue_Escuela`,`NumEscuela`,`Nombre`,`Calle`,`Num_Calle`,`Cod_postal`,`Telefono`,`Email`,`IdProvin`,`IdModalidad`,`IdNivel`) VALUES (340000700,'286','EPEP N° 286','COLONIA RODA','1','3603','-','-',10,10,2);

/*Query Insert Into Tabla Docentes*/ 

INSERT INTO docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('20288554194','Romina','Caporale',39,'28855419',11,'925',5,3,340000600);
INSERT INTO docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('20345874673','Jose Maria ','Acevedo',31,'34587467',5,'558',6,2,100000300);
INSERT INTO docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('20384929948','Maria Soledad','Mistral',28,'38492994',1,'298',2,3,340000700);
INSERT INTO docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('21395426713','Sebastian','Caiman',27,'39542671',4,'748',6,2,100000100);
INSERT INTO docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('22236784563','Ingrid \n  \n','Sousa\n',46,'23678456',10,'667',2,2,140000900);
INSERT INTO docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('23326988964','Reinaldo','Juarez',35,'32698896',12,'128',2,3,20001200);
INSERT INTO docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('23351246272','Leonardo','Remanso',31,'35124627',6,'937',1,2,140000200);
INSERT INTO docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('23389425364','Pedro','Cruz',28,'38942536',4,'543',5,4,100000300);
INSERT INTO docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('24331829382','Magali','Bustamante',32,'33182938',3,'237',2,2,140000900);
INSERT INTO docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('24369998723','Lucia','Leico',30,'36999872',6,'882',1,1,220000101);
INSERT INTO docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('25378879384','Juan Carlos','Castillo',29,'37887938',3,'823',3,2,20001100);
INSERT INTO docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('25402781291','Camila','Machado',26,'40278129',2,'743',1,3,60000300);
INSERT INTO docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('26309099256','Monica','Anchua',35,'30909925',10,'726',2,5,220000101);
INSERT INTO docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('27236392092','Agustina','Remacho',46,'23639209',7,'672',4,1,100000100);
INSERT INTO docentes (`Id_Cuit`,`Nombre`,`Apellido`,`Edad`,`Dni`,`Años_Docenc`,`Matricu`,`IdNivel`,`IdEspeciali_`,`Cue_Escuela`) VALUES ('28385443733','Julian','Casamiro',28,'38544373',2,'865',4,4,20001200);

/*Query Insert Into Tabla Materias*/ 

INSERT INTO materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (1,'Ciencias Naturales',2,1,5,'20345874673',60000400);
INSERT INTO materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (2,'Historia',2,5,4,'20384929948',100000100);
INSERT INTO materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (3,'Matematica',4,1,5,'20288554194',100000200);
INSERT INTO materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (4,'Geografia',2,4,2,'21395426713',100000300);
INSERT INTO materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (5,'Ciencias Sociales',4,1,5,'22236784563',140000100);
INSERT INTO materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (6,'Lengua y Literatura',6,1,4,'23326988964',140000200);
INSERT INTO materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (7,'Contabilidad',2,5,4,'23351246272',140000300);
INSERT INTO materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (8,'Informatica',4,3,4,'23389425364',140000700);
INSERT INTO materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (9,'Arte',2,4,1,'24331829382',140000800);
INSERT INTO materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (10,'Matematica',6,1,4,'24369998723',140000900);
INSERT INTO materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (11,'Educacion Fisica',2,4,4,'25378879384',140001100);
INSERT INTO materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (12,'Lengua y Literatura',4,1,4,'25402781291',220000100);
INSERT INTO materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (13,'Ciencias Sociales',4,1,5,'26309099256',220000101);
INSERT INTO materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (14,'Ciencias Naturales',4,1,5,'27236392092',220000200);
INSERT INTO materias (`IdMateria`,`Materia`,`Durac_Horas`,`IdTipCurs_`,`IdTurno`,`Id_Cuit`,`Cue_Escuela`) VALUES (15,'Matematica',6,1,4,'28385443733',220000300);

/*Query Insert Into Tabla Localidad*/ 

INSERT INTO localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (1,3,'San Miguel del Monte',60000100);
INSERT INTO localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (2,3,'Arrecifes',60000200);
INSERT INTO localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (3,2,'San Justo',60000300);
INSERT INTO localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (4,2,'Lomas de Zamora',60000400);
INSERT INTO localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (5,7,'Cordoba Capital',140000100);
INSERT INTO localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (6,7,'Villa Maria',140000200);
INSERT INTO localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (7,7,'Alta Gracia',140000300);
INSERT INTO localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (8,7,'Cordoba Capital',140000700);
INSERT INTO localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (9,7,'General Belgrano',140000800);
INSERT INTO localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (10,7,'La Falda',140000900);
INSERT INTO localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (11,7,'Villa Maria',140001100);
INSERT INTO localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (12,4,'Aconquija',100000100);
INSERT INTO localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (13,4,'Alijilan',100000200);
INSERT INTO localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (14,4,'Ancasti',100000300);
INSERT INTO localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (15,5,'Resistencia',220000100);
INSERT INTO localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (16,5,'Colonia Elisa',220000101);
INSERT INTO localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (17,5,'Charata',220000200);
INSERT INTO localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (18,5,'Resistencia',220000300);
INSERT INTO localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (19,10,'Formosa Capital',340000500);
INSERT INTO localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (20,10,'Clorinda',340000600);
INSERT INTO localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (21,10,'El Colorado',340000700);
INSERT INTO localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (22,1,'Agronomia',20001100);
INSERT INTO localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (23,1,'San Telmo',20001200);
INSERT INTO localidad (`IdLocalidad`,`IdProvin`,`Localidad`,`Cue_Escuela`) VALUES (24,1,'Belgrano',20001500);


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