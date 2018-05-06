-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: mypost
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.29-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Other','Any information that doesn\'t siut to another categories.'),(2,'IT technologies','All related to the IT industry.'),(3,'Heroes','All about of the super heroes.'),(4,'Cycling','All about Cycling');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `postId` int(10) NOT NULL,
  `author` varchar(250) NOT NULL,
  `text` varchar(1000) NOT NULL,
  `creationTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,16,'Citizen','The test comment here is','2018-05-06 21:42:19'),(2,16,'Hubalailo','The second test comment here is','2018-05-06 21:43:31'),(3,16,'Never Surrender','The third test comment here is','2018-05-06 21:47:24');
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(500) NOT NULL,
  `text` varchar(32766) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `userId` int(11) NOT NULL,
  `categoryId` int(10) NOT NULL,
  `introduction` varchar(2500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES (1,'First Post','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin non condimentum mauris, et dignissim diam. Curabitur varius lobortis nunc, sed aliquam quam feugiat ut. Sed id orci nisl.','2018-01-14 02:04:02',1,1,'In your blog introduction, you need to create a big WHY for the reader.'),(2,'s','sdddddddddddddd','2018-01-14 02:04:03',2,1,'In your blog introduction, you need to create a big WHY for the reader.'),(3,'Third post','<p>test&nbsp; &nbsp; ffffffffffffffffffffffffff</p>','2018-01-14 02:04:07',1,1,'In your blog introduction, you need to create a big WHY for the reader.'),(4,'Forth post','ghjghjghj ghjghjghj ghjghjghj','2018-01-14 02:22:03',1,1,'In your blog introduction, you need to create a big WHY for the reader.'),(5,'wwwwwwwwww','wwwwwwwwwwwwwwwwwwwwwwww','2018-01-14 02:22:03',1,1,'In your blog introduction, you need to create a big WHY for the reader.'),(6,'ddddddddd','ddddddddddd','2018-01-14 13:55:49',1,1,'In your blog introduction, you need to create a big WHY for the reader.'),(8,'asdasdasd','<p>asdasdasd test</p>','2018-01-14 17:18:02',1,1,'In your blog introduction, you need to create a big WHY for the reader.'),(9,'ggg','<p>ggg</p>','2018-01-14 17:20:45',1,2,'In your blog introduction, you need to create a big WHY for the reader.'),(10,'sdfsdfsdfsdf','<p>sdfsdfsdfsdf</p>','2018-01-14 17:27:04',1,1,'In your blog introduction, you need to create a big WHY for the reader.'),(11,'elevens post','<p>ddddddddddddddddddddddddddddddddddddddddddddddddd</p>','2018-01-14 19:02:39',1,3,'In your blog introduction, you need to create a big WHY for the reader.'),(12,'test tiny mce 1','<p>ddddddddddddddddddddddddddddddddddddd</p>\r\n<p>&nbsp;</p>','2018-01-14 22:50:18',1,3,'In your blog introduction, you need to create a big WHY for the reader.'),(13,'Thirhteen post','<p>jjjjjjjjjj</p>\r\n<p>SDGsdgh</p>\r\n<p>SDGASDFHG</p>\r\n<p>ADFEHQDFH</p>\r\n<p>SDFHJSDAFGHJ</p>','2018-01-14 23:29:13',1,2,'In your blog introduction, you need to create a big WHY for the reader.'),(14,'Lorem ipsum dolor sit amet, consectetur adipisicing elit. ','<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Lorem ipsum dolor sit amet, consectetur adipisicing elit.&nbsp;Lorem ipsum dolor sit amet, consectetur adipisicing elit.&nbsp;</p>','2018-05-02 18:25:06',1,1,'In your blog introduction, you need to create a big WHY for the reader.'),(15,'Lorem ipsum dolor sit amet, consectetur adipisicing elit. ','<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Lorem ipsum dolor sit amet, consectetur adipisicing elit.&nbsp;Lorem ipsum dolor sit amet, consectetur adipisicing elit.&nbsp;</p>','2018-05-02 18:25:13',1,1,'In your blog introduction, you need to create a big WHY for the reader.'),(16,'Another one post','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas eget enim diam. Donec sed consectetur lacus. Cras efficitur risus diam, at porta mauris convallis et. Nulla mi purus, placerat vitae tellus vitae, consectetur scelerisque lacus. Curabitur sodales in ipsum in tempus. Integer eget dui risus. Praesent varius venenatis est egestas mattis. Aliquam eu felis vel ligula volutpat faucibus. Fusce vel erat pulvinar, molestie purus vel, malesuada sem. Integer gravida lacinia elit lacinia condimentum. Phasellus ut hendrerit magna. Aliquam ac arcu fringilla, sagittis quam et, ultricies nisi. Aliquam consectetur accumsan urna sed pellentesque. Vivamus blandit nisi vel sem hendrerit tempor non in magna.</p>\r\n<p>Maecenas maximus pretium justo, at eleifend mauris efficitur sed. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Fusce eu quam elit. Phasellus sed odio at orci viverra efficitur. Duis at nulla at enim condimentum mattis et a mauris. Vivamus condimentum turpis justo, quis tempor purus dapibus at. Curabitur nulla tortor, hendrerit quis ullamcorper et, congue tincidunt magna. Duis quis orci lorem. Fusce eget cursus tortor, vitae vestibulum metus. Aliquam eu lacinia risus. Proin elit orci, tempus sit amet ante sit amet, commodo sodales lorem.</p>\r\n<p>Vestibulum rutrum urna enim, et mollis nisl feugiat in. Proin sed consequat ipsum. Nam ornare in eros a laoreet. Cras eget mauris malesuada, cursus nisi nec, convallis felis. Praesent tristique risus neque, id tincidunt nibh varius ut. Aenean mi enim, ultrices non quam sit amet, ornare varius arcu. Nam tempor est id lectus volutpat molestie. Etiam euismod leo nunc, et sagittis odio rutrum eu. Quisque euismod mattis lacus, nec faucibus arcu porta ut.</p>\r\n<p>Ut sed sollicitudin leo. Duis sit amet iaculis velit. Sed quis felis mauris. Vestibulum luctus enim semper sagittis convallis. Phasellus tempor rutrum cursus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Integer euismod dignissim rhoncus. Pellentesque sapien urna, dapibus imperdiet bibendum vitae, aliquet vitae odio.</p>\r\n<p>Integer et neque condimentum, elementum justo id, vehicula tortor. Sed a tincidunt risus. Aenean tortor ligula, euismod varius ligula ac, cursus tempus sem. Vivamus in pharetra quam. Donec sagittis sapien ac nisl fringilla, eu bibendum ex congue. In malesuada auctor sapien in congue. Donec venenatis lectus id dolor rutrum, suscipit semper mauris dapibus. Duis laoreet vitae urna et rhoncus. Aliquam consectetur, purus vitae dignissim luctus, eros lorem lobortis urna, vel egestas ipsum tellus quis velit. Fusce eget ultricies sapien. Vivamus nec imperdiet felis, ac ultricies metus. Duis ac nisl auctor, accumsan libero eu, porttitor nibh. Ut tincidunt mauris id quam semper malesuada. In elementum mi risus. Nam faucibus neque ac mi congue porttitor.</p>','2018-05-03 20:00:34',2,3,'This is an introduction');
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile`
--

