--  MySQL dump 10.13  Distrib 8.0.15, for macos10.14 (x86_64)
--  
--  Host: localhost    Database: covid_tracker
--  -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
--  Server version	8.0.15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 -- SET NAMES utf8mb4 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

USE covid_tracker;
--  
--  Table structure for table `city`
--  

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;

CREATE TABLE `city` (
  `dbid` bigint(20) NOT NULL AUTO_INCREMENT,
  `adminCode` varchar(10) DEFAULT NULL,
  `population` bigint(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `cityId` bigint(20) DEFAULT NULL,
  `isCapital` tinyint(1) DEFAULT NULL,
  `latitude` varchar(20) NOT NULL,
  `longitude` varchar(20) NOT NULL,
  PRIMARY KEY (`dbid`)
)  AUTO_INCREMENT=341;
/*!40101 SET character_set_client = @saved_cs_client */;

--  
--  Dumping data for table `city`
--  

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` VALUES (1,'7',994938,'Guatemala City',3598132,1,'14.64072','-90.51327'),(2,'7',473080,'Mixco',3592519,NULL,'14.63333','-90.60639'),(3,'7',406830,'Villa Nueva',3587902,NULL,'14.52694','-90.5875'),(4,'7',141455,'Petapa',3591415,NULL,'14.50278','-90.55167'),(5,'7',136886,'San Juan Sacatepéquez',3589885,NULL,'14.71889','-90.64417'),(6,'13',132230,'Quetzaltenango',3590979,NULL,'14.83472','-91.51806'),(7,'7',122194,'Villa Canales',3587923,NULL,'14.48139','-90.53167'),(8,'6',103165,'Escuintla',3595803,NULL,'14.305','-90.785'),(9,'7',97172,'Chinautla',3598529,NULL,'14.70833','-90.49944'),(10,'3',82370,'Chimaltenango',3598572,NULL,'14.66111','-90.81944'),(11,'14',79759,'Chichicastenango',3598655,NULL,'14.93333','-91.11667'),(12,'8',79426,'Huehuetenango',3595416,NULL,'15.31918','-91.47241'),(13,'7',71836,'Amatitlán',3599735,NULL,'14.4774','-90.63489'),(14,'21',69734,'Totonicapán',3588258,NULL,'14.91167','-91.36111'),(15,'7',67994,'Santa Catarina Pinula',3589452,NULL,'14.56889','-90.49528'),(16,'6',62097,'Santa Lucía Cotzumalguapa',3589289,NULL,'14.33333','-91.01667'),(17,'9',56605,'Puerto Barrios',3591062,NULL,'15.72778','-88.59444'),(18,'21',54493,'San Francisco El Alto',3590219,NULL,'14.95','-91.45'),(19,'1',53375,'Cobán',3598119,NULL,'15.47083','-90.37083'),(20,'7',47247,'San José Pinula',3589977,NULL,'14.54611','-90.41139'),(21,'7',46803,'San Pedro Ayampuc',3589646,NULL,'14.78667','-90.45111'),(22,'10',45834,'Jalapa',3595237,NULL,'14.63472','-89.98889'),(23,'13',45654,'Coatepeque',3598122,NULL,'14.7','-91.86667'),(24,'19',45373,'Sololá',3588698,NULL,'14.77222','-91.18333'),(25,'20',44132,'Mazatenango',3592609,NULL,'14.53417','-91.50333'),(26,'4',41521,'Chiquimula',3598465,NULL,'14.8','-89.54583'),(27,'17',40021,'San Pedro Sacatepéquez',3589626,NULL,'14.96667','-91.76667'),(28,'2',40000,'Salamá',3590616,NULL,'15.10278','-90.31806'),(29,'16',39368,'Antigua Guatemala',3599699,NULL,'14.56111','-90.73444'),(30,'15',36656,'Retalhuleu',3590858,NULL,'14.53611','-91.67778'),(31,'22',36088,'Zacapa',3587587,NULL,'14.97222','-89.53056'),(32,'11',34332,'Jutiapa',3595069,NULL,'14.29167','-89.89583'),(33,'8',34084,'Jacaltenango',3595248,NULL,'15.66662','-91.71177'),(34,'19',33309,'Santiago Atitlán',3589105,NULL,'14.63823','-91.22901'),(35,'21',31739,'Momostenango',3592483,NULL,'15.04437','-91.40864'),(36,'6',31329,'Palín',3591833,NULL,'14.40556','-90.69833'),(37,'12',30764,'San Benito',3590389,NULL,'16.91675','-89.91898'),(38,'18',30539,'Barberena',3599582,NULL,'14.30944','-90.36111'),(39,'16',30203,'Ciudad Vieja',3598128,NULL,'14.52639','-90.75972'),(40,'13',28894,'Ostuncalco',3591997,NULL,'14.86667','-91.61667'),(41,'7',28492,'Fraijanes',3595714,NULL,'14.46528','-90.44083'),(42,'19',27690,'Nahualá',3592286,NULL,'14.85','-91.31667'),(43,'13',26063,'Cantel',3599069,NULL,'14.81667','-91.45'),(44,'1',25569,'Panzós',3591676,NULL,'15.4','-89.66667'),(45,'17',25088,'San Marcos',3589805,NULL,'14.96389','-91.79444'),(46,'16',24210,'Santiago Sacatepéquez',3589101,NULL,'14.63528','-90.67639'),(47,'6',24001,'La Gomera',3594575,NULL,'14.08333','-91.05'),(48,'14',23618,'Santa Cruz del Quiché',3589404,NULL,'15.03085','-91.14871'),(49,'14',23301,'Nebaj',3592237,NULL,'15.40614','-91.14682'),(50,'3',21978,'Tecpán Guatemala',3588476,NULL,'14.76694','-90.99417'),(51,'16',20884,'Sumpango',3588653,NULL,'14.64639','-90.73389'),(52,'3',20738,'Comalapa',3598034,NULL,'14.74111','-90.8875'),(53,'4',20674,'Esquipulas',3595783,NULL,'14.56667','-89.35'),(54,'12',20464,'Flores',3595725,NULL,'16.92258','-89.89941'),(55,'20',20426,'Chicacao',3598678,NULL,'14.53333','-91.31667'),(56,'20',20259,'San Pablo Jocopilas',3589671,NULL,'14.58333','-91.45'),(57,'17',19669,'Comitancillo',3598025,NULL,'15.08937','-91.74971'),(58,'1',19664,'San Cristóbal Verapaz',3590316,NULL,'15.39632','-90.56513'),(59,'22',19354,'Gualán',3595560,NULL,'15.11952','-89.35721'),(60,'15',19162,'Nuevo San Carlos',3592105,NULL,'14.6','-91.7'),(61,'13',19115,'Colomba',3598073,NULL,'14.71667','-91.73333'),(62,'9',18994,'Morales',3592362,NULL,'15.48333','-88.81667'),(63,'3',18704,'Patzún',3591512,NULL,'14.68333','-91.01667'),(64,'6',18655,'Puerto San José',3591060,NULL,'13.9274','-90.82166'),(65,'3',18647,'San Andrés Itzapa',3590529,NULL,'14.62','-90.84417'),(66,'7',18574,'Palencia',3591851,NULL,'14.66472','-90.35861'),(67,'6',18189,'Tiquisate',3591093,NULL,'14.28356','-91.36063'),(68,'16',17959,'San Lucas Sacatepéquez',3589852,NULL,'14.60972','-90.65694'),(69,'16',17918,'Jocotenango',3595171,NULL,'14.58194','-90.74361'),(70,'16',17410,'Alotenango',3599788,NULL,'14.48028','-90.8075'),(71,'12',17320,'Poptún',3591181,NULL,'16.33111','-89.41694'),(72,'1',17018,'Chisec',3598415,NULL,'15.81667','-90.28333'),(73,'3',16494,'Patzicía',3591523,NULL,'14.63167','-90.92694'),(74,'18',16484,'Cuilapa',3597804,NULL,'14.27639','-90.29889'),(75,'13',16461,'La Esperanza',3594703,NULL,'14.86667','-91.56667'),(76,'5',15843,'Sanarate',3590406,NULL,'14.795','-90.19222'),(77,'9',15842,'El Estor',3597078,NULL,'15.53333','-89.35'),(78,'3',15770,'El Tejar',3596041,NULL,'14.64778','-90.79278'),(79,'11',15608,'Asunción Mita',3599639,NULL,'14.33083','-89.71083'),(80,'16',15529,'Santa María de Jesús',3589253,NULL,'14.51833','-90.72667'),(81,'13',15167,'El Palmar',3596644,NULL,'14.65','-91.58333'),(82,'17',14923,'Malacatán',3592753,NULL,'14.91065','-92.05795'),(83,'15',14823,'San Sebastián',3589548,NULL,'14.56667','-91.65'),(84,'19',14734,'Santa Catarina Ixtahuacán',3589458,NULL,'14.8','-91.36667'),(85,'19',14545,'San Lucas Tolimán',3589850,NULL,'14.59471','-91.14659'),(86,'9',14350,'Lívingston',3593376,NULL,'15.82826','-88.75039'),(87,'7',14315,'San Pedro Sacatepéquez',3589627,NULL,'14.68417','-90.64417'),(88,'20',14196,'Patulul',3591541,NULL,'14.41667','-91.16667'),(89,'8',14100,'Barillas',3599575,NULL,'15.80361','-91.31583'),(90,'20',13855,'San Francisco Zapotitlán',3590197,NULL,'14.58333','-91.51667'),(91,'2',13747,'San Miguel Chicaj',3589730,NULL,'15.1','-90.4'),(92,'17',13668,'San Pablo',3589677,NULL,'14.93281','-92.00414'),(93,'5',13467,'Guastatoya',3596421,NULL,'14.85417','-90.06944'),(94,'1',13332,'San Pedro Carchá',3589643,NULL,'15.48333','-90.26667'),(95,'8',13213,'San Mateo Ixtatán',3589770,NULL,'15.83194','-91.47806'),(96,'14',13164,'Joyabaj',3595148,NULL,'14.995','-90.80611'),(97,'16',13001,'Santa Lucía Milpas Altas',3589285,NULL,'14.57583','-90.67861'),(98,'20',12906,'Santa Bárbara',3589475,NULL,'14.43333','-91.23333'),(99,'19',12863,'Panajachel',3591750,NULL,'14.73333','-91.15'),(100,'18',12842,'Chiquimulilla',3598462,NULL,'14.0838','-90.38547'),(101,'21',12133,'San Andrés Xecul',3590520,NULL,'14.9','-91.48333'),(102,'17',12122,'El Quetzal',3596389,NULL,'14.76667','-91.81667'),(103,'14',12088,'Sacapulas',3590690,NULL,'15.28801','-91.08914'),(104,'13',11984,'Flores Costa Cuca',3595721,NULL,'14.63238','-91.86341'),(105,'13',11966,'Salcajá',3590605,NULL,'14.88333','-91.45'),(106,'13',11946,'Cabricán',3599287,NULL,'15.07485','-91.648'),(107,'1',11944,'San Juan Chamelco',3589917,NULL,'15.43333','-90.33333'),(108,'13',11913,'Almolonga',3599793,NULL,'14.81667','-91.5'),(109,'14',11657,'Chajul',3598804,NULL,'15.48523','-91.0352'),(110,'11',11543,'Atescatempa',3599633,NULL,'14.17444','-89.7425'),(111,'12',11457,'Melchor de Mencos',3598131,NULL,'17.06606','-89.15229'),(112,'17',11432,'Ciudad Tecún Umán',3598129,NULL,'14.67737','-92.14039'),(113,'6',11121,'Nueva Concepción',3592145,NULL,'14.2','-91.3'),(114,'14',11046,'San Juan Cotzal',3589913,NULL,'15.43368','-91.03481'),(115,'20',10951,'San Antonio Suchitepéquez',3590412,NULL,'14.53333','-91.41667'),(116,'8',10916,'Soloma',3588694,NULL,'15.65841','-91.42994'),(117,'20',10825,'Cuyotenango',3597750,NULL,'14.53333','-91.56667'),(118,'11',10817,'Santa Catarina Mita',3589456,NULL,'14.45','-89.75'),(119,'2',10737,'Rabinal',3590924,NULL,'15.1','-90.45'),(120,'12',10604,'Dolores',3597722,NULL,'16.51417','-89.41583'),(121,'11',10469,'Jalpatagua',3595232,NULL,'14.14167','-90.00861'),(122,'16',10393,'Pastores',3591574,NULL,'14.59667','-90.75472'),(123,'10',10351,'Monjas',3592477,NULL,'14.5','-89.86667'),(124,'5',10335,'San Agustín Acasaguastlán',3590547,NULL,'14.95','-89.96667'),(125,'10',10306,'San Luis Jilotepeque',3589822,NULL,'14.65','-89.73333'),(126,'18',10155,'Oratorio',3592019,NULL,'14.22806','-90.17583'),(127,'18',10130,'Nueva Santa Rosa',3592126,NULL,'14.38111','-90.27611'),(128,'6',10045,'Masagua',3592642,NULL,'14.20306','-90.84806'),(129,'13',9986,'Zunil',3587510,NULL,'14.78333','-91.48333'),(130,'13',9958,'Huitán',3595406,NULL,'15.0492','-91.63944'),(131,'3',9846,'San Martín Jilotepeque',3589780,NULL,'14.78778','-90.7925'),(132,'2',9753,'Cubulco',3597837,NULL,'15.13333','-90.58333'),(133,'19',9681,'San Pedro La Laguna',3589637,NULL,'14.69297','-91.27201'),(134,'3',9613,'Parramos',3591629,NULL,'14.60778','-90.80306'),(135,'12',9523,'Santa Ana',3589507,NULL,'16.8','-89.83333'),(136,'17',9463,'Ocós',3592086,NULL,'14.50998','-92.19298'),(137,'3',9361,'Zaragoza',3587543,NULL,'14.65444','-90.88944'),(138,'14',9241,'Zacualpa',3587578,NULL,'15.08333','-90.83333'),(139,'17',9152,'San Cristóbal Cucho',3590323,NULL,'14.9','-91.78333'),(140,'12',9100,'Sayaxché',3588984,NULL,'16.52446','-90.18801'),(141,'1',8999,'Tactic',3588603,NULL,'15.32218','-90.35448'),(142,'13',8994,'Samayac',3590567,NULL,'14.58084','-91.46135'),(143,'18',8970,'Casillas',3598968,NULL,'14.42222','-90.24417'),(144,'3',8961,'Yepocapa',3587636,NULL,'14.50417','-90.95694'),(145,'22',8937,'Estanzuela',3595757,NULL,'15','-89.56667'),(146,'8',8925,'Concepción Huista',3598005,NULL,'15.62378','-91.66521'),(147,'15',8921,'San Felipe',3590288,NULL,'14.61667','-91.6'),(148,'16',8791,'Santo Domingo Xenacoj',3589072,NULL,'14.67778','-90.69778'),(149,'7',8689,'San Raimundo',3589569,NULL,'14.76472','-90.59556'),(150,'12',8646,'La Libertad',3594422,NULL,'16.7885','-90.11698'),(151,'8',8465,'Chiantla',3598692,NULL,'15.35484','-91.45807'),(152,'16',8424,'San Miguel Dueñas',3589727,NULL,'14.52389','-90.79833'),(153,'14',8400,'Cunén',3597772,NULL,'15.33626','-91.02776'),(154,'17',8164,'Pajapita',3591885,NULL,'14.72152','-92.03521'),(155,'11',8145,'Moyuta',3592322,NULL,'14.03861','-90.08083'),(156,'17',8113,'Nuevo Progreso',3592108,NULL,'14.8','-91.91667'),(157,'2',8093,'San Jerónimo',3590114,NULL,'15.06032','-90.2405'),(158,'13',8080,'Concepción Chiquirichapa',3597993,NULL,'14.85','-91.61667'),(159,'14',7850,'San Luis Ixcán',3589824,NULL,'15.78722','-91.095'),(160,'3',7825,'Santa Cruz Balanyá',3589408,NULL,'14.68722','-90.915'),(161,'16',7811,'San Antonio Aguas Calientes',3590475,NULL,'14.53972','-90.76944'),(162,'5',7781,'San Antonio La Paz',3590449,NULL,'14.74972','-90.28667'),(163,'15',7761,'Champerico',3598787,NULL,'14.3','-91.91667'),(164,'20',7568,'Río Bravo',3590804,NULL,'14.40042','-91.31713'),(165,'17',7562,'El Tumbador',3595929,NULL,'14.86667','-91.93333'),(166,'13',7551,'San Miguel Sigüilá',3589706,NULL,'14.9','-91.61667'),(167,'10',7539,'Mataquescuintla',3592635,NULL,'14.52917','-90.18417'),(168,'1',7465,'Chahal Guatemala',3598825,NULL,'15.79122','-89.60518'),(169,'11',7350,'El Progreso',3596423,NULL,'14.35','-89.85'),(170,'12',7235,'San Andrés',3590537,NULL,'16.96667','-89.91667'),(171,'6',7162,'San Vicente Pacaya',3589036,NULL,'14.41611','-90.63917'),(172,'7',7149,'Chuarrancho',3598277,NULL,'14.82167','-90.50861'),(173,'20',7081,'Santo Tomás La Unión',3589062,NULL,'14.63333','-91.38333'),(174,'18',7080,'Guazacapán',3595503,NULL,'14.07417','-90.41667'),(175,'3',7050,'Acatenango',3600008,NULL,'14.55194','-90.94222'),(176,'21',6980,'Santa María Chiquimula',3589256,NULL,'15.02992','-91.3292'),(177,'13',6831,'San Carlos Sija',3590347,NULL,'14.98333','-91.55'),(178,'12',6776,'San Luis',3589841,NULL,'16.19889','-89.44028'),(179,'18',6518,'Taxisco',3588491,NULL,'14.06719','-90.46791'),(180,'8',6439,'La Libertad',3594423,NULL,'15.51421','-91.86944'),(181,'17',6438,'Tacaná',3588612,NULL,'15.24058','-92.06721'),(182,'22',6407,'Teculután',3588469,NULL,'14.98333','-89.71667'),(183,'11',6367,'San José Acatempa',3590053,NULL,'14.26528','-90.12694'),(184,'20',6270,'Santo Domingo Suchitepéquez',3589074,NULL,'14.46667','-91.48333'),(185,'16',6261,'San Bartolomé Milpas Altas',3590393,NULL,'14.60611','-90.68'),(186,'18',6254,'Santa Cruz Naranjo',3589398,NULL,'14.38806','-90.36972'),(187,'19',6186,'San Pablo La Laguna',3589669,NULL,'14.71667','-91.26667'),(188,'15',6156,'El Asintal',3597587,NULL,'14.6','-91.73333'),(189,'22',5997,'Río Hondo',3590788,NULL,'15.06667','-89.58333'),(190,'3',5987,'San José Poaquil',3589975,NULL,'14.81972','-90.90639'),(191,'18',5984,'Santa Rosa de Lima',3589159,NULL,'14.38806','-90.29556'),(192,'1',5843,'Santa Cruz Verapaz',3589395,NULL,'15.36667','-90.43333'),(193,'8',5669,'San Antonio Huista',3590458,NULL,'15.6501','-91.77163'),(194,'1',5633,'Senahú',3588858,NULL,'15.4','-89.83333'),(195,'16',5582,'Magdalena Milpas Altas',3592770,NULL,'14.54528','-90.67528'),(196,'8',5572,'Aguacatán',3599912,NULL,'15.34222','-91.31141'),(197,'13',5534,'San Mateo',3589774,NULL,'14.86667','-91.58333'),(198,'20',5501,'San Bernardino',3590384,NULL,'14.53333','-91.45'),(199,'6',5479,'La Democracia',3594753,NULL,'14.23083','-90.94722'),(200,'2',5370,'Purulhá',3591028,NULL,'15.26667','-90.2'),(201,'19',5306,'Santa Clara La Laguna',3589433,NULL,'14.71667','-91.3'),(202,'4',5283,'Ipala',3595366,NULL,'14.61667','-89.61667'),(203,'15',5102,'San Andrés Villa Seca',3590522,NULL,'14.56667','-91.58333'),(204,'22',4987,'Usumatlán',3588040,NULL,'14.95','-89.78333'),(205,'4',4930,'Jocotán',3595181,NULL,'14.81667','-89.38333'),(206,'8',4921,'Santa Eulalia',3589355,NULL,'15.7306','-91.45846'),(207,'7',4908,'San José del Golfo',3590030,NULL,'14.76278','-90.37639'),(208,'17',4905,'La Reforma',3594143,NULL,'14.8','-91.81667'),(209,'1',4772,'Tucurú',3588206,NULL,'15.3','-90.06667'),(210,'14',4714,'Uspantán',3588043,NULL,'15.38333','-90.83333'),(211,'22',4678,'Cabañas',3599298,NULL,'14.93333','-89.8'),(212,'1',4671,'Cahabón',3599265,NULL,'15.56667','-89.81667'),(213,'19',4608,'San Juan La Laguna',3589896,NULL,'14.7','-91.28333'),(214,'11',4421,'Jerez',3595224,NULL,'14.1','-89.75'),(215,'15',4419,'San Martín Zapotitlán',3589776,NULL,'14.6','-91.6'),(216,'17',4329,'Tajumulco',3588588,NULL,'15.08349','-91.92225'),(217,'17',4320,'San Rafael Pie de La Cuesta',3589577,NULL,'14.93333','-91.91667'),(218,'5',4242,'El Jícaro',3596940,NULL,'14.91667','-89.9'),(219,'18',4211,'Pueblo Nuevo Viñas',3591092,NULL,'14.22583','-90.47417'),(220,'21',4191,'San Cristóbal Totonicapán',3590318,NULL,'14.91667','-91.43333'),(221,'4',4126,'Quezaltepeque',3590973,NULL,'14.63333','-89.45'),(222,'20',4118,'San Gabriel',3590195,NULL,'14.51667','-91.51667'),(223,'6',4020,'Iztapa',3595255,NULL,'13.93333','-90.7075'),(224,'12',3954,'San Francisco',3590249,NULL,'16.8','-89.93333'),(225,'3',3879,'Pochuta',3591210,NULL,'14.55','-91.08333'),(226,'5',3792,'Sansare',3589554,NULL,'14.74722','-90.1125'),(227,'13',3744,'Génova',3595674,NULL,'14.61667','-91.83333'),(228,'8',3708,'Ixtahuacán',3595282,NULL,'15.41688','-91.76927'),(229,'22',3682,'La Unión',3593500,NULL,'14.96667','-89.28333'),(230,'17',3662,'San Miguel Ixtahuacán',3589720,NULL,'15.27247','-91.74785'),(231,'13',3658,'San Martín Sacatepéquez',3589778,NULL,'14.81667','-91.65'),(232,'18',3634,'Santa María Ixhuatán',3589249,NULL,'14.19','-90.27472'),(233,'19',3588,'San Antonio Palopó',3590424,NULL,'14.7','-91.11667'),(234,'8',3554,'San Pedro Necta',3589632,NULL,'15.49142','-91.76551'),(235,'9',3417,'Los Amates',3593235,NULL,'15.25645','-89.09723'),(236,'11',3415,'Conguaco',3597966,NULL,'14.04417','-90.03111'),(237,'10',3302,'San Pedro Pinula',3589629,NULL,'14.66667','-89.85'),(238,'19',3292,'Concepción',3598006,NULL,'14.78333','-91.15'),(239,'8',3289,'Todos Santos Cuchumatán',3588308,NULL,'15.50846','-91.60382'),(240,'16',3214,'Santa Catarina Barahona',3589460,NULL,'14.54889','-90.78833'),(241,'20',3116,'Pueblo Nuevo',3591106,NULL,'14.65','-91.53333'),(242,'17',3040,'Catarina',3598958,NULL,'14.8515','-92.07646'),(243,'11',3028,'Yupiltepeque',3587593,NULL,'14.2','-89.78333'),(244,'8',3020,'Santiago Chimaltenango',3589103,NULL,'15.47658','-91.69656'),(245,'19',2948,'Santa Catarina Palopó',3589454,NULL,'14.71667','-91.13333'),(246,'13',2927,'Cajolá',3599253,NULL,'14.91667','-91.61667'),(247,'6',2842,'Guanagazapa',3595554,NULL,'14.22528','-90.64333'),(248,'11',2776,'Agua Blanca',3599972,NULL,'14.5','-89.65'),(249,'8',2773,'San Miguel Acatán',3589734,NULL,'15.70401','-91.59771'),(250,'20',2745,'Zunilito',3587506,NULL,'14.61667','-91.51667'),(251,'22',2712,'Huité',3595403,NULL,'14.93333','-89.71667'),(252,'15',2706,'Santa Cruz Muluá',3589400,NULL,'14.58333','-91.61667'),(253,'14',2693,'Chinique',3598513,NULL,'15.04147','-91.02594'),(254,'19',2681,'San Marcos La Laguna',3589795,NULL,'14.71667','-91.26667'),(255,'20',2680,'San Juan Bautista',3589923,NULL,'14.41667','-91.18333'),(256,'17',2653,'Tejutla',3588460,NULL,'15.12254','-91.80635'),(257,'10',2624,'San Manuel Chaparrón',3589812,NULL,'14.51667','-89.76667'),(258,'19',2605,'San Andrés Semetabaj',3590524,NULL,'14.75','-91.13333'),(259,'18',2572,'San Rafael Las Flores',3589592,NULL,'14.48139','-90.17333'),(260,'5',2554,'Morazán',3592349,NULL,'14.93278','-90.14306'),(261,'8',2535,'San Juan Ixcoy',3589900,NULL,'15.60022','-91.44639'),(262,'8',2530,'Nentón',3592217,NULL,'15.8007','-91.75464'),(263,'20',2412,'San José El Ídolo',3590029,NULL,'14.45','-91.41667'),(264,'14',2406,'Chiché',3598659,NULL,'15.00885','-91.06379'),(265,'3',2396,'Santa Apolonia',3589480,NULL,'14.79139','-90.97083'),(266,'2',2391,'El Chol',3597301,NULL,'14.96417','-90.48056'),(267,'4',2361,'San José La Arada',3590017,NULL,'14.71667','-89.58333'),(268,'14',2344,'Pachalun',3591955,NULL,'14.92472','-90.66278'),(269,'17',2263,'Ixchiguán',3595329,NULL,'15.16375','-91.93256'),(270,'11',2250,'Quesada',3590987,NULL,'14.27028','-90.04028'),(271,'18',2210,'San Juan Tecuaco',3589880,NULL,'14.08222','-90.26111'),(272,'5',2171,'San Cristóbal Acasaguastlán',3590325,NULL,'14.91667','-89.88333'),(273,'20',2165,'San Lorenzo',3589869,NULL,'14.48333','-91.51667'),(274,'8',2121,'Malacatancito',3592751,NULL,'15.24457','-91.49901'),(275,'14',2090,'Chicamán',3598670,NULL,'15.4','-90.76667'),(276,'20',2024,'San Miguel Panán',3589709,NULL,'14.53333','-91.36667'),(277,'14',2021,'San Antonio Ilotenango',3590456,NULL,'15.05472','-91.22986'),(278,'1',2006,'Lanquín',3594315,NULL,'15.56667','-89.96667'),(279,'8',2004,'Santa Ana Huista',3589498,NULL,'15.68085','-91.82005'),(280,'14',1988,'San Andrés Sajcabajá',3590526,NULL,'15.21667','-90.91667'),(281,'11',1964,'El Adelanto',3597676,NULL,'14.16667','-89.83333'),(282,'8',1910,'San Juan Atitán',3589925,NULL,'15.42886','-91.62398'),(283,'17',1887,'El Rodeo',3596249,NULL,'14.91667','-91.96667'),(284,'11',1873,'Pasaco',3591618,NULL,'13.97722','-90.20639'),(285,'8',1713,'Cuilco',3597802,NULL,'15.40719','-91.94667'),(286,'14',1698,'Canillá',3599094,NULL,'15.16667','-90.85'),(287,'13',1691,'Palestina de los Altos',3591841,NULL,'14.93333','-91.7'),(288,'4',1690,'Olopa',3592035,NULL,'14.68333','-89.35'),(289,'8',1690,'Colotenango',3598041,NULL,'15.40602','-91.71267'),(290,'17',1658,'San Antonio Sacatepéquez',3590419,NULL,'14.96667','-91.73333'),(291,'17',1657,'Sibinal',3588760,NULL,'15.14963','-92.04892'),(292,'4',1623,'San Juan Ermita',3589903,NULL,'14.76667','-89.43333'),(293,'14',1620,'San Bartolomé Jocotenango',3590395,NULL,'15.19153','-91.07806'),(294,'11',1617,'Zapotitlán',3587546,NULL,'14.13333','-89.83333'),(295,'4',1597,'Camotán',3599181,NULL,'14.81667','-89.36667'),(296,'17',1533,'Esquipulas Palo Gordo',3595778,NULL,'14.93333','-91.81667'),(297,'8',1525,'San Rafael Petzal',3589579,NULL,'15.40487','-91.66451'),(298,'4',1519,'San Jacinto',3590127,NULL,'14.66667','-89.5'),(299,'11',1493,'Comapa',3598031,NULL,'14.11667','-89.91667'),(300,'19',1487,'Santa María Visitación',3589247,NULL,'14.71667','-91.31667'),(301,'19',1422,'Santa Cruz La Laguna',3589402,NULL,'14.75','-91.21667'),(302,'21',1406,'Santa Lucia La Reforma',3589287,NULL,'15.12819','-91.23619'),(303,'8',1311,'San Sebastián Huehuetenango',3589541,NULL,'15.38768','-91.6153'),(304,'19',1305,'Santa Lucía Utatlán',3589282,NULL,'14.76667','-91.26667'),(305,'4',1295,'Concepción Las Minas',3597985,NULL,'14.51667','-89.45'),(306,'21',1290,'San Bartolo',3590399,NULL,'15.08438','-91.45606'),(307,'17',1269,'San José Ojetenán',3589983,NULL,'15.21667','-91.96667'),(308,'12',1201,'San José',3590069,NULL,'16.98333','-89.9'),(309,'13',1180,'Sibilia',3588762,NULL,'15','-91.61667'),(310,'17',1171,'Concepción Tutuapa',3597976,NULL,'15.2394','-91.8446'),(311,'13',1170,'San Francisco La Unión',3590213,NULL,'14.91667','-91.53333'),(312,'8',1059,'San Rafael La Independencia',3589595,NULL,'15.7015','-91.53553'),(313,'14',1040,'San Pédro Jocopilas',3589640,NULL,'15.09525','-91.15135'),(314,'1',1012,'Tamahú',3588554,NULL,'15.3089','-90.23599'),(315,'14',1003,'Patzité',3591517,NULL,'14.96667','-91.21667'),(316,'17',945,'San Lorenzo',3589865,NULL,'15.03087','-91.73534'),(317,'2',937,'Granados',3595631,NULL,'14.91361','-90.52278'),(318,'8',888,'Santa Bárbara',3589468,NULL,'15.31617','-91.63279'),(319,'19',839,'San José Chacayá',3590041,NULL,'14.76667','-91.21667'),(320,'17',829,'Río Blanco',3590814,NULL,'15.0382','-91.68463'),(321,'8',801,'San Sebastián Coatán',3589543,NULL,'15.73584','-91.56285'),(322,'8',743,'Tectitán',3588474,NULL,'15.3063','-92.06051'),(323,'17',661,'Sipacapa',3588726,NULL,'15.21246','-91.63416'),(324,'22',557,'San Diego',3590312,NULL,'14.78333','-89.78333'),(325,'8',551,'San Gaspar Ixchil',3590188,NULL,'15.38796','-91.72564'),(326,'8',0,'Unión',3588057,NULL,'15.92176','-91.77647'),(327,'6',0,'Siquinalá',3588720,NULL,'14.30611','-90.965'),(328,'17',0,'San José Ojetenam',3589985,NULL,'15.23443','-91.97317'),(329,'22',0,'San Jorge',3590090,NULL,'14.93333','-89.58333'),(330,'10',0,'San Carlos Alzatate',3590355,NULL,'14.49778','-90.06028'),(331,'1',0,'Raxruhá',3590881,NULL,'15.86667','-90.03333'),(332,'14',0,'Playa Grande',3591216,NULL,'15.93333','-90.73333'),(333,'13',0,'Olintepeque',3592041,NULL,'14.88333','-91.51667'),(334,'1',0,'La Tinta',3593542,NULL,'15.31667','-89.88333'),(335,'8',0,'La Democracia',3594754,NULL,'15.62544','-91.8867'),(336,'17',0,'La Blanca',3594989,NULL,'14.57889','-92.14137'),(337,'12',0,'El Chal',3597339,NULL,'16.66667','-89.63333'),(338,'1',0,'Fray Bartolomé de Las Casas',9980863,NULL,'15.81516','-89.88931'),(339,'13',0,'San Juan Ostuncalco',9975222,NULL,'14.87328','-91.6897'),(340,'20',0,'San José La Máquina',9975226,NULL,'14.30178','-91.56707');
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--  
--  Table structure for table `diagnostic`
--  

DROP TABLE IF EXISTS `diagnostic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;

CREATE TABLE `diagnostic` (
  `dbid` bigint(20) NOT NULL AUTO_INCREMENT,
  `person` bigint(20) NOT NULL,
  `observations` varchar(2000) DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL,
  `city` bigint(20) NOT NULL,
  `status` bigint(20) NOT NULL,
  `token` varchar(100) NOT NULL,
  PRIMARY KEY (`dbid`),
  KEY `diagnostic_person_fk` (`person`),
  KEY `diagnostic_status_fk` (`status`),
  KEY `diagnostic_city_fk` (`city`),
  CONSTRAINT `diagnostic_city_fk` FOREIGN KEY (`city`) REFERENCES `city` (`dbid`),
  CONSTRAINT `diagnostic_person_fk` FOREIGN KEY (`person`) REFERENCES `person` (`dbid`),
  CONSTRAINT `diagnostic_status_fk` FOREIGN KEY (`status`) REFERENCES `value_list` (`dbid`)
)  AUTO_INCREMENT=78;
/*!40101 SET character_set_client = @saved_cs_client */;
 
--  
--  Dumping data for table `diagnostic`
--  

LOCK TABLES `diagnostic` WRITE;
/*!40000 ALTER TABLE `diagnostic` DISABLE KEYS */;
/*!40000 ALTER TABLE `diagnostic` ENABLE KEYS */;
UNLOCK TABLES;

--  
--  Table structure for table `diagnostic_detail`
-- 

DROP TABLE IF EXISTS `diagnostic_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;

CREATE TABLE `diagnostic_detail` (
  `dbid` bigint(20) NOT NULL AUTO_INCREMENT,
  `diagnostic` bigint(20) NOT NULL,
  `symptom_response` bigint(20) NOT NULL,
  `observations` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`dbid`),
  KEY `diagnostic_detail_symptom_response_fk` (`symptom_response`),
  KEY `diagnostic_detail_diagnostic_fk` (`diagnostic`),
  CONSTRAINT `diagnostic_detail_diagnostic_fk` FOREIGN KEY (`diagnostic`) REFERENCES `diagnostic` (`dbid`),
  CONSTRAINT `diagnostic_detail_symptom_response_fk` FOREIGN KEY (`symptom_response`) REFERENCES `symptom_response` (`dbid`)
)  AUTO_INCREMENT=282;
/*!40101 SET character_set_client = @saved_cs_client */;

-- 
--  Dumping data for table `diagnostic_detail`
-- 

LOCK TABLES `diagnostic_detail` WRITE;
/*!40000 ALTER TABLE `diagnostic_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `diagnostic_detail` ENABLE KEYS */;
UNLOCK TABLES;

-- 
--  Table structure for table `observations`
-- 

DROP TABLE IF EXISTS `observations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;

CREATE TABLE `observations` (
  `dbid` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(3000)  DEFAULT NULL,
  `category` bigint(20) NOT NULL,
  `type_condition` bigint(20) DEFAULT NULL,
  `initial_probability` bigint(20) DEFAULT NULL,
  `final_probability_range` bigint(20) DEFAULT NULL,
  `status` bigint(20) NOT NULL,
  PRIMARY KEY (`dbid`),
  KEY `observations_category_fk` (`category`),
  KEY `observations_type_condition_fk` (`type_condition`),
  KEY `observations_status_fk` (`status`),
  CONSTRAINT `observations_category_fk` FOREIGN KEY (`category`) REFERENCES `value_list` (`dbid`),
  CONSTRAINT `observations_status_fk` FOREIGN KEY (`status`) REFERENCES `value_list` (`dbid`),
  CONSTRAINT `observations_type_condition_fk` FOREIGN KEY (`type_condition`) REFERENCES `value_list` (`dbid`)
)  AUTO_INCREMENT=28;
/*!40101 SET character_set_client = @saved_cs_client */;

-- 
--  Dumping data for table `observations`
-- 

LOCK TABLES `observations` WRITE;
/*!40000 ALTER TABLE `observations` DISABLE KEYS */;
INSERT INTO `observations` VALUES (6,'Lávate las manos frecuentemente, con agua y jabón, mínimo 20 segundos o utiliza gel con base de alcohol al 70%',45,NULL,0,0,4),(7,'Cúbrete la nariz y boca con el antebrazo o pañuelo desechable, al estornudar o toser.',45,NULL,0,0,4),(8,'Si está enfermo o cuida a alguien que está enfermo, use una mascarilla médica.',45,NULL,0,0,4),(9,'No tocarse la cara, la nariz, la boca y los ojos con las manos sucias.',45,NULL,0,0,4),(10,'Limpia y desinfecta las superficies y objetos de uso común en: casas, oficinas, sitios cerrados, transporte, centros de reunión, etc.',45,NULL,0,0,4),(11,'Permanezca en casa si no se encuentra bien. Si tiene fiebre, tos y dificultad para respirar, busque atención médica y llame con antelación. Siga las instrucciones de las autoridades sanitarias locales.',45,NULL,0,0,4),(12,'Evite el contacto cercano con otras personas.',45,NULL,0,0,4),(13,'Use pañuelos desechables para eliminar secreciones respiratorias y tírelos tras su uso.',45,NULL,0,0,4),(14,'Debido a la afección médica que padece podría desarrollar un caso más grave de COVID-19, por favor tome todas las medidas de precaución.',44,NULL,0,0,5),(15,'1. Llame a su médico de cabecera o proveedor de atención médica.',46,NULL,7,33,4),(16,'2. Si no están disponibles, llame a Ministerio de Salud Pública y Asistencia Social al 1517.',46,NULL,7,33,4),(17,'El virus se puede transmitir de persona a persona por contacto cercano. Se considera contacto cercano estar a menos de 2 metros de distancia.',47,NULL,0,0,4),(18,'Puede transmitirse de persona a persona a través el aire cuando alguien que tiene el virus tose o estornuda.',47,NULL,0,0,4),(19,'Se puede transmitir si tocan una superficie que ha sido previamente tocada por alguien con el virus.',47,NULL,0,0,4),(20,'Alguien sin síntomas aún puede tener el virus y transmitirlo a otras personas.',47,NULL,0,0,4),(21,'Probablemente solo se encuentre estresado. Por favor, siga las medidas de precaución. ',43,NULL,0,2,4),(22,'Hidrátese adecuadamente y siga las medidas de precaución y vuelva a hacer la evaluación después de dos días.',43,NULL,3,6,4),(23,'Los síntomas que informa se presentan en algunas personas con COVID-19, sin embargo los sintomas más comunes son fiebre, cansancio y tos seca.',43,NULL,7,33,4),(24,'Por favor, búsque atención médica.',43,NULL,13,33,4),(25,'Para saber si las pruebas de COVID-19 están disponibles en su área, llame a su médico de cabecera o a la línea de salud pública.',43,NULL,13,33,4),(26,'Informe a su médico de su sospecha de tener COVID-19, si se le aconseja ir a un centro de emergencia o los centro establecidos, por favor utilice mascarilla para minimizar la probabilidad de contagiar a otros.',43,NULL,13,33,4),(27,'0. Para preguntas de salud que no sean de emergencia, busque ayuda en este orden:\n\n',46,NULL,7,33,4);
/*!40000 ALTER TABLE `observations` ENABLE KEYS */;
UNLOCK TABLES;

-- 
--  Table structure for table `patient_condition`
-- 

DROP TABLE IF EXISTS `patient_condition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;

CREATE TABLE `patient_condition` (
  `dbid` bigint(20) NOT NULL AUTO_INCREMENT,
  `diagnostic` bigint(20) NOT NULL,
  `type_job` bigint(20) NOT NULL,
  `type_contact_work` bigint(20) NOT NULL,
  `risk_area` tinyint(1) NOT NULL,
  `positive_person_contact` tinyint(1) NOT NULL,
  PRIMARY KEY (`dbid`),
  KEY `patient_condition_type_job_fk` (`type_job`),
  KEY `patient_condition_type_contact_work_fk` (`type_contact_work`),
  KEY `patient_condition_diagnostic_fk` (`diagnostic`),
  CONSTRAINT `patient_condition_diagnostic_fk` FOREIGN KEY (`diagnostic`) REFERENCES `diagnostic` (`dbid`),
  CONSTRAINT `patient_condition_type_contact_work_fk` FOREIGN KEY (`type_contact_work`) REFERENCES `value_list` (`dbid`),
  CONSTRAINT `patient_condition_type_job_fk` FOREIGN KEY (`type_job`) REFERENCES `value_list` (`dbid`)
)  AUTO_INCREMENT=66;
/*!40101 SET character_set_client = @saved_cs_client */;

-- 
--  Dumping data for table `patient_condition`
-- 

LOCK TABLES `patient_condition` WRITE;
/*!40000 ALTER TABLE `patient_condition` DISABLE KEYS */;
/*!40000 ALTER TABLE `patient_condition` ENABLE KEYS */;
UNLOCK TABLES;

-- 
--  Table structure for table `person`
-- 

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;

CREATE TABLE `person` (
  `dbid` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `dpi` bigint(15) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `age` bigint(3) DEFAULT NULL,
  `gender` bigint(20) DEFAULT NULL,
  `mobile` bigint(20) DEFAULT NULL,
  `phone` bigint(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`dbid`)
)  AUTO_INCREMENT=92;
/*!40101 SET character_set_client = @saved_cs_client */;

-- 
--  Dumping data for table `person`
-- 

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;

-- 
--  Table structure for table `symptom`
-- 

DROP TABLE IF EXISTS `symptom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;

CREATE TABLE `symptom` (
  `dbid` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `category` bigint(20) NOT NULL,
  `weighing` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`dbid`)
)  AUTO_INCREMENT=23;
/*!40101 SET character_set_client = @saved_cs_client */;

-- 
--  Dumping data for table `symptom`
-- 

LOCK TABLES `symptom` WRITE;
/*!40000 ALTER TABLE `symptom` DISABLE KEYS */;
INSERT INTO `symptom` VALUES (11,'Fiebre',NULL,22,5),(12,'Tos',NULL,22,5),(13,'Dificultad para respirar',NULL,22,5),(14,'Fatiga',NULL,22,4),(15,'Dolor de garganta',NULL,23,3),(16,'Diarrea',NULL,23,2),(17,'Dolor de cabeza',NULL,23,1),(18,'Hipertensión arterial',NULL,21,0),(19,'Enfermedad cardiaca',NULL,21,0),(20,'Diabetes',NULL,21,0),(21,'Rinitis',NULL,23,2),(22,'Dolor muscular',NULL,23,3);
/*!40000 ALTER TABLE `symptom` ENABLE KEYS */;
UNLOCK TABLES;

-- 
--  Table structure for table `symptom_response`
-- 

DROP TABLE IF EXISTS `symptom_response`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;

CREATE TABLE `symptom_response` (
  `dbid` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50)  DEFAULT NULL,
  `response` varchar(100)  DEFAULT NULL,
  `complement` varchar(300) DEFAULT NULL,
  `weighing` bigint(10) NOT NULL DEFAULT '0',
  `symptom` bigint(20) NOT NULL,
  PRIMARY KEY (`dbid`),
  KEY `symptom_response_symptom_fk` (`symptom`),
  KEY `symptom_response_response_fk` (`complement`),
  CONSTRAINT `symptom_response_symptom_fk` FOREIGN KEY (`symptom`) REFERENCES `symptom` (`dbid`)
)  AUTO_INCREMENT=51;
/*!40101 SET character_set_client = @saved_cs_client */;

-- 
--  Dumping data for table `symptom_response`
-- 

LOCK TABLES `symptom_response` WRITE;
/*!40000 ALTER TABLE `symptom_response` DISABLE KEYS */;
INSERT INTO `symptom_response` VALUES (16,NULL,'NO','',0,11),(17,NULL,'Fiebre leve','(38.0 - 38.5 ° C)',5,11),(18,NULL,'Fiebre moderada','(38.6 - 39.0 ° C)',5,11),(19,NULL,'Fiebre alta','(39.1 - 39.9 ° C)',5,11),(20,NULL,'Fiebre muy alta ','( > 40.0 ° C )',5,11),(21,NULL,'NO','',0,12),(22,NULL,'Tos débil sin dolor','',3,12),(23,NULL,'Tos con dolor leve','',4,12),(24,NULL,'Tos severa con dolor pulmonar','',5,12),(25,NULL,'NO','',0,13),(26,NULL,'SI','',5,13),(27,NULL,'NO','',0,14),(28,NULL,'SI','',4,14),(29,NULL,'NO','',0,15),(30,NULL,'Dolor de garganta','',1,15),(31,NULL,'Dificultad para tragar','',2,15),(32,NULL,'Apenas es posible tragar','',3,15),(33,NULL,'NO','',0,16),(34,NULL,'Ligera','(todo el día)',1,16),(35,NULL,'Heces líquidas','(todo el día)',2,16),(36,NULL,'Heces acuosas','(todo el día)',2,16),(37,NULL,'NO','',0,17),(38,NULL,'Por lapsos','',3,17),(39,NULL,'Todo el día','',1,17),(40,NULL,'Mareos al ponerse de pie','',1,17),(41,NULL,'SI','',0,18),(42,NULL,'NO','',0,18),(43,NULL,'SI','',0,19),(44,NULL,'NO','',0,19),(45,NULL,'SI','',0,20),(46,NULL,'NO','',0,20),(47,NULL,'SI',NULL,3,21),(48,NULL,'NO',NULL,0,21),(49,NULL,'SI',NULL,2,22),(50,NULL,'NO',NULL,0,22);
/*!40000 ALTER TABLE `symptom_response` ENABLE KEYS */;
UNLOCK TABLES;

-- 
--  Table structure for table `value_list`
-- 

DROP TABLE IF EXISTS `value_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;

CREATE TABLE `value_list` (
  `dbid` bigint(20) NOT NULL AUTO_INCREMENT,
  `discriminator` varchar(100) NOT NULL,
  `name` varchar(200) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`dbid`)
)  AUTO_INCREMENT=48;
/*!40101 SET character_set_client = @saved_cs_client */;

