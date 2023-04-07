------------------------------------- SCRIPT DE CREATION DES TABLES ET INSERTION DES TUPLES -------------------------------------

-- Auteurs : CREPIN Corentin, MALEBE Mayel

-- TP : TPD

-- SAE BDD BUT2 SEMESTRE 3

-- Module : R3.07

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

/* Table Equipe */

-- 1. Création de la table
CREATE TABLE IF NOT EXISTS equipe (
  id_equipe int NOT NULL,
  nom varchar(255) NOT NULL,
  ville varchar(255) NOT NULL,
  stade varchar(255) NOT NULL,
  capacite int NOT NULL,
  PRIMARY KEY (id_equipe)
);

-- 2. Insertion des données
INSERT INTO equipe VALUES
(1, 'Arsenal', 'Londres', 'Emirates Stadium', 60361),
(2, 'Aston Villa', 'Birmingham', 'Villa Park', 42788),
(3, 'Brighton', 'Brighton', 'Amex Stadium', 30750),
(4, 'Burnley', 'Burnley', 'Turf Moor', 22574),
(5, 'Chelsea', 'Londres', 'Stamford Bridge', 40949),
(6, 'Crystal Palace', 'Londres', 'Selhurst Park', 26300),
(7, 'Everton', 'Liverpool', 'Goodison Park', 39578),
(8, 'Leicester', 'Leicester', 'King Power Stadium', 32262),
(9, 'Liverpool', 'Liverpool', 'Anfield', 54074),
(10, 'Manchester City', 'Manchester', 'Etihad Stadium', 55097),
(11, 'Manchester United', 'Manchester', 'Old Trafford', 76212),
(12, 'Newcastle', 'Newcastle', 'St James Park', 52338),
(13, 'Norwich', 'Norwich', 'Carrow Road', 27000),
(14, 'Sheffield United', 'Sheffield', 'Bramall Lane', 32362),
(15, 'Southampton', 'Southampton', 'St Mary''s Stadium', 32689),
(16, 'Tottenham', 'Londres', 'Tottenham Hotspur Stadium', 62062),
(17, 'Watford', 'Watford', 'Vicarage Road', 21000),
(18, 'West Ham', 'Londres', 'London Stadium', 60000),
(19, 'Wolverhampton', 'Wolverhampton', 'Molineux Stadium', 31333),
(20, 'Lens', 'Londres', 'Stade Bollaert-Delelis', 25000);

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

/* Table Joueur */

-- 1. Création de la table
Create table joueur(
    id_joueur int primary key,
    nom_joueur varchar(50) not null,
    prenom_joueur varchar(50) not null,
    poste_joueur varchar(50) not null,
    numero_joueur int not null,
    id_equipe int not null,
    foreign key (id_equipe) references equipe(id_equipe)
);

-- 2. Insertion des données
insert into joueur values(1, 'Courtois', 'Thibaut', 'Gardien', 13, 5);
insert into joueur values(2, 'Azpilicueta', 'Cesar', 'Defenseur', 28, 5);
insert into joueur values(3, 'Luiz', 'David', 'Defenseur', 30, 5);
insert into joueur values(4, 'Rudiger', 'Antonio', 'Defenseur', 2, 5);
insert into joueur values(5, 'Alonso', 'Marcos', 'Defenseur', 3, 5);
insert into joueur values(6, 'Kante', 'NGolo', 'Milieu', 7, 5);
insert into joueur values(7, 'Jorginho', 'Jorginho', 'Milieu', 5, 5);
insert into joueur values(8, 'Kovacic', 'Mateo', 'Milieu', 17, 5);
insert into joueur values(9, 'Willian', 'Willian', 'Attaquant', 22, 5);
insert into joueur values(10, 'Hazard', 'Eden', 'Attaquant', 10, 5);
insert into joueur values(11, 'Morata', 'Alvaro', 'Attaquant', 9, 5);
insert into joueur values(12, 'Caballero', 'Wilfredo', 'Gardien', 1, 5);
insert into joueur values(13, 'Christensen', 'Andreas', 'Defenseur', 4, 5);
insert into joueur values(14, 'Barkley', 'Ross', 'Milieu', 8, 5);
insert into joueur values(15, 'Pedro', 'Pedro', 'Attaquant', 11, 5);
insert into joueur values(16, 'Giroud', 'Olivier', 'Attaquant', 18, 5);
insert into joueur values(17, 'Moses', 'Victor', 'Defenseur', 19, 5);
insert into joueur values(18, 'Batshuayi', 'Michy', 'Attaquant', 23, 5);
insert into joueur values(19, 'Emerson', 'Emerson', 'Defenseur', 24, 5);
insert into joueur values(20, 'Zappacosta', 'Davide', 'Defenseur', 25, 5);
insert into joueur values(21, 'Loftus-Cheek', 'Ruben', 'Milieu', 29, 5);
insert into joueur values(22, 'Hudson-Odoi', 'Callum', 'Attaquant', 35, 5);
insert into joueur values(23, 'Boga', 'Charly', 'Attaquant', 36, 5);
insert into joueur values(24, 'Gilmour', 'Billy', 'Milieu', 37, 5);
insert into joueur values(25, 'Baker', 'Trevoh', 'Gardien', 38, 5);

/* Script d'insertion des joueurs de liverpool */

