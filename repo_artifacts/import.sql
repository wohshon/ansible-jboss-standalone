-- MySQL dump 10.14  Distrib 5.5.52-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: demodb
-- ------------------------------------------------------
-- Server version	5.5.52-MariaDB

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
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customers` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `custId` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_rfbvkrffamfql7cjmen8v976v` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `customerId` varchar(255) DEFAULT NULL,
  `orderDate` datetime DEFAULT NULL,
  `totalPrice` decimal(19,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `orderItems`
--

DROP TABLE IF EXISTS `orderItems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orderItems` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `lineCost` decimal(19,2) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK90td7v08r46nlwukfklfeaygq` (`order_id`),
  KEY `FKdh7yf6js8ac0x7a1aoi5it7g1` (`product_id`),
  CONSTRAINT `FKdh7yf6js8ac0x7a1aoi5it7g1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `FK90td7v08r46nlwukfklfeaygq` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;





--
-- Table structure for table `orders_orderItems`
--

DROP TABLE IF EXISTS `orders_orderItems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders_orderItems` (
  `Order_id` bigint(20) NOT NULL,
  `items_id` bigint(20) NOT NULL,
  UNIQUE KEY `UK_rimiergo0c10g7hokpgvtth4c` (`items_id`),
  KEY `FK5i4tedlh9qx3mh6fj7bqv9bk3` (`Order_id`),
  CONSTRAINT `FK5i4tedlh9qx3mh6fj7bqv9bk3` FOREIGN KEY (`Order_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `FK9tvrlbv3xsqxvfim5q58pingl` FOREIGN KEY (`items_id`) REFERENCES `orderItems` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `descp` varchar(255) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `price` decimal(19,2) DEFAULT NULL,
  `shortDesc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Red Fedora','Worn by all that are passionate about opensource softwares!','img/red_fedora_sm.png',25.99,'Red Hot Fedora for all occasions'),(2,'Tux Doll','(T)orvalds (U)ni(X)... Need we say more??!','img/tux_sm.png',35.99,'The kernel mascot!'),(3,'Fabric8 Robot','startup, shutdown, toss and throw your containers around but never miss a beat!','img/fabric_sm.png',55.99,'The container juggler'),(4,'WidFly RC Plane','size does not matter, wildfly tackles all kind of workload despite its lightweight and nimble footprint!','img/fly_sm.png',105.99,'The most agile flying monster around'),(5,'Container','Always run the same, regardless of the environment it runs in!','img/container_sm.png',85.99,'everything you need in a package');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-02-12  8:30:09