-- 
--  Dumping data for table `value_list`
-- 

LOCK TABLES `value_list` WRITE;
/*!40000 ALTER TABLE `value_list` DISABLE KEYS */;
INSERT INTO `value_list` VALUES (1,'Gender','male','Masculino'),(2,'Gender','female','Femenino'),(3,'Gender','others','Otros'),(4,'Status','active','Activo'),(5,'Status','cancel','Cancelado'),(8,'ServiceType','medical','Servicio médico'),(15,'TypeJob','home_office','Actualmente trabajo desde casa'),(16,'TypeJob','health','Trabajo en industria de salud'),(17,'TypeJob','public_transport','Trabajo en transporte público'),(18,'TypeJob','others','Otros'),(19,'TypeContact','none','Ningún contacto'),(20,'TypeContact','little','Poco contacto'),(21,'Category','disease','3. Enfermedades'),(22,'Category','principal_symptom','1. Síntomas'),(23,'Category','other_symptom','2. Otros síntomas'),(33,'Category','condition','4. Condicion del paciente'),(34,'RiskType','risk_area','Area de riesgo'),(35,'RiskType','positive_person_contact','Contacto con persona positiva'),(36,'CovidPDF','Que es el COVID-19?','assets/pdf/covid19.pdf'),(37,'CovidPDF','Cuándo limpiarse las manos?','assets/pdf/cuando-limpiarse-las-manos.pdf'),(38,'CovidPDF','Limpiarse las manos con jabón','assets/pdf/jabon-limpiarse-las-manos.pdf'),(39,'CovidPDF','Limpiarse las manos con gel','assets/pdf/gel-limpiarse-las-manos.pdf'),(40,'CovidPDF','Qué hacer en la cuarentena?','assets/pdf/que_hacer_cuarentena.pdf'),(41,'CovidPDF','Cómo colocarse equipo de protección 1','assets/pdf/equipo-proteccion-personal-1.pdf'),(42,'CovidPDF','Cómo colocarse equipo de protección 2','assets/pdf/equipo-proteccion-personal-3.pdf'),(43,'ObservationType','resumen','1.Resumen'),(44,'ObservationType','diseases','2.Enfermedades'),(45,'ObservationType','safety_measures','3.Medidas de precaución'),(46,'ObservationType','forms_communication','3.Formas de comunicación'),(47,'ObservationType','contagion','4.Contagio');
/*!40000 ALTER TABLE `value_list` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

--  Dump completed on 2020-04-05 11:08:00