insert into joueur values(26, 'Alisson', 'Alisson', 'Gardien', 1, 9);
insert into joueur values(27, 'Alexander-Arnold', 'Trent', 'Defenseur', 66, 9);
insert into joueur values(28, 'Matip', 'Joel', 'Defenseur', 32, 9);
insert into joueur values(29, 'Van Dijk', 'Virgil', 'Defenseur', 4, 9);
insert into joueur values(30, 'Robertson', 'Andrew', 'Defenseur', 26, 9);
insert into joueur values(31, 'Fabinho', 'Fabinho', 'Milieu', 3, 9);
insert into joueur values(32, 'Wijnaldum', 'Georginio', 'Milieu', 5, 9);
insert into joueur values(33, 'Henderson', 'Jordan', 'Milieu', 14, 9);
insert into joueur values(34, 'Milner', 'James', 'Milieu', 7, 9);
insert into joueur values(35, 'Mane', 'Sadio', 'Attaquant', 10, 9);
insert into joueur values(36, 'Salah', 'Mohamed', 'Attaquant', 11, 9);
insert into joueur values(37, 'Firmino', 'Roberto', 'Attaquant', 9, 9);
insert into joueur values(38, 'Karius', 'Loris', 'Gardien', 13, 9);
insert into joueur values(39, 'Lovren', 'Dejan', 'Defenseur', 6, 9);
insert into joueur values(40, 'Keita', 'Naby', 'Milieu', 8, 9);
insert into joueur values(41, 'Shaqiri', 'Xherdan', 'Attaquant', 23, 9);
insert into joueur values(42, 'Oxlade-Chamberlain', 'Alex', 'Milieu', 15, 9);
insert into joueur values(43, 'Sturridge', 'Daniel', 'Attaquant', 17, 9);
insert into joueur values(44, 'Mignolet', 'Simon', 'Gardien', 12, 9);
insert into joueur values(45, 'Moreno', 'Alberto', 'Defenseur', 18, 9);
insert into joueur values(46, 'Clyne', 'Nathaniel', 'Defenseur', 2, 9);
insert into joueur values(47, 'Gomez', 'Joe', 'Defenseur', 16, 9);
insert into joueur values(48, 'Ings', 'Danny', 'Attaquant', 19, 9);
insert into joueur values(49, 'Origi', 'Divock', 'Attaquant', 27, 9);
insert into joueur values(50, 'Klavan', 'Magnar', 'Defenseur', 20, 9);
insert into joueur values(51, 'Grujic', 'Marko', 'Milieu', 21, 9);
insert into joueur values(52, 'Woodburn', 'Ben', 'Attaquant', 22, 9);


/* Script d'insertion joueurs manchester united */

insert into joueur values (53,'De Gea','David','Gardien',1,11);
insert into joueur values (54,'Romero','Sergio','Gardien',22,11);
insert into joueur values (55,'Grant','Lee','Gardien',13,11);
insert into joueur values (56,'Henderson','Dean','Gardien',23,11);
insert into joueur values (57,'Maguire','Harry','Défenseur',5,11);
insert into joueur values (58,'Lindelof','Victor','Défenseur',2,11);
insert into joueur values (59,'Shaw','Luke','Défenseur',23,11);
insert into joueur values (60,'Wan-Bissaka','Aaron','Défenseur',29,11);
insert into joueur values (61,'Williams','Brandon','Défenseur',33,11);
insert into joueur values (62,'Tuanzebe','Axel','Défenseur',38,11);
insert into joueur values (63,'Fosu-Mensah','Timothy','Défenseur',31,11);
insert into joueur values (64,'Young','Ashley','Défenseur',18,11);
insert into joueur values (65,'Dalot','Diogo','Défenseur',20,11);
insert into joueur values (66,'Matic','Nemanja','Milieu',31,11);
insert into joueur values (67,'Fred','Frederico','Milieu',17,11);
insert into joueur values (68,'McTominay','Scott','Milieu',39,11);
insert into joueur values (69,'James','Daniel','Milieu',21,11);
insert into joueur values (70,'Gomes','Angel','Milieu',8,11);
insert into joueur values (71,'Pogba','Paul','Milieu',6,11);
insert into joueur values (72,'Mata','Juan','Milieu',8,11);
insert into joueur values (73,'Lingard','Jesse','Milieu',14,11);
insert into joueur values (74,'Rashford','Marcus','Attaquant',10,11);
insert into joueur values (75,'Greenwood','Mason','Attaquant',11,11);
insert into joueur values (76,'Martial','Anthony','Attaquant',9,11);
insert into joueur values (77,'James','Daniel','Attaquant',21,11);
insert into joueur values (78,'Ighalo','Odion','Attaquant',25,11);
insert into joueur values (79,'Gomes','Angel','Attaquant',8,11);
insert into joueur values (80,'Pereira','Andreas','Attaquant',15,11);
insert into joueur values (81,'Mata','Juan','Attaquant',8,11);

/* Script d'insertion joueurs manchester city */

insert into joueur values (82,'Ederson','Ederson','Gardien',31,10);
insert into joueur values (83,'Stekelenburg','Maarten','Gardien',1,10);
insert into joueur values (84,'Muric','Arijanet','Gardien',13,10);
insert into joueur values (85,'Zinchenko','Oleksandr','Défenseur',22,10);
insert into joueur values (86,'Walker','Kyle','Défenseur',2,10);
insert into joueur values (87,'Stones','John','Défenseur',5,10);
insert into joueur values (88,'Otamendi','Nicolas','Défenseur',30,10);
insert into joueur values (89,'Laporte','Aymeric','Défenseur',14,10);
insert into joueur values (90,'Kompany','Vincent','Défenseur',4,10);
insert into joueur values (91,'Mendy','Benjamin','Défenseur',24,10);
insert into joueur values (92,'Delph','Fabian','Milieu',18,10);
insert into joueur values (93,'Gundogan','Ilkay','Milieu',8,10);
insert into joueur values (94,'Diaz','Rodrigo','Milieu',20,10);
insert into joueur values (95,'B Silva','Bernardo','Milieu',21,10);
insert into joueur values (96,'De Bruyne','Kevin','Milieu',17,10);
insert into joueur values (97,'Mahrez','Riyad','Milieu',26,10);
insert into joueur values (98,'Foden','Phil','Milieu',35,10);
insert into joueur values (99,'Sterling','Raheem','Attaquant',7,10);
insert into joueur values (100,'Jesus','Gabriel','Attaquant',33,10);
insert into joueur values (101,'Aguero','Sergio','Attaquant',10,10);
insert into joueur values (102,'Sané','Leroy','Attaquant',19,10);

/* Script d'insertion joueurs Arsenal */

