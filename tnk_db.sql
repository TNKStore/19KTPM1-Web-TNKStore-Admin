CREATE DATABASE  IF NOT EXISTS `tnk_database` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `tnk_database`;
-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: tnk_database
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `first_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `last_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `locked` int DEFAULT '0',
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES ('admin1912@gmail.com','Khue','Pham','$2b$10$reUntgyX4CxUJyUDCCQrbOzJV1lQyWbA0Pn0JT/lc5rQNGwqR0Lfy',0),('asd@gmail.com','','','$2b$10$mECDci7w1xBHMhN37RZyfeiPGcl1A4fq0CPNyTpeLO7K1.3KpyxEi',0),('ptvkhue@gmail.com','Khu??','Ph???m ','$2b$10$M1lot.xNCk/esZCYUi0In.BhkRQ5ppjI6J/OvkkOfbrM1UCcgSBvu',1);
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill`
--

DROP TABLE IF EXISTS `bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bill` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` smallint unsigned NOT NULL,
  `address` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `payment_id` tinyint unsigned DEFAULT NULL,
  `total` int unsigned DEFAULT NULL,
  `status_id` tinyint unsigned NOT NULL,
  `phone` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_User_Bill` (`user_id`),
  KEY `FK_Payment_Bill` (`payment_id`),
  KEY `FK_Status_Bill` (`status_id`),
  CONSTRAINT `bill_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `bill_ibfk_2` FOREIGN KEY (`payment_id`) REFERENCES `payment` (`id`),
  CONSTRAINT `bill_ibfk_3` FOREIGN KEY (`status_id`) REFERENCES `status` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill`
--

LOCK TABLES `bill` WRITE;
/*!40000 ALTER TABLE `bill` DISABLE KEYS */;
INSERT INTO `bill` VALUES (1,2,'190 Cao L???, Qu???n 8, TP. H??? Ch?? M\'inh',1,19120100,3,'0822525450','2022-01-10 12:30:21'),(2,2,'227 Nguy???n V??n C???, Qu???n 5, TP. H??? Ch?? Minh',1,22750000,4,'0822525450','2022-01-10 12:30:21'),(3,2,'227 Nguy???n V??n C???, Qu???n 5, TP. H??? Ch?? Minh',1,19563500,3,'0822525450','2022-01-10 12:30:21'),(4,2,'56 V?? Ng???c Phan, Phan Thi???t, B??nh Thu???n',3,703000,3,'0822525450','2022-01-10 12:30:21'),(5,28,'195 Cao Lo',1,37505000,1,'0822525450','2022-01-10 05:34:58');
/*!40000 ALTER TABLE `bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `billdetail`
--

DROP TABLE IF EXISTS `billdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `billdetail` (
  `bill_id` int unsigned NOT NULL AUTO_INCREMENT,
  `product_id` smallint unsigned NOT NULL,
  `amount` smallint unsigned DEFAULT '1',
  PRIMARY KEY (`bill_id`,`product_id`),
  KEY `FK_Product_BillDetail` (`product_id`),
  CONSTRAINT `billdetail_ibfk_1` FOREIGN KEY (`bill_id`) REFERENCES `bill` (`id`),
  CONSTRAINT `billdetail_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `billdetail`
--

