-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: swp3
-- ------------------------------------------------------
-- Server version	8.0.36

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `blog`
--

DROP TABLE IF EXISTS `blog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog` (
  `BlogID` int NOT NULL AUTO_INCREMENT,
  `UserID` int NOT NULL,
  `Title` varchar(1000) NOT NULL,
  `Content` varchar(8000) NOT NULL,
  `ShortDescription` varchar(500) NOT NULL,
  `BlogDate` datetime NOT NULL,
  `Image` varchar(255) NOT NULL,
  `BlogStatus` tinyint NOT NULL,
  `Views` int DEFAULT '0',
  PRIMARY KEY (`BlogID`),
  KEY `UserID` (`UserID`),
  CONSTRAINT `blog_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog`
--

LOCK TABLES `blog` WRITE;
/*!40000 ALTER TABLE `blog` DISABLE KEYS */;
INSERT INTO `blog` VALUES (1,1,'Detailed Review of Smart Wristwatches','Detailed Review of Smart Wristwatches','The article will cover features such as health monitoring, smart notifications, and the ability to connect to mobile phones. At the same time, it will highlight the appearance design and how it interacts with everyday users','2024-02-25 15:16:25','Slider/201-TET-2024-1.jpg',1,0),(2,1,'Development History of Wristwatches','Development History of Wristwatches','The article will cover the history of the development of the wristwatch from the 17th century to the present day, covering important innovations such as the move from mechanical to battery, changes in materials and design, and its influence on culture and fashion.','2024-02-25 15:28:32','Slider/12-TUAN-LE-VANG-OKE.jpg',1,0),(3,3,'The Secret of Tourbillon Watches','The Secret of Tourbillon Watches','The article will explain the meaning of Tourbillon in the watch world, how it helps improve the accuracy and aesthetics of watches. The history and development of the Tourbillon from its introduction to the present day will also be covered.','2024-02-25 15:54:28','Slider/13-418004996-1357155059.jpg',1,0),(5,2,'Discover the Mystery of Mechanical Watches','Discover the Mystery of Mechanical Watches','This article will delve into the structure and operation of mechanical watches, explaining the main components such as balance, transmission, and why mechanical watches have an enduring appeal to watch enthusiasts.','2024-02-25 21:38:39','Slider/2211-BLACK-GiAM-thang-12.jpg',0,0),(6,3,'Electronic Sports Watch','Electronic Sports Watch','The article will cover important features such as heart rate measurement, physical activity tracking, water resistance, and how to combine them with specific sports activities. Some suggestions on using e-sports watches in daily life will also be provided.','2024-02-25 21:38:39','Slider/Vi-sao-trong-moi-quang-cao-kim-dong-ho-luon-diem-10h10.png',1,0),(9,3,'New Post Test','jdhfjsdh','jdshfjs','2024-02-29 08:33:15','i1.jpg',1,0);
/*!40000 ALTER TABLE `blog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brand`
--

DROP TABLE IF EXISTS `brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brand` (
  `BrandID` int NOT NULL AUTO_INCREMENT,
  `BrandName` varchar(255) NOT NULL,
  `BrandStatus` tinyint NOT NULL,
  `BrandImg` varchar(255) NOT NULL,
  PRIMARY KEY (`BrandID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand`
--

LOCK TABLES `brand` WRITE;
/*!40000 ALTER TABLE `brand` DISABLE KEYS */;
INSERT INTO `brand` VALUES (1,'Rolex',1,'images/Brand/Rolex_logo.svg.png'),(2,'Seiko',1,'images/Brand/seiko-5.png'),(3,'Tissot',1,'images/Brand/tissot-logo.png'),(4,'Casio',1,'images/Brand/casio-logo.png'),(5,'Orient',1,'images/Brand/orient-logo.png');
/*!40000 ALTER TABLE `brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `CartID` int NOT NULL AUTO_INCREMENT,
  `UserID` int NOT NULL,
  `Quantity` int NOT NULL,
  `productID` int DEFAULT NULL,
  PRIMARY KEY (`CartID`),
  KEY `UserID` (`UserID`),
  KEY `productID` (`productID`),
  CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`),
  CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`productID`) REFERENCES `product` (`ProductID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `OrderID` int NOT NULL AUTO_INCREMENT,
  `UserID` int NOT NULL,
  `Order_date` date NOT NULL,
  `Total` double NOT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `UserID` (`UserID`),
  CONSTRAINT `order_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (1,1,'2024-02-25',24160),(2,1,'2024-02-25',24160),(3,1,'2024-01-25',57500),(4,1,'2024-02-26',2416),(5,1,'2024-02-26',6691),(6,1,'2024-02-29',32143),(7,1,'2024-02-29',21235),(8,1,'2024-03-05',2726.5);
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_detail`
--

DROP TABLE IF EXISTS `order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_detail` (
  `OrderID` int NOT NULL,
  `ProductID` int NOT NULL,
  `Quantity` int NOT NULL,
  `Price` double NOT NULL,
  PRIMARY KEY (`OrderID`,`ProductID`),
  KEY `ProductID` (`ProductID`),
  CONSTRAINT `order_detail_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `order` (`OrderID`),
  CONSTRAINT `order_detail_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_detail`
--

LOCK TABLES `order_detail` WRITE;
/*!40000 ALTER TABLE `order_detail` DISABLE KEYS */;
INSERT INTO `order_detail` VALUES (1,14,1,7740),(1,41,1,8820),(1,50,1,7600),(2,14,1,7740),(2,41,1,8820),(2,50,1,7600),(3,5,2,7650),(3,6,2,3020),(3,14,1,7740),(3,23,1,9000),(3,36,2,1500),(3,41,1,8820),(3,50,1,7600),(4,6,1,2416),(5,1,1,3000),(5,6,1,2416),(5,36,1,1275),(6,14,1,6579),(6,41,3,7056),(6,42,1,4396),(7,14,1,6579),(7,41,1,7056),(7,50,1,7600),(8,4,1,2726.5);
/*!40000 ALTER TABLE `order_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `ProductID` int NOT NULL AUTO_INCREMENT,
  `ProductName` varchar(255) NOT NULL,
  `Description` varchar(1000) NOT NULL,
  `GenderP` tinyint NOT NULL,
  `DateP` date NOT NULL,
  `BrandID` int NOT NULL,
  `Price` double NOT NULL,
  `Discount` double NOT NULL,
  `Image` varchar(255) NOT NULL,
  `StatusP` tinyint NOT NULL,
  `Quantity` int NOT NULL,
  `Sold` int DEFAULT NULL,
  PRIMARY KEY (`ProductID`),
  KEY `BrandID` (`BrandID`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`BrandID`) REFERENCES `brand` (`BrandID`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Rolex blue dial with luminous coating','Rolex Watch 126234 with blue dial and luminous indexes shows strength and elegance, so this is a watch model that is extremely popular with gentlemen who are customers of the Rolex watch brand.',1,'2024-01-30',1,3000,0,'images/rolex/Dong_Ho_Rolex_126234_mat_so_xanh_coc_so_phu_da_quang.png',1,50,6),(2,'Rolex Datejust 41mm 126331','Rolex Datejust 41mm 126331 Jubilee strap diamond-encrusted white mother-of-pearl dial version is an extremely unique watch model under the Rolex brand because you will not find a second watch exactly like it.',0,'2024-01-20',1,4090,0,'images/rolex/Dong_Ho_Rolex_Datejust_41mm_126231.png',1,65,21),(3,'Rolex Day Date President Solid gold','The Rolex 18238 Day Date President Watch with 18k solid gold diamond pile is an extremely unique product from the Rolex brand when using gold material to design almost the entire watch.',0,'2024-01-23',1,5500,0,'images/rolex/dong-ho-rolex-18238-day-date-president-coc-kim-cuong-vang-khoi-18k.png',1,47,12),(4,'Rolex Oyster Perpetual Day-Date','The Rolex Oyster Perpetual Day-Date 36mm watch has a distinctive fluted bezel design',0,'2024-01-15',1,2870,5,'images/rolex/rolex_oyster_perpetual_day-date_36mm.png',1,65,13),(5,'Rolex Cellini Dual Time 39mm','The Cellini Dual Time in 18 ct Everose gold features a Brown Enameled dial, dual bezel and Leather Strap.',1,'2024-01-11',1,7650,0,'images/rolex/rolex-cellini-dual-time-39mm-day-deo-da.png',1,34,24),(6,'Rolex Cosmograph Daytona TigerEye','18kt rose gold case with a black rubber Oysterflex strap. Bezel set with fixed diamonds. Gold-tone dial with gold-tone hands and diamond hour markers.',0,'2024-01-21',1,3020,20,'images/rolex/rolex-cosmograph-daytona-eye-of-the-tiger-chronograph-automatic-chronometer-diamond-mens-watch-116588tbr0003_3.png',1,67,31),(7,'Rolex Cosmograph Daytona 116508','Rolex Caliber 4130 automatic movement with 72-hour power reserve. Scratch-resistant sapphire crystal. Screw down the crown. The back cover is sturdy.',1,'2024-01-02',1,8400,0,'images/rolex/rolex-cosmograph-daytona-champagne-diamond-dial-automatic-mens-watch-116508gldo_1.png',1,24,7),(8,'Rolex Day-Date Everose President','The Rolex Caliber 3255 automatic movement, based on the Rolex 3035, contains 31 jewels, operates at 28800 vph and has a power reserve of approximately 70 hours.',1,'2024-01-05',1,4600,0,'images/rolex/rolex-daydate-36-paved-dial-automatic-18kt-everose-gold-president-watch-128345dsp_2.png',1,43,17),(9,'Rolex Daytona Chronograph 126508','Black dial with yellow gold-tone hands and index hour markers. Minute markers around the outer rim.',1,'2024-01-08',1,3900,0,'images/rolex/rolex-daytona-chronograph-automatic-black-dial-mens-watch-1265080004.png',1,64,21),(10,'Rolex GMT-MASTER II 126755SARU','Rolex Caliber 3186 automatic movement, containing 31 Jewels, operates at 28800 vph and has a power reserve of approximately 50 hours.',0,'2024-01-26',1,9100,13,'images/rolex/rolex-gmtmaster-ii-automatic-chronometer-diamond-black-dial-watch-126755saru_3.png',1,17,1),(11,'Rolex Jubilee GMT-Master II Pepsi','Stainless steel case with stainless steel Rolex Jubilee bracelet. Bidirectional rotating stainless steel bezel with blue and red ring (Pepsi). Black dial with bright silver-toned Mercedes logo, sword, Breguet-shaped hands and hour markers.',1,'2024-01-19',1,4500,15,'images/rolex/rolex-gmtmaster-ii-pepsi-blue-and-red-bezel-stainless-steel-jubilee-watch-126710bksj-126710blro.png',1,35,6),(12,'Rolex Oyster Perpetual Cosmograph','The Rolex caliber 4130 automatic movement, based on the Rolex 4030, contains 44 jewels, operates at 28800 vph and has a power reserve of approximately 72 hours.',1,'2024-01-09',1,7000,25,'images/rolex/rolex-oyster-perpetual-cosmograph-daytona-ice-blue-dial-automatic-mens-chronograph-watch-116506bldo-116506ibldo.png',1,75,0),(13,'Rolex Rainbow Sapphire Daytona','Fixed bezel with baguette-cut 36 sapphires. Black dial with yellow hands and diamond hour markers.',1,'2024-01-11',1,6300,0,'images/rolex/rolex-rainbow-sapphire-daytona-chronograph-automatic-chronometer-diamond-black-dial-unisex-watch-116595-rbow0001.png',1,48,0),(14,'Rolex Submariner \"Hulk\"\" 116610LV\"','Unidirectional rotating stainless steel bezel with green cerachrom top ring. Green dial with silver-tone Mercedes logo, sword and Breguet-shaped hands and luminous dot hour markers.',1,'2024-02-09',1,7740,15,'images/rolex/rolex-submariner-hulk-green-dial-steel-mens-watch-116610lv.png',1,22,2),(15,'Seiko SNK807K2 Size 37mm','The attraction of Seiko SNK807K2 comes from the mysterious navy blue color of both the dial and strap. This model has defeated countless people with small - medium wrist sizes.',1,'2024-01-15',2,3850,0,'images/seiko/seiko-snk907k2-size-37mm.jpg',1,51,15),(16,'Seiko SRPB41J1 Size 40.5mm','Seiko watches are a Japanese brand, founded by Seiko Kintaro Hattori in 1881. The Japanese meaning is \"workmanship of exquisite houses\"\".\"',1,'2024-01-02',2,1300,0,'images/seiko/srpb41j1.jpg',1,30,0),(17,'Seiko SFQ803 Size 30mm','With its persistence over time, Seiko is increasingly developed and popular around the world with its durability, strong machine with extremely high precision.',0,'2024-01-13',2,4500,0,'images/seiko/sfq803.jpg',1,25,11),(18,'Seiko SNZG09J1 Size 42mm','Seiko watches are a Japanese brand, founded by Seiko Kintaro Hattori in 1881. The Japanese meaning is \"workmanship of exquisite houses\"\".\"',1,'2024-01-02',2,6000,0,'images/seiko/snzg09j1.jpg',1,18,5),(19,'Seiko SRP852J1 Size 34mm','With its persistence over time, Seiko is increasingly developed and popular around the world with its durability, strong machine with extremely high precision.',0,'2023-12-09',2,7500,0,'images/seiko/SRP852J1.jpg',1,20,0),(20,'Seiko SUT207 Size 29mm','With its persistence over time, Seiko is increasingly developed and popular around the world with its durability, strong machine with extremely high precision.',0,'2024-01-17',2,3000,0,'images/seiko/SUT207.jpg',1,15,3),(21,'Seiko SRPE55K1 Size 40mm','Seiko watches are a Japanese brand, founded by Seiko Kintaro Hattori in 1881. The Japanese meaning is \"workmanship of exquisite houses\"\".\"',1,'2024-01-09',2,8300,10,'images/seiko/SRPE55K1.jpg',1,40,12),(22,'Tissot T086.408.22.036.00 41mm','Tissot T086.408.22.036.00 is truly a Powermatic 80 Chronometer men\'s watch with a face size of 41mm, a thickness of 9.8mm, and fits all men\'s wrists from 16cm and up.',1,'2023-12-21',3,9000,0,'images/tissot/dong-ho-tissot-t086.408.22.036.00.png',1,38,10),(23,'Tissot T050.207.37.017.04 35mm','Tissot T050.207.37.017.04 is a Swiss women\'s watch model with 3ATM (30m) water resistance, enough for women to comfortably go in the rain and wash hands.',0,'2024-01-30',3,9000,70,'images/tissot/T050.png',1,54,22),(24,'Tissot T050.207.17.117.05 35mm','Model Tissot T050.207.17.117.05 Lady Heart Flower with attractive white tone and mother-of-pearl inlay is the number 1 accessory for office ladies or young fashion enthusiasts to use.',0,'2023-12-15',3,7600,0,'images/tissot/T050.207.17.117.05-2-1641973809522.png',1,60,15),(25,'Tissot T050.207.37.017.05 35mm','Tissot T050.207.37.017.05 is a Swiss women\'s watch model with 3ATM (30m) water resistance, enough for women to comfortably go in the rain and wash their hands.',0,'2024-01-03',3,5300,0,'images/tissot/T0502073701705-1-1013302102-1124118622.png',1,34,5),(26,'Tissot T035.407.36.051.01 39mm','Tissot T035.407.36.051.01 round face watch with black tone and gold case is the number 1 accessory that enhances the elegance of office workers, men or young businessmen.',1,'2023-12-29',3,9800,0,'images/tissot/T035-500423103-547082675.png',1,20,3),(27,'Tissot T035.207.16.031.01 32mm','Model Tissot T035.207.16.031.01 attractive red leather case is the number 1 accessory for office ladies or young people who are passionate about fashion to use.',0,'2023-12-24',3,6000,0,'images/tissot/T035-1236434723-1928092348.png',1,15,1),(28,'Tissot T035.407.11.031.00 39mm','The white Tissot T035.407.11.031.00 round face watch is the number 1 accessory that enhances the elegance of office workers, men or young businessmen.',1,'2024-01-11',3,8500,33,'images/tissot/T0354071103100-1-571428383-582448776.png',1,30,7),(29,'Tissot T137.410.16.041.00 40mm','The Tissot T137.410.16.041.00 round watch with blue face is the number 1 accessory that enhances the elegance of office workers, men or young businessmen.',1,'2023-12-24',3,4700,0,'images/tissot/T137.410.16.041.00-11-1670320775687.png',1,22,4),(30,'Tissot T108.208.33.117.00 32mm','Tissot T108.208.33.117.00 is a Swiss women\'s watch with 3ATM (30m) water resistance, enough for women to comfortably go in the rain and wash their hands.',0,'2023-12-11',3,9400,0,'images/tissot/T1082083311700-1-989063965-1404694283.png',1,10,0),(31,'Tissot T086.207.16.111.00 33mm','Tissot T086.207.16.111.00 is a Swiss women\'s watch with 3ATM (30m) water resistance, enough for women to comfortably go in the rain and wash their hands.',0,'2023-11-04',3,7500,0,'images/tissot/T086.207.16.111.00-1-1657079073546.png',1,21,5),(32,'Tissot T137.207.33.021.00 35mm','Tissot T137.207.33.021.00 is truly a men\'s watch with a face size of 35mm, fitting all men\'s wrists from 16cm or larger.',1,'2024-01-04',3,8500,0,'images/tissot/T137-998371198-1909910193.png',1,25,4),(33,'Casio MTP-1374L-1AVDF 43.5mm','Youthful, individual but no less elegant and luxurious; Those are 4 phrases that accurately describe the appearance of the Casio MTP-1374L-1AVDF watch.',1,'2024-01-26',4,2000,0,'images/casio/MTP-1374L-1AVDF.jpg',1,40,11),(34,'Casio EFV-600L-2AVUDF 43.8mm','Casio is a Japanese watch brand founded in 1946 by Mr. Tadao Kashio. Outstanding lines of Casio include \"G - Shock, Baby - G, Casio MTP,...\"',1,'2024-02-07',4,3300,11,'images/casio/EFV-600L-2AVUDF.jpg',1,66,17),(35,'Casio MTP-1384L-1AVDF 41mm','Until now, Casio has always been famous for its quality watches, beautiful designs and extremely affordable prices. Casio MTP-1384L-1AVDF is one of the best-selling Casio watches today.',1,'2023-12-25',4,1800,0,'images/casio/MTP-1384L-1AVDF.jpg',1,35,20),(36,'Casio LTP-V300L-4AUDF 33.2mm','With a gentle pink tone that is extremely flattering, the product quickly captures the hearts of girls from the first moment they meet it.',0,'2024-02-02',4,1500,15,'images/casio/LTP-V300L-4AUDF.jpg',1,40,27),(37,'Casio MTP-1384L-7AVDF 41mm','Part of the extremely popular Casio MTP-1384 watch series, Casio MTP-1384L-7AVDF possesses a stylish design but most importantly, an attractive price.',1,'2023-12-27',4,1700,0,'images/casio/MTP-1384L-7AVDF.jpg',1,22,8),(38,'Casio LTP-VT01GL-7BUDF 34mm','With a gentle, luxurious golden tone, the product quickly captures the hearts of girls from the first moment they meet it.',0,'2023-12-16',4,1100,0,'images/casio/LTP-VT01GL-7BUDF.jpg',1,30,0),(39,'Casio BA-110-7A1DR Size 43.5mm','Casio is a Japanese watch brand founded in 1946 by Mr. Tadao Kashio. Outstanding lines of Casio include \"G - Shock, Baby - G, Casio MTP,...\"',0,'2024-02-03',4,3250,0,'images/casio/BA-110-7A1DR.jpg',1,25,3),(40,'Orient RA-AA0B02R19B Size 41.7mm','Until now, the Japanese watch Orient SK RA-AA0B02R19B is still being sought after by many people because of its timeless beauty as well as the mysteries behind this time machine.',1,'2024-02-06',5,5460,0,'images/orient/RA-AA0B02R19B.jpg',1,30,12),(41,'Orient RA-AR0001S10B Size 40.8mm','Orient RA-AR0001S10B is one of the outstanding products from Orient - a watch brand in the mid-range segment but the quality is not ordinary.',1,'2024-02-17',5,8820,20,'images/orient/RA-AR0001S10B.jpg',1,42,10),(42,'Orient RA-AG0017Y10B Size 36mm','Orient is a Japanese watch brand established in 1950. The company was founded by Shogoro Yoshida.',0,'2024-02-08',5,6280,30,'images/orient/RA-AG0017Y10B.jpg',1,45,17),(43,'Orient RA-AR0005Y10B Size 40.8mm','Orient RA-AR0005Y10 is one of the watches from the cherry blossom brand that is most loved by users because of its unique design and many convenient functions.',1,'2024-01-11',5,5700,0,'images/orient/RA-AR0005Y10B.jpg',1,35,9),(44,'Orient RA-AR0004S10B Size 40.8mm','By \"teasing\"\" the structure of part of the internal mechanism, the Orient RA-AR0004S10B Open Heart watch has aroused the curiosity of anyone who has ever seen it.\"',1,'2023-12-31',5,4400,0,'images/orient/RA-AR0004S10B.jpg',1,52,21),(45,'Orient FAG02003W0 Size 41mm','Orient FAG02003W0 is not only a unique Semi Skeleton Automatic watch model, but also a perfect combination of a durable Japanese machine and a traditional Swiss-style sound.',1,'2024-02-05',5,1800,0,'images/orient/FAG02003W0.jpg',1,24,4),(46,'Orient FAG00003W0 Size 43mm','Orient FAG00003W0 represents the sophisticated choice of men. With luxurious design and meticulous attention to detail, it enhances the beauty of men\'s bravery.',1,'2023-12-19',5,2500,0,'images/orient/FAG00003W0.jpg',1,35,11),(47,'Orient RA-AG0726S00B Size 36mm','Orient is a Japanese watch brand established in 1950. The company was founded by Shogoro Yoshida.',0,'2024-01-06',5,3100,0,'images/orient/Orient-RA-AG0726S00B.jpg',1,46,7),(48,'Orient RA-AA0B03L19B Size 41.7mm','The 4-stud hexagonal face design of the Orient SK RA-AA0B03L19B version re-released in 2019 left an unforgettable mark in the music world.',1,'2023-12-05',5,5000,0,'images/orient/RA-AA0B03L19B.jpg',1,27,22),(49,'Orient FAG02004B0 Size 41mm','The famous Japanese watch brand continues to satisfy customers with the outstanding open-heart version of Orient FAG02004B0 for men.',1,'2023-12-24',5,3400,0,'images/orient/FAG02004B0.jpg',1,79,14),(50,'Orient RA-AG0005L10B Size 40.5mm','The Orient RA-AG0005L10B model stands out and attracts attention thanks to its fanciful navy blue tone combined with white from the silver hands and hour markers. The stylish blue dial synchronized with the strap brings a youthful and modern look to men.',1,'2024-02-11',5,7600,0,'images/orient/RA-AG0005L10B.jpg',1,51,15);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slider`
--

DROP TABLE IF EXISTS `slider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `slider` (
  `SliderID` int NOT NULL AUTO_INCREMENT,
  `UserID` int NOT NULL,
  `SliderTitle` varchar(255) NOT NULL,
  `SliderImage` varchar(255) NOT NULL,
  `backlink` varchar(255) NOT NULL,
  `SliderStatus` tinyint NOT NULL,
  PRIMARY KEY (`SliderID`),
  KEY `UserID` (`UserID`),
  CONSTRAINT `slider_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slider`
--

LOCK TABLES `slider` WRITE;
/*!40000 ALTER TABLE `slider` DISABLE KEYS */;
INSERT INTO `slider` VALUES (1,1,'Slide one ','uploads/background3.jpg','blogdetail?id=1',0),(2,1,'Slide two ','images/Slider/12-TUAN-LE-VANG-OKE.jpg','blogdetail?id=2',1),(3,1,'Slide three','images/Slider/13-418004996-1357155059.jpg','blogdetail?id=3',0),(4,1,'Sldie four','images/Slider/2612-Bonest-Gatti-2.jpg','blogdetail?id=4',1),(5,1,'Slide five','images/Slider/2211-BLACK-GiAM-thang-12.jpg','blogdetail?id=5',1),(6,1,'Slide six','images/Slider/Vi-sao-trong-moi-quang-cao-kim-dong-ho-luon-diem-10h10.png','blogdetail?id=6',1);
/*!40000 ALTER TABLE `slider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `UserID` int NOT NULL AUTO_INCREMENT,
  `RoleID` int NOT NULL,
  `Mail` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Address` varchar(255) NOT NULL,
  `Phone` varchar(255) NOT NULL,
  `Fullname` varchar(255) NOT NULL,
  `Gender` tinyint NOT NULL,
  `DOB` date NOT NULL,
  `Avatar` varchar(255) NOT NULL,
  `UserStatus` tinyint NOT NULL,
  `join_date` datetime NOT NULL,
  PRIMARY KEY (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,1,'user@fpt.edu.vn','user','Hola','0123456789','Mr.User',1,'2021-01-19','uploads/background3.jpg',1,'2021-01-19 12:00:00'),(2,2,'admin@fpt.edu.vn','admin','Ha Noi','0915254754','Mrs.Admin',0,'2024-01-07','bl4.jpg',1,'2024-01-07 12:00:00'),(3,3,'mkt@fpt.edu.vn','mkt','Hai Phong','0972346212','Mr.Marketing',0,'2020-01-29','Screenshot 2023-11-01 171551.png',1,'2020-01-29 12:00:00'),(4,1,'cus@fpt.edu.vn','cus','asdjn','0975238472','Customer',1,'2021-01-19','...',1,'2021-01-19 00:00:00'),(5,1,'usera@fpt.edu.vn','123','asdsma','0921378128','New User',1,'2021-01-19','...',0,'2021-01-19 00:00:00'),(6,4,'beck@fpt.edu.vn','123','Ha Noi','0921378128','Beck',1,'2021-01-19','...',0,'2021-01-19 00:00:00'),(7,1,'user3@fpt.edu.vn','123','Ha Nam','0283728374','User',0,'2024-01-07','background3.jpg',0,'2020-01-29 12:00:00'),(8,2,'admin2@fpt.edu.vn','123','Hai Duong','0962738473','Meo',0,'2020-01-29','.',1,'2020-01-29 12:00:00'),(9,2,'admin3@fpt.edu.vn','123','Nam Dinh','0263718273','John',1,'2024-01-07','.',1,'2024-01-07 12:00:00'),(10,3,'mkt2@fpt.edu.vn','123','Hola','0293812831','Marketing',1,'2020-04-01','.',1,'2021-01-19 00:00:00'),(11,4,'sale@fpt.edu.vn','123','Xavalo','0927381832','SaleMan',1,'2022-01-07','.',1,'2021-01-19 00:00:00'),(12,1,'customer@fpt.edu.vn','123','Da Nang','0738492832','Cus',0,'2019-05-02','.',1,'2021-01-19 00:00:00'),(13,1,'cus2@fpt.edu.vn','123','Ha Giang','0917283753','Nam',1,'2022-09-04','.',1,'2021-01-19 00:00:00');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-05 22:21:20