insert into joueur values (103,'Leno','Bernd','Gardien',19,1);
insert into joueur values (104,'Martinez','Emiliano','Gardien',1,1);
insert into joueur values (105,'Macey','Matt','Gardien',13,1);
insert into joueur values (106,'Bellerin','Hector','Défenseur',2,1);
insert into joueur values (107,'Maitland-Niles','Ainsley','Défenseur',34,1);
insert into joueur values (108,'Kolasinac','Sead','Défenseur',31,1);
insert into joueur values (109,'Chambers','Calum','Défenseur',24,1);
insert into joueur values (110,'Mustafi','Shkodran','Défenseur',20,1);
insert into joueur values (111,'Sokratis','Papastathopoulos','Défenseur',5,1);
insert into joueur values (112,'Xhaka','Granit','Milieu',29,1);
insert into joueur values (113,'Guendouzi','Matteo','Milieu',8,1);
insert into joueur values (114,'Torreira','Lucas','Milieu',11,1);
insert into joueur values (115,'Willock','Joe','Milieu',14,1);
insert into joueur values (116,'Ceballos','Dani','Milieu',16,1);
insert into joueur values (117,'Lacazette','Alexandre','Attaquant',9,1);
insert into joueur values (118,'Nelson','Reiss','Attaquant',17,1);
insert into joueur values (119,'Martinelli','Gabriel','Attaquant',22,1);
insert into joueur values (120,'Saka','Bukayo','Attaquant',7,1);
insert into joueur values (121,'Nketiah','Eddie','Attaquant',15,1);
insert into joueur values (122,'Pepe','Nicolas','Attaquant',19,1);
insert into joueur values (123,'Aubameyang','Pierre-Emerick','Attaquant',14,1);

/* Script d'insertion joueurs Whest-Ham */

insert into joueur values (124,'Fabianski','Lukasz','Gardien',1,18);
insert into joueur values (125,'Henderson','Darren','Gardien',13,18);
insert into joueur values (126,'Zabaleta','Pablo','Défenseur',2,18);
insert into joueur values (127,'Fredericks','Aaron','Défenseur',3,18);
insert into joueur values (128,'Diop','Issa','Défenseur',5,18);
insert into joueur values (129,'Balbuena','Fabian','Défenseur',6,18);
insert into joueur values (130,'Cresswell','Aaron','Défenseur',23,18);
insert into joueur values (131,'Masuaku','Arthur','Défenseur',22,18);
insert into joueur values (132,'Noble','Mark','Milieu',16,18);
insert into joueur values (133,'Snodgrass','Robert','Milieu',17,18);
insert into joueur values (134,'Fornals','Manuel','Milieu',18,18);
insert into joueur values (135,'Lanzini','Manuel','Milieu',20,18);
insert into joueur values (136,'Anderson','Robert','Milieu',21,18);
insert into joueur values (137,'Yarmolenko','Andriy','Milieu',10,18);
insert into joueur values (138,'Antonio','Michail','Attaquant',7,18);
insert into joueur values (139,'Haller','Sebastien','Attaquant',9,18);
insert into joueur values (140,'Chicharito','Javier','Attaquant',29,18);
insert into joueur values (141,'Arnautovic','Marko','Attaquant',30,18);
insert into joueur values (142,'Perez','Felipe','Attaquant',33,18);

/* Script d'insertion joueurs Norwich */

insert into joueur values (143,'Krul','Tim','Gardien',1,13);
insert into joueur values (144,'Ruddy','John','Gardien',13,13);
insert into joueur values (145,'Stiepermann','Mario','Défenseur',2,13);
insert into joueur values (146,'Godfrey','Ben','Défenseur',3,13);
insert into joueur values (147,'Lewis','Max','Défenseur',4,13);
insert into joueur values (148,'Klose','Timm','Défenseur',5,13);
insert into joueur values (149,'Aarons','Jamal','Défenseur',6,13);
insert into joueur values (150,'Zimmermann','Tim','Défenseur',23,13);
insert into joueur values (151,'Trybull','Moritz','Milieu',8,13);
insert into joueur values (152,'McLean','Oliver','Milieu',10,13);
insert into joueur values (153,'Buendia','Emi','Milieu',11,13);
insert into joueur values (154,'Leitner','Moritz','Milieu',14,13);
insert into joueur values (155,'Vrancic','Mario','Milieu',15,13);
insert into joueur values (156,'Hernandez','Emiliano','Milieu',16,13);
insert into joueur values (157,'Pukki','Teemu','Attaquant',9,13);
insert into joueur values (158,'Srbeny','Adam','Attaquant',17,13);
insert into joueur values (159,'Idah','Adam','Attaquant',18,13);
insert into joueur values (160,'Hugill','Jordan','Attaquant',19,13);
insert into joueur values (161,'Stiepermann','Mario','Attaquant',20,13);


/* Script d'insertion joueurs Southampton */

insert into joueur values (162,'McCarthy','Alex','Gardien',1,15);
insert into joueur values (163,'Forster','Fraser','Gardien',13,15);
insert into joueur values (164,'Walker-Peters','Kyle','Défenseur',2,15);
insert into joueur values (165,'Bednarek','Jan','Défenseur',3,15);
insert into joueur values (166,'Vestergaard','Jannik','Défenseur',4,15);
insert into joueur values (167,'Bertrand','Ryan','Défenseur',5,15);
insert into joueur values (168,'Cedric','Cedric','Défenseur',23,15);
insert into joueur values (169,'Valery','Yan','Défenseur',24,15);
insert into joueur values (170,'Djenepo','Mohamed','Milieu',7,15);
insert into joueur values (171,'Armstrong','James','Milieu',8,15);
insert into joueur values (172,'Ward-Prowse','James','Milieu',10,15);
insert into joueur values (173,'Redmond','Nathan','Milieu',11,15);
insert into joueur values (174,'Hojbjerg','Pierre-Emile','Milieu',14,15);
insert into joueur values (175,'Romeu','Oriol','Milieu',15,15);
insert into joueur values (176,'Ings','Danny','Attaquant',9,15);
insert into joueur values (177,'Long','Charlie','Attaquant',17,15);
insert into joueur values (178,'Adams','Che','Attaquant',18,15);
insert into joueur values (179,'Obafemi','Michael','Attaquant',19,15);
insert into joueur values (180,'Armstrong','Sam','Attaquant',20,15);


/* Script d'insertion joueurs Tottenham */

