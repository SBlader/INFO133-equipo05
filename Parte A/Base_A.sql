-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: base_datos_a
-- ------------------------------------------------------
-- Server version	11.1.0-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `idCategoria` int(11) NOT NULL AUTO_INCREMENT,
  `Tipo` char(16) DEFAULT NULL,
  `URL` varchar(2083) DEFAULT NULL,
  PRIMARY KEY (`idCategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'Actualidad','https://peru.com/actualidad/coronavirus-peru-minsa-se-pronuncia-sobre-si-se-aplicara-una-dosis-anual-de-la-vacuna-contra-el-covid-19-rmmn-noticia/'),(2,'Entretenimiento','https://peru.com/entretenimiento/musica/bad-bunny-y-el-look-que-robo-miradas-en-el-coachella-noticia/'),(3,'Viajes','https://peru.com/viajes/lamas-el-primer-pueblo-con-encanto-de-la-selva-del-peru-mira-las-imagenes-turismo-rmmn-emcc-noticia/'),(4,'Deportes','https://peru.com/deportes/dia-del-padre-elige-el-regalo-ideal-para-sorprender-a-papa-adidas-levis-la-bodega-offside-noticia/'),(5,'Futbol','https://peru.com/futbol/liga-1-2023-posterga-su-inicio-por-el-estado-de-emergencia-rmmd-noticia/'),(6,'Estilo de vida','https://peru.com/estilo-de-vida/es-oficial-ultra-peru-revela-segunda-lista-de-djs-que-se-presentaran-en-nuestro-pais-noticia/'),(7,'Politica','https://rpp.pe/politica/gobierno/ministro-de-salud-nego-que-su-designacion-se-deba-a-un-acuerdo-politico-entre-app-y-el-gobierno-noticia-1493113'),(8,'Perú','https://rpp.pe/peru/moquegua/volcan-ubinas-igp-recomienda-elevar-nivel-de-alerta-por-incremento-de-actividad-sismica-noticia-1493086'),(9,'Mundo','https://rpp.pe/mundo/estados-unidos/donald-trump-presiono-al-gobernador-de-arizona-para-que-anulara-el-triunfo-de-joe-biden-segun-medios-estadounidenses-noticia-1493115'),(10,'Economia','https://rpp.pe/economia/economia/gonzalo-galdos-los-jovenes-representan-el-nuevo-liderazgo-noticia-1493083'),(11,'Tecnologia','https://rpp.pe/tecnologia/mas-tecnologia/reglas-de-ia-podrian-perjudicar-a-europa-advierten-lideres-tecnologicos-noticia-1492936'),(12,'Videojuegos','https://rpp.pe/videojuegos/juegos/como-un-jugador-de-football-manager-descubrio-que-brereton-diaz-era-mitad-chileno-noticia-1492965'),(13,'Lima','https://elcomercio.pe/lima/asi-se-realiza-la-marcha-del-orgullo-gay-2023-por-las-calles-del-centro-de-lima-lgtb-cercado-de-lima-ultimas-noticia/'),(14,'Cocina','https://elcomercio.pe/provecho/recetas-de-piqueos-3-platos-que-debes-aprender-a-preparar-para-compartir-noticia/'),(15,'Farandula','https://larepublica.pe/espectaculos/farandula/2023/07/01/christian-meier-arturo-pomar-jr-dice-cual-fue-la-reaccion-del-zorro-tras-revelar-datos-de-su-boda-matrimonio-edad-joven-mujer-esposa-lugar-actor-arena-hash-79861'),(16,'Cultura','https://www.exitosanoticias.pe/cultural/alcance-internacional-madrid-rinde-homenaje-nicomedes-santa-cruz-exponiendo-primera-vez-su-coleccion-privada-n102454'),(17,'Opinion','https://trome.com/opinion/seno-maria/a-prevenir-la-anemia-trcm-noticia/'),(18,'Ambiente','https://ojo-publico.com/4460/las-trampas-la-exportacion-tortugas-amenazadas-desde-la-amazonia'),(19,'Derechos Humanos','https://ojo-publico.com/4470/solo-14-policias-sancionados-peru-por-abuso-la-fuerza-5-anos'),(20,'Policial','https://panamericana.pe/buenosdiasperu/nacionales/384450-ancash-menos-2-minutos-asaltan-violentamente-tienda-distribuidora'),(21,'Judicial','https://panamericana.pe/poder-judicial/384442-camarada-carlos-mp-logra-declare-fundada-solicitud-prision-preventiva-18-meses'),(22,'Educación','https://elpopular.pe/educacion/2023/06/28/habra-clases-escolares-29-30-junio-colegios-feriado-largo-dijo-minedu-dia-san-pedro-san-pablo-2403044');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crear`
--

DROP TABLE IF EXISTS `crear`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `crear` (
  `IDPrensa` int(11) NOT NULL,
  `IDFundadores` int(11) NOT NULL,
  PRIMARY KEY (`IDPrensa`,`IDFundadores`),
  KEY `IDFundadores` (`IDFundadores`),
  CONSTRAINT `crear_ibfk_1` FOREIGN KEY (`IDPrensa`) REFERENCES `prensa` (`id`),
  CONSTRAINT `crear_ibfk_2` FOREIGN KEY (`IDFundadores`) REFERENCES `fundadores` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crear`
--

LOCK TABLES `crear` WRITE;
/*!40000 ALTER TABLE `crear` DISABLE KEYS */;
INSERT INTO `crear` VALUES (1,1),(28,1),(2,2),(2,3),(4,4),(4,5),(5,6),(6,7),(6,8),(6,9),(6,10),(7,11),(22,11),(8,12),(18,16),(19,17),(20,18),(27,18),(22,19),(22,20),(23,21),(23,22),(23,23),(23,24),(24,25),(25,26),(26,27),(26,28),(28,29),(28,30),(28,31),(28,32),(29,33),(29,34),(30,35);
/*!40000 ALTER TABLE `crear` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ejemplo_n`
--

DROP TABLE IF EXISTS `ejemplo_n`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ejemplo_n` (
  `XPATH_T` char(64) DEFAULT NULL,
  `XPATH_C` char(128) DEFAULT NULL,
  `XPATH_F` char(128) DEFAULT NULL,
  `URL` varchar(2083) NOT NULL,
  `IDPrensa` int(11) DEFAULT NULL,
  PRIMARY KEY (`URL`),
  KEY `IDPrensa` (`IDPrensa`),
  CONSTRAINT `ejemplo_n_ibfk_1` FOREIGN KEY (`IDPrensa`) REFERENCES `prensa` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ejemplo_n`
--

LOCK TABLES `ejemplo_n` WRITE;
/*!40000 ALTER TABLE `ejemplo_n` DISABLE KEYS */;
INSERT INTO `ejemplo_n` VALUES ('//h1','//div [contains(@class,\"px-4 xl:px-0\")]','//time','https://canaln.pe/actualidad/ministro-salud-sobre-sindrome-guillain-barre-tenemos-tratamiento-alternativo-hasta-comprar-mas-insumos-n463595',22),('//h1 [contains(@class,\"sht__title\")]','//div [contains(@id,\"contenedor\")]/div/section','//time','https://diariocorreo.pe/economia/apec-peru-2024-revelan-la-millonaria-inversion-en-dolares-que-recibio-el-pais-por-anteriores-presidencias-cancilleria-noticia/',30),('//h1 [contains(@class,\"sht__title\")]','//div [contains(@class,\"story-contents__content\")]/div/section','//time','https://elcomercio.pe/politica/congreso/dina-boluarte-cambio-democratico-juntos-por-el-peru-presentara-demanda-ante-el-tribunal-constitucional-contra-ley-que-le-permite-gobernar-de-forma-remota-congreso-ultimas-noticia/',4),('//h1','//div [contains(@id,\"contenido\")]','//div [contains(@id,\"contenido\")]/abbr/strong','https://elperuano.pe/noticia/216940-otarola-ratifica-que-el-gobierno-esta-adoptando-medidas-preventivas-ante-el-nino-global',24),('//h1 [contains(@class,\"titleMain f-w500\")]','//div [contains(@class,\"col-page-inverse pb-mobile-140\"]','//time','https://elpopular.pe/espectaculos/nacionales/2023/07/03/me-autoregalo-cosas-digo-fue-mi-marido-como-otras-tilsa-lozano-hunde-magaly-medina-echar-jackson-mora-alfredo-zambrano-america-hoy-178548',29),('//h1 [contains(@class,\"sht__title\")]','//div [contains(@class,\"story-contents w-full \")]','//time','https://gestion.pe/economia/mercados/inversiones-bursatiles-rendimiento-de-acciones-en-asia-cual-es-el-mercado-mas-atractivo-para-invertir-china-japon-mercados-asiaticos-bvl-inversionistas-peruanos-credicorp-noticia/',25),('//h1 [contains(@class,\"MainContent_main__title__6UiB8\")]','//div [contains(@class,\"MainContent_main__body__6UiB8\")]','//time','https://larepublica.pe/politica/judiciales/2023/07/01/joaquin-ramirez-los-ramirez-planeaban-lavar-us20-millones-con-filial-de-alas-peruanas-en-miami-fidel-uap-corrupcion-jesus-vasquez-40675',5),('//h1 [contains(@class,\"title-item-news\")]','//div [contains(@class,\"detail\")]','//div [contains(@class,\"date-nota\")]/p [contains(@class=\"create\")]','https://latinanoticias.pe/noticias/meghan-markle-sancionan-al-diario-the-sun-por-mensaje-de-odio-contra-esposa-del-principe-harry',6),('//h1 [contains(@class,\"is-size-3-mobile\")]','//div [contains(@itemprop,\"articleBody\")]','//article [contains(@class,\"nota\")]','https://panamericana.pe/politica/384461-alberto-otarola-anuncia-declarara-emergencia-zona-perjudicada-volcan-ubinas',28),('//h1 [contains(@class,\"sht__title\")]','//div [contains(@class,\"story-contents__content\")]/div/section','//time','https://peru.com/actualidad/coronavirus-peru-minsa-se-pronuncia-sobre-si-se-aplicara-una-dosis-anual-de-la-vacuna-contra-el-covid-19-rmmn-noticia/',1),('//h1 [contains(@class,\"sht__title\")]','//div [contains(@class,\"st-sidebar__main\")]','//time','https://peru21.pe/politica/encuesta-ipsos-el-52-cree-que-el-congreso-gobierna-el-pais-ipsos-congreso-dina-boluarte-alberto-otarola-noticia/',8),('//h1 [contains(@class,\"article__title\")]','//div [contains(@class,\"body\")]','//time','https://rpp.pe/lima/actualidad/marcha-del-orgullo-lgtbi-recorre-las-principales-avenidas-del-centro-de-lima-con-el-lema-orgullo-es-democracia-noticia-1493128',2),('//h1 [contains(@class,\"sht__title\")]','//div [contains(@class,\"st-sidebar__main\")]','//time','https://trome.com/espectaculos/samahara-lobaton-nueva-etapa-revela-que-no-tiene-cocina-lavadora-en-su-departamento-empezare-de-cero-sin-youna-instagram-farandula-trcm-noticia/',19),('//h1/b','//div [contains(@class,\"card-text py-2 text-black body-publication\")]','//span [contains(@class,\"text-muted post-date\")]','https://willax.pe/adriana-tudela-no-es-una-opcion-que-la-izquierda-lidere-la-mesa-directiva',27),('//h1 [contains(@class,\"title-post\")]','//div [contains(@class,\"post-content\")]','//div [contains(@class,\"date\")]','https://www.atv.pe/noticia/policia-confirma-que-complice-de-maldito-cris-huyo-a-chile-tras-ser-liberado',18),('//h1 [contains(@class,\"tit-ficha\")]','//article [contains(@class,\"content\")]','//p [contains(@class,\"miga\")]','https://www.exitosanoticias.pe/politica/peru-asumira-presidencia-alianza-pacifico-primer-trimestre-2024-anuncia-embajador-chile-n102584',7),('//h1','//div [contains(@class,\"paragraph\")]','//div [contains(@class,\"date\")]','https://www.tvperu.gob.pe/novedades/tvperu/breve-electronico-sigue-estas-recomendaciones-en-caso-no-tengas-tu-documento-ante-una-intervencion-policial',20);
/*!40000 ALTER TABLE `ejemplo_n` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fundadores`
--

DROP TABLE IF EXISTS `fundadores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fundadores` (
  `Nombre` char(32) DEFAULT NULL,
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fundadores`
--

LOCK TABLES `fundadores` WRITE;
/*!40000 ALTER TABLE `fundadores` DISABLE KEYS */;
INSERT INTO `fundadores` VALUES ('Juan Francisco Rosas',1),('Manuel Delgado Parker',2),('Johnny Lindley Taboada',3),('Manuel Amunátegui',4),('Alejandro Villota',5),('Gustavo Mohme Llona',6),('Bernardo Batievsky',7),('Samuel Winter',8),('Mendel Winter',9),('Baruch Ivcher',10),('Omar Castro Morales',11),('Bernardo Roca Rey',12),('Gilberto Hume',13),('Grupo El Comercio',14),('Carlos Tizón Pacheco',16),('Grupo El Comericio.',17),('Ministerio de Educacion',18),('Gilberto Hume',19),('Grupo El Comercio',20),('Oscar Castilla',21),('Nelly Luna',22),('David Hidalgo',23),('Fabiola Torres',24),('Simon Bolivar',25),('Manuel Romero Caro',26),('Antonio Umbert',27),('Nicanor González Vásquez',28),('Genaro Delgado Parker',29),('Isaac Lindley',30),('Genaro Delgado Brandt',31),('Hector Delgado Parker',32),('Guillermo Thorndike',33),('Gustavo Mohme',34),('Luis Banchero Rossi',35);
/*!40000 ALTER TABLE `fundadores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prensa`
--

DROP TABLE IF EXISTS `prensa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prensa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Region` char(16) DEFAULT NULL,
  `Ciudad` char(32) DEFAULT NULL,
  `Nombre` char(32) DEFAULT NULL,
  `Continente` char(16) DEFAULT NULL,
  `pais` char(32) DEFAULT NULL,
  `Año_Fundacion` year(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prensa`
--

LOCK TABLES `prensa` WRITE;
/*!40000 ALTER TABLE `prensa` DISABLE KEYS */;
INSERT INTO `prensa` VALUES (1,'Lima','Lima','Peru.com','America','Peru',1998),(2,'Lima','Lima','RPP news','America','Peru',1963),(4,'Lima','Lima','El Comercio','America','Peru',1901),(5,'Lima','Lima','La Republica','America','Peru',1981),(6,'Lima','Lima','Latina','America','Peru',1983),(7,'Lima','Lima','Exitosa noticias','America','Peru',2004),(8,'Lima','Lima','Peru21','America','Peru',2002),(18,'Lima','Lima','ATV Noticias','America','Peru',1992),(19,'Lima','Lima','Trome','America','Peru',2001),(20,'Lima','Lima','TVPeru','America','Peru',1958),(22,'Lima','Lima','Canal N','America','Peru',1999),(23,'Lima','Lima','Ojo Publico','America','Peru',2014),(24,'Lima','Lima','El Peruano','America','Peru',1901),(25,'Lima','Lima','Gestion','America','Peru',1990),(26,'Lima','Lima.','America TV','America','Perú',1958),(27,'Lima','Lima','Willax','America','Perú',2010),(28,'Lima','Lima.','Panamericana TV','America','Perú',1958),(29,'Lima','Lima','El Popular','America','Perú',1984),(30,'Lima','Lima','Diario Correo','America','Perú',1962);
/*!40000 ALTER TABLE `prensa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `redes`
--

DROP TABLE IF EXISTS `redes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `redes` (
  `Tipo_R` char(16) NOT NULL,
  `Usuario` char(32) NOT NULL,
  `IDPrensa` int(11) DEFAULT NULL,
  PRIMARY KEY (`Tipo_R`,`Usuario`),
  KEY `IDPrensa` (`IDPrensa`),
  CONSTRAINT `redes_ibfk_1` FOREIGN KEY (`IDPrensa`) REFERENCES `prensa` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `redes`
--

LOCK TABLES `redes` WRITE;
/*!40000 ALTER TABLE `redes` DISABLE KEYS */;
INSERT INTO `redes` VALUES ('Twitter','@Perucomweb',1),('Facebook','RPP Noticias',2),('Instagram','rppnoticias',2),('Twitter','@RPPNoticias',2),('Facebook','Diario El Comercio (Peru)',4),('Twitter','@elcomercio_peru',4),('Facebook','La Republica',5),('Instagram','larepublica_pe',5),('TikTok','larepublica.pe',5),('Twitter','@larepublica_pe',5),('Facebook','Latina.Pe',6),('Instagram','latina.pe',6),('Twitter','@latina_pe',6),('Facebook','Exitosa Noticias',7),('Instagram','exitosape',7),('TikTok','exitosanoticias',7),('Twitter','@exitosape',7),('Facebook','Peru21.pe',8),('Twitter','@peru21noticias',8),('Facebook','ATV.pe',18),('Instagram','atv.pe',18),('TikTok','atv.pe',18),('Twitter','@atvpe',18),('Facebook','Trome',19),('Instagram','tromeoficial',19),('TikTok','tromepe',19),('Twitter','@tromepe',19),('Facebook','TVPerú',20),('Instagram','tvperuoficial',20),('Twitter','@tvperupe',20),('Facebook','Canal N',22),('Instagram','Canalnoficial',22),('Facebook','OjoPúblico',23),('Instagram','ojopublico',23),('TikTok','ojopublico',23),('Twitter','@Ojo_Publico',23),('Facebook','Diario El Peruano',24),('Instagram','diarioelperuano',24),('TikTok','diarioelperuano',24),('Twitter','@DiarioElPeruano',24),('Facebook','Diario Gestión',25),('Twitter','@Gestionpe',25),('Facebook','America Noticias',26),('Instagram','americanoticias',26),('Twitter','@noticiAmerica',26),('Facebook','Willax Televisión',27),('Instagram','willaxtelevision',27),('Twitter','@willaxtv',27),('Facebook','Panamericana Televisión',28),('Instagram','panamericana.pe',28),('TikTok','panamericanatelevision',28),('Twitter','@PanamericanaTV',28),('Facebook','Diario El Popular',29),('Instagram','elpopular_pe',29),('TikTok','elpopular.pe',29),('Twitter','@elpopular_pe',29),('Facebook','Diario Correo',30),('Instagram','diario_correo',30),('Twitter','@diariocorreo',30);
/*!40000 ALTER TABLE `redes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tener`
--

DROP TABLE IF EXISTS `tener`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tener` (
  `IDPrensa` int(11) NOT NULL,
  `IDCategoria` int(11) NOT NULL,
  `XPATH_N` varchar(2083) DEFAULT NULL,
  `URL_P` varchar(2083) DEFAULT NULL,
  `URL_C` varchar(2083) DEFAULT NULL,
  PRIMARY KEY (`IDPrensa`,`IDCategoria`),
  KEY `IDCategoria` (`IDCategoria`),
  CONSTRAINT `tener_ibfk_1` FOREIGN KEY (`IDPrensa`) REFERENCES `prensa` (`id`),
  CONSTRAINT `tener_ibfk_2` FOREIGN KEY (`IDCategoria`) REFERENCES `categoria` (`idCategoria`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tener`
--

LOCK TABLES `tener` WRITE;
/*!40000 ALTER TABLE `tener` DISABLE KEYS */;
INSERT INTO `tener` VALUES (1,1,'//h2 [contains(@class,\"story-item__content-title overflow-hidden\")]//a/@href','https://peru.com/actualidad/','https://peru.com/actualidad/'),(1,2,'//h2 [contains(@class,\"story-item__content-title overflow-hidden\")]//a/@href','https://peru.com/entretenimiento/','https://peru.com/entretenimiento/'),(1,3,'//h2 [contains(@class,\"story-item__content-title overflow-hidden\")]//a/@href','https://peru.com/viajes/','https://peru.com/viajes/'),(1,4,'//h2 [contains(@class,\"story-item__content-title overflow-hidden\")]//a/@href','https://peru.com/deportes/','https://peru.com/deportes/'),(1,5,'//h2 [contains(@class,\"story-item__content-title overflow-hidden\")]//a/@href','https://peru.com/futbol/','https://peru.com/futbol/'),(1,6,'//h2 [contains(@class,\"story-item__content-title overflow-hidden\")]//a/@href','https://peru.com/estilo-de-vida/','https://peru.com/estilo-de-vida/'),(2,1,'//h2 [contains(@class,\"news__title\"//a/@href','https://rpp.pe/archivo/actualidad','https://rpp.pe/actualidad'),(2,2,'//h2 [contains(@class,\"newstitle\"//a/@href','https://rpp.pe/archivo/entretenimiento','https://rpp.pe/entretenimiento'),(2,4,'//h2 [contains(@class,\"news__title\"//a/@href','https://rpp.pe/archivo/deportes','https://rpp.pe/deportes'),(2,7,'//h2 [contains(@class,\"newstitle\"//a/@href','https://rpp.pe/archivo/politica','https://rpp.pe/politica'),(2,8,'//h2 [contains(@class,\"news__title\"//a/@href','https://rpp.pe/archivo/peru','https://rpp.pe/peru'),(2,9,'//h2 [contains(@class,\"news__title\"//a/@href','https://rpp.pe/archivo/mundo','https://rpp.pe/mundo'),(2,10,'//h2 [contains(@class,\"news__title\"//a/@href','https://rpp.pe/archivo/economia','https://rpp.pe/economia'),(2,11,'//h2 [contains(@class,\"news__title\"//a/@href','https://rpp.pe/archivo/tec','https://rpp.pe/tecno'),(2,12,'//h2 [contains(@class,\"news__title\"//a/@href','https://rpp.pe/archivo/videojuegos','https://rpp.pe/videojuegos'),(4,2,'//h2/a[contains(@class,\"saltar-intro-separator__content\")/@href','https://elcomercio.pe/saltar-intro/','https://elcomercio.pe/saltar-intro/'),(4,4,'//h2 [contains(@class,\"story-item__content-title overflow-hidden\")]//a/@href','https://elcomercio.pe/archivo/deporte-total/','https://elcomercio.pe/deporte-total/'),(4,6,'//h2 [contains(@class,\"fs-wi__title\")]//a/@href','https://elcomercio.pe/somos/','https://elcomercio.pe/somos/'),(4,7,'//h2 [contains(@class,\"story-item__content-title overflow-hidden\")]//a/@href','https://elcomercio.pe/archivo/politica/','https://elcomercio.pe/politica/'),(4,9,'//h2 [contains(@class,\"story-item__content-title overflow-hidden\")]//a/@href','https://elcomercio.pe/archivo/mundo/','https://elcomercio.pe/mundo/'),(4,10,'//h2 [contains(@class,\"story-item__content-title overflow-hidden\")]//a/@href','https://elcomercio.pe/archivo/economia/','https://elcomercio.pe/economia/'),(4,11,'//h2 [contains(@class,\"story-item__content-title overflow-hidden\")]//a/@href','https://elcomercio.pe/archivo/tecnologia/','https://elcomercio.pe/tecnologia/'),(4,13,'//h2 [contains(@class,\"story-item__content-title overflow-hidden\")]//a/@href','https://elcomercio.pe/archivo/lima/','https://elcomercio.pe/lima/'),(4,14,'//h2/a [contains(@class,\"sep-opt__link font-0 position-absolute h-full w-full top-0 provecho\"]/@href','https://elcomercio.pe/provecho/','https://elcomercio.pe/provecho/'),(5,1,'//h2//a [contains(@class,\"extend-link\")]/@href','https://larepublica.pe/sociedad','https://larepublica.pe/sociedad'),(5,2,'//h2//a [contains(@class,\"extend-link\")]/@href','https://larepublica.pe/cine-series','https://larepublica.pe/cine-series'),(5,4,'//h2//a [contains(@class,\"extend-link\")]/@href','https://larepublica.pe/deportes','https://larepublica.pe/deportes'),(5,7,'//h2//a [contains(@class,\"extend-link\")]/@href','https://larepublica.pe/politica','https://larepublica.pe/politica'),(5,8,'//h2//a [contains(@class,\"extend-link\")]/@href','https://larepublica.pe/peru','https://larepublica.pe/peru'),(5,9,'//h2//a [contains(@class,\"extend-link\")]/@href','https://larepublica.pe/mundo','https://larepublica.pe/mundo'),(5,10,'//h2//a [contains(@class,\"extend-link\")]/@href','https://larepublica.pe/economia','https://larepublica.pe/economia'),(5,15,'//h2//a [contains(@class,\"extend-link\")]/@href','https://larepublica.pe/espectaculos','https://larepublica.pe/espectaculos'),(6,4,'//h3 [contains(@class,\"title-noticia\")]/a/@href','https://latinanoticias.pe/deportes/page/2','https://latinanoticias.pe/deportes'),(6,7,'//h3 [contains(@class,\"title-noticia\")]/a/@href','https://latinanoticias.pe/politica/page/2','https://latinanoticias.pe/politica'),(6,8,'//h3 [contains(@class,\"title-noticia\")]/a/@href','https://latinanoticias.pe/regiones/page/2','https://latinanoticias.pe/regiones'),(6,9,'//h3 [contains(@class,\"title-noticia\")]/a/@href','https://latinanoticias.pe/mundo/page/2','https://latinanoticias.pe/mundo'),(6,13,'//h3 [contains(@class,\"title-noticia\")]/a/@href','https://latinanoticias.pe/lima/page/2','https://latinanoticias.pe/lima'),(7,1,'//h2 [contains(@class,\"tit\")]/a/@href','https://www.exitosanoticias.pe/actualidad/','https://www.exitosanoticias.pe/actualidad/'),(7,4,'//h2 [contains(@class,\"tit\")]/a/@href','https://www.exitosanoticias.pe/deportes/','https://www.exitosanoticias.pe/deportes/'),(7,7,'//h2 [contains(@class,\"tit\")]/a/@href','https://www.exitosanoticias.pe/politica/','https://www.exitosanoticias.pe/politica/'),(7,9,'//h2 [contains(@class,\"tit\")]/a/@href','https://www.exitosanoticias.pe/mundo/','https://www.exitosanoticias.pe/mundo/'),(7,15,'//h2 [contains(@class,\"tit\")]/a/@href','https://www.exitosanoticias.pe/espectaculos/','https://www.exitosanoticias.pe/espectaculos/'),(7,16,'//h2 [contains(@class,\"tit\")]/a/@href','https://www.exitosanoticias.pe/cultural/','https://www.exitosanoticias.pe/cultural/'),(8,4,'//h2 [contains(@class,\"story-item__content-title overflow-hidden\")]//a/@href','https://peru21.pe/archivo/deportes/','https://peru21.pe/deportes/'),(8,5,'//h2 [contains(@class,\"story-item__content-title overflow-hidden\")]//a/@href','https://peru21.pe/archivo/deportes/','https://peru21.pe/deportes/'),(8,6,'//h2 [contains(@class,\"story-item__content-title overflow-hidden\")]//a/@href','https://peru21.pe/archivo/vida/','https://peru21.pe/vida/'),(8,7,'//h2 [contains(@class,\"story-item__content-title overflow-hidden\")]//a/@href','https://peru21.pe/archivo/politica/','https://peru21.pe/politica/'),(8,8,'//h2 [contains(@class,\"story-item__content-title overflow-hidden\")]//a/@href','https://peru21.pe/archivo/peru/','https://peru21.pe/peru/'),(8,9,'//h2 [contains(@class,\"story-item__content-title overflow-hidden\")]//a/@href','https://peru21.pe/archivo/mundo/','https://peru21.pe/mundo/'),(8,10,'//h2 [contains(@class,\"story-item__content-title overflow-hidden\")]//a/@href','https://peru21.pe/archivo/economia/','https://peru21.pe/economia/'),(8,11,'//h2 [contains(@class,\"story-item__content-title overflow-hidden\")]//a/@href','https://peru21.pe/archivo/tecnologia/','https://peru21.pe/tecnologia/'),(8,12,'//h2 [contains(@class,\"story-item__content-title overflow-hidden\")]//a/@href','https://peru21.pe/archivo/videojuegos/','https://peru21.pe/videojuegos/'),(8,13,'//h2 [contains(@class,\"story-item__content-title overflow-hidden\")]//a/@href','https://peru21.pe/archivo/lima/','https://peru21.pe/lima/'),(8,14,'//h2 [contains(@class,\"story-item__content-title overflow-hidden\")]//a/@href ','https://peru21.pe/archivo/gastronomia/','https://peru21.pe/gastronomia/'),(8,15,'//h2 [contains(@class,\"story-item__content-title overflow-hidden\")]//a/@href','https://peru21.pe/archivo/espectaculos/','https://peru21.pe/espectaculos/'),(8,16,'//h2 [contains(@class,\"story-item__content-title overflow-hidden\")]//a/@href','https://peru21.pe/archivo/cultura/','https://peru21.pe/cultura/'),(18,1,'//div [contains(\"item border-alba\")]//a/@href','https://www.atv.pe/category/actualidad/page/2','https://www.atv.pe/noticias'),(19,1,'//h2 [contains(@class,\"story-item__content-title overflow-hidden\")]//a/@href','https://trome.com/archivo/actualidad/','https://trome.com/actualidad/'),(19,4,'//h2 [contains(@class,\"story-item__content-title overflow-hidden\")]//a/@href','https://trome.com/archivo/deportes/','https://trome.com/deportes/'),(19,6,'//h2 [contains(@class,\"story-item__content-title overflow-hidden\")]//a/@href','https://trome.com/archivo/familia/','https://trome.com/familia/'),(19,9,'//h2 [contains(@class,\"story-item__content-title overflow-hidden\")]//a/@href','https://trome.com/archivo/mundo/','https://trome.com/mundo/'),(19,11,'//h2 [contains(@class,\"story-item__content-title overflow-hidden\")]//a/@href','https://trome.com/archivo/tecnologia/','https://trome.com/tecnologia/'),(19,15,'//h2 [contains(@class,\"story-item__content-title overflow-hidden\")]//a/@href','https://trome.com/archivo/espectaculos/','https://trome.com/espectaculos/'),(19,17,'//h2 [contains(@class,\"story-item__content-title overflow-hidden\")]//a/@href','https://trome.com/archivo/opinion/','https://trome.com/opinion/'),(20,4,'//div [contains(@class,\"title\")]//a//@href','https://www.tvperu.gob.pe/noticias/seccion/deportes?page=1','https://www.tvperu.gob.pe/noticias/seccion/deportes'),(20,7,'//div [contains(@class,\"title\")]//a//@href','https://www.tvperu.gob.pe/noticias/seccion/politica?page=1','https://www.tvperu.gob.pe/noticias/seccion/politica'),(20,8,'//div [contains(@class,\"title\")]//a//@href','https://www.tvperu.gob.pe/noticias/seccion/nacionales?page=1','https://www.tvperu.gob.pe/noticias/seccion/nacionales'),(20,9,'//div [contains(@class,\"title\")]//a//@href','https://www.tvperu.gob.pe/noticias/seccion/internacionales?page=1','https://www.tvperu.gob.pe/noticias/seccion/internacionales'),(20,10,'//div [contains(@class,\"title\")]//a//@href','https://www.tvperu.gob.pe/noticias/seccion/economia?page=1','https://www.tvperu.gob.pe/noticias/seccion/economia'),(20,11,'//div [contains(@class,\"title\")]//a//@href','https://www.tvperu.gob.pe/noticias/seccion/tecnologia?page=1','https://www.tvperu.gob.pe/noticias/seccion/tecnologia'),(20,16,'//div [contains(@class,\"title\")]//a//@href','https://www.tvperu.gob.pe/noticias/seccion/Cultural?page=1','https://www.tvperu.gob.pe/noticias/seccion/Cultural'),(22,1,'//div [contains(@class,\"Carddescription__lE2S_\")] ','https://canaln.pe/actualidad','https://canaln.pe/actualidad'),(22,4,'//div [contains(@class,\"Carddescription__lE2S_\")]','https://canaln.pe/deportes','https://canaln.pe/deportes'),(22,8,'//div [contains(@class,\"Carddescription__lE2S_\")]','https://canaln.pe/peru','https://canaln.pe/peru'),(22,9,'//div [contains(@class,\"Carddescription__lE2S_\")]','https://canaln.pe/internacionales','https://canaln.pe/internacionales'),(23,7,'//h2 [contains(@class,\"more-news-article__title heading-4\")]//a/@href','https://ojo-publico.com/politica','https://ojo-publico.com/politica'),(23,17,' //h2 [contains(@class,\"more-news-article__title heading-4\")]//a/@href','https://ojo-publico.com/opinion','https://ojo-publico.com/opinion'),(23,18,'//h2 [contains(@class,\"more-news-article__title heading-4\")]//a/@href','https://ojo-publico.com/derechos-humanos','https://ojo-publico.com/derechos-humanos'),(23,19,'//h2 [contains(@class,\"more-news-article__title heading-4\")]//a/@href','https://ojo-publico.com/ambiente','https://ojo-publico.com/ambiente'),(24,1,'//a [contains(@class,\"titular\")]/@href','https://elperuano.pe/actualidad','https://elperuano.pe/actualidad'),(24,4,'//a [contains(@class,\"titular\")]/@href','https://www.elperuano.pe/deportes','https://www.elperuano.pe/deportes'),(24,7,'//a [contains(@class,\"titular\")]/@href','https://www.elperuano.pe/politica','https://www.elperuano.pe/politica'),(24,8,'//a [contains(@class,\"titular\")]/@href','https://www.elperuano.pe/pais','https://www.elperuano.pe/pais'),(24,9,'//a [contains(@class,\"titular\")]/@href','https://www.elperuano.pe/mundo','https://www.elperuano.pe/mundo'),(24,11,'//a [contains(@class,\"titular\")]/@href','https://www.elperuano.pe/ciencia-tecnologia','https://www.elperuano.pe/ciencia-tecnologia'),(24,16,'//a [contains(@class,\"titular\")]/@href','https://www.elperuano.pe/cultural','https://www.elperuano.pe/cultural'),(24,17,'//a [contains(@class,\"titular\")]/@href','https://www.elperuano.pe/opinion','https://www.elperuano.pe/opinion'),(25,8,'//h2 [contains(@class,\"story-item__content-title overflow-hidden\")]//a/@href','https://gestion.pe/archivo/peru/','https://gestion.pe/peru/'),(25,9,'//h2 [contains(@class,\"story-item__content-title overflow-hidden\")]//a/@href','https://gestion.pe/archivo/mundo/','https://gestion.pe/mundo/'),(25,10,'//h2 [contains(@class,\"story-item__content-title overflow-hidden\")]//a/@href','https://gestion.pe/archivo/economia/','https://gestion.pe/economia/'),(25,11,'//h2 [contains(@class,\"story-item__content-title overflow-hidden\")]//a/@href','https://gestion.pe/tecnologia/','https://gestion.pe/tecnologia/'),(25,17,'//h2 [contains(@class,\"story-item__content-title overflow-hidden\")]//a/@href','https://gestion.pe/archivo/opinion/','https://gestion.pe/opinion/'),(26,1,'//h2 [contains(@class,\"CardPrincipal_title__6KAwe hover:underline\")]//a/@href','https://www.americatv.com.pe/noticias/actualidad','https://www.americatv.com.pe/noticias/actualidad'),(26,9,'//h2 [contains(@class,\"CardPrincipal_title__6KAwe hover:underline\")]//a/@href','https://www.americatv.com.pe/noticias/internacionales','https://www.americatv.com.pe/noticias/internacionales'),(26,15,'//h2 [contains(@class,\"CardPrincipal_title__6KAwe hover:underline\")]//a/@href','https://www.americatv.com.pe/noticias/espectaculos','https://www.americatv.com.pe/noticias/espectaculos'),(27,1,'//a [contains(@class,\"card border-0\")]/@href','https://willax.pe/category/actualidad?page=2','https://willax.pe/category/actualidad'),(27,2,'//a [contains(@class,\"card border-0\")]/@href','https://willax.pe/category/entretenimiento?page=2','https://willax.pe/category/entretenimiento'),(27,4,'//a [contains(@class,\"card border-0\")]/@href','https://willax.pe/category/deportes?page=2','https://willax.pe/category/deportes'),(27,7,'//a [contains(@class,\"card border-0\")]/@href','https://willax.pe/category/politica?page=2','https://willax.pe/category/politica'),(27,9,'//a [contains(@class,\"card border-0\")]/@href','https://willax.pe/category/internacionales?page=2','https://willax.pe/category/internacionales'),(28,2,'//div [contains(@class,\"column is-4\")]//a/@href','https://panamericana.pe/entretenimiento','https://panamericana.pe/entretenimiento'),(28,4,'//div [contains(@class,\"column is-4\")]//a/@href','https://panamericana.pe/deportes','https://panamericana.pe/deportes'),(28,7,'//div [contains(@class,\"column is-4\")]//a/@href','https://panamericana.pe/politica','https://panamericana.pe/politica'),(28,8,'//div [contains(@class,\"column is-4\")]//a/@href','https://panamericana.pe/nacionales','https://panamericana.pe/nacionales'),(28,9,'//div [contains(@class,\"column is-4\")]//a/@href','https://panamericana.pe/internacionales','https://panamericana.pe/internacionales'),(28,10,'//div [contains(@class,\"column is-4\")]//a/@href','https://panamericana.pe/tags/econom%C3%ADa','https://panamericana.pe/tags/econom%C3%ADa'),(28,11,'//div [contains(@class,\"column is-4\")]//a/@href','https://panamericana.pe/tecnologia','https://panamericana.pe/tecnologia'),(28,16,'//div [contains(@class,\"column is-4\")]//a/@href','https://panamericana.pe/cultura','https://panamericana.pe/cultura'),(28,20,'//div [contains(@class,\"column is-4\")]//a/@href','https://panamericana.pe/tags/policiales','https://panamericana.pe/tags/policiales'),(28,21,'//div [contains(@class,\"column is-4\")]//a/@href','https://panamericana.pe/tags/poder+judicial','https://panamericana.pe/tags/poder+judicial'),(29,1,'//div [contains(@class,\"wrapperContent\")]//a/@href','https://elpopular.pe/actualidad','https://elpopular.pe/actualidad'),(29,4,'//div [contains(@class,\"wrapperContent\")]//a/@href','https://elpopular.pe/deportes','https://elpopular.pe/deportes'),(29,6,'//div [contains(@class,\"wrapperContent\")]//a/@href','https://elpopular.pe/vida','https://elpopular.pe/vida'),(29,9,'//div [contains(@class,\"wrapperContent\")]//a/@href','https://elpopular.pe/mundo','https://elpopular.pe/mundo'),(29,15,'//div [contains(@class,\"wrapperContent\")]//a/@href','https://elpopular.pe/espectaculos','https://elpopular.pe/espectaculos'),(29,22,'//div [contains(@class,\"wrapperContent\")]//a/@href','https://elpopular.pe/educacion','https://elpopular.pe/educacion'),(30,4,'//h2 [contains(@class,\"story-item__content-title overflow-hidden\")]//a/@href','https://diariocorreo.pe/archivo/deportes/','https://diariocorreo.pe/deportes/'),(30,7,'//h2 [contains(@class,\"story-item__content-title overflow-hidden\")]//a/@href','https://diariocorreo.pe/archivo/politica/','https://diariocorreo.pe/politica/'),(30,8,'//h2 [contains(@class,\"story-item__content-title overflow-hidden\")]//a/@href','https://diariocorreo.pe/archivo/peru/','https://diariocorreo.pe/peru/'),(30,9,'//h2 [contains(@class,\"story-item__content-title overflow-hidden\")]//a/@href','https://diariocorreo.pe/archivo/mundo/','https://diariocorreo.pe/mundo/'),(30,10,'//h2 [contains(@class,\"story-item__content-title overflow-hidden\")]//a/@href','https://diariocorreo.pe/archivo/economia/','https://diariocorreo.pe/economia/'),(30,15,'//h2 [contains(@class,\"story-item__content-title overflow-hidden\")]//a/@href','https://diariocorreo.pe/archivo/espectaculos/','https://diariocorreo.pe/espectaculos/');
/*!40000 ALTER TABLE `tener` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'base_datos_a'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-07-06 21:18:41