DROP TABLE IF EXISTS `profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profile` (
  `id` int(11) NOT NULL,
  `highlight` varchar(500) DEFAULT NULL,
  `description` varchar(20000) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `image` blob,
  `startdate` datetime DEFAULT NULL,
  `imgsrc` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile`
--

LOCK TABLES `profile` WRITE;
/*!40000 ALTER TABLE `profile` DISABLE KEYS */;
INSERT INTO `profile` VALUES (1,'More quietly, there\'s more - from where you\'re going.','<h2>What is Lorem Ipsum?</h2>\r\n<p><strong>Lorem Ipsum</strong>is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>','2018-03-04',NULL,NULL,'lineage2.jpg'),(2,'More quietly, there\'s more - from where you\'re going.','<h2>What is Lorem Ipsum?</h2>\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>','2018-05-01',NULL,NULL,NULL),(3,'More quietly, there\'s more - from where you\'re going.','<h2>What is Lorem Ipsum?</h2>\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>','1968-08-05',NULL,NULL,'carol.jpg'),(4,'More quietly, there\'s more - from where you\'re going.','<h2>What is Lorem Ipsum?</h2>\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>','1964-05-01',NULL,NULL,'Black_Widow.jpg'),(5,'More quietly, there\'s more - from where you\'re going.','<h2>What is Lorem Ipsum?</h2>\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>','1925-12-30',NULL,NULL,'bucky.jpg'),(6,'More quietly, there\'s more - from where you\'re going.','<h2>What is Lorem Ipsum?</h2>\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>','1970-05-29',NULL,NULL,'ironman.jpg'),(7,'More quietly, there\'s more - from where you\'re going.','<h2>What is Lorem Ipsum?</h2>\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>','2001-05-20',NULL,NULL,'spiderman.jpg'),(8,'More quietly, there\'s more - from where you\'re going.','<h2>What is Lorem Ipsum?</h2>\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>','1962-05-10',NULL,NULL,'hulk.jpg'),(9,'More quietly, there\'s more - from where you\'re going.','<h2>What is Lorem Ipsum?</h2>\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>','1993-12-23',NULL,NULL,'maximoff.jpg'),(10,'More quietly, there\'s more - from where you\'re going.','<h2>What is Lorem Ipsum?</h2>\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>','1983-12-12',NULL,NULL,'hawkeye.jpg'),(11,'More quietly, there\'s more - from where you\'re going.','<h2>What is Lorem Ipsum?</h2>\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>','1920-07-04',NULL,NULL,'cap.jpg'),(12,'More quietly, there\'s more - from where you\'re going.','<h2>What is Lorem Ipsum?</h2>\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>','1968-08-06',NULL,NULL,'Iron_Patriot.jpg'),(13,'More quietly, there\'s more - from where you\'re going.','<h2>What is Lorem Ipsum?</h2>\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>','1951-12-21',NULL,NULL,'fury.jpg'),(14,'More quietly, there\'s more - from where you\'re going.','<h2>What is Lorem Ipsum?</h2>\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>','1969-09-10',NULL,NULL,'falcon.jpg');
/*!40000 ALTER TABLE `profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registration`
--

DROP TABLE IF EXISTS `registration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `registration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(10) NOT NULL,
  `password` varchar(20) NOT NULL,
  `firstname` varchar(45) DEFAULT NULL,
  `lastname` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registration`
--

LOCK TABLES `registration` WRITE;
/*!40000 ALTER TABLE `registration` DISABLE KEYS */;
INSERT INTO `registration` VALUES (1,'admin','admin123','Admin','Adminich'),(2,'vasia','admin123','Vasiliy','Vasilyevich'),(3,'capmarvel','admin123','Carol','Danvers'),(4,'mswidow','admin123','Nat','Romanov'),(5,'bucky','admin123','Bucky','Barns'),(6,'ironman','admin123','Tony','Stark'),(7,'spiderman','admin123','Peter','Parker'),(8,'hulk','admin123','Bruce','Bener'),(9,'maximoff','admin123','Vanda','Maximoff'),(10,'hawkeye','admin123','Clint','Barton'),(11,'cap','admin123','Steven','Rogers'),(12,'warmachine','admin123','James','Rhodes'),(13,'fury','admin123','Nicholas','Fury'),(14,'falcon','admin123','Sam','Wilson');
/*!40000 ALTER TABLE `registration` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-05-07  0:00:12