insert into joueur values (181,'Lloris','Hugo','Gardien',1,16);
insert into joueur values (182,'Gazzaniga','Paulo','Gardien',13,16);
insert into joueur values (183,'Vorm','Michel','Gardien',23,16);
insert into joueur values (184,'Alderweireld','Toby','Défenseur',2,16);
insert into joueur values (185,'Dier','Eric','Défenseur',3,16);
insert into joueur values (186,'Vertonghen','Jan','Défenseur',4,16);
insert into joueur values (187,'Sanchez','Juan','Défenseur',5,16);
insert into joueur values (188,'Rose','Danny','Défenseur',6,16);
insert into joueur values (189,'Aurier','Serge','Défenseur',24,16);
insert into joueur values (190,'Winks','Harry','Milieu',8,16);
insert into joueur values (191,'Sissoko','Moussa','Milieu',17,16);
insert into joueur values (192,'Lo Celso','Giovani','Milieu',18,16);
insert into joueur values (193,'Eriksen','Christian','Milieu',23,16);
insert into joueur values (194,'Alli','Dele','Milieu',20,16);
insert into joueur values (195,'Son','Heung-Min','Attaquant',7,16);
insert into joueur values (196,'Lamela','Erik','Attaquant',11,16);
insert into joueur values (197,'Kane','Harry','Attaquant',10,16);
insert into joueur values (198,'Moura','Lucas','Attaquant',27,16);
insert into joueur values (199,'Lucas','Lucas','Attaquant',28,16);
insert into joueur values (200,'Vinicius','Vinicius','Attaquant',29,16);


/* Script d'insertion joueurs Watford */

insert into joueur values (201,'Gomes','Ben Foster','Gardien',1,17);
insert into joueur values (202,'Foster','Ben Foster','Gardien',13,17);
insert into joueur values (203,'Mariappa','Adrian','Défenseur',2,17);
insert into joueur values (204,'Janmaat','Daryl','Défenseur',3,17);
insert into joueur values (205,'Masina','Adam','Défenseur',4,17);
insert into joueur values (206,'Cathcart','Craig','Défenseur',5,17);
insert into joueur values (207,'Femenia','Jose','Défenseur',6,17);
insert into joueur values (208,'Doucoure','Etienne','Milieu',8,17);
insert into joueur values (209,'Capoue','Etienne','Milieu',10,17);
insert into joueur values (210,'Chalobah','Nathaniel','Milieu',11,17);
insert into joueur values (211,'Hughes','Will','Milieu',14,17);
insert into joueur values (212,'Pereyra','Roberto','Milieu',15,17);
insert into joueur values (213,'Deulofeu','Gerard','Attaquant',7,17);
insert into joueur values (214,'Gray','Andre','Attaquant',9,17);
insert into joueur values (215,'Deeney','Troy','Attaquant',17,17);
insert into joueur values (216,'Success','Isaac','Attaquant',18,17);
insert into joueur values (217,'Deulofeu','Gerard','Attaquant',19,17);
insert into joueur values (218,'Sema','Kenan','Attaquant',20,17);
insert into joueur values (219,'Okaka','Stefano','Attaquant',21,17);


/* Script d'insertion joueurs Aston Villa */

insert into joueur values (220,'Nyland','Orjan','Gardien',1,2);
insert into joueur values (221,'Heaton','Tom','Gardien',13,2);
insert into joueur values (222,'Hause','Kortney','Défenseur',2,2);
insert into joueur values (223,'Mings','Tyrone','Défenseur',3,2);
insert into joueur values (224,'Target','Neil','Défenseur',4,2);
insert into joueur values (225,'Taylor','Neil','Défenseur',5,2);
insert into joueur values (226,'Elmo','Ahmed','Défenseur',6,2);
insert into joueur values (227,'Hourihane','John','Milieu',8,2);
insert into joueur values (228,'Luiz','Douglas','Milieu',10,2);
insert into joueur values (229,'Grealish','Jack','Milieu',11,2);
insert into joueur values (230,'McGinn','John','Milieu',14,2);
insert into joueur values (231,'Traore','Anwar','Milieu',15,2);
insert into joueur values (232,'El Ghazi','Anwar','Attaquant',7,2);
insert into joueur values (233,'Davis','Keinan','Attaquant',9,2);
insert into joueur values (234,'Abraham','Tammy','Attaquant',17,2);
insert into joueur values (235,'Green','Keinan','Attaquant',18,2);
insert into joueur values (236,'Samatta','Mbwana','Attaquant',19,2);
insert into joueur values (237,'Jota','Pedro','Attaquant',20,2);
insert into joueur values (238,'Kodjia','Jonathan','Attaquant',21,2);
insert into joueur values (239,'Barkley','Ross','Attaquant',22,2);
insert into joueur values (240,'Bjarnason','Albert','Attaquant',23,2);


/* Script d'insertion joueurs Brighton */

insert into joueur values (241,'Ryan','Maty','Gardien',1,3);
insert into joueur values (242,'Begovic','Asmir','Gardien',13,3);
insert into joueur values (243,'White','Lewis','Défenseur',2,3);
insert into joueur values (244,'Dunk','Lewis','Défenseur',3,3);
insert into joueur values (245,'Burn','Ben','Défenseur',4,3);
insert into joueur values (246,'Montoya','Martin','Défenseur',5,3);
insert into joueur values (247,'Bernardo','Bernardo','Défenseur',6,3);
insert into joueur values (248,'Propper','Davy','Milieu',8,3);
insert into joueur values (249,'Bissouma','Yves','Milieu',10,3);
insert into joueur values (250,'March','Anthony','Milieu',11,3);
insert into joueur values (251,'Lallana','Adam','Milieu',14,3);
insert into joueur values (252,'Jahanbakhsh','Alireza','Milieu',15,3);
insert into joueur values (253,'Maupay','Neal','Attaquant',7,3);
insert into joueur values (254,'Andone','Jose','Attaquant',9,3);
insert into joueur values (255,'Murray','Glenn','Attaquant',17,3);
insert into joueur values (256,'Trossard','Leandro','Attaquant',18,3);
insert into joueur values (257,'Webster','Lewis','Attaquant',19,3);
insert into joueur values (258,'Connolly','Aaron','Attaquant',20,3);
insert into joueur values (259,'Mac Allister','Aaron','Attaquant',21,3);
insert into joueur values (260,'Bong','Bruno','Attaquant',22,3);
insert into joueur values (261,'Kayal','Beram','Attaquant',23,3);