LOCK TABLES `billdetail` WRITE;
/*!40000 ALTER TABLE `billdetail` DISABLE KEYS */;
INSERT INTO `billdetail` VALUES (1,4,1),(1,10,1),(2,6,5),(3,8,2),(4,12,1),(4,13,1),(5,3,1);
/*!40000 ALTER TABLE `billdetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cartdetail`
--

DROP TABLE IF EXISTS `cartdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cartdetail` (
  `user_id` smallint unsigned DEFAULT NULL,
  `unauth_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `product_id` smallint unsigned DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  KEY `cartdetail_product_id_fk` (`product_id`),
  KEY `cartdetail_user_id_fk` (`user_id`),
  CONSTRAINT `cartdetail_product_id_fk` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cartdetail_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cartdetail`
--

LOCK TABLES `cartdetail` WRITE;
/*!40000 ALTER TABLE `cartdetail` DISABLE KEYS */;
/*!40000 ALTER TABLE `cartdetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog`
--

DROP TABLE IF EXISTS `catalog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog` (
  `id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog`
--

LOCK TABLES `catalog` WRITE;
/*!40000 ALTER TABLE `catalog` DISABLE KEYS */;
INSERT INTO `catalog` VALUES (1,'Laptop Asus'),(2,'Laptop Acer'),(3,'Laptop Dell'),(4,'Laptop MSI'),(5,'Chu???t & l??t chu???t'),(6,'B??n ph??m'),(7,'Tai nghe Gaming'),(8,'Loa & tai nghe'),(10,'Ph??? ki???n MSI');
/*!40000 ALTER TABLE `catalog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedback` (
  `id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `fullname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `product_id` smallint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `feedback_user_id_fk_idx` (`product_id`),
  CONSTRAINT `feedback_user_id_fk` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
INSERT INTO `feedback` VALUES (1,'Ch???t l?????ng t???t, m???u m?? ?????p','Nguy???n V??n Thu???n','2021-11-24 00:00:00',4),(2,'Gi?? t???t','Tr???n V??n C?????ng','2021-11-24 00:00:00',10),(3,'S???n ph???m ?????p, d??ng r???t th??ch','L??m Th??? T?????ng Vy','2021-11-24 16:58:14',12),(4,'T???t, ??a d???ng','Phan Anh','2021-11-24 16:58:14',13);
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image`
--

DROP TABLE IF EXISTS `image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `image` (
  `product_id` smallint unsigned DEFAULT NULL,
  `id` smallint NOT NULL AUTO_INCREMENT,
  `url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `image_product_id_fk` (`product_id`),
  CONSTRAINT `image_product_id_fk` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
INSERT INTO `image` VALUES (19,1,'https://product.hstatic.net/1000026716/product/tai-nghe-soundpeats-air3-1_fd79bcfa76784170a5dabd5afb030a8c.jpg'),(18,2,'https://product.hstatic.net/1000026716/product/tai-nghe-dareu-a710-wireless-songphuong.vn__e9474e2b1bc048d697b721ec635d0bfd.jpg'),(15,3,'https://product.hstatic.net/1000026716/product/gearvn-ban-phim-fc650mds-blue-grey-blue-switch-1_1288af97e522447fbf0282cdd120c3ab.jpg'),(13,4,'https://product.hstatic.net/1000026716/product/dm8xxy_633efb36a8b44c89bdc6a1acd0e7efea.jpg'),(12,5,'https://product.hstatic.net/1000026716/product/dareu-em908-gearvn.jpg'),(17,6,'https://product.hstatic.net/1000026716/product/60710_tai_nghe_khong_day_corsair_virtuoso_xt_ca_9011188_ap_0000_1_5cfa4de39b2648589795adf9816065d0.jpg'),(16,7,'https://product.hstatic.net/1000026716/product/42000_logitech_mx_keys_ha1_01258e2ae9614a6a8dca17b3b20dc54a.jpg'),(14,8,'https://product.hstatic.net/1000026716/product/-ch-9194114-na-gallery-k65-rgb-mini-white-01_3655b5fe039c49cebcb8bf4919f32c59.png'),(1,9,'https://images.fpt.shop/unsafe/fit-in/800x800/filters:quality(90):fill(white):upscale()/fptshop.com.vn/Uploads/Originals/2021/3/1/637502180353670464_asus-vivobook-x515-print-bac-1.jpg'),(3,10,'https://cdn.cellphones.com.vn/media/catalog/product/cache/7/image/9df78eab33525d08d6e5fb8d27136e95/o/p/oppo-a74-black-10-200x200-002.jpg'),(10,11,'https://cdn.cellphones.com.vn/media/catalog/product/cache/7/image/9df78eab33525d08d6e5fb8d27136e95/l/a/laptop-msi-gaming-gl75-leopard-10scsk-056vn-01-ksp.jpg'),(8,12,'https://cdn.cellphones.com.vn/media/catalog/product/cache/7/image/9df78eab33525d08d6e5fb8d27136e95/l/a/laptop-ksp-v2-laptop-gaming.jpg'),(6,13,'https://cdn.cellphones.com.vn/media/catalog/product/cache/7/image/9df78eab33525d08d6e5fb8d27136e95/l/a/laptop-ksp-v2-009899.jpg'),(5,14,'https://cdn.cellphones.com.vn/media/catalog/product/cache/7/image/9df78eab33525d08d6e5fb8d27136e95/l/a/laptop-asus-tuf-gaming-fa506qm-hn016t-1_2-ksp.jpg'),(2,15,'https://cdn.cellphones.com.vn/media/catalog/product/cache/7/image/9df78eab33525d08d6e5fb8d27136e95/l/a/laptop-asus-gaming-rog-zephyrus-g14-ga401qm-6-ksp.jpg'),(9,16,'https://cdn.cellphones.com.vn/media/catalog/product/cache/7/image/9df78eab33525d08d6e5fb8d27136e95/1/_/1_66_5.jpg'),(4,17,'https://cdn.cellphones.com.vn/media/catalog/product/cache/7/image/9df78eab33525d08d6e5fb8d27136e95/0/3/03_1_2-ksp.jpg'),(7,18,'https://cdn.cellphones.com.vn/media/catalog/product/cache/7/image/9df78eab33525d08d6e5fb8d27136e95/0/2/02_fx516_black_v5_1.png'),(11,19,'https://cdn.cellphones.com.vn/media/catalog/product/cache/7/image/9df78eab33525d08d6e5fb8d27136e95/_/0/_0003_34994_vos_3405_2-ksp.jpg'),(33,27,'https://fptshop.com.vn/Uploads/images/2015/Tin-Tuc/QuanLNH2/MSI-Katana-GF76-5.jpg'),(34,28,'https://images.fpt.shop/unsafe/fit-in/585x390/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2021/7/6/637611871441309690_msi-summit-e16-flip-1.jpg'),(35,29,'https://fptshop.com.vn/Uploads/images/2015/Tin-Tuc/QuanLNH2/msi-stealth-15m-13.jpg'),(36,30,'https://images.fpt.shop/unsafe/fit-in/585x390/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2021/7/6/637611863318837230_msi-summit-e13-flip-den-1.jpg'),(37,31,'https://fptshop.com.vn/Uploads/images/2015/Tin-Tuc/QuanLNH2/MSI-Alpha-15-2021-10.jpg'),(38,32,'https://images.fpt.shop/unsafe/fit-in/585x390/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2021/10/4/637689712831853969_msi-prestige-15-xam-1.jpg'),(39,33,'https://images.fpt.shop/unsafe/fit-in/665x374/filters:quality(100):fill(white)/fptshop.com.vn/Uploads/Originals/2021/8/24/637654208712552459_msi-pulse-gl66-11udk-255vn-i7-11800h-man-hinh.png'),(40,34,'https://images.fpt.shop/unsafe/fit-in/585x390/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2021/4/22/637547082749323145_msi-gaming-gf65-den-1.jpg'),(41,35,'https://product.hstatic.net/1000262653/product/msi-b11_04b7c563799b4102a4d389f52f712902_master.jpg'),(42,36,'https://cdn.tgdd.vn/Products/Images/44/256509/asus-zenbook-duo-ux482ea-i7-ka268t-13-1.jpg'),(43,37,'https://bizweb.dktcdn.net/100/418/926/products/asus-zenbook-ux482eg-i5-ka166t-14-org-jpeg.jpg?v=1623461913087'),(44,38,'https://bizweb.dktcdn.net/100/372/934/products/laptopnew-asus-vivobook-pro-m3500qc-thumnail.jpg?v=1634610852080'),(45,39,'https://images.fpt.shop/unsafe/fit-in/585x390/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2021/3/29/637526137028914779_asus-tuf-gaming-fx516-xam-2.jpg'),(46,40,'https://i.imgur.com/8gE3YpI.jpg');
/*!40000 ALTER TABLE `image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `id` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (1,'Thanh to??n b???ng ti???n m???t'),(2,'Thanh to??n b???ng th??? VISA/Mastercard'),(3,'Thanh to??n b???ng v?? ??i???n t??? Momo'),(4,'Thanh to??n b???ng th??? ng??n h??ng n???i ?????a');
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `amount` int DEFAULT '0',
  `price` int unsigned DEFAULT NULL,
  `old_price` int unsigned DEFAULT NULL,
  `update_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci,
  `catalog_id` smallint unsigned NOT NULL,
  `hide` tinyint(1) NOT NULL DEFAULT '0',
  `amount_view` int DEFAULT '0',
  `amount_sold` int DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `product_ibfk_1` (`catalog_id`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`catalog_id`) REFERENCES `catalog` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Laptop th??? h??? m???i',50,16999000,NULL,'2022-10-01 06:24:32','Laptop 4.0',2,0,0,0,'2022-01-05 12:55:39'),(2,'Laptop',50,46999000,NULL,'2022-01-05 12:55:39',NULL,1,0,0,0,'2022-01-05 12:55:39'),(3,'Laptop ASUS ROG Flow X13 GV301QC-K6052T',49,37490000,NULL,'2022-01-10 06:05:19',NULL,1,0,1,0,'2022-01-05 12:55:39'),(4,'Laptop Gaming ASUS ROG Zephyrus G14 GA401QEC-K2064T',50,42490000,NULL,'2022-01-05 12:55:39',NULL,1,0,0,0,'2022-01-05 12:55:39'),(5,'Laptop ASUS TUF Gaming FA506QR-AZ003T',50,36990000,NULL,'2022-01-05 12:55:39',NULL,1,0,0,0,'2022-01-05 12:55:39'),(6,'Laptop ASUS ZenBook Flip UX363EA',50,32490000,NULL,'2022-01-05 12:55:39',NULL,1,0,0,0,'2022-01-05 12:55:39'),(7,'Laptop ASUS TUF Dash 15 FX516PM-HN002W',50,31290000,NULL,'2022-01-05 12:55:39',NULL,1,0,0,0,'2022-01-05 12:55:39'),(8,'Laptop ASUS TUF Gaming F15 FX506HCB-HN141W',50,27490000,NULL,'2022-01-05 12:55:39',NULL,1,0,0,0,'2022-01-05 12:55:39'),(9,'Laptop Acer Aspire 3 A315-56-502X NX.HS5SV.00F ',50,13790000,NULL,'2022-01-05 12:55:39',NULL,2,0,0,0,'2022-01-05 12:55:39'),(10,'Laptop MSI Gaming GL75 Leopard 10SCSK 056VN ',50,21390000,NULL,'2022-01-09 12:26:49',NULL,4,0,0,0,'2022-01-05 12:55:39'),(11,'Laptop Dell Vostro 3405 V4R53500U003W',50,17590000,NULL,'2022-01-09 12:26:49',NULL,3,0,0,0,'2022-01-05 12:55:39'),(12,'Chu???t DareU EM908',50,399000,NULL,'2022-01-10 06:05:19',NULL,5,0,1,0,'2022-01-05 12:55:39'),(13,'Chu???t Logitech G300S ',50,299000,NULL,'2022-01-05 12:55:39',NULL,5,0,0,0,'2022-01-05 12:55:39'),(14,'B??n ph??m c?? Corsair K65 RGB MINI White',50,2590000,NULL,'2022-01-05 12:55:39',NULL,6,0,0,0,'2022-01-05 12:55:39'),(15,'B??n ph??m Leopold FC650MDS Bluetooth Blue Grey',50,3300000,NULL,'2022-01-05 12:55:39',NULL,6,0,0,0,'2022-01-05 12:55:39'),(16,'B??n ph??m kh??ng d??y Logitech MX Keys',50,2690000,NULL,'2022-01-05 12:55:39',NULL,6,0,0,0,'2022-01-05 12:55:39'),(17,'Tai nghe kh??ng d??y Corsair Virtuoso XT',10,6590000,NULL,'2022-01-05 12:55:39',NULL,7,0,0,0,'2022-01-05 12:55:39'),(18,'Tai nghe DareU A710 RGB Wireless',50,1390000,NULL,'2022-01-05 12:55:39',NULL,7,0,0,0,'2022-01-05 12:55:39'),(19,'Tai nghe true wireless Soundpeats Air 3',50,1490000,NULL,'2022-01-05 12:55:39',NULL,8,0,0,0,'2022-01-05 12:55:39'),(33,'Laptop MSI Katana GF76 11UC 096VN',50,29000000,NULL,'2022-06-01 08:38:12','M??y t??nh x??ch tay/ Laptop MSI Katana GF76 11UC-096VN l?? phi??n b???n th??? h??? m???i s??? h???u hi???u n??ng m???nh m??? ?????n t??? chip Intel Core i7 th??? h??? th??? 11. N???u b???n l?? m???t ng?????i ??am m?? tr???i nghi???m nh???ng t???a game n???ng, ????i h???i c???u h??nh cao th?? MSI Katana GF76 11UC-096VN ch???c ch???n s??? l?? chi???c laptop tuy???t v???i d?? s???c ????p ???ng ???????c y??u c???u ????.',4,0,0,0,'2022-06-01 01:11:49'),(34,'Laptop MSI Summit E16 Flip A11UCT i7 1195G7',10,44999000,NULL,'2022-01-09 12:22:37','Laptop hi???n ?????i b???c nh???t hi???n nay',4,0,0,0,'2022-01-09 11:15:00'),(35,'Laptop MSI Gaming Stealth 15M A11UEK-232VN i7 11375H',19,39500000,NULL,'2022-01-09 12:22:37','MSI Stealth 15M A11UEK-232VN x???ng ????ng ???????c m???nh danh l?? si??u ph???m laptop gaming di ?????ng khi t??ch h???p c??? b??? vi x??? l?? Intel Core i7 11375H v?? card ????? h???a RTX 3060 Max-Q v??o trong m???t chi???c m??y t??nh g???n nh??? nh?? m???t cu???n s??ch, s???n s??ng c??ng b???n ch??y b???ng ??am m??.',4,0,0,0,'2022-01-09 12:19:19'),(36,'Laptop MSI Summit E13 Flip Evo A11MT- 220VN i7 1185G7',16,37500000,NULL,'2022-01-09 12:24:33','MSI Summit E13 Flip Evo A11MT x???ng ????ng ???????c g???i l?? m???t tuy???t ph???m trong th??? gi???i laptop doanh nh??n. T??? thi???t k??? c???c m???ng, b???n l??? xoay 360 ????? cho ?????n nh???ng ???????ng n??t tinh x???o, th???m ch?? Summit E13 Flip c??n trang b??? si??u c???u h??nh, cho b???n t???n h?????ng nh???ng g?? tuy???t v???i nh???t c???a th??? gi???i c??ng ngh???.',4,0,0,0,'2022-01-09 12:24:33'),(37,'Laptop MSI Gaming Alpha 15 B5EEK 036VN R7 5800H',12,34799000,NULL,'2022-01-09 12:27:52','Th???n th?? L??i ??i???u v???i s???c m???nh, t???c ????? v?? s??? ch??nh x??c tuy???t ?????i, MSI Gaming Alpha 15 B5EEK 036VN ???? s???n s??ng cho nh???ng tr???n chi???n game r???c l???a c???a b???n. B??? vi x??? l?? AMD Ryzen 7 5800H, card ????? h???a r???i Radeon RX6600M m???i nh???t c??ng m??n h??nh 144Hz t???o n??n hi???u su???t h???y di???t, chinh ph???c m???i cu???c ch??i.',4,0,0,0,'2022-01-09 12:27:52'),(38,'Laptop MSI Prestige 15 A11SC 037VN i7 1185G7',11,34000000,NULL,'2022-01-09 12:31:13','????? ng?????i d??ng c?? ???????c ph????ng ti???n l??m vi???c hi???u qu??? nh???t, nh??ng v???n ph???i thi???t k??? tinh x???o v?? th??? hi???n ?????ng c???p, MSI ???? t???o ra MSI Prestige 15 A11SC 037VN, m???u laptop m???ng nh??? nh??ng v???n v?? c??ng m???nh m???.',4,0,0,0,'2022-01-09 12:31:13'),(39,'Laptop MSI Pulse GL66 11UDK 255VN i7 11800H',5,32500000,NULL,'2022-01-09 12:33:16','L???y c???m h???ng t??? nh???ng chi???n binh b??? t???c R???ng, MSI Pulse GL66 th??? hi???n s??? m???nh m??? qua m???t thi???t k??? vi???n t?????ng ?????c ????o. S???c m???nh b??n trong m??y c??ng khi???n t???t c??? ph???i k??nh n??? v???i b??? vi x??? l?? Intel Core i7 th??? h??? th??? 11 m???i nh???t v?? card ????? h???a RTX 30 series.',4,0,0,0,'2022-01-09 12:33:16'),(40,'Laptop MSI Gaming GF65 10UE 286VN i5 10500H',15,27500000,NULL,'2022-01-09 12:36:56','Th?????ng th???c Ray Tracing v?? ki???n tr??c Ampere m???i nh???t c???a d??ng card r???i RTX 30 series trong m???c gi?? h???p d???n ch??a t???ng th???y, laptop MSI Gaming GF65 10UE 286VN s??? ????a tr???i nghi???m laptop gaming c???a b???n l??n m???t t???m cao m???i.',4,0,0,0,'2022-01-09 12:36:56'),(41,'Laptop MSI Modern 14 B11MOU-848VN i7 1195G7',25,21500000,NULL,'2022-01-09 12:40:37',NULL,4,0,0,0,'2022-01-09 12:40:37'),(42,'Laptop Asus Zenbook Duo UX482EA-KA268T i7 1165G7',16,38500000,NULL,'2022-01-09 12:45:22','ASUS ZenBook Duo 14 UX482EA m??? ra m???t t????ng lai m???i cho ng??nh c??ng nghi???p laptop khi t??ch h???p t???i hai m??n h??nh nh??ng thi???t k??? v???n v?? c??ng di ?????ng. ZenBook Duo th???c s??? th??ch h???p cho c??ng vi???c s??ng t???o hay nh???ng ng?????i th?????ng xuy??n ph???i x??? l?? nhi???u c??ng vi???c c??ng l??c.',1,0,0,0,'2022-01-09 12:45:22'),(43,'Laptop Asus Zenbook Duo UX482EA-KA081T i5 1135G7',14,31600000,NULL,'2022-01-09 12:50:01','ASUS ZenBook Duo 14 UX482EA l?? chi???c ch??a kh??a ????a b???n m??? ra th??? gi???i c??ng ngh??? ho??n to??n m???i, n??i b???n ???????c ch???ng ki???n nh???ng ??i???u t?????ng nh?? ch??? c?? trong phim vi???n t?????ng v???i m???t chi???c laptop 2 m??n h??nh si??u ?????c, s??? h???u s???c m???nh v?? lo???t t??nh n??ng ????ng kinh ng???c.',1,0,0,0,'2022-01-09 12:50:01'),(44,'Laptop Asus Vivobook Pro M3500QC-L1105T R5 5600H',23,25400000,NULL,'2022-01-09 12:52:10',NULL,1,0,0,0,'2022-01-09 12:52:10'),(45,'Laptop Asus Gaming TUF FX516PC-HN001T i7 11370H',28,27600000,NULL,'2022-01-09 12:55:59','hu???c th??? h??? ASUS TUF Dash F15 2021, ASUS Gaming TUF FX516PC-HN001T mang ?????n tr???i nghi???m gaming ?????y m???nh m??? v???i b??? vi x??? l?? Intel Core i7 11370H v?? card ????? h???a RTX 3050. D?? c?? m???t thi???t k??? si??u di ?????ng, nh??ng chi???c laptop Asus TUF v???n c?? ????? b???n chu???n qu??n s???, cho b???n ho??n to??n y??n t??m s??? d???ng.',1,0,0,0,'2022-01-09 12:55:59'),(46,'Laptop New',15,19000000,NULL,'2022-10-01 06:23:44','M?? t??? laptop',3,0,0,0,'2022-10-01 06:23:44');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `status` (
  `id` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
INSERT INTO `status` VALUES (1,'Ch??a thanh to??n'),(2,'??ang v???n chuy???n'),(3,'Th??nh c??ng'),(4,'???? h???y');
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `last_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `pwd` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `phone` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `address` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `locked` int DEFAULT '0',
  `activated` int DEFAULT '0',
  `activationString` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Thu???n','Nguy???n V??n','nvthuan@gmail.com','15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225','0909080909','123 Nguy???n Tri Ph????ng, qu???n 5, TP H??? Ch?? Minh',0,0,NULL),(2,'Khu??','Ph???m Trong Vinh','ptvinhkhue2001@gmail.com','cbe3158a6237b9a3586905d8a5c987001c103d9ff8ae5bf4da4125963fe8d988','0822525450','56 V?? Ng???c Phan, Phan Thi???t, B??nh Thu???n',0,0,NULL),(3,'Anh','Ph???m Ho??ng','phanh1906@gmail.com','948772e922c13f308cf37233858f216abcf039ada7b0d2c648346576f57f5c10','0823763731','390 Tr???n H??ng ?????o, Qu???n 1, TP H??? Ch?? Minh',0,0,NULL),(4,'Khue','Pham','ptvkhue@gmail.com','$2b$10$rmkH8507SEXWKu5KoQNx1OrcX7m3knceh5AKRCKJTskYf1P94RNue','0822525450',NULL,1,0,NULL),(28,'Khue','Pham','xabit74118@whecode.com','$2b$10$FCflyCHGLF8Bzjsf/O3GqOnUpxRH6xO5V66cRPqp0bT345LIPbn7C','0822525450',NULL,0,1,'kIyt24ww1wqFCkDlN0j7nfS8VLqbxfdw');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wishlist`
--

DROP TABLE IF EXISTS `wishlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wishlist` (
  `product_id` smallint unsigned NOT NULL,
  `user_id` smallint unsigned NOT NULL,
  PRIMARY KEY (`product_id`,`user_id`),
  KEY `FK_User_Wishlist` (`user_id`),
  CONSTRAINT `wishlist_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `wishlist_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishlist`
--

LOCK TABLES `wishlist` WRITE;
/*!40000 ALTER TABLE `wishlist` DISABLE KEYS */;
INSERT INTO `wishlist` VALUES (11,1),(3,2),(9,2),(12,2),(4,3);
/*!40000 ALTER TABLE `wishlist` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-01-10 17:14:47
