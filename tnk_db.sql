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
INSERT INTO `admin` VALUES ('admin1912@gmail.com','Khue','Pham','$2b$10$reUntgyX4CxUJyUDCCQrbOzJV1lQyWbA0Pn0JT/lc5rQNGwqR0Lfy',0),('asd@gmail.com','','','$2b$10$mECDci7w1xBHMhN37RZyfeiPGcl1A4fq0CPNyTpeLO7K1.3KpyxEi',0),('ptvkhue@gmail.com','Khuê','Phạm ','$2b$10$M1lot.xNCk/esZCYUi0In.BhkRQ5ppjI6J/OvkkOfbrM1UCcgSBvu',1);
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
INSERT INTO `bill` VALUES (1,2,'190 Cao Lỗ, Quận 8, TP. Hồ Chí M\'inh',1,19120100,3,'0822525450','2022-01-10 12:30:21'),(2,2,'227 Nguyễn Văn Cừ, Quận 5, TP. Hồ Chí Minh',1,22750000,4,'0822525450','2022-01-10 12:30:21'),(3,2,'227 Nguyễn Văn Cừ, Quận 5, TP. Hồ Chí Minh',1,19563500,3,'0822525450','2022-01-10 12:30:21'),(4,2,'56 Vũ Ngọc Phan, Phan Thiết, Bình Thuận',3,703000,3,'0822525450','2022-01-10 12:30:21'),(5,28,'195 Cao Lo',1,37505000,1,'0822525450','2022-01-10 05:34:58');
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
INSERT INTO `catalog` VALUES (1,'Laptop Asus'),(2,'Laptop Acer'),(3,'Laptop Dell'),(4,'Laptop MSI'),(5,'Chuột & lót chuột'),(6,'Bàn phím'),(7,'Tai nghe Gaming'),(8,'Loa & tai nghe'),(10,'Phụ kiện MSI');
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
INSERT INTO `feedback` VALUES (1,'Chất lượng tốt, mẫu mã đẹp','Nguyễn Văn Thuận','2021-11-24 00:00:00',4),(2,'Giá tốt','Trần Văn Cường','2021-11-24 00:00:00',10),(3,'Sản phẩm đẹp, dùng rất thích','Lâm Thị Tường Vy','2021-11-24 16:58:14',12),(4,'Tốt, đa dụng','Phan Anh','2021-11-24 16:58:14',13);
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
INSERT INTO `payment` VALUES (1,'Thanh toán bằng tiền mặt'),(2,'Thanh toán bằng thẻ VISA/Mastercard'),(3,'Thanh toán bằng ví điện tử Momo'),(4,'Thanh toán bằng thẻ ngân hàng nội địa');
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
INSERT INTO `product` VALUES (1,'Laptop thế hệ mới',50,16999000,NULL,'2022-10-01 06:24:32','Laptop 4.0',2,0,0,0,'2022-01-05 12:55:39'),(2,'Laptop',50,46999000,NULL,'2022-01-05 12:55:39',NULL,1,0,0,0,'2022-01-05 12:55:39'),(3,'Laptop ASUS ROG Flow X13 GV301QC-K6052T',49,37490000,NULL,'2022-01-10 06:05:19',NULL,1,0,1,0,'2022-01-05 12:55:39'),(4,'Laptop Gaming ASUS ROG Zephyrus G14 GA401QEC-K2064T',50,42490000,NULL,'2022-01-05 12:55:39',NULL,1,0,0,0,'2022-01-05 12:55:39'),(5,'Laptop ASUS TUF Gaming FA506QR-AZ003T',50,36990000,NULL,'2022-01-05 12:55:39',NULL,1,0,0,0,'2022-01-05 12:55:39'),(6,'Laptop ASUS ZenBook Flip UX363EA',50,32490000,NULL,'2022-01-05 12:55:39',NULL,1,0,0,0,'2022-01-05 12:55:39'),(7,'Laptop ASUS TUF Dash 15 FX516PM-HN002W',50,31290000,NULL,'2022-01-05 12:55:39',NULL,1,0,0,0,'2022-01-05 12:55:39'),(8,'Laptop ASUS TUF Gaming F15 FX506HCB-HN141W',50,27490000,NULL,'2022-01-05 12:55:39',NULL,1,0,0,0,'2022-01-05 12:55:39'),(9,'Laptop Acer Aspire 3 A315-56-502X NX.HS5SV.00F ',50,13790000,NULL,'2022-01-05 12:55:39',NULL,2,0,0,0,'2022-01-05 12:55:39'),(10,'Laptop MSI Gaming GL75 Leopard 10SCSK 056VN ',50,21390000,NULL,'2022-01-09 12:26:49',NULL,4,0,0,0,'2022-01-05 12:55:39'),(11,'Laptop Dell Vostro 3405 V4R53500U003W',50,17590000,NULL,'2022-01-09 12:26:49',NULL,3,0,0,0,'2022-01-05 12:55:39'),(12,'Chuột DareU EM908',50,399000,NULL,'2022-01-10 06:05:19',NULL,5,0,1,0,'2022-01-05 12:55:39'),(13,'Chuột Logitech G300S ',50,299000,NULL,'2022-01-05 12:55:39',NULL,5,0,0,0,'2022-01-05 12:55:39'),(14,'Bàn phím cơ Corsair K65 RGB MINI White',50,2590000,NULL,'2022-01-05 12:55:39',NULL,6,0,0,0,'2022-01-05 12:55:39'),(15,'Bàn phím Leopold FC650MDS Bluetooth Blue Grey',50,3300000,NULL,'2022-01-05 12:55:39',NULL,6,0,0,0,'2022-01-05 12:55:39'),(16,'Bàn phím không dây Logitech MX Keys',50,2690000,NULL,'2022-01-05 12:55:39',NULL,6,0,0,0,'2022-01-05 12:55:39'),(17,'Tai nghe không dây Corsair Virtuoso XT',10,6590000,NULL,'2022-01-05 12:55:39',NULL,7,0,0,0,'2022-01-05 12:55:39'),(18,'Tai nghe DareU A710 RGB Wireless',50,1390000,NULL,'2022-01-05 12:55:39',NULL,7,0,0,0,'2022-01-05 12:55:39'),(19,'Tai nghe true wireless Soundpeats Air 3',50,1490000,NULL,'2022-01-05 12:55:39',NULL,8,0,0,0,'2022-01-05 12:55:39'),(33,'Laptop MSI Katana GF76 11UC 096VN',50,29000000,NULL,'2022-06-01 08:38:12','Máy tính xách tay/ Laptop MSI Katana GF76 11UC-096VN là phiên bản thế hệ mới sở hữu hiệu năng mạnh mẽ đến từ chip Intel Core i7 thế hệ thứ 11. Nếu bạn là một người đam mê trải nghiệm những tựa game nặng, đòi hỏi cấu hình cao thì MSI Katana GF76 11UC-096VN chắc chắn sẽ là chiếc laptop tuyệt vời dư sức đáp ứng được yêu cầu đó.',4,0,0,0,'2022-06-01 01:11:49'),(34,'Laptop MSI Summit E16 Flip A11UCT i7 1195G7',10,44999000,NULL,'2022-01-09 12:22:37','Laptop hiện đại bậc nhất hiện nay',4,0,0,0,'2022-01-09 11:15:00'),(35,'Laptop MSI Gaming Stealth 15M A11UEK-232VN i7 11375H',19,39500000,NULL,'2022-01-09 12:22:37','MSI Stealth 15M A11UEK-232VN xứng đáng được mệnh danh là siêu phẩm laptop gaming di động khi tích hợp cả bộ vi xử lý Intel Core i7 11375H và card đồ họa RTX 3060 Max-Q vào trong một chiếc máy tính gọn nhẹ như một cuốn sách, sẵn sàng cùng bạn cháy bỏng đam mê.',4,0,0,0,'2022-01-09 12:19:19'),(36,'Laptop MSI Summit E13 Flip Evo A11MT- 220VN i7 1185G7',16,37500000,NULL,'2022-01-09 12:24:33','MSI Summit E13 Flip Evo A11MT xứng đáng được gọi là một tuyệt phẩm trong thế giới laptop doanh nhân. Từ thiết kế cực mỏng, bản lề xoay 360 độ cho đến những đường nét tinh xảo, thậm chí Summit E13 Flip còn trang bị siêu cấu hình, cho bạn tận hưởng những gì tuyệt vời nhất của thế giới công nghệ.',4,0,0,0,'2022-01-09 12:24:33'),(37,'Laptop MSI Gaming Alpha 15 B5EEK 036VN R7 5800H',12,34799000,NULL,'2022-01-09 12:27:52','Thần thú Lôi Điểu với sức mạnh, tốc độ và sự chính xác tuyệt đối, MSI Gaming Alpha 15 B5EEK 036VN đã sẵn sàng cho những trận chiến game rực lửa của bạn. Bộ vi xử lý AMD Ryzen 7 5800H, card đồ họa rời Radeon RX6600M mới nhất cùng màn hình 144Hz tạo nên hiệu suất hủy diệt, chinh phục mọi cuộc chơi.',4,0,0,0,'2022-01-09 12:27:52'),(38,'Laptop MSI Prestige 15 A11SC 037VN i7 1185G7',11,34000000,NULL,'2022-01-09 12:31:13','Để người dùng có được phương tiện làm việc hiệu quả nhất, nhưng vẫn phải thiết kế tinh xảo và thể hiện đẳng cấp, MSI đã tạo ra MSI Prestige 15 A11SC 037VN, mẫu laptop mỏng nhẹ nhưng vẫn vô cùng mạnh mẽ.',4,0,0,0,'2022-01-09 12:31:13'),(39,'Laptop MSI Pulse GL66 11UDK 255VN i7 11800H',5,32500000,NULL,'2022-01-09 12:33:16','Lấy cảm hứng từ những chiến binh bộ tộc Rồng, MSI Pulse GL66 thể hiện sự mạnh mẽ qua một thiết kế viễn tưởng độc đáo. Sức mạnh bên trong máy cũng khiến tất cả phải kính nể với bộ vi xử lý Intel Core i7 thế hệ thứ 11 mới nhất và card đồ họa RTX 30 series.',4,0,0,0,'2022-01-09 12:33:16'),(40,'Laptop MSI Gaming GF65 10UE 286VN i5 10500H',15,27500000,NULL,'2022-01-09 12:36:56','Thưởng thức Ray Tracing và kiến trúc Ampere mới nhất của dòng card rời RTX 30 series trong mức giá hấp dẫn chưa từng thấy, laptop MSI Gaming GF65 10UE 286VN sẽ đưa trải nghiệm laptop gaming của bạn lên một tầm cao mới.',4,0,0,0,'2022-01-09 12:36:56'),(41,'Laptop MSI Modern 14 B11MOU-848VN i7 1195G7',25,21500000,NULL,'2022-01-09 12:40:37',NULL,4,0,0,0,'2022-01-09 12:40:37'),(42,'Laptop Asus Zenbook Duo UX482EA-KA268T i7 1165G7',16,38500000,NULL,'2022-01-09 12:45:22','ASUS ZenBook Duo 14 UX482EA mở ra một tương lai mới cho ngành công nghiệp laptop khi tích hợp tới hai màn hình nhưng thiết kế vẫn vô cùng di động. ZenBook Duo thực sự thích hợp cho công việc sáng tạo hay những người thường xuyên phải xử lý nhiều công việc cùng lúc.',1,0,0,0,'2022-01-09 12:45:22'),(43,'Laptop Asus Zenbook Duo UX482EA-KA081T i5 1135G7',14,31600000,NULL,'2022-01-09 12:50:01','ASUS ZenBook Duo 14 UX482EA là chiếc chìa khóa đưa bạn mở ra thế giới công nghệ hoàn toàn mới, nơi bạn được chứng kiến những điều tưởng như chỉ có trong phim viễn tưởng với một chiếc laptop 2 màn hình siêu độc, sở hữu sức mạnh và loạt tính năng đáng kinh ngạc.',1,0,0,0,'2022-01-09 12:50:01'),(44,'Laptop Asus Vivobook Pro M3500QC-L1105T R5 5600H',23,25400000,NULL,'2022-01-09 12:52:10',NULL,1,0,0,0,'2022-01-09 12:52:10'),(45,'Laptop Asus Gaming TUF FX516PC-HN001T i7 11370H',28,27600000,NULL,'2022-01-09 12:55:59','huộc thế hệ ASUS TUF Dash F15 2021, ASUS Gaming TUF FX516PC-HN001T mang đến trải nghiệm gaming đầy mạnh mẽ với bộ vi xử lý Intel Core i7 11370H và card đồ họa RTX 3050. Dù có một thiết kế siêu di động, nhưng chiếc laptop Asus TUF vẫn có độ bền chuẩn quân sự, cho bạn hoàn toàn yên tâm sử dụng.',1,0,0,0,'2022-01-09 12:55:59'),(46,'Laptop New',15,19000000,NULL,'2022-10-01 06:23:44','Mô tả laptop',3,0,0,0,'2022-10-01 06:23:44');
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
INSERT INTO `status` VALUES (1,'Chưa thanh toán'),(2,'Đang vận chuyển'),(3,'Thành công'),(4,'Đã hủy');
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
INSERT INTO `user` VALUES (1,'Thuận','Nguyễn Văn','nvthuan@gmail.com','15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225','0909080909','123 Nguyễn Tri Phương, quận 5, TP Hồ Chí Minh',0,0,NULL),(2,'Khuê','Phạm Trong Vinh','ptvinhkhue2001@gmail.com','cbe3158a6237b9a3586905d8a5c987001c103d9ff8ae5bf4da4125963fe8d988','0822525450','56 Vũ Ngọc Phan, Phan Thiết, Bình Thuận',0,0,NULL),(3,'Anh','Phạm Hoàng','phanh1906@gmail.com','948772e922c13f308cf37233858f216abcf039ada7b0d2c648346576f57f5c10','0823763731','390 Trần Hưng Đạo, Quận 1, TP Hồ Chí Minh',0,0,NULL),(4,'Khue','Pham','ptvkhue@gmail.com','$2b$10$rmkH8507SEXWKu5KoQNx1OrcX7m3knceh5AKRCKJTskYf1P94RNue','0822525450',NULL,1,0,NULL),(28,'Khue','Pham','xabit74118@whecode.com','$2b$10$FCflyCHGLF8Bzjsf/O3GqOnUpxRH6xO5V66cRPqp0bT345LIPbn7C','0822525450',NULL,0,1,'kIyt24ww1wqFCkDlN0j7nfS8VLqbxfdw');
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