/* Script d'insertion joueurs Burnley */

insert into joueur values (262,'Pope','Nick','Gardien',1,4);
insert into joueur values (263,'Hart','Joe','Gardien',13,4);
insert into joueur values (264,'Lowton','Matthew','Défenseur',2,4);
insert into joueur values (265,'Tarkowski','James','Défenseur',3,4);
insert into joueur values (266,'Mee','Ben','Défenseur',4,4);
insert into joueur values (267,'Bardsley','Stephen','Défenseur',5,4);
insert into joueur values (268,'Taylor','Charlie','Défenseur',6,4);
insert into joueur values (269,'Westwood','Jeff','Milieu',8,4);
insert into joueur values (270,'Gudmundsson','Gudmundur','Milieu',10,4);
insert into joueur values (271,'McNeil','Jay','Milieu',11,4);
insert into joueur values (272,'Barnes','Chris','Milieu',14,4);
insert into joueur values (273,'Rodriguez','Robbie','Milieu',15,4);
insert into joueur values (274,'Wood','Ashley','Attaquant',7,4);
insert into joueur values (275,'Vokes','Sam','Attaquant',9,4);
insert into joueur values (276,'Cork','Jeff','Attaquant',17,4);
insert into joueur values (277,'Brady','Robbie','Attaquant',18,4);
insert into joueur values (278,'Crouch','Peter','Attaquant',19,4);
insert into joueur values (279,'Hendrick','Jeff','Attaquant',20,4);
insert into joueur values (280,'Gudmundsson','Gudmundur','Attaquant',21,4);
insert into joueur values (281,'Long','Danny','Attaquant',22,4);


/* Script d'insertion joueurs Crystal Palace */

insert into joueur values (282,'Guaita','Vicente','Gardien',1,6);
insert into joueur values (283,'Hennessey','Wayne','Gardien',13,6);
insert into joueur values (284,'Kelly','Martin','Défenseur',2,6);
insert into joueur values (285,'Tomkins','Scott','Défenseur',3,6);
insert into joueur values (286,'Van Aanholt','Patrick','Défenseur',4,6);
insert into joueur values (287,'Ward','Joel','Défenseur',5,6);
insert into joueur values (288,'Mitchell','James','Défenseur',6,6);
insert into joueur values (289,'Milivojevic','Luka','Milieu',8,6);
insert into joueur values (290,'McArthur','James','Milieu',10,6);
insert into joueur values (291,'Townsend','Andros','Milieu',11,6);
insert into joueur values (292,'Zaha','Wilfried','Milieu',14,6);
insert into joueur values (293,'Ayew','Jordan','Milieu',15,6);
insert into joueur values (294,'Benteke','Christian','Attaquant',7,6);
insert into joueur values (295,'Batshuayi','Michy','Attaquant',9,6);
insert into joueur values (296,'Schlupp','Jeffrey','Attaquant',17,6);
insert into joueur values (297,'Riedewald','Joel','Attaquant',18,6);
insert into joueur values (298,'Meyer','Max','Attaquant',19,6);
insert into joueur values (299,'Sako','Yannick','Attaquant',20,6);



/* Script d'insertion joueurs Everton */

insert into joueur values (300,'Pickford','Jordan','Gardien',1,7);
insert into joueur values (301,'Lossl','Jonas','Gardien',13,7);
insert into joueur values (302,'Coleman','Seamus','Défenseur',2,7);
insert into joueur values (303,'Keane','Michael','Défenseur',3,7);
insert into joueur values (304,'Zouma','Kurt','Défenseur',4,7);
insert into joueur values (305,'Digne','Lucas','Défenseur',5,7);
insert into joueur values (306,'Holgate','Mason','Défenseur',6,7);
insert into joueur values (307,'Gomes','Andre','Milieu',8,7);
insert into joueur values (308,'Sigurdsson','Gylfi','Milieu',10,7);
insert into joueur values (309,'Bernard','Bernard','Milieu',11,7);
insert into joueur values (310,'Davies','Tom','Milieu',14,7);
insert into joueur values (311,'Richarlison','Richarlison','Milieu',15,7);
insert into joueur values (312,'Calvert-Lewin','Dominic','Attaquant',7,7);
insert into joueur values (313,'Kean','Moise','Attaquant',9,7);
insert into joueur values (314,'Niasse','Oumar','Attaquant',17,7);
insert into joueur values (315,'Lookman','Ademola','Attaquant',18,7);
insert into joueur values (316,'Gueye','Idrissa','Attaquant',19,7);
insert into joueur values (317,'Vlasic','Antone','Attaquant',20,7);
insert into joueur values (318,'Nkounkou','Jean-Philippe','Attaquant',21,7);
insert into joueur values (319,'Kenny','Jonjoe','Attaquant',22,7);


/* Script d'insertion joueurs Leicester */

insert into joueur values (320,'Schmeichel','Kasper','Gardien',1,8);
insert into joueur values (321,'Hamer','Ben','Gardien',13,8);
insert into joueur values (322,'Justin','James','Défenseur',2,8);
insert into joueur values (323,'Evans','Jonny','Défenseur',3,8);
insert into joueur values (324,'Morgan','Wes','Défenseur',4,8);
insert into joueur values (325,'Chilwell','Ben','Défenseur',5,8);
insert into joueur values (326,'Fuchs','Christian','Défenseur',6,8);
insert into joueur values (327,'Ndidi','Wilfred','Milieu',8,8);
insert into joueur values (328,'Tielemans','Youri','Milieu',10,8);
insert into joueur values (329,'Maddison','James','Milieu',11,8);
insert into joueur values (330,'Albrighton','Marc','Milieu',14,8);
insert into joueur values (331,'Pereira','Ricardo','Milieu',15,8);
insert into joueur values (332,'Vardy','Jamie','Attaquant',7,8);
insert into joueur values (333,'Ihenacho','Kelechi','Attaquant',9,8);
insert into joueur values (334,'Gray','Demarai','Attaquant',17,8);
insert into joueur values (335,'Musa','Ahmed','Attaquant',18,8);
insert into joueur values (336,'Choudhury','Hamza','Attaquant',19,8);
insert into joueur values (337,'Under','Ademola','Attaquant',20,8);
insert into joueur values (338,'Barnes','Ashley','Attaquant',21,8);
insert into joueur values (339,'Maddison','Harvey','Attaquant',22,8);


/* Script d'insertion joueurs Newcastle */

insert into joueur values (340,'Dubravka','Martin','Gardien',1,12);
insert into joueur values (341,'Darlow','Rob','Gardien',13,12);
insert into joueur values (342,'Manquillo','Javier','Défenseur',2,12);
insert into joueur values (343,'Lascelles','Jamaal','Défenseur',3,12);
insert into joueur values (344,'Fernandez','Federico','Défenseur',4,12);
insert into joueur values (345,'Yedlin','DeAndre','Défenseur',5,12);
insert into joueur values (346,'Clark','Ciaran','Défenseur',6,12);
insert into joueur values (347,'Shelvey','Jonjo','Milieu',8,12);
insert into joueur values (348,'Hayden','Sean','Milieu',10,12);
insert into joueur values (349,'Atsu','Christian','Milieu',11,12);
insert into joueur values (350,'Ritchie','Matt','Milieu',14,12);
insert into joueur values (351,'Kenedy','Kenedy','Milieu',15,12);
insert into joueur values (352,'Rondon','Salomon','Attaquant',7,12);
insert into joueur values (353,'Perez','Ayoze','Attaquant',9,12);
insert into joueur values (354,'Murphy','Jacob','Attaquant',17,12);
insert into joueur values (355,'Gayle','Dwight','Attaquant',18,12);
insert into joueur values (356,'Longstaff','Isaac','Attaquant',19,12);
insert into joueur values (357,'Joelinton','Joelinton','Attaquant',20,12);
insert into joueur values (358,'Almiron','Almiron','Attaquant',21,12);
insert into joueur values (359,'Saint-Maximin','Allan','Attaquant',22,12);


/* Script d'insertion joueurs Sheffield United */

insert into joueur values (360,'Henderson','Dean','Gardien',1,14);
insert into joueur values (361,'McBurnie','Dean','Gardien',13,14);
insert into joueur values (362,'Basham','Enda','Défenseur',2,14);
insert into joueur values (363,'OConnell','John','Défenseur',3,14);
insert into joueur values (364,'Egan','Jack','Défenseur',4,14);
insert into joueur values (365,'OConnell','George','Défenseur',5,14);
insert into joueur values (366,'Stevens','Chris','Défenseur',6,14);
insert into joueur values (367,'Norwood','John','Milieu',8,14);
insert into joueur values (368,'Berge','Sander','Milieu',10,14);
insert into joueur values (369,'McGoldrick','David','Milieu',11,14);
insert into joueur values (370,'Lundstram','John','Milieu',14,14);
insert into joueur values (371,'Baldock','Oliver','Milieu',15,14);
insert into joueur values (372,'McBurnie','Oliver','Attaquant',7,14);


/* Script d'insertion joueurs Wolverhampton */

insert into joueur values (373,'Patricio','Rui','Gardien',1,19);
insert into joueur values (374,'Johnstone','John','Gardien',13,19);
insert into joueur values (375,'Saiss','Romain','Défenseur',2,19);
insert into joueur values (376,'Coady','Conor','Défenseur',3,19);
insert into joueur values (377,'Boly','Willy','Défenseur',4,19);
insert into joueur values (378,'Dendoncker','Leander','Défenseur',5,19);
insert into joueur values (379,'Marcal','Roderick','Défenseur',6,19);
insert into joueur values (380,'Neves','Ruben','Milieu',8,19);
insert into joueur values (381,'Moutinho','Joao','Milieu',10,19);
insert into joueur values (382,'Jota','Diogo','Milieu',11,19);
insert into joueur values (383,'Traore','Adama','Milieu',14,19);
insert into joueur values (384,'Podence','Daniel','Milieu',15,19);
insert into joueur values (385,'Jimenez','Raul','Attaquant',7,19);
insert into joueur values (386,'Cutrone','Patrick','Attaquant',9,19);
insert into joueur values (387,'Neto','Pedro','Attaquant',17,19);
insert into joueur values (388,'Doherty','Matt','Attaquant',18,19);
insert into joueur values (389,'Gibbs-White','Ryan','Attaquant',19,19);
insert into joueur values (390,'Silva','Pedro','Attaquant',20,19);
insert into joueur values (391,'Castelo Podence','Daniel','Attaquant',21,19);



/* Script d'insertion joueurs RC Lens */

insert into joueur values (392,'Samba','Brice','Gardien',30,20);
insert into joueur values (393,'Farinez','Wulker','Gardien',1,20);
insert into joueur values (394,'Leca','Jean-Louis','Gardien',16,20);
insert into joueur values (395,'Medina','Facundo','Défenseur',14,20);
insert into joueur values (396,'Danso','Kevin','Défenseur',4,20);
insert into joueur values (397,'Gradit','Jonathan','Défenseur',24,20);
insert into joueur values (398,'Fortes','Steven','Défenseur',15,20);
insert into joueur values (399,'Machado','Deiver','Défenseur',3,20);
insert into joueur values (400,'Haidara','Massadio','Défenseur',21,20);
insert into joueur values (401,'Le Cardinal','Julien','Défenseur',25,20);
insert into joueur values (402,'Abdul Samed','Salis','Milieu',26,20);
insert into joueur values (403,'Onana','Jean','Milieu',6,20);
insert into joueur values (404,'Fofana','Seko','Milieu',8,20);
insert into joueur values (405,'Frankowski','Przemyslaw','Milieu',29,20);
insert into joueur values (406,'Cabot','Jimmy','Milieu',19,20);
insert into joueur values (407,'Claude Maurice','Alexis','Milieu',18,20);
insert into joueur values (408,'Said','Wesley','Attaquant',22,20);
insert into joueur values (409,'Openda','Lois','Attaquant',11,20);
insert into joueur values (410,'Buksa','Adam','Attaquant',9,20);
insert into joueur values (411,'Sotoca','Florian','Attaquant',7,20);
insert into joueur values (412,'Capitaine','Dany','Attaquant',10,20);

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

/* Table match */

-- 1. Création de la table match
CREATE TABLE IF NOT EXISTS match (
  id_match int NOT NULL,
  id_equipe_domicile int NOT NULL,
  id_equipe_exterieur int NOT NULL,
  score_equipe_domicile int NOT NULL,
  score_equipe_exterieur int NOT NULL,
  date_match date NOT NULL,
  PRIMARY KEY (id_match),
  foreign key (id_equipe_domicile) references equipe(id_equipe),
  foreign key (id_equipe_exterieur) references equipe(id_equipe)
);

-- 2. Insertion des données dans la table match
insert into match values (1,1,2,1,1,'2019-08-09');
insert into match values (2,3,4,2,1,'2019-08-10');
insert into match values (3,5,6,2,2,'2019-08-10');
insert into match values (4,7,8,0,2,'2019-08-10');
insert into match values (5,9,10,1,1,'2019-08-10');
insert into match values (6,11,12,3,2,'2019-08-10');
insert into match values (7,13,14,0,2,'2019-08-10');
insert into match values (8,15,16,3,1,'2019-08-10');
insert into match values (9,17,18,2,0,'2019-08-10');
insert into match values (10,19,20,1,4,'2019-08-10');
insert into match values (11,1,3,1,2,'2019-08-17');
insert into match values (12,4,5,0,2,'2019-08-17');
insert into match values (13,6,7,1,1,'2019-08-17');
insert into match values (14,8,9,0,2,'2019-08-17');
insert into match values (15,10,11,1,1,'2019-08-17');
insert into match values (16,12,13,1,1,'2019-08-17');
insert into match values (17,14,15,2,0,'2019-08-17');
insert into match values (18,16,17,1,2,'2019-08-17');
insert into match values (19,18,19,3,0,'2019-08-17');
insert into match values (20,20,2,4,1,'2019-08-17');

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

/* Table carton */

-- 1. Création de la table carton
CREATE TABLE carton (
    id_carton integer primary key,
    couleur_carton varchar(50)
);

-- 2. Insertion des données dans la table carton                        
insert into carton values (1, 'jaune');
insert into carton values (2, 'rouge');

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

/* Table saison */

-- 1. Création de la table saison
CREATE TABLE saison (
    id_saison integer primary key, 
    libelle_saison varchar (100), 
    date_debut date, 
    date_fin date
);

-- 2. Changement du format de date
SET datestyle = "ISO, DMY"; -- pour mettre en format date européen

-- 3. Insertion des données dans la table saison
insert into saison values (1,'2019-2020', '01/08/2019','30/06/2020');

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

/* Table but */

-- 1. Création de la table but
Create table but (
    id_but int not null,
    id_match int not null,
    id_joueur int not null,
    type_but varchar not null,
    id_equipe int not null,
    primary key (id_but),
    foreign key (id_match) references match(id_match),
    foreign key (id_joueur) references joueur(id_joueur),
    foreign key (id_equipe) references equipe(id_equipe)
);

-- 2. Insertion des données dans la table but
insert into but values (1,1,229,'penalty', 2);
insert into but values (2,1,122,'coup franc', 1);
insert into but values (3,2,281,'pied droit',4);
insert into but values (4,2,256,'pied gauche',3);
insert into but values (5,2,249,'tête',3);
insert into but values (6,3,16,'pied droit',5);
insert into but values (7,3,16,'pied gauche',5);
insert into but values (8,3,294,'tête',6);
insert into but values (9,3,292,'coup franc',6);
insert into but values (10,4,332,'pied droit',8);
insert into but values (11,4,332,'penalty',8);
insert into but values (12,5,37,'pied gauche',9);
insert into but values (13,5,96,'pied droit',10);
insert into but values (14,6,76,'tête',11);
insert into but values (15,6,74,'pied droit',11);
insert into but values (16,6,71,'pied droit',11);
insert into but values (17,6,359,'pied droit',12);
insert into but values (18,6,358,'pied droit',12);
insert into but values (19,7,371,'pied gauche',14);
insert into but values (20,7,366,'pied droit',14);
insert into but values (21,8,195,'pied droit',16);
insert into but values (22,8,178,'pied gauche',15);
insert into but values (23,8,172,'pied droit',15);
insert into but values (24,8,172,'coup franc',15);
insert into but values (25,9,219,'tête',17);
insert into but values (26,9,207,'tête',17);
insert into but values (27,10,412,'pied droit',20);
insert into but values (28,10,412,'pied droit',20);
insert into but values (29,10,412,'penalty',20);
insert into but values (30,10,412,'coup franc',20);
insert into but values (31,10,387,'penalty',19);
insert into but values (32,11,253,'pied droit',3);
insert into but values (33,11,256,'pied gauche',3);
insert into but values (34,11,123,'penalty',1);
insert into but values (35,12,10,'coup franc',5);
insert into but values (36,12,16,'pied droit',5);
insert into but values (37,13,292,'pied droit',6);
insert into but values (38,13,312,'pied droit',7);
insert into but values (39,14,35,'pied gauche',9);
insert into but values (40,14,36,'penalty',9);
insert into but values (41,15,74,'pied droit',11);
insert into but values (42,15,101,'penalty',10);
insert into but values (43,16,359,'pied droit',12);
insert into but values (44,16,157,'pied droit',13);
insert into but values (45,17,368,'pied gauche',12);
insert into but values (46,17,371,'pied droit',14);
insert into but values (47,18,217,'pied droit',17);
insert into but values (48,18,219,'tête',17);
insert into but values (49,18,197,'pied droit',16);
insert into but values (50,19,139,'pied droit',18);
insert into but values (51,19,141,'pied droit',18);
insert into but values (52,20,412,'pied gauche',20);
insert into but values (53,20,412,'pied droit',20);
insert into but values (54,20,412,'tête',20);
insert into but values (55,20,409,'pied droit',20);
insert into but values (56,20,229,'pied droit',2);

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

/* Table avertir */

-- 1. Création de la table avertir
CREATE TABLE IF NOT EXISTS avertir (
  id_avertir int NOT NULL,
  id_joueur int NOT NULL,
  id_carton int NOT NULL,
  id_match int NOT NULL,
  minutes int NOT NULL,
  id_equipe int NOT NULL,
  FOREIGN KEY (id_joueur) REFERENCES joueur(id_joueur),
  FOREIGN KEY (id_carton) REFERENCES carton(id_carton),
  FOREIGN KEY (id_match) REFERENCES match(id_match),
  FOREIGN KEY (id_equipe) REFERENCES equipe(id_equipe),
  PRIMARY KEY (id_avertir)
);

-- 2. Insertion des données dans la table avertir
insert into avertir values (1,244,1,2,24,3);
insert into avertir values (2,265,1,2,78,4);
insert into avertir values (3,292,1,3,12,6);
insert into avertir values (4,290,2,3,45,6);
insert into avertir values (5,8,1,3,90,5);
insert into avertir values (6,4,1,3,32,5);
insert into avertir values (7,28,1,5,20,9);
insert into avertir values (8,86,1,5,9,10);
insert into avertir values (9,343,1,6,25,12);
insert into avertir values (10,146,1,7,12,13);
insert into avertir values (11,157,1,7,54,13);
insert into avertir values (12,364,1,7,41,14);
insert into avertir values (13,204,2,9,89,17);
insert into avertir values (14,205,1,9,17,17);
insert into avertir values (15,377,1,10,20,19);
insert into avertir values (16,411,1,10,44,20);
insert into avertir values (17,6,1,12,63,5);
insert into avertir values (18,265,1,12,59,4);
insert into avertir values (19,266,1,12,11,4);
insert into avertir values (20,294,1,13,76,6);
insert into avertir values (21,323,2,14,42,8);
insert into avertir values (22,89,1,15,80,10);
insert into avertir values (23,146,1,16,75,13);
insert into avertir values (24,157,1,16,42,13);
insert into avertir values (25,345,1,16,1,12);
insert into avertir values (26,364,1,17,8,14);
insert into avertir values (27,166,1,17,90,15);
insert into avertir values (28,185,2,18,57,16);
insert into avertir values (29,377,1,19,22,19);
insert into avertir values (30,397,1,20,53,20);
insert into avertir values (31,412,1,20,62,20);

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

/* Table classement */

-- 1. Création de la table
CREATE TABLE IF NOT EXISTS classement (
  id_classement int NOT NULL,
  nom_equipe varchar(50) NOT NULL,
  nb_matchs int NOT NULL,
  points int NOT NULL,
  diff_but int NOT NULL,
  carton_jaune int NOT NULL,
  carton_rouge int NOT NULL,
  but_marque int NOT NULL,
  but_encaisse int NOT NULL,
  nb_victoire int NOT NULL,
  nb_defaite int NOT NULL,
  nb_match_nul int NOT NULL,
  forme varchar NOT NULL,
  PRIMARY KEY (id_classement));

-- 2. Insertion des données

insert into classement values (20,'Lens',2,6,6,3,0,8,2,2,0,0,'V');
insert into classement values (14,'Sheffield United',2,6,4,2,0,4,0,2,0,0,'V');
insert into classement values (17,'Watford',2,6,3,1,1,4,1,2,0,0,'V');
insert into classement values (3,'Brighton',2,6,2,1,0,4,2,2,0,0,'V');

insert into classement values (5,'Chelsea',2,4,2,3,0,4,2,1,0,1,'V');
insert into classement values (11,'Manchester United',2,4,1,0,0,4,3,1,0,1,'N');
insert into classement values (9,'Liverpool',2,4,2,1,0,3,1,1,0,1,'V');

insert into classement values (18,'West Ham',2,3,1,0,0,3,2,1,1,0,'V');
insert into classement values (15,'Southampton',2,3,0,1,0,3,3,1,1,0,'D');
insert into classement values (8,'Leicester',2,3,0,0,1,2,2,1,1,0,'D');

insert into classement values (6,'Crystal Palace',2,2,3,0,0,3,3,0,0,2,'N');
insert into classement values (10,'Manchester City',2,2,0,2,0,2,2,0,0,2,'N');

insert into classement values (12,'Newcastle',2,1,-1,2,0,3,4,0,1,1,'N');
insert into classement values (1,'Arsenal',2,1,-1,0,0,2,3,0,1,1,'D');

insert into classement values (13,'Norwich',2,1,-2,4,0,1,3,0,1,1,'N');
insert into classement values (7,'Everton',2,1,-2,0,0,1,3,0,1,1,'N');
insert into classement values (2,'Aston Villa',2,1,-3,0,0,2,5,0,1,1,'D');

insert into classement values (16,'Tottenham',2,0,-3,0,1,2,5,0,2,0,'D');
insert into classement values (4,'Burnley',2,0,-3,3,0,1,4,0,2,0,'D');
insert into classement values (19,'Wolverhampton',2,0,-6,2,0,1,7,0,2,0,'D');

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

/* Table classement_buteur */

-- 1. Création de la table
CREATE TABLE IF NOT EXISTS classement_buteur (
  id_classement_buteur int NOT NULL,
  nom_joueur varchar(50) NOT NULL,
  but_marque int NOT NULL,
  PRIMARY KEY (id_classement_buteur));

-- 2. Insertion des données

insert into classement_buteur values (412,'Capitaine',7);
insert into classement_buteur values (16,'Giroud',3);
insert into classement_buteur values (74,'Rashford',2);
insert into classement_buteur values (172,'Ward-Prowse',2);
insert into classement_buteur values (359,'Saint-Maximin',2);
insert into classement_buteur values (332,'Vardy',2);
insert into classement_buteur values (229,'Grealish',2);
insert into classement_buteur values (219,'Okaka',2);
insert into classement_buteur values (256,'Trossard',2);
insert into classement_buteur values (292,'Zaha',2);
insert into classement_buteur values (371,'Baldock',2);
insert into classement_buteur values (178,'Adams',1);
insert into classement_buteur values (368,'Berge',1);
insert into classement_buteur values (123,'Aubameyang',1);
insert into classement_buteur values (177,'Long',1);

























