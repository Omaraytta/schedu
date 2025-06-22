-- MySQL dump 10.13  Distrib 9.3.0, for Linux (x86_64)
--
-- Host: localhost    Database: railway
-- ------------------------------------------------------
-- Server version       9.3.0

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
-- Table structure for table `academic_degrees`
--

DROP TABLE IF EXISTS `academic_degrees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `academic_degrees` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_ar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prefix` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prefix_ar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `academic_degrees`
--

LOCK TABLES `academic_degrees` WRITE;
INSERT INTO `academic_degrees` VALUES (1,'professor','أستاذ','Prof.','أ. د.');
INSERT INTO `academic_degrees` VALUES (2,'associate professor','أستاذ مساعد','Dr.','د.');
INSERT INTO `academic_degrees` VALUES (3,'assistant professor','مدرس','Dr.','د.');
INSERT INTO `academic_degrees` VALUES (4,'assistant lecturer','مدرس مساعد','Eng.','م.');
INSERT INTO `academic_degrees` VALUES (5,'teaching assistant','معيد','Eng.','م.');
UNLOCK TABLES;

--
-- Table structure for table `academic_items`
--

DROP TABLE IF EXISTS `academic_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `academic_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `academic_id` bigint unsigned NOT NULL,
  `course_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `academic_items_academic_id_foreign` (`academic_id`),
  KEY `academic_items_course_id_foreign` (`course_id`),
  CONSTRAINT `academic_items_academic_id_foreign` FOREIGN KEY (`academic_id`) REFERENCES `academics` (`id`),
  CONSTRAINT `academic_items_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `academic_items`
--

LOCK TABLES `academic_items` WRITE;
UNLOCK TABLES;

--
-- Table structure for table `academics`
--

DROP TABLE IF EXISTS `academics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `academics` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_ar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `department_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `academics_department_id_foreign` (`department_id`),
  CONSTRAINT `academics_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `academics`
--

LOCK TABLES `academics` WRITE;
INSERT INTO `academics` VALUES (2,'Regulation 2022 - Level','اللائحة 2022 - المستوى الأول- ذكاء اصطناعي',5);
UNLOCK TABLES;

--
-- Table structure for table `acadmic_spaces`
--

DROP TABLE IF EXISTS `acadmic_spaces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acadmic_spaces` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `capacity` bigint NOT NULL,
  `availability` json NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acadmic_spaces`
--

LOCK TABLES `acadmic_spaces` WRITE;
UNLOCK TABLES;

--
-- Table structure for table `course_assignments`
--

DROP TABLE IF EXISTS `course_assignments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course_assignments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `study_plan_id` bigint unsigned NOT NULL,
  `course_id` bigint unsigned NOT NULL,
  `lecture_groups` int NOT NULL DEFAULT '0',
  `lab_groups` int NOT NULL DEFAULT '0',
  `is_common` tinyint(1) NOT NULL DEFAULT '0',
  `practical_in_labs` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `course_assignments_study_plan_id_foreign` (`study_plan_id`),
  KEY `course_assignments_course_id_foreign` (`course_id`),
  CONSTRAINT `course_assignments_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  CONSTRAINT `course_assignments_study_plan_id_foreign` FOREIGN KEY (`study_plan_id`) REFERENCES `study_planes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_assignments`
--

LOCK TABLES `course_assignments` WRITE;
INSERT INTO `course_assignments` VALUES (16,19,33,1,0,0,0,NULL,NULL);
INSERT INTO `course_assignments` VALUES (17,19,34,1,0,0,0,NULL,NULL);
INSERT INTO `course_assignments` VALUES (18,20,40,1,0,0,0,NULL,NULL);
UNLOCK TABLES;

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courses` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_ar` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_en` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `practical_components` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `lecture_hours` int NOT NULL,
  `practical_hours` int NOT NULL,
  `credit_hours` int NOT NULL,
  `academic_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_academic_id_foreign` (`academic_id`),
  CONSTRAINT `courses_academic_id_foreign` FOREIGN KEY (`academic_id`) REFERENCES `academics` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
INSERT INTO `courses` VALUES (33,'UNV102','لغه انجليزيه في التخصص','English Language','',2,0,2,2);
INSERT INTO `courses` VALUES (34,'UNV103','الكتابة الفنية والعلمية','Technical and Scientific Writing','',2,0,2,2);
INSERT INTO `courses` VALUES (35,'UNV104','الذكاء الاصطناعي والتحول الرقمي في المجتمع','Artificial Intelligence and Digital Transformation in Society','',2,0,2,2);
INSERT INTO `courses` VALUES (36,'BS102','الهياكل المتقطعة','Discrete  Structures','',2,2,3,2);
INSERT INTO `courses` VALUES (37,'BS103','الجبر الخطي','Linear Algebra','',2,2,3,2);
INSERT INTO `courses` VALUES (38,'CS103','برمجة كائنية التوجه','Object Programming','',2,2,3,2);
INSERT INTO `courses` VALUES (39,'BS104','تطبيقات الاحتمالات والإحصاء في الحاسب','Probability and Statistics Applications in Computer','',2,2,3,2);
INSERT INTO `courses` VALUES (40,'Math0','رياضه تكميليه','Complementary Mathematics for Science','',0,0,0,2);
INSERT INTO `courses` VALUES (41,'IS202','نظم قواعد البيانات','Database Systems','',2,2,3,2);
INSERT INTO `courses` VALUES (42,'IT203','شبكات الحاسوب','Computer Networks','',2,2,3,2);
INSERT INTO `courses` VALUES (43,'CS206','مقدمة في الذكاء الاصطناعي','Introduction to Artificial Intelligence','',2,2,3,2);
INSERT INTO `courses` VALUES (44,'CS311','تصميم وتحليل الخوارزميات','Design and Analysis of Algorithms','',2,2,3,2);
INSERT INTO `courses` VALUES (45,'IT309','معالجة الإشارات الرقمية','Digital Signals Processing','',2,2,3,2);
INSERT INTO `courses` VALUES (46,'BS209','بحوث العمليات (2)','Operations Research','',0,0,0,2);
INSERT INTO `courses` VALUES (47,'CS314','معالجة الصور','Image Processing','',2,2,3,2);
INSERT INTO `courses` VALUES (48,'CS321','الذكاء التطوري وذكاء السرب','Evolutionary and Swarm Intelligence','',2,2,3,2);
INSERT INTO `courses` VALUES (49,'IT423','إنترنت الأشياء','Internet of Things','',2,2,3,2);
INSERT INTO `courses` VALUES (50,'CS429','التشفير','Cryptography','',2,2,3,2);
INSERT INTO `courses` VALUES (51,'CS443','الذكاء الاصطناعي للروبوت','Artificial Intelligence for Robot','',2,2,3,2);
INSERT INTO `courses` VALUES (52,'IT416','الواقع الافتراضي والمعزز','Virtual and Agumented Reality','',2,2,3,2);
INSERT INTO `courses` VALUES (53,'IT427','مقدمة في المركبات ذاتية القيادة','Introduction to Autonomous Vehicles','',2,2,3,2);
INSERT INTO `courses` VALUES (54,'CS309','الحوسبة اللينة','Soft Computing','',2,2,3,2);
INSERT INTO `courses` VALUES (55,'PRA1401','مشروع','Project','',1,2,2,2);
INSERT INTO `courses` VALUES (56,'CS437','علم البيانات','Data Science','',0,0,0,2);
INSERT INTO `courses` VALUES (57,'CS441','التعلم العميق','Deep Learning','',0,0,0,2);
INSERT INTO `courses` VALUES (58,'CS434','التعرف علي الانماط','Pattern Recognition','',2,2,3,2);
UNLOCK TABLES;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_ar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
INSERT INTO `departments` VALUES (1,'general','عام');
INSERT INTO `departments` VALUES (2,'computer science','علوم الحاسب');
INSERT INTO `departments` VALUES (3,'information technology','تكنولوجيا المعلومات');
INSERT INTO `departments` VALUES (4,'information systems','نظم المعلومات');
INSERT INTO `departments` VALUES (5,'artificial intelligence','الذكاء الاصطناعي');
INSERT INTO `departments` VALUES (6,'cybersecurity','الأمن السيبراني');
INSERT INTO `departments` VALUES (7,'biomedical','الطب الحيوي');
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
UNLOCK TABLES;

--
-- Table structure for table `halls`
--

DROP TABLE IF EXISTS `halls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `halls` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `capacity` bigint NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `halls`
--

LOCK TABLES `halls` WRITE;
INSERT INTO `halls` VALUES (1,'206',150);
INSERT INTO `halls` VALUES (2,'207',80);
INSERT INTO `halls` VALUES (3,'b104',300);
UNLOCK TABLES;

--
-- Table structure for table `lab_assignments`
--

DROP TABLE IF EXISTS `lab_assignments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lab_assignments` (
  `course_assignment_id` bigint unsigned NOT NULL,
  `lab_id` bigint unsigned NOT NULL,
  KEY `lab_assignments_course_assignment_id_foreign` (`course_assignment_id`),
  KEY `lab_assignments_lab_id_foreign` (`lab_id`),
  CONSTRAINT `lab_assignments_course_assignment_id_foreign` FOREIGN KEY (`course_assignment_id`) REFERENCES `course_assignments` (`id`) ON DELETE CASCADE,
  CONSTRAINT `lab_assignments_lab_id_foreign` FOREIGN KEY (`lab_id`) REFERENCES `laps` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_assignments`
--

LOCK TABLES `lab_assignments` WRITE;
UNLOCK TABLES;

--
-- Table structure for table `laps`
--

DROP TABLE IF EXISTS `laps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `laps` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `capacity` int NOT NULL,
  `labType` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `usedInNonSpecialistCourses` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `laps`
--

LOCK TABLES `laps` WRITE;
INSERT INTO `laps` VALUES (1,'105',90,'general',1);
INSERT INTO `laps` VALUES (2,'105',99,'general',1);
INSERT INTO `laps` VALUES (3,'202',20,'general',1);
INSERT INTO `laps` VALUES (4,'203',60,'general',1);
INSERT INTO `laps` VALUES (5,'204',40,'specialist',1);
INSERT INTO `laps` VALUES (6,'100',100,'general',0);
INSERT INTO `laps` VALUES (7,'303',60,'general',1);
UNLOCK TABLES;

--
-- Table structure for table `lecturer_assignments`
--

DROP TABLE IF EXISTS `lecturer_assignments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lecturer_assignments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `course_assignment_id` bigint unsigned NOT NULL,
  `lecturer_id` bigint unsigned NOT NULL,
  `num_groups` int NOT NULL DEFAULT '1',
  `type` enum('lecturer','teaching_assistant') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `lecturer_assignments_course_assignment_id_foreign` (`course_assignment_id`),
  KEY `lecturer_assignments_lecturer_id_foreign` (`lecturer_id`),
  CONSTRAINT `lecturer_assignments_course_assignment_id_foreign` FOREIGN KEY (`course_assignment_id`) REFERENCES `course_assignments` (`id`) ON DELETE CASCADE,
  CONSTRAINT `lecturer_assignments_lecturer_id_foreign` FOREIGN KEY (`lecturer_id`) REFERENCES `lecturers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lecturer_assignments`
--

LOCK TABLES `lecturer_assignments` WRITE;
INSERT INTO `lecturer_assignments` VALUES (9,16,5,1,'lecturer',NULL,NULL);
INSERT INTO `lecturer_assignments` VALUES (10,17,10,1,'lecturer',NULL,NULL);
INSERT INTO `lecturer_assignments` VALUES (11,18,9,1,'lecturer',NULL,NULL);
UNLOCK TABLES;

--
-- Table structure for table `lecturers`
--

DROP TABLE IF EXISTS `lecturers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lecturers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_ar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `department_id` bigint unsigned NOT NULL,
  `academic_id` bigint unsigned NOT NULL,
  `isPermanent` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `lecturers_department_id_foreign` (`department_id`),
  KEY `lecturers_academic_id_foreign` (`academic_id`),
  CONSTRAINT `lecturers_academic_id_foreign` FOREIGN KEY (`academic_id`) REFERENCES `academic_degrees` (`id`),
  CONSTRAINT `lecturers_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lecturers`
--

LOCK TABLES `lecturers` WRITE;
INSERT INTO `lecturers` VALUES (3,'Ahmed Mohammed  Rabiea','أحمد سيد ربيع',3,1,1);
INSERT INTO `lecturers` VALUES (5,'Ahmed Elharby','احمد الحربي',2,1,1);
INSERT INTO `lecturers` VALUES (6,'Wael Abdelkader Awad','وائل عبد القادر عوض',2,1,1);
INSERT INTO `lecturers` VALUES (7,'Samar El-Badawy','سمر البدوي',2,3,1);
INSERT INTO `lecturers` VALUES (8,'Tamer Zakaria','تامر زكريا',3,2,1);
INSERT INTO `lecturers` VALUES (9,'Mona Nagi El-Badawy','منى ناجي البدوي',2,2,1);
INSERT INTO `lecturers` VALUES (10,'Abeer saber','عبير صابر',3,3,1);
INSERT INTO `lecturers` VALUES (11,'Ali elbaz','علي الباز',5,1,1);
INSERT INTO `lecturers` VALUES (19,'Gamal Mohamed Behairy','جمال محمد بحيري',2,1,1);
INSERT INTO `lecturers` VALUES (20,'Nesma Ibrahim','نسمه ابراهيم',2,3,1);
INSERT INTO `lecturers` VALUES (21,'Amira Elzeny','اميره الزيني',4,3,1);
INSERT INTO `lecturers` VALUES (23,'Mohammed Taha','محمد طه',3,2,1);
INSERT INTO `lecturers` VALUES (24,'Heba Elhadidy','هبه الحديدي',2,3,1);
INSERT INTO `lecturers` VALUES (26,'Mohammed Tamer','محمد تامر',2,5,1);
INSERT INTO `lecturers` VALUES (27,'Ibrahim Shokry El-Gazzar','ابراهيم شكري الجزار',2,5,1);
INSERT INTO `lecturers` VALUES (28,'Maya Hesham','مايا هشام',2,5,1);
INSERT INTO `lecturers` VALUES (29,'Rana Khater','رنا خاطر',2,5,1);
INSERT INTO `lecturers` VALUES (30,'Mariam Khashaba','مريم خشبة',2,5,1);
INSERT INTO `lecturers` VALUES (31,'Mariam El-Ghaitany','مريم الغيطاني',2,5,1);
INSERT INTO `lecturers` VALUES (32,'Nada Abdelhady','ندى عبدالهادي',2,5,1);
INSERT INTO `lecturers` VALUES (33,'Eman Magdy','ايمان مجدي',2,5,1);
INSERT INTO `lecturers` VALUES (34,'Soheila El-Shamy','سهيلة الشامي',3,5,1);
INSERT INTO `lecturers` VALUES (35,'Lamyaa Ibrahim','لمياء ابراهيم',2,5,1);
INSERT INTO `lecturers` VALUES (36,'Sahar El-Shennawy','سحر الشناوي',2,5,1);
INSERT INTO `lecturers` VALUES (37,'Salma Ahmed','سلمى احمد',2,5,1);
INSERT INTO `lecturers` VALUES (38,'Fatma Abdeldayem','فاطمة عبدالدايم',3,4,1);
INSERT INTO `lecturers` VALUES (39,'Mennaallah El-Zawawy','منةالله الزواوي',2,5,1);
INSERT INTO `lecturers` VALUES (40,'Omnia Ghanem','أمنية غانم',2,5,1);
INSERT INTO `lecturers` VALUES (41,'Asmaa Fathy','أسماء فتحي',2,5,1);
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1);
INSERT INTO `migrations` VALUES (2,'2014_10_12_100000_create_password_reset_tokens_table',1);
INSERT INTO `migrations` VALUES (3,'2019_08_19_000000_create_failed_jobs_table',1);
INSERT INTO `migrations` VALUES (4,'2019_12_14_000001_create_personal_access_tokens_table',1);
INSERT INTO `migrations` VALUES (5,'2025_01_02_213131_create_academic_degrees_table',1);
INSERT INTO `migrations` VALUES (6,'2025_01_10_160232_create_departments_table',1);
INSERT INTO `migrations` VALUES (7,'2025_02_05_160117_create_academics_table',1);
INSERT INTO `migrations` VALUES (8,'2025_02_10_152447_create_acadmic_spaces_table',1);
INSERT INTO `migrations` VALUES (9,'2025_02_10_154811_create_term_plans_table',1);
INSERT INTO `migrations` VALUES (10,'2025_02_10_154927_create_courses_table',1);
INSERT INTO `migrations` VALUES (11,'2025_02_10_160547_create_academic_items_table',1);
INSERT INTO `migrations` VALUES (12,'2025_02_10_164139_create_lecturers_table',1);
INSERT INTO `migrations` VALUES (13,'2025_02_10_164634_create_term_items_table',1);
INSERT INTO `migrations` VALUES (14,'2025_02_18_012655_create_permission_tables',1);
INSERT INTO `migrations` VALUES (15,'2025_03_02_133103_create_time_preferences_table',1);
INSERT INTO `migrations` VALUES (16,'2025_03_02_133218_create_halls_table',1);
INSERT INTO `migrations` VALUES (17,'2025_03_02_153616_create_laps_table',1);
INSERT INTO `migrations` VALUES (18,'2025_03_08_150430_create_study_planes_table',1);
INSERT INTO `migrations` VALUES (19,'2025_03_08_154924_create_course_assignments_table',1);
INSERT INTO `migrations` VALUES (20,'2025_03_08_203444_create_lecturer_assignments_table',1);
INSERT INTO `migrations` VALUES (21,'2025_03_08_203740_create_lab_assignments_table',1);
UNLOCK TABLES;

--
-- Table structure for table `model_has_permissions`
--

DROP TABLE IF EXISTS `model_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `model_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_permissions`
--

LOCK TABLES `model_has_permissions` WRITE;
UNLOCK TABLES;

--
-- Table structure for table `model_has_roles`
--

DROP TABLE IF EXISTS `model_has_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `model_has_roles` (
  `role_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_roles`
--

LOCK TABLES `model_has_roles` WRITE;
INSERT INTO `model_has_roles` VALUES (1,'App\\Models\\User',1);
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
INSERT INTO `permissions` VALUES (1,'view academic spaces','web','2025-05-19 18:13:55','2025-05-19 18:13:55');
INSERT INTO `permissions` VALUES (2,'create academic space','web','2025-05-19 18:13:55','2025-05-19 18:13:55');
INSERT INTO `permissions` VALUES (3,'show academic space','web','2025-05-19 18:13:55','2025-05-19 18:13:55');
INSERT INTO `permissions` VALUES (4,'update academic space','web','2025-05-19 18:13:55','2025-05-19 18:13:55');
INSERT INTO `permissions` VALUES (5,'delete academic space','web','2025-05-19 18:13:55','2025-05-19 18:13:55');
INSERT INTO `permissions` VALUES (6,'view departments','web','2025-05-19 18:13:55','2025-05-19 18:13:55');
INSERT INTO `permissions` VALUES (7,'create department','web','2025-05-19 18:13:55','2025-05-19 18:13:55');
INSERT INTO `permissions` VALUES (8,'show department','web','2025-05-19 18:13:55','2025-05-19 18:13:55');
INSERT INTO `permissions` VALUES (9,'update department','web','2025-05-19 18:13:55','2025-05-19 18:13:55');
INSERT INTO `permissions` VALUES (10,'delete department','web','2025-05-19 18:13:55','2025-05-19 18:13:55');
INSERT INTO `permissions` VALUES (11,'view lecturers','web','2025-05-19 18:13:55','2025-05-19 18:13:55');
INSERT INTO `permissions` VALUES (12,'create lecturer','web','2025-05-19 18:13:55','2025-05-19 18:13:55');
INSERT INTO `permissions` VALUES (13,'show lecturer','web','2025-05-19 18:13:55','2025-05-19 18:13:55');
INSERT INTO `permissions` VALUES (14,'update lecturer','web','2025-05-19 18:13:55','2025-05-19 18:13:55');
INSERT INTO `permissions` VALUES (15,'delete lecturer','web','2025-05-19 18:13:55','2025-05-19 18:13:55');
INSERT INTO `permissions` VALUES (16,'view courses','web','2025-05-19 18:13:55','2025-05-19 18:13:55');
INSERT INTO `permissions` VALUES (17,'create course','web','2025-05-19 18:13:55','2025-05-19 18:13:55');
INSERT INTO `permissions` VALUES (18,'show course','web','2025-05-19 18:13:55','2025-05-19 18:13:55');
INSERT INTO `permissions` VALUES (19,'update course','web','2025-05-19 18:13:55','2025-05-19 18:13:55');
INSERT INTO `permissions` VALUES (20,'delete course','web','2025-05-19 18:13:55','2025-05-19 18:13:55');
INSERT INTO `permissions` VALUES (21,'view academics','web','2025-05-19 18:13:55','2025-05-19 18:13:55');
INSERT INTO `permissions` VALUES (22,'create academic','web','2025-05-19 18:13:55','2025-05-19 18:13:55');
INSERT INTO `permissions` VALUES (23,'show academic','web','2025-05-19 18:13:55','2025-05-19 18:13:55');
INSERT INTO `permissions` VALUES (24,'update academic','web','2025-05-19 18:13:55','2025-05-19 18:13:55');
INSERT INTO `permissions` VALUES (25,'delete academic','web','2025-05-19 18:13:55','2025-05-19 18:13:55');
INSERT INTO `permissions` VALUES (26,'add course to academic','web','2025-05-19 18:13:55','2025-05-19 18:13:55');
INSERT INTO `permissions` VALUES (27,'remove course from academic','web','2025-05-19 18:13:55','2025-05-19 18:13:55');
INSERT INTO `permissions` VALUES (28,'view term plans','web','2025-05-19 18:13:55','2025-05-19 18:13:55');
INSERT INTO `permissions` VALUES (29,'create term plan','web','2025-05-19 18:13:55','2025-05-19 18:13:55');
INSERT INTO `permissions` VALUES (30,'show term plan','web','2025-05-19 18:13:55','2025-05-19 18:13:55');
INSERT INTO `permissions` VALUES (31,'update term plan','web','2025-05-19 18:13:55','2025-05-19 18:13:55');
INSERT INTO `permissions` VALUES (32,'delete term plan','web','2025-05-19 18:13:55','2025-05-19 18:13:55');
INSERT INTO `permissions` VALUES (33,'add item to term plan','web','2025-05-19 18:13:55','2025-05-19 18:13:55');
INSERT INTO `permissions` VALUES (34,'remove item from term plan','web','2025-05-19 18:13:55','2025-05-19 18:13:55');
INSERT INTO `permissions` VALUES (35,'show term plan item','web','2025-05-19 18:13:55','2025-05-19 18:13:55');
INSERT INTO `permissions` VALUES (36,'assign role','web','2025-05-19 18:13:55','2025-05-19 18:13:55');
INSERT INTO `permissions` VALUES (37,'remove role','web','2025-05-19 18:13:55','2025-05-19 18:13:55');
INSERT INTO `permissions` VALUES (38,'assign permission','web','2025-05-19 18:13:55','2025-05-19 18:13:55');
INSERT INTO `permissions` VALUES (39,'remove permission','web','2025-05-19 18:13:55','2025-05-19 18:13:55');
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
INSERT INTO `personal_access_tokens` VALUES (30,'App\\Models\\User',1,'auth_token','d7ce8a3218e59eacb94497c65ce9fe08f445b2faf641f9cdea6814702c820386','[\"*\"]','2025-05-20 08:16:45',NULL,'2025-05-20 08:16:07','2025-05-20 08:16:45');
INSERT INTO `personal_access_tokens` VALUES (31,'App\\Models\\User',1,'auth_token','43670f95df2d2765004db93c5e54c91a9b9adf0da303b2d3ed87fb6ab6419e20','[\"*\"]','2025-05-20 08:22:27',NULL,'2025-05-20 08:17:30','2025-05-20 08:22:27');
INSERT INTO `personal_access_tokens` VALUES (32,'App\\Models\\User',1,'auth_token','f0a5b4c5d387b05914db6c3cce5d63c439810232e0b03050c23722fbf40bdcc7','[\"*\"]','2025-05-20 08:21:59',NULL,'2025-05-20 08:20:28','2025-05-20 08:21:59');
INSERT INTO `personal_access_tokens` VALUES (33,'App\\Models\\User',1,'auth_token','371acc9d41ed31a358548b5466e6d35ecf1b26f1fb0cfebe157713fb6424be86','[\"*\"]','2025-05-20 08:31:49',NULL,'2025-05-20 08:25:52','2025-05-20 08:31:49');
INSERT INTO `personal_access_tokens` VALUES (34,'App\\Models\\User',1,'auth_token','22245f02738400dc38d58f10ba40a2d7f8b39352f9780fac66f1607dde3a81d2','[\"*\"]','2025-05-20 08:55:13',NULL,'2025-05-20 08:28:57','2025-05-20 08:55:13');
INSERT INTO `personal_access_tokens` VALUES (35,'App\\Models\\User',1,'auth_token','7389bddbb6bf790f05794846af35ba246a4a69e8353d64232644983efbf01211','[\"*\"]','2025-05-20 08:36:48',NULL,'2025-05-20 08:34:47','2025-05-20 08:36:48');
INSERT INTO `personal_access_tokens` VALUES (36,'App\\Models\\User',1,'auth_token','1fe9275d75c6d26821fdd194d1fc945ca347f6cbc40b82fad36c774997887447','[\"*\"]','2025-05-20 08:38:03',NULL,'2025-05-20 08:37:24','2025-05-20 08:38:03');
INSERT INTO `personal_access_tokens` VALUES (37,'App\\Models\\User',1,'auth_token','815aefbd5cadcf7d23a4e282f70060f197d97d0ba7ed8da2bf7450f8b6af0e49','[\"*\"]','2025-05-20 08:55:12',NULL,'2025-05-20 08:42:47','2025-05-20 08:55:12');
INSERT INTO `personal_access_tokens` VALUES (38,'App\\Models\\User',1,'auth_token','439d8eded9d06fb4a25fc219d2b9f83a0c30fe1c259cedef26ac8116940a77b1','[\"*\"]','2025-05-20 08:53:59',NULL,'2025-05-20 08:44:36','2025-05-20 08:53:59');
INSERT INTO `personal_access_tokens` VALUES (39,'App\\Models\\User',1,'auth_token','318904fa9e1f5cd243f3c6b675adb747441c6d77f48444f167760855560298eb','[\"*\"]',NULL,NULL,'2025-05-20 08:46:51','2025-05-20 08:46:51');
INSERT INTO `personal_access_tokens` VALUES (40,'App\\Models\\User',1,'auth_token','cc9228951c982f31f3362342e96891639ae65e8d674571e814180d8623635904','[\"*\"]',NULL,NULL,'2025-05-20 08:48:52','2025-05-20 08:48:52');
INSERT INTO `personal_access_tokens` VALUES (41,'App\\Models\\User',1,'auth_token','42fc4a8385d055b1b3acb6f76b81efc2df4e0773e048e3676dd103fa1e4a3cbe','[\"*\"]','2025-05-20 11:36:48',NULL,'2025-05-20 11:35:50','2025-05-20 11:36:48');
INSERT INTO `personal_access_tokens` VALUES (42,'App\\Models\\User',1,'auth_token','f229cd26e76ce4a66f788f76824e8c137ca1290f5a2e20196edb1b24a1b9e7a6','[\"*\"]','2025-05-20 13:58:04',NULL,'2025-05-20 13:56:21','2025-05-20 13:58:04');
INSERT INTO `personal_access_tokens` VALUES (43,'App\\Models\\User',1,'auth_token','d188b6a1a315ae9a7b6c2b4fa1a995c2c9f5b4650c6878447af4629915ca2e6e','[\"*\"]','2025-05-20 14:18:26',NULL,'2025-05-20 14:03:25','2025-05-20 14:18:26');
INSERT INTO `personal_access_tokens` VALUES (44,'App\\Models\\User',1,'auth_token','477122b574a75c6de3f1095bda6022e73eee437a04d32c6a24507e20f7f388fc','[\"*\"]','2025-05-20 14:37:15',NULL,'2025-05-20 14:36:25','2025-05-20 14:37:15');
INSERT INTO `personal_access_tokens` VALUES (45,'App\\Models\\User',1,'auth_token','37d9faf516831e9e545d8c58653e5f0b1a6a7975883b6de77c7a72c2448963a3','[\"*\"]','2025-05-20 14:38:01',NULL,'2025-05-20 14:37:33','2025-05-20 14:38:01');
INSERT INTO `personal_access_tokens` VALUES (46,'App\\Models\\User',1,'auth_token','06165ab4291087679dc4a978517d7a60835eff3b3f170093322ad8f3993555c0','[\"*\"]','2025-05-20 14:40:10',NULL,'2025-05-20 14:39:08','2025-05-20 14:40:10');
INSERT INTO `personal_access_tokens` VALUES (47,'App\\Models\\User',1,'auth_token','1de7f1cfe52c61699fc55cca64323dd2ae799d08de3de5a53021f5933f16f1b2','[\"*\"]','2025-05-20 14:56:18',NULL,'2025-05-20 14:43:32','2025-05-20 14:56:18');
INSERT INTO `personal_access_tokens` VALUES (48,'App\\Models\\User',1,'auth_token','5384caaab41bf4a20d0e85ee592d4b0ab2d2592e34a500f6b2c37e0dc0665ef3','[\"*\"]','2025-05-20 14:58:17',NULL,'2025-05-20 14:53:24','2025-05-20 14:58:17');
INSERT INTO `personal_access_tokens` VALUES (49,'App\\Models\\User',1,'auth_token','db13f9ba2173a6977773a031ef3bae7c69653577baada75fa7b7f2dc216db6a2','[\"*\"]','2025-05-20 16:37:59',NULL,'2025-05-20 16:36:19','2025-05-20 16:37:59');
INSERT INTO `personal_access_tokens` VALUES (50,'App\\Models\\User',1,'auth_token','41161bd05692a396c5433cc80188b5d369d8e14d2abeafb135c70c8143519bb6','[\"*\"]','2025-05-20 16:37:50',NULL,'2025-05-20 16:36:48','2025-05-20 16:37:50');
INSERT INTO `personal_access_tokens` VALUES (51,'App\\Models\\User',1,'auth_token','fae656a8552529aa4b139d4b0b1172ffe3773fccc3ecd5c593ee0297a5a06a9d','[\"*\"]','2025-05-20 16:38:41',NULL,'2025-05-20 16:37:54','2025-05-20 16:38:41');
INSERT INTO `personal_access_tokens` VALUES (52,'App\\Models\\User',1,'auth_token','6e32b66e17edb20b065d55e57b55a83767fc856cafd232bedcd084ee52e4140b','[\"*\"]','2025-05-20 16:48:40',NULL,'2025-05-20 16:38:22','2025-05-20 16:48:40');
INSERT INTO `personal_access_tokens` VALUES (53,'App\\Models\\User',1,'auth_token','aed942adf66f89b8108e06fdedfe129c913b901908eac8457f0d93da6e169b5a','[\"*\"]','2025-05-20 16:40:05',NULL,'2025-05-20 16:39:04','2025-05-20 16:40:05');
INSERT INTO `personal_access_tokens` VALUES (54,'App\\Models\\User',1,'auth_token','709e595ef0ec022357bd110971b75bbf3309372d2358d650d4d1b7f7c9cd6733','[\"*\"]','2025-05-20 16:52:28',NULL,'2025-05-20 16:52:24','2025-05-20 16:52:28');
INSERT INTO `personal_access_tokens` VALUES (55,'App\\Models\\User',1,'auth_token','8d99c98edd59234fafee008276c7b6d5e4ee2506ac99abf013a7794cba91381c','[\"*\"]','2025-05-20 17:00:03',NULL,'2025-05-20 16:58:42','2025-05-20 17:00:03');
INSERT INTO `personal_access_tokens` VALUES (56,'App\\Models\\User',1,'auth_token','3c62d34fa229bf607d4f99af915a642bffdd440fac9e95605814d679d28a2447','[\"*\"]','2025-05-20 17:00:47',NULL,'2025-05-20 17:00:28','2025-05-20 17:00:47');
INSERT INTO `personal_access_tokens` VALUES (57,'App\\Models\\User',1,'auth_token','9777b567dce813934275da927d49cecb59ec94eabeac8e2d02d2d8500c77b4af','[\"*\"]','2025-05-20 17:22:11',NULL,'2025-05-20 17:20:58','2025-05-20 17:22:11');
INSERT INTO `personal_access_tokens` VALUES (58,'App\\Models\\User',1,'auth_token','62b3abff96fc39d76bbf92d36c684ced5dfc8f735a467175a49fd92b13337912','[\"*\"]','2025-05-20 17:43:18',NULL,'2025-05-20 17:43:10','2025-05-20 17:43:18');
INSERT INTO `personal_access_tokens` VALUES (59,'App\\Models\\User',1,'auth_token','a189617b236f6839179b5d42789a146977917f67310bf7e2a6fbc1bb26a4c7a1','[\"*\"]','2025-05-20 19:19:32',NULL,'2025-05-20 19:18:40','2025-05-20 19:19:32');
INSERT INTO `personal_access_tokens` VALUES (60,'App\\Models\\User',1,'auth_token','326fb5ca9b67f1ce9198cf2c7216a4e512d144f90864cbc8bfb9f469e503ba1b','[\"*\"]','2025-05-20 19:19:58',NULL,'2025-05-20 19:19:57','2025-05-20 19:19:58');
INSERT INTO `personal_access_tokens` VALUES (61,'App\\Models\\User',1,'auth_token','4899bc340f5566a91435fd0882a601b11cf2b4666387abdc0803ebbdf61e04f5','[\"*\"]','2025-05-20 20:28:24',NULL,'2025-05-20 20:27:41','2025-05-20 20:28:24');
INSERT INTO `personal_access_tokens` VALUES (62,'App\\Models\\User',1,'auth_token','dd18de3f23657c64f39a4250c78854eaf25c23451a2c32bab1d18bd1d25f75a7','[\"*\"]','2025-05-21 09:28:16',NULL,'2025-05-21 09:27:04','2025-05-21 09:28:16');
INSERT INTO `personal_access_tokens` VALUES (63,'App\\Models\\User',1,'auth_token','448dcd202124023d966bfe5b7b97b4f6d6343663ef052d1ec03d47cd768dd8b3','[\"*\"]','2025-05-21 13:50:52',NULL,'2025-05-21 13:47:54','2025-05-21 13:50:52');
INSERT INTO `personal_access_tokens` VALUES (64,'App\\Models\\User',1,'auth_token','217187262448b25b6509d8555a74c5f056c9641cec204675df76b0804a990773','[\"*\"]','2025-05-21 20:05:17',NULL,'2025-05-21 20:04:21','2025-05-21 20:05:17');
INSERT INTO `personal_access_tokens` VALUES (65,'App\\Models\\User',1,'auth_token','ebba98b9bb02aefdda5b367ea54229ec9e38ce64b381733c7b8c50bfa23b7db4','[\"*\"]','2025-05-21 20:52:48',NULL,'2025-05-21 20:49:35','2025-05-21 20:52:48');
INSERT INTO `personal_access_tokens` VALUES (66,'App\\Models\\User',1,'auth_token','2de146459703a84f86b37668cba8b25f9e3ed4ae4b1b906375bf10e838b0541c','[\"*\"]','2025-05-21 21:54:37',NULL,'2025-05-21 21:52:17','2025-05-21 21:54:37');
INSERT INTO `personal_access_tokens` VALUES (67,'App\\Models\\User',1,'auth_token','bff66a5fb5a87d4dfafe0d149b05136fd542f633208b231c7837b9ba41988748','[\"*\"]','2025-05-21 22:09:20',NULL,'2025-05-21 21:55:10','2025-05-21 22:09:20');
INSERT INTO `personal_access_tokens` VALUES (68,'App\\Models\\User',1,'auth_token','2388e1b6c25e07e9cdf4e9c6f7bf0343b7b0a12beeff8c7651e44e2356d596a1','[\"*\"]','2025-05-21 23:11:28',NULL,'2025-05-21 21:55:56','2025-05-21 23:11:28');
INSERT INTO `personal_access_tokens` VALUES (69,'App\\Models\\User',1,'auth_token','c02c21be3b778460d2339578d1378f0d6091dfd71cb58a191356e7f888458c49','[\"*\"]','2025-05-21 23:35:02',NULL,'2025-05-21 22:09:27','2025-05-21 23:35:02');
INSERT INTO `personal_access_tokens` VALUES (70,'App\\Models\\User',1,'auth_token','25f70df0f06e7acf9c72c455f54a43286eaf94ea6469600907e9122899f16782','[\"*\"]','2025-05-21 23:11:43',NULL,'2025-05-21 22:37:42','2025-05-21 23:11:43');
INSERT INTO `personal_access_tokens` VALUES (71,'App\\Models\\User',1,'auth_token','854da6a596b191e539bb950567b253c5ddc695db01515fb31cf3cc17682c7a15','[\"*\"]','2025-05-21 23:06:54',NULL,'2025-05-21 23:02:12','2025-05-21 23:06:54');
INSERT INTO `personal_access_tokens` VALUES (72,'App\\Models\\User',1,'auth_token','30511fb8d2b66d392d727f061786b4bab256df5e56281c3696d9b7a21235fc7d','[\"*\"]','2025-05-21 23:17:30',NULL,'2025-05-21 23:12:37','2025-05-21 23:17:30');
INSERT INTO `personal_access_tokens` VALUES (73,'App\\Models\\User',1,'auth_token','b2e438541e2f5010b698c960649b6ee9bfda760ba5dd369875c841bc8399f5b2','[\"*\"]','2025-05-22 02:10:17',NULL,'2025-05-22 02:10:00','2025-05-22 02:10:17');
INSERT INTO `personal_access_tokens` VALUES (74,'App\\Models\\User',1,'auth_token','bc0309f8606fc993f124baed730044d94509cae1d43ea31a4d9366ffe5e33c0e','[\"*\"]','2025-05-22 02:11:01',NULL,'2025-05-22 02:10:46','2025-05-22 02:11:01');
INSERT INTO `personal_access_tokens` VALUES (75,'App\\Models\\User',1,'auth_token','8fd0eabba1d44127bbbacef98a044131a232ac52389c6e94e6b21f4da017ec86','[\"*\"]','2025-05-22 02:13:28',NULL,'2025-05-22 02:11:18','2025-05-22 02:13:28');
INSERT INTO `personal_access_tokens` VALUES (76,'App\\Models\\User',1,'auth_token','8342e92e0a43f9cd1b75b971611bc24211a7163d49105abbc84f9917f803506f','[\"*\"]','2025-05-22 02:21:52',NULL,'2025-05-22 02:13:55','2025-05-22 02:21:52');
INSERT INTO `personal_access_tokens` VALUES (77,'App\\Models\\User',1,'auth_token','f884525f14f4c91da94b1c7862de0121d4cafd61928b87992244628fc687588f','[\"*\"]','2025-05-22 02:22:21',NULL,'2025-05-22 02:22:08','2025-05-22 02:22:21');
INSERT INTO `personal_access_tokens` VALUES (78,'App\\Models\\User',1,'auth_token','868a4959462bb6bfc7048bf15e766699dc048564f328f76d2e474c708dedf4a7','[\"*\"]','2025-05-22 10:51:26',NULL,'2025-05-22 09:52:19','2025-05-22 10:51:26');
INSERT INTO `personal_access_tokens` VALUES (79,'App\\Models\\User',1,'auth_token','b2ceb833482228c2b29befb287987d9756dbcd38458816c662a41690b9e5f2d4','[\"*\"]','2025-05-22 13:08:37',NULL,'2025-05-22 13:06:26','2025-05-22 13:08:37');
INSERT INTO `personal_access_tokens` VALUES (80,'App\\Models\\User',1,'auth_token','6763827e16a780f66c17a4de27fb6aaa0b64974e58f972e3ad26812b5eb5c8b0','[\"*\"]','2025-05-22 22:36:50',NULL,'2025-05-22 22:36:48','2025-05-22 22:36:50');
INSERT INTO `personal_access_tokens` VALUES (81,'App\\Models\\User',1,'auth_token','a3f63576796efad5dbd0ced6e85d1db4661d93928acf2adc1aaf66356a245763','[\"*\"]','2025-05-22 23:16:41',NULL,'2025-05-22 22:37:43','2025-05-22 23:16:41');
INSERT INTO `personal_access_tokens` VALUES (82,'App\\Models\\User',1,'auth_token','f9b2c099122e3ce6909c43068e7e9050e9958cf661ed10de55b8122832ab653e','[\"*\"]','2025-05-22 22:58:44',NULL,'2025-05-22 22:44:29','2025-05-22 22:58:44');
INSERT INTO `personal_access_tokens` VALUES (83,'App\\Models\\User',1,'auth_token','2018bc4e393171acf7483d004f3575fdedba0cb7c96e46cee286982f0ca797e6','[\"*\"]','2025-05-22 23:06:22',NULL,'2025-05-22 23:02:54','2025-05-22 23:06:22');
INSERT INTO `personal_access_tokens` VALUES (84,'App\\Models\\User',1,'auth_token','a15151e316d16f5887441604a808f6e8ec398784aa9267409e859cccf1f5051e','[\"*\"]','2025-05-22 23:24:16',NULL,'2025-05-22 23:16:55','2025-05-22 23:24:16');
INSERT INTO `personal_access_tokens` VALUES (85,'App\\Models\\User',1,'auth_token','b6d2bfeb6908257929ffb229fb60c6415211ec5f77017f2ba2437a25bf0a5439','[\"*\"]','2025-05-23 00:14:03',NULL,'2025-05-23 00:01:52','2025-05-23 00:14:03');
INSERT INTO `personal_access_tokens` VALUES (86,'App\\Models\\User',1,'auth_token','71a076f528b8b896771509744f4d21db98e19900de56f4092ce665fc131aa02c','[\"*\"]','2025-05-23 00:48:01',NULL,'2025-05-23 00:47:26','2025-05-23 00:48:01');
INSERT INTO `personal_access_tokens` VALUES (87,'App\\Models\\User',1,'auth_token','b338c3805a2e11e580eef97053df6525ec013cee80857a1ebf55548cbf8a9d76','[\"*\"]','2025-05-23 10:06:43',NULL,'2025-05-23 10:06:00','2025-05-23 10:06:43');
INSERT INTO `personal_access_tokens` VALUES (88,'App\\Models\\User',1,'auth_token','92521489604de20ced4c9b73e3cf11bffb97a2dd8fc0bc25a09bd5d221f25de3','[\"*\"]','2025-05-24 09:49:12',NULL,'2025-05-24 09:48:17','2025-05-24 09:49:12');
INSERT INTO `personal_access_tokens` VALUES (89,'App\\Models\\User',1,'auth_token','1034278f5444c5de5258baa1a316d291b8fd89603fa13bb7c913255b674366c8','[\"*\"]','2025-05-24 16:08:09',NULL,'2025-05-24 16:07:36','2025-05-24 16:08:09');
INSERT INTO `personal_access_tokens` VALUES (90,'App\\Models\\User',1,'auth_token','80b7ca5bf04cb7a361a3bc7e1f0e6d126bec4a38a4058b4fe221189dbee5ce5a','[\"*\"]','2025-05-26 14:36:11',NULL,'2025-05-26 14:35:24','2025-05-26 14:36:11');
INSERT INTO `personal_access_tokens` VALUES (91,'App\\Models\\User',1,'auth_token','34e617b36c450e5ad461e11205e181fc188e7ea7920222dfc24cb29f71abbc93','[\"*\"]','2025-05-26 15:21:22',NULL,'2025-05-26 14:37:55','2025-05-26 15:21:22');
INSERT INTO `personal_access_tokens` VALUES (92,'App\\Models\\User',1,'auth_token','19502b2822d1b576001f2a72cc399194bf047e6602e944749f04199111aada0e','[\"*\"]','2025-05-28 11:55:31',NULL,'2025-05-28 11:54:34','2025-05-28 11:55:31');
UNLOCK TABLES;

--
-- Table structure for table `role_has_permissions`
--

DROP TABLE IF EXISTS `role_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_has_permissions`
--

LOCK TABLES `role_has_permissions` WRITE;
INSERT INTO `role_has_permissions` VALUES (1,1);
INSERT INTO `role_has_permissions` VALUES (2,1);
INSERT INTO `role_has_permissions` VALUES (3,1);
INSERT INTO `role_has_permissions` VALUES (4,1);
INSERT INTO `role_has_permissions` VALUES (5,1);
INSERT INTO `role_has_permissions` VALUES (6,1);
INSERT INTO `role_has_permissions` VALUES (7,1);
INSERT INTO `role_has_permissions` VALUES (8,1);
INSERT INTO `role_has_permissions` VALUES (9,1);
INSERT INTO `role_has_permissions` VALUES (10,1);
INSERT INTO `role_has_permissions` VALUES (11,1);
INSERT INTO `role_has_permissions` VALUES (12,1);
INSERT INTO `role_has_permissions` VALUES (13,1);
INSERT INTO `role_has_permissions` VALUES (14,1);
INSERT INTO `role_has_permissions` VALUES (15,1);
INSERT INTO `role_has_permissions` VALUES (16,1);
INSERT INTO `role_has_permissions` VALUES (17,1);
INSERT INTO `role_has_permissions` VALUES (18,1);
INSERT INTO `role_has_permissions` VALUES (19,1);
INSERT INTO `role_has_permissions` VALUES (20,1);
INSERT INTO `role_has_permissions` VALUES (21,1);
INSERT INTO `role_has_permissions` VALUES (22,1);
INSERT INTO `role_has_permissions` VALUES (23,1);
INSERT INTO `role_has_permissions` VALUES (24,1);
INSERT INTO `role_has_permissions` VALUES (25,1);
INSERT INTO `role_has_permissions` VALUES (26,1);
INSERT INTO `role_has_permissions` VALUES (27,1);
INSERT INTO `role_has_permissions` VALUES (28,1);
INSERT INTO `role_has_permissions` VALUES (29,1);
INSERT INTO `role_has_permissions` VALUES (30,1);
INSERT INTO `role_has_permissions` VALUES (31,1);
INSERT INTO `role_has_permissions` VALUES (32,1);
INSERT INTO `role_has_permissions` VALUES (33,1);
INSERT INTO `role_has_permissions` VALUES (34,1);
INSERT INTO `role_has_permissions` VALUES (35,1);
INSERT INTO `role_has_permissions` VALUES (36,1);
INSERT INTO `role_has_permissions` VALUES (37,1);
INSERT INTO `role_has_permissions` VALUES (38,1);
INSERT INTO `role_has_permissions` VALUES (39,1);
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
INSERT INTO `roles` VALUES (1,'admin','web','2025-05-19 18:13:55','2025-05-19 18:13:55');
UNLOCK TABLES;

--
-- Table structure for table `study_planes`
--

DROP TABLE IF EXISTS `study_planes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `study_planes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name_en` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_ar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `academic_id` bigint unsigned NOT NULL,
  `academicLevel` enum('1','2','3','4') COLLATE utf8mb4_unicode_ci NOT NULL,
  `expected_students` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `study_planes_academic_id_foreign` (`academic_id`),
  CONSTRAINT `study_planes_academic_id_foreign` FOREIGN KEY (`academic_id`) REFERENCES `academics` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `study_planes`
--

LOCK TABLES `study_planes` WRITE;
INSERT INTO `study_planes` VALUES (19,'Regulation 2022 - Level 1 -AI','لائحه ٢٠٢٢- المستوي الاول -ذكاء اصطناعي',2,'1',50);
INSERT INTO `study_planes` VALUES (20,'Regulation 2022 - level 2 - AI','لائحه ٢٠٢٢-  المستوي الثاني - ذكاء اصطناعي',2,'2',100);
UNLOCK TABLES;

--
-- Table structure for table `term_items`
--

DROP TABLE IF EXISTS `term_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `term_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_ar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `academic_id` bigint unsigned NOT NULL,
  `academicLevel` enum('1','2','3','4') COLLATE utf8mb4_unicode_ci NOT NULL,
  `lecturer_id` bigint unsigned NOT NULL,
  `spaces_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `term_items_academic_id_foreign` (`academic_id`),
  KEY `term_items_lecturer_id_foreign` (`lecturer_id`),
  KEY `term_items_spaces_id_foreign` (`spaces_id`),
  CONSTRAINT `term_items_academic_id_foreign` FOREIGN KEY (`academic_id`) REFERENCES `academics` (`id`) ON DELETE CASCADE,
  CONSTRAINT `term_items_lecturer_id_foreign` FOREIGN KEY (`lecturer_id`) REFERENCES `lecturers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `term_items_spaces_id_foreign` FOREIGN KEY (`spaces_id`) REFERENCES `acadmic_spaces` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `term_items`
--

LOCK TABLES `term_items` WRITE;
UNLOCK TABLES;

--
-- Table structure for table `term_plans`
--

DROP TABLE IF EXISTS `term_plans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `term_plans` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `term_plans`
--

LOCK TABLES `term_plans` WRITE;
UNLOCK TABLES;

--
-- Table structure for table `time_preferences`
--

DROP TABLE IF EXISTS `time_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `time_preferences` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `timeable_id` bigint unsigned NOT NULL,
  `timeable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `day` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `startTime` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `endTime` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1074 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time_preferences`
--

LOCK TABLES `time_preferences` WRITE;
INSERT INTO `time_preferences` VALUES (14,1,'App\\Models\\Hall','tuesday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (15,1,'App\\Models\\Hall','tuesday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (16,1,'App\\Models\\Hall','wednesday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (17,1,'App\\Models\\Hall','friday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (18,1,'App\\Models\\Hall','saturday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (19,1,'App\\Models\\Hall','sunday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (20,1,'App\\Models\\Hall','sunday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (21,1,'App\\Models\\Hall','sunday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (22,1,'App\\Models\\Hall','sunday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (23,1,'App\\Models\\Hall','monday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (24,1,'App\\Models\\Hall','thursday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (25,1,'App\\Models\\Hall','wednesday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (26,1,'App\\Models\\Hall','thursday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (27,1,'App\\Models\\Hall','wednesday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (28,2,'App\\Models\\Hall','friday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (29,2,'App\\Models\\Hall','sunday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (30,2,'App\\Models\\Hall','sunday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (31,2,'App\\Models\\Hall','tuesday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (32,2,'App\\Models\\Hall','wednesday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (33,2,'App\\Models\\Hall','tuesday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (34,2,'App\\Models\\Hall','monday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (35,2,'App\\Models\\Hall','sunday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (36,2,'App\\Models\\Hall','saturday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (37,2,'App\\Models\\Hall','sunday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (38,2,'App\\Models\\Hall','saturday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (39,2,'App\\Models\\Hall','monday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (40,2,'App\\Models\\Hall','wednesday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (41,2,'App\\Models\\Hall','thursday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (42,2,'App\\Models\\Hall','wednesday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (43,2,'App\\Models\\Hall','monday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (44,2,'App\\Models\\Hall','wednesday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (45,2,'App\\Models\\Hall','thursday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (46,2,'App\\Models\\Hall','thursday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (132,6,'App\\Models\\Lecturer','sunday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (133,6,'App\\Models\\Lecturer','sunday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (134,6,'App\\Models\\Lecturer','sunday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (135,6,'App\\Models\\Lecturer','sunday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (136,6,'App\\Models\\Lecturer','sunday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (137,6,'App\\Models\\Lecturer','monday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (138,6,'App\\Models\\Lecturer','tuesday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (139,6,'App\\Models\\Lecturer','monday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (140,6,'App\\Models\\Lecturer','monday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (141,6,'App\\Models\\Lecturer','monday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (142,6,'App\\Models\\Lecturer','monday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (143,6,'App\\Models\\Lecturer','tuesday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (144,6,'App\\Models\\Lecturer','tuesday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (145,6,'App\\Models\\Lecturer','tuesday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (146,6,'App\\Models\\Lecturer','tuesday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (147,6,'App\\Models\\Lecturer','wednesday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (148,6,'App\\Models\\Lecturer','wednesday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (149,6,'App\\Models\\Lecturer','wednesday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (150,6,'App\\Models\\Lecturer','wednesday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (151,6,'App\\Models\\Lecturer','wednesday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (152,6,'App\\Models\\Lecturer','thursday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (153,6,'App\\Models\\Lecturer','thursday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (154,6,'App\\Models\\Lecturer','thursday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (155,6,'App\\Models\\Lecturer','thursday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (156,6,'App\\Models\\Lecturer','thursday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (157,7,'App\\Models\\Lecturer','sunday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (158,7,'App\\Models\\Lecturer','sunday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (159,7,'App\\Models\\Lecturer','sunday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (160,7,'App\\Models\\Lecturer','sunday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (161,7,'App\\Models\\Lecturer','sunday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (162,7,'App\\Models\\Lecturer','monday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (163,7,'App\\Models\\Lecturer','monday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (164,7,'App\\Models\\Lecturer','monday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (165,7,'App\\Models\\Lecturer','monday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (166,7,'App\\Models\\Lecturer','monday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (167,7,'App\\Models\\Lecturer','tuesday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (168,7,'App\\Models\\Lecturer','tuesday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (169,7,'App\\Models\\Lecturer','tuesday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (170,7,'App\\Models\\Lecturer','tuesday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (171,7,'App\\Models\\Lecturer','tuesday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (172,7,'App\\Models\\Lecturer','wednesday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (173,7,'App\\Models\\Lecturer','wednesday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (174,7,'App\\Models\\Lecturer','wednesday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (175,7,'App\\Models\\Lecturer','wednesday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (176,7,'App\\Models\\Lecturer','wednesday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (177,7,'App\\Models\\Lecturer','thursday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (178,7,'App\\Models\\Lecturer','thursday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (179,7,'App\\Models\\Lecturer','thursday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (180,7,'App\\Models\\Lecturer','thursday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (181,7,'App\\Models\\Lecturer','thursday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (182,8,'App\\Models\\Lecturer','sunday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (183,8,'App\\Models\\Lecturer','sunday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (184,8,'App\\Models\\Lecturer','sunday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (185,8,'App\\Models\\Lecturer','sunday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (186,8,'App\\Models\\Lecturer','sunday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (187,8,'App\\Models\\Lecturer','monday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (188,8,'App\\Models\\Lecturer','monday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (189,8,'App\\Models\\Lecturer','monday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (190,8,'App\\Models\\Lecturer','monday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (191,8,'App\\Models\\Lecturer','monday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (192,8,'App\\Models\\Lecturer','tuesday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (193,8,'App\\Models\\Lecturer','tuesday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (194,8,'App\\Models\\Lecturer','tuesday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (195,8,'App\\Models\\Lecturer','tuesday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (196,8,'App\\Models\\Lecturer','tuesday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (197,8,'App\\Models\\Lecturer','wednesday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (198,8,'App\\Models\\Lecturer','wednesday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (199,8,'App\\Models\\Lecturer','wednesday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (200,8,'App\\Models\\Lecturer','wednesday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (201,8,'App\\Models\\Lecturer','wednesday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (202,8,'App\\Models\\Lecturer','thursday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (203,8,'App\\Models\\Lecturer','thursday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (204,8,'App\\Models\\Lecturer','thursday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (205,8,'App\\Models\\Lecturer','thursday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (206,8,'App\\Models\\Lecturer','thursday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (232,10,'App\\Models\\Lecturer','sunday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (233,10,'App\\Models\\Lecturer','monday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (234,10,'App\\Models\\Lecturer','tuesday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (235,10,'App\\Models\\Lecturer','wednesday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (236,10,'App\\Models\\Lecturer','thursday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (237,10,'App\\Models\\Lecturer','sunday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (238,10,'App\\Models\\Lecturer','monday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (239,10,'App\\Models\\Lecturer','tuesday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (240,10,'App\\Models\\Lecturer','wednesday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (241,10,'App\\Models\\Lecturer','thursday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (242,10,'App\\Models\\Lecturer','sunday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (243,10,'App\\Models\\Lecturer','monday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (244,10,'App\\Models\\Lecturer','tuesday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (245,10,'App\\Models\\Lecturer','wednesday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (246,10,'App\\Models\\Lecturer','thursday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (247,10,'App\\Models\\Lecturer','sunday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (248,10,'App\\Models\\Lecturer','monday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (249,10,'App\\Models\\Lecturer','tuesday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (250,10,'App\\Models\\Lecturer','wednesday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (251,10,'App\\Models\\Lecturer','thursday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (252,10,'App\\Models\\Lecturer','sunday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (253,10,'App\\Models\\Lecturer','tuesday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (254,10,'App\\Models\\Lecturer','monday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (255,10,'App\\Models\\Lecturer','wednesday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (256,10,'App\\Models\\Lecturer','thursday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (282,11,'App\\Models\\Lecturer','sunday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (283,11,'App\\Models\\Lecturer','monday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (284,11,'App\\Models\\Lecturer','tuesday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (285,11,'App\\Models\\Lecturer','wednesday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (286,11,'App\\Models\\Lecturer','thursday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (287,11,'App\\Models\\Lecturer','sunday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (288,11,'App\\Models\\Lecturer','monday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (289,11,'App\\Models\\Lecturer','tuesday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (290,11,'App\\Models\\Lecturer','wednesday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (291,11,'App\\Models\\Lecturer','thursday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (292,11,'App\\Models\\Lecturer','sunday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (293,11,'App\\Models\\Lecturer','monday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (294,11,'App\\Models\\Lecturer','tuesday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (295,11,'App\\Models\\Lecturer','wednesday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (296,11,'App\\Models\\Lecturer','thursday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (297,11,'App\\Models\\Lecturer','sunday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (298,11,'App\\Models\\Lecturer','monday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (299,11,'App\\Models\\Lecturer','tuesday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (300,11,'App\\Models\\Lecturer','wednesday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (301,11,'App\\Models\\Lecturer','thursday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (302,11,'App\\Models\\Lecturer','sunday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (303,11,'App\\Models\\Lecturer','monday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (304,11,'App\\Models\\Lecturer','tuesday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (305,11,'App\\Models\\Lecturer','wednesday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (306,11,'App\\Models\\Lecturer','thursday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (307,3,'App\\Models\\Lecturer','monday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (308,3,'App\\Models\\Lecturer','sunday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (309,3,'App\\Models\\Lecturer','tuesday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (310,3,'App\\Models\\Lecturer','wednesday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (311,3,'App\\Models\\Lecturer','wednesday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (312,3,'App\\Models\\Lecturer','monday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (313,3,'App\\Models\\Lecturer','sunday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (314,3,'App\\Models\\Lecturer','tuesday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (315,3,'App\\Models\\Lecturer','sunday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (316,3,'App\\Models\\Lecturer','sunday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (317,3,'App\\Models\\Lecturer','monday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (318,3,'App\\Models\\Lecturer','tuesday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (319,3,'App\\Models\\Lecturer','wednesday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (320,3,'App\\Models\\Lecturer','wednesday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (321,3,'App\\Models\\Lecturer','tuesday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (322,3,'App\\Models\\Lecturer','monday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (360,5,'App\\Models\\Lecturer','monday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (361,5,'App\\Models\\Lecturer','sunday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (362,5,'App\\Models\\Lecturer','sunday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (363,5,'App\\Models\\Lecturer','sunday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (364,5,'App\\Models\\Lecturer','sunday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (365,5,'App\\Models\\Lecturer','monday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (366,5,'App\\Models\\Lecturer','monday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (367,5,'App\\Models\\Lecturer','monday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (368,5,'App\\Models\\Lecturer','monday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (369,5,'App\\Models\\Lecturer','sunday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (370,5,'App\\Models\\Lecturer','tuesday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (371,5,'App\\Models\\Lecturer','wednesday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (372,5,'App\\Models\\Lecturer','tuesday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (373,5,'App\\Models\\Lecturer','tuesday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (374,5,'App\\Models\\Lecturer','tuesday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (375,5,'App\\Models\\Lecturer','tuesday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (376,5,'App\\Models\\Lecturer','wednesday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (377,5,'App\\Models\\Lecturer','wednesday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (378,5,'App\\Models\\Lecturer','wednesday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (379,5,'App\\Models\\Lecturer','wednesday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (380,5,'App\\Models\\Lecturer','thursday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (381,5,'App\\Models\\Lecturer','thursday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (382,5,'App\\Models\\Lecturer','thursday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (383,5,'App\\Models\\Lecturer','thursday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (384,5,'App\\Models\\Lecturer','thursday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (385,19,'App\\Models\\Lecturer','sunday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (386,19,'App\\Models\\Lecturer','monday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (387,19,'App\\Models\\Lecturer','tuesday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (388,19,'App\\Models\\Lecturer','wednesday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (389,19,'App\\Models\\Lecturer','thursday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (390,19,'App\\Models\\Lecturer','sunday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (391,19,'App\\Models\\Lecturer','monday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (392,19,'App\\Models\\Lecturer','tuesday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (393,19,'App\\Models\\Lecturer','wednesday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (394,19,'App\\Models\\Lecturer','thursday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (395,19,'App\\Models\\Lecturer','sunday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (396,19,'App\\Models\\Lecturer','monday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (397,19,'App\\Models\\Lecturer','wednesday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (398,19,'App\\Models\\Lecturer','tuesday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (399,19,'App\\Models\\Lecturer','thursday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (400,19,'App\\Models\\Lecturer','sunday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (401,19,'App\\Models\\Lecturer','monday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (402,19,'App\\Models\\Lecturer','tuesday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (403,19,'App\\Models\\Lecturer','wednesday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (404,19,'App\\Models\\Lecturer','thursday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (405,19,'App\\Models\\Lecturer','sunday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (406,19,'App\\Models\\Lecturer','monday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (407,19,'App\\Models\\Lecturer','tuesday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (408,19,'App\\Models\\Lecturer','wednesday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (409,19,'App\\Models\\Lecturer','thursday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (410,20,'App\\Models\\Lecturer','sunday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (411,20,'App\\Models\\Lecturer','monday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (412,20,'App\\Models\\Lecturer','tuesday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (413,20,'App\\Models\\Lecturer','wednesday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (414,20,'App\\Models\\Lecturer','thursday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (415,20,'App\\Models\\Lecturer','sunday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (416,20,'App\\Models\\Lecturer','monday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (417,20,'App\\Models\\Lecturer','tuesday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (418,20,'App\\Models\\Lecturer','wednesday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (419,20,'App\\Models\\Lecturer','thursday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (420,20,'App\\Models\\Lecturer','sunday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (421,20,'App\\Models\\Lecturer','monday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (422,20,'App\\Models\\Lecturer','tuesday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (423,20,'App\\Models\\Lecturer','wednesday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (424,20,'App\\Models\\Lecturer','thursday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (425,20,'App\\Models\\Lecturer','sunday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (426,20,'App\\Models\\Lecturer','monday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (427,20,'App\\Models\\Lecturer','tuesday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (428,20,'App\\Models\\Lecturer','wednesday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (429,20,'App\\Models\\Lecturer','thursday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (430,20,'App\\Models\\Lecturer','sunday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (431,20,'App\\Models\\Lecturer','monday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (432,20,'App\\Models\\Lecturer','tuesday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (433,20,'App\\Models\\Lecturer','wednesday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (434,20,'App\\Models\\Lecturer','thursday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (435,21,'App\\Models\\Lecturer','sunday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (436,21,'App\\Models\\Lecturer','monday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (437,21,'App\\Models\\Lecturer','tuesday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (438,21,'App\\Models\\Lecturer','wednesday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (439,21,'App\\Models\\Lecturer','thursday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (440,21,'App\\Models\\Lecturer','sunday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (441,21,'App\\Models\\Lecturer','monday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (442,21,'App\\Models\\Lecturer','tuesday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (443,21,'App\\Models\\Lecturer','wednesday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (444,21,'App\\Models\\Lecturer','thursday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (445,21,'App\\Models\\Lecturer','sunday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (446,21,'App\\Models\\Lecturer','monday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (447,21,'App\\Models\\Lecturer','tuesday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (448,21,'App\\Models\\Lecturer','wednesday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (449,21,'App\\Models\\Lecturer','thursday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (450,21,'App\\Models\\Lecturer','sunday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (451,21,'App\\Models\\Lecturer','monday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (452,21,'App\\Models\\Lecturer','tuesday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (453,21,'App\\Models\\Lecturer','wednesday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (454,21,'App\\Models\\Lecturer','thursday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (455,21,'App\\Models\\Lecturer','sunday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (456,21,'App\\Models\\Lecturer','monday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (457,21,'App\\Models\\Lecturer','tuesday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (458,21,'App\\Models\\Lecturer','wednesday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (459,21,'App\\Models\\Lecturer','thursday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (485,23,'App\\Models\\Lecturer','monday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (486,23,'App\\Models\\Lecturer','sunday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (487,23,'App\\Models\\Lecturer','tuesday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (488,23,'App\\Models\\Lecturer','wednesday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (489,23,'App\\Models\\Lecturer','thursday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (490,23,'App\\Models\\Lecturer','sunday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (491,23,'App\\Models\\Lecturer','monday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (492,23,'App\\Models\\Lecturer','tuesday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (493,23,'App\\Models\\Lecturer','wednesday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (494,23,'App\\Models\\Lecturer','thursday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (495,23,'App\\Models\\Lecturer','sunday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (496,23,'App\\Models\\Lecturer','monday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (497,23,'App\\Models\\Lecturer','tuesday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (498,23,'App\\Models\\Lecturer','wednesday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (499,23,'App\\Models\\Lecturer','thursday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (500,23,'App\\Models\\Lecturer','sunday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (501,23,'App\\Models\\Lecturer','monday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (502,23,'App\\Models\\Lecturer','wednesday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (503,23,'App\\Models\\Lecturer','tuesday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (504,23,'App\\Models\\Lecturer','thursday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (505,23,'App\\Models\\Lecturer','sunday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (506,23,'App\\Models\\Lecturer','monday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (507,23,'App\\Models\\Lecturer','tuesday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (508,23,'App\\Models\\Lecturer','wednesday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (509,23,'App\\Models\\Lecturer','thursday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (510,9,'App\\Models\\Lecturer','sunday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (511,9,'App\\Models\\Lecturer','monday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (512,9,'App\\Models\\Lecturer','tuesday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (513,9,'App\\Models\\Lecturer','wednesday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (514,9,'App\\Models\\Lecturer','thursday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (515,9,'App\\Models\\Lecturer','sunday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (516,9,'App\\Models\\Lecturer','monday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (517,9,'App\\Models\\Lecturer','tuesday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (518,9,'App\\Models\\Lecturer','wednesday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (519,9,'App\\Models\\Lecturer','thursday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (520,9,'App\\Models\\Lecturer','sunday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (521,9,'App\\Models\\Lecturer','monday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (522,9,'App\\Models\\Lecturer','tuesday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (523,9,'App\\Models\\Lecturer','wednesday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (524,9,'App\\Models\\Lecturer','thursday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (525,9,'App\\Models\\Lecturer','sunday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (526,9,'App\\Models\\Lecturer','monday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (527,9,'App\\Models\\Lecturer','tuesday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (528,9,'App\\Models\\Lecturer','thursday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (529,9,'App\\Models\\Lecturer','wednesday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (530,9,'App\\Models\\Lecturer','sunday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (531,9,'App\\Models\\Lecturer','monday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (532,9,'App\\Models\\Lecturer','tuesday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (533,9,'App\\Models\\Lecturer','wednesday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (534,9,'App\\Models\\Lecturer','thursday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (535,24,'App\\Models\\Lecturer','sunday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (536,24,'App\\Models\\Lecturer','monday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (537,24,'App\\Models\\Lecturer','tuesday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (538,24,'App\\Models\\Lecturer','wednesday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (539,24,'App\\Models\\Lecturer','thursday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (540,24,'App\\Models\\Lecturer','sunday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (541,24,'App\\Models\\Lecturer','monday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (542,24,'App\\Models\\Lecturer','tuesday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (543,24,'App\\Models\\Lecturer','wednesday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (544,24,'App\\Models\\Lecturer','thursday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (545,24,'App\\Models\\Lecturer','sunday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (546,24,'App\\Models\\Lecturer','monday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (547,24,'App\\Models\\Lecturer','tuesday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (548,24,'App\\Models\\Lecturer','wednesday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (549,24,'App\\Models\\Lecturer','thursday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (550,24,'App\\Models\\Lecturer','sunday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (551,24,'App\\Models\\Lecturer','monday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (552,24,'App\\Models\\Lecturer','tuesday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (553,24,'App\\Models\\Lecturer','wednesday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (554,24,'App\\Models\\Lecturer','thursday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (555,24,'App\\Models\\Lecturer','monday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (556,24,'App\\Models\\Lecturer','sunday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (557,24,'App\\Models\\Lecturer','wednesday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (558,24,'App\\Models\\Lecturer','tuesday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (559,24,'App\\Models\\Lecturer','thursday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (560,3,'App\\Models\\Lap','saturday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (561,3,'App\\Models\\Lap','saturday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (562,3,'App\\Models\\Lap','saturday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (563,3,'App\\Models\\Lap','saturday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (564,3,'App\\Models\\Lap','sunday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (565,3,'App\\Models\\Lap','sunday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (566,3,'App\\Models\\Lap','monday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (567,3,'App\\Models\\Lap','monday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (568,3,'App\\Models\\Lap','tuesday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (569,3,'App\\Models\\Lap','tuesday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (570,3,'App\\Models\\Lap','wednesday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (571,3,'App\\Models\\Lap','wednesday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (572,3,'App\\Models\\Lap','wednesday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (573,3,'App\\Models\\Lap','tuesday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (574,3,'App\\Models\\Lap','sunday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (575,3,'App\\Models\\Lap','monday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (576,3,'App\\Models\\Lap','sunday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (577,3,'App\\Models\\Lap','monday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (578,3,'App\\Models\\Lap','tuesday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (579,3,'App\\Models\\Lap','wednesday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (580,4,'App\\Models\\Lap','wednesday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (581,4,'App\\Models\\Lap','tuesday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (582,4,'App\\Models\\Lap','monday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (583,4,'App\\Models\\Lap','monday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (584,4,'App\\Models\\Lap','wednesday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (585,4,'App\\Models\\Lap','wednesday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (586,4,'App\\Models\\Lap','tuesday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (587,4,'App\\Models\\Lap','tuesday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (588,4,'App\\Models\\Lap','monday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (589,4,'App\\Models\\Lap','tuesday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (590,4,'App\\Models\\Lap','monday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (591,4,'App\\Models\\Lap','wednesday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (592,5,'App\\Models\\Lap','monday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (593,5,'App\\Models\\Lap','monday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (594,5,'App\\Models\\Lap','monday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (595,5,'App\\Models\\Lap','tuesday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (596,5,'App\\Models\\Lap','monday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (597,5,'App\\Models\\Lap','wednesday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (598,5,'App\\Models\\Lap','tuesday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (599,5,'App\\Models\\Lap','wednesday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (600,5,'App\\Models\\Lap','wednesday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (601,5,'App\\Models\\Lap','tuesday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (602,5,'App\\Models\\Lap','wednesday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (603,5,'App\\Models\\Lap','tuesday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (604,1,'App\\Models\\Lap','monday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (605,1,'App\\Models\\Lap','wednesday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (606,1,'App\\Models\\Lap','sunday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (607,1,'App\\Models\\Lap','sunday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (608,1,'App\\Models\\Lap','tuesday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (609,1,'App\\Models\\Lap','sunday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (610,1,'App\\Models\\Lap','tuesday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (611,1,'App\\Models\\Lap','monday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (612,1,'App\\Models\\Lap','sunday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (613,1,'App\\Models\\Lap','tuesday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (614,2,'App\\Models\\Lap','wednesday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (615,2,'App\\Models\\Lap','wednesday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (616,2,'App\\Models\\Lap','wednesday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (617,2,'App\\Models\\Lap','wednesday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (618,2,'App\\Models\\Lap','sunday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (619,2,'App\\Models\\Lap','tuesday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (620,2,'App\\Models\\Lap','monday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (621,2,'App\\Models\\Lap','saturday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (622,2,'App\\Models\\Lap','friday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (623,2,'App\\Models\\Lap','friday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (624,2,'App\\Models\\Lap','sunday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (625,2,'App\\Models\\Lap','tuesday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (626,2,'App\\Models\\Lap','wednesday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (647,26,'App\\Models\\Lecturer','sunday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (648,26,'App\\Models\\Lecturer','monday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (649,26,'App\\Models\\Lecturer','tuesday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (650,26,'App\\Models\\Lecturer','wednesday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (651,26,'App\\Models\\Lecturer','thursday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (652,26,'App\\Models\\Lecturer','thursday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (653,26,'App\\Models\\Lecturer','wednesday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (654,26,'App\\Models\\Lecturer','monday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (655,26,'App\\Models\\Lecturer','tuesday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (656,26,'App\\Models\\Lecturer','sunday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (657,26,'App\\Models\\Lecturer','sunday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (658,26,'App\\Models\\Lecturer','monday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (659,26,'App\\Models\\Lecturer','tuesday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (660,26,'App\\Models\\Lecturer','wednesday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (661,26,'App\\Models\\Lecturer','thursday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (662,26,'App\\Models\\Lecturer','thursday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (663,26,'App\\Models\\Lecturer','wednesday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (664,26,'App\\Models\\Lecturer','tuesday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (665,26,'App\\Models\\Lecturer','sunday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (666,26,'App\\Models\\Lecturer','monday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (667,26,'App\\Models\\Lecturer','sunday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (668,26,'App\\Models\\Lecturer','monday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (669,26,'App\\Models\\Lecturer','tuesday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (670,26,'App\\Models\\Lecturer','wednesday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (671,26,'App\\Models\\Lecturer','thursday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (672,27,'App\\Models\\Lecturer','sunday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (673,27,'App\\Models\\Lecturer','monday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (674,27,'App\\Models\\Lecturer','tuesday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (675,27,'App\\Models\\Lecturer','wednesday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (676,27,'App\\Models\\Lecturer','thursday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (677,27,'App\\Models\\Lecturer','sunday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (678,27,'App\\Models\\Lecturer','monday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (679,27,'App\\Models\\Lecturer','tuesday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (680,27,'App\\Models\\Lecturer','wednesday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (681,27,'App\\Models\\Lecturer','thursday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (682,27,'App\\Models\\Lecturer','thursday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (683,27,'App\\Models\\Lecturer','wednesday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (684,27,'App\\Models\\Lecturer','tuesday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (685,27,'App\\Models\\Lecturer','monday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (686,27,'App\\Models\\Lecturer','sunday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (687,27,'App\\Models\\Lecturer','sunday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (688,27,'App\\Models\\Lecturer','monday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (689,27,'App\\Models\\Lecturer','tuesday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (690,27,'App\\Models\\Lecturer','wednesday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (691,27,'App\\Models\\Lecturer','thursday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (692,27,'App\\Models\\Lecturer','thursday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (693,27,'App\\Models\\Lecturer','wednesday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (694,27,'App\\Models\\Lecturer','monday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (695,27,'App\\Models\\Lecturer','tuesday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (696,27,'App\\Models\\Lecturer','sunday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (697,28,'App\\Models\\Lecturer','sunday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (698,28,'App\\Models\\Lecturer','monday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (699,28,'App\\Models\\Lecturer','tuesday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (700,28,'App\\Models\\Lecturer','wednesday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (701,28,'App\\Models\\Lecturer','thursday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (702,28,'App\\Models\\Lecturer','thursday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (703,28,'App\\Models\\Lecturer','wednesday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (704,28,'App\\Models\\Lecturer','tuesday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (705,28,'App\\Models\\Lecturer','monday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (706,28,'App\\Models\\Lecturer','sunday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (707,28,'App\\Models\\Lecturer','sunday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (708,28,'App\\Models\\Lecturer','monday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (709,28,'App\\Models\\Lecturer','tuesday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (710,28,'App\\Models\\Lecturer','thursday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (711,28,'App\\Models\\Lecturer','wednesday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (712,28,'App\\Models\\Lecturer','thursday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (713,28,'App\\Models\\Lecturer','wednesday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (714,28,'App\\Models\\Lecturer','tuesday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (715,28,'App\\Models\\Lecturer','monday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (716,28,'App\\Models\\Lecturer','sunday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (717,28,'App\\Models\\Lecturer','sunday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (718,28,'App\\Models\\Lecturer','monday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (719,28,'App\\Models\\Lecturer','tuesday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (720,28,'App\\Models\\Lecturer','wednesday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (721,28,'App\\Models\\Lecturer','thursday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (722,29,'App\\Models\\Lecturer','sunday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (723,29,'App\\Models\\Lecturer','monday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (724,29,'App\\Models\\Lecturer','tuesday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (725,29,'App\\Models\\Lecturer','wednesday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (726,29,'App\\Models\\Lecturer','thursday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (727,29,'App\\Models\\Lecturer','sunday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (728,29,'App\\Models\\Lecturer','monday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (729,29,'App\\Models\\Lecturer','tuesday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (730,29,'App\\Models\\Lecturer','wednesday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (731,29,'App\\Models\\Lecturer','thursday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (732,29,'App\\Models\\Lecturer','thursday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (733,29,'App\\Models\\Lecturer','wednesday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (734,29,'App\\Models\\Lecturer','tuesday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (735,29,'App\\Models\\Lecturer','monday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (736,29,'App\\Models\\Lecturer','sunday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (737,29,'App\\Models\\Lecturer','sunday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (738,29,'App\\Models\\Lecturer','monday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (739,29,'App\\Models\\Lecturer','tuesday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (740,29,'App\\Models\\Lecturer','wednesday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (741,29,'App\\Models\\Lecturer','thursday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (742,29,'App\\Models\\Lecturer','thursday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (743,29,'App\\Models\\Lecturer','wednesday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (744,29,'App\\Models\\Lecturer','tuesday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (745,29,'App\\Models\\Lecturer','monday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (746,29,'App\\Models\\Lecturer','sunday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (747,30,'App\\Models\\Lecturer','thursday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (748,30,'App\\Models\\Lecturer','wednesday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (749,30,'App\\Models\\Lecturer','tuesday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (750,30,'App\\Models\\Lecturer','monday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (751,30,'App\\Models\\Lecturer','sunday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (752,30,'App\\Models\\Lecturer','sunday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (753,30,'App\\Models\\Lecturer','monday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (754,30,'App\\Models\\Lecturer','tuesday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (755,30,'App\\Models\\Lecturer','wednesday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (756,30,'App\\Models\\Lecturer','thursday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (757,30,'App\\Models\\Lecturer','thursday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (758,30,'App\\Models\\Lecturer','wednesday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (759,30,'App\\Models\\Lecturer','tuesday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (760,30,'App\\Models\\Lecturer','monday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (761,30,'App\\Models\\Lecturer','sunday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (762,30,'App\\Models\\Lecturer','sunday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (763,30,'App\\Models\\Lecturer','monday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (764,30,'App\\Models\\Lecturer','tuesday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (765,30,'App\\Models\\Lecturer','wednesday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (766,30,'App\\Models\\Lecturer','thursday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (767,30,'App\\Models\\Lecturer','thursday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (768,30,'App\\Models\\Lecturer','wednesday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (769,30,'App\\Models\\Lecturer','tuesday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (770,30,'App\\Models\\Lecturer','monday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (771,30,'App\\Models\\Lecturer','sunday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (772,31,'App\\Models\\Lecturer','thursday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (773,31,'App\\Models\\Lecturer','wednesday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (774,31,'App\\Models\\Lecturer','tuesday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (775,31,'App\\Models\\Lecturer','monday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (776,31,'App\\Models\\Lecturer','sunday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (777,31,'App\\Models\\Lecturer','sunday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (778,31,'App\\Models\\Lecturer','monday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (779,31,'App\\Models\\Lecturer','wednesday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (780,31,'App\\Models\\Lecturer','tuesday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (781,31,'App\\Models\\Lecturer','thursday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (782,31,'App\\Models\\Lecturer','thursday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (783,31,'App\\Models\\Lecturer','wednesday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (784,31,'App\\Models\\Lecturer','tuesday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (785,31,'App\\Models\\Lecturer','monday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (786,31,'App\\Models\\Lecturer','sunday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (787,31,'App\\Models\\Lecturer','sunday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (788,31,'App\\Models\\Lecturer','monday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (789,31,'App\\Models\\Lecturer','tuesday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (790,31,'App\\Models\\Lecturer','wednesday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (791,31,'App\\Models\\Lecturer','thursday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (792,31,'App\\Models\\Lecturer','thursday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (793,31,'App\\Models\\Lecturer','wednesday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (794,31,'App\\Models\\Lecturer','tuesday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (795,31,'App\\Models\\Lecturer','monday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (796,31,'App\\Models\\Lecturer','sunday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (797,32,'App\\Models\\Lecturer','thursday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (798,32,'App\\Models\\Lecturer','wednesday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (799,32,'App\\Models\\Lecturer','tuesday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (800,32,'App\\Models\\Lecturer','monday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (801,32,'App\\Models\\Lecturer','sunday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (802,32,'App\\Models\\Lecturer','sunday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (803,32,'App\\Models\\Lecturer','monday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (804,32,'App\\Models\\Lecturer','tuesday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (805,32,'App\\Models\\Lecturer','wednesday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (806,32,'App\\Models\\Lecturer','thursday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (807,32,'App\\Models\\Lecturer','sunday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (808,32,'App\\Models\\Lecturer','monday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (809,32,'App\\Models\\Lecturer','tuesday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (810,32,'App\\Models\\Lecturer','wednesday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (811,32,'App\\Models\\Lecturer','thursday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (812,32,'App\\Models\\Lecturer','thursday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (813,32,'App\\Models\\Lecturer','wednesday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (814,32,'App\\Models\\Lecturer','tuesday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (815,32,'App\\Models\\Lecturer','monday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (816,32,'App\\Models\\Lecturer','sunday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (817,32,'App\\Models\\Lecturer','sunday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (818,32,'App\\Models\\Lecturer','monday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (819,32,'App\\Models\\Lecturer','tuesday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (820,32,'App\\Models\\Lecturer','wednesday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (821,32,'App\\Models\\Lecturer','thursday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (822,33,'App\\Models\\Lecturer','thursday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (823,33,'App\\Models\\Lecturer','wednesday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (824,33,'App\\Models\\Lecturer','tuesday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (825,33,'App\\Models\\Lecturer','monday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (826,33,'App\\Models\\Lecturer','sunday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (827,33,'App\\Models\\Lecturer','sunday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (828,33,'App\\Models\\Lecturer','monday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (829,33,'App\\Models\\Lecturer','tuesday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (830,33,'App\\Models\\Lecturer','thursday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (831,33,'App\\Models\\Lecturer','wednesday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (832,33,'App\\Models\\Lecturer','thursday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (833,33,'App\\Models\\Lecturer','wednesday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (834,33,'App\\Models\\Lecturer','tuesday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (835,33,'App\\Models\\Lecturer','monday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (836,33,'App\\Models\\Lecturer','sunday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (837,33,'App\\Models\\Lecturer','sunday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (838,33,'App\\Models\\Lecturer','monday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (839,33,'App\\Models\\Lecturer','tuesday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (840,33,'App\\Models\\Lecturer','wednesday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (841,33,'App\\Models\\Lecturer','thursday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (842,33,'App\\Models\\Lecturer','thursday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (843,33,'App\\Models\\Lecturer','wednesday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (844,33,'App\\Models\\Lecturer','tuesday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (845,33,'App\\Models\\Lecturer','monday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (846,33,'App\\Models\\Lecturer','sunday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (847,34,'App\\Models\\Lecturer','thursday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (848,34,'App\\Models\\Lecturer','wednesday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (849,34,'App\\Models\\Lecturer','tuesday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (850,34,'App\\Models\\Lecturer','monday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (851,34,'App\\Models\\Lecturer','sunday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (852,34,'App\\Models\\Lecturer','sunday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (853,34,'App\\Models\\Lecturer','monday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (854,34,'App\\Models\\Lecturer','tuesday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (855,34,'App\\Models\\Lecturer','wednesday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (856,34,'App\\Models\\Lecturer','thursday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (857,34,'App\\Models\\Lecturer','thursday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (858,34,'App\\Models\\Lecturer','wednesday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (859,34,'App\\Models\\Lecturer','tuesday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (860,34,'App\\Models\\Lecturer','monday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (861,34,'App\\Models\\Lecturer','sunday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (862,34,'App\\Models\\Lecturer','sunday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (863,34,'App\\Models\\Lecturer','monday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (864,34,'App\\Models\\Lecturer','tuesday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (865,34,'App\\Models\\Lecturer','wednesday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (866,34,'App\\Models\\Lecturer','thursday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (867,34,'App\\Models\\Lecturer','thursday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (868,34,'App\\Models\\Lecturer','wednesday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (869,34,'App\\Models\\Lecturer','tuesday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (870,34,'App\\Models\\Lecturer','monday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (871,34,'App\\Models\\Lecturer','sunday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (872,35,'App\\Models\\Lecturer','thursday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (873,35,'App\\Models\\Lecturer','wednesday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (874,35,'App\\Models\\Lecturer','tuesday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (875,35,'App\\Models\\Lecturer','monday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (876,35,'App\\Models\\Lecturer','sunday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (877,35,'App\\Models\\Lecturer','sunday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (878,35,'App\\Models\\Lecturer','monday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (879,35,'App\\Models\\Lecturer','tuesday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (880,35,'App\\Models\\Lecturer','wednesday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (881,35,'App\\Models\\Lecturer','thursday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (882,35,'App\\Models\\Lecturer','thursday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (883,35,'App\\Models\\Lecturer','wednesday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (884,35,'App\\Models\\Lecturer','tuesday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (885,35,'App\\Models\\Lecturer','monday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (886,35,'App\\Models\\Lecturer','sunday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (887,35,'App\\Models\\Lecturer','sunday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (888,35,'App\\Models\\Lecturer','monday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (889,35,'App\\Models\\Lecturer','wednesday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (890,35,'App\\Models\\Lecturer','tuesday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (891,35,'App\\Models\\Lecturer','thursday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (892,35,'App\\Models\\Lecturer','thursday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (893,35,'App\\Models\\Lecturer','wednesday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (894,35,'App\\Models\\Lecturer','tuesday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (895,35,'App\\Models\\Lecturer','monday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (896,35,'App\\Models\\Lecturer','sunday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (897,36,'App\\Models\\Lecturer','thursday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (898,36,'App\\Models\\Lecturer','wednesday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (899,36,'App\\Models\\Lecturer','tuesday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (900,36,'App\\Models\\Lecturer','monday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (901,36,'App\\Models\\Lecturer','sunday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (902,36,'App\\Models\\Lecturer','sunday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (903,36,'App\\Models\\Lecturer','monday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (904,36,'App\\Models\\Lecturer','tuesday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (905,36,'App\\Models\\Lecturer','wednesday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (906,36,'App\\Models\\Lecturer','thursday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (907,36,'App\\Models\\Lecturer','thursday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (908,36,'App\\Models\\Lecturer','wednesday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (909,36,'App\\Models\\Lecturer','tuesday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (910,36,'App\\Models\\Lecturer','monday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (911,36,'App\\Models\\Lecturer','sunday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (912,36,'App\\Models\\Lecturer','sunday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (913,36,'App\\Models\\Lecturer','monday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (914,36,'App\\Models\\Lecturer','tuesday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (915,36,'App\\Models\\Lecturer','wednesday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (916,36,'App\\Models\\Lecturer','thursday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (917,36,'App\\Models\\Lecturer','thursday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (918,36,'App\\Models\\Lecturer','wednesday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (919,36,'App\\Models\\Lecturer','tuesday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (920,36,'App\\Models\\Lecturer','monday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (921,36,'App\\Models\\Lecturer','sunday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (922,37,'App\\Models\\Lecturer','thursday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (923,37,'App\\Models\\Lecturer','wednesday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (924,37,'App\\Models\\Lecturer','tuesday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (925,37,'App\\Models\\Lecturer','monday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (926,37,'App\\Models\\Lecturer','sunday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (927,37,'App\\Models\\Lecturer','sunday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (928,37,'App\\Models\\Lecturer','monday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (929,37,'App\\Models\\Lecturer','tuesday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (930,37,'App\\Models\\Lecturer','thursday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (931,37,'App\\Models\\Lecturer','wednesday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (932,37,'App\\Models\\Lecturer','thursday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (933,37,'App\\Models\\Lecturer','wednesday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (934,37,'App\\Models\\Lecturer','tuesday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (935,37,'App\\Models\\Lecturer','monday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (936,37,'App\\Models\\Lecturer','sunday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (937,37,'App\\Models\\Lecturer','sunday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (938,37,'App\\Models\\Lecturer','monday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (939,37,'App\\Models\\Lecturer','tuesday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (940,37,'App\\Models\\Lecturer','wednesday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (941,37,'App\\Models\\Lecturer','thursday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (942,37,'App\\Models\\Lecturer','thursday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (943,37,'App\\Models\\Lecturer','wednesday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (944,37,'App\\Models\\Lecturer','tuesday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (945,37,'App\\Models\\Lecturer','monday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (946,37,'App\\Models\\Lecturer','sunday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (947,38,'App\\Models\\Lecturer','thursday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (948,38,'App\\Models\\Lecturer','wednesday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (949,38,'App\\Models\\Lecturer','tuesday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (950,38,'App\\Models\\Lecturer','monday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (951,38,'App\\Models\\Lecturer','sunday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (952,38,'App\\Models\\Lecturer','sunday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (953,38,'App\\Models\\Lecturer','monday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (954,38,'App\\Models\\Lecturer','tuesday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (955,38,'App\\Models\\Lecturer','wednesday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (956,38,'App\\Models\\Lecturer','thursday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (957,38,'App\\Models\\Lecturer','thursday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (958,38,'App\\Models\\Lecturer','wednesday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (959,38,'App\\Models\\Lecturer','monday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (960,38,'App\\Models\\Lecturer','tuesday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (961,38,'App\\Models\\Lecturer','sunday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (962,38,'App\\Models\\Lecturer','sunday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (963,38,'App\\Models\\Lecturer','monday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (964,38,'App\\Models\\Lecturer','tuesday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (965,38,'App\\Models\\Lecturer','wednesday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (966,38,'App\\Models\\Lecturer','thursday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (967,38,'App\\Models\\Lecturer','thursday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (968,38,'App\\Models\\Lecturer','wednesday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (969,38,'App\\Models\\Lecturer','tuesday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (970,38,'App\\Models\\Lecturer','monday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (971,38,'App\\Models\\Lecturer','sunday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (972,39,'App\\Models\\Lecturer','thursday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (973,39,'App\\Models\\Lecturer','wednesday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (974,39,'App\\Models\\Lecturer','tuesday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (975,39,'App\\Models\\Lecturer','monday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (976,39,'App\\Models\\Lecturer','sunday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (977,39,'App\\Models\\Lecturer','sunday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (978,39,'App\\Models\\Lecturer','monday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (979,39,'App\\Models\\Lecturer','tuesday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (980,39,'App\\Models\\Lecturer','wednesday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (981,39,'App\\Models\\Lecturer','thursday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (982,39,'App\\Models\\Lecturer','thursday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (983,39,'App\\Models\\Lecturer','wednesday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (984,39,'App\\Models\\Lecturer','tuesday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (985,39,'App\\Models\\Lecturer','monday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (986,39,'App\\Models\\Lecturer','sunday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (987,39,'App\\Models\\Lecturer','sunday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (988,39,'App\\Models\\Lecturer','monday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (989,39,'App\\Models\\Lecturer','tuesday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (990,39,'App\\Models\\Lecturer','wednesday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (991,39,'App\\Models\\Lecturer','thursday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (992,39,'App\\Models\\Lecturer','thursday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (993,39,'App\\Models\\Lecturer','wednesday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (994,39,'App\\Models\\Lecturer','tuesday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (995,39,'App\\Models\\Lecturer','monday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (996,39,'App\\Models\\Lecturer','sunday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (997,40,'App\\Models\\Lecturer','thursday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (998,40,'App\\Models\\Lecturer','wednesday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (999,40,'App\\Models\\Lecturer','tuesday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (1000,40,'App\\Models\\Lecturer','monday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (1001,40,'App\\Models\\Lecturer','sunday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (1002,40,'App\\Models\\Lecturer','sunday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (1003,40,'App\\Models\\Lecturer','monday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (1004,40,'App\\Models\\Lecturer','tuesday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (1005,40,'App\\Models\\Lecturer','wednesday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (1006,40,'App\\Models\\Lecturer','thursday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (1007,40,'App\\Models\\Lecturer','thursday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (1008,40,'App\\Models\\Lecturer','wednesday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (1009,40,'App\\Models\\Lecturer','tuesday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (1010,40,'App\\Models\\Lecturer','monday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (1011,40,'App\\Models\\Lecturer','sunday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (1012,40,'App\\Models\\Lecturer','monday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (1013,40,'App\\Models\\Lecturer','sunday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (1014,40,'App\\Models\\Lecturer','tuesday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (1015,40,'App\\Models\\Lecturer','wednesday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (1016,40,'App\\Models\\Lecturer','thursday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (1017,40,'App\\Models\\Lecturer','thursday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (1018,40,'App\\Models\\Lecturer','tuesday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (1019,40,'App\\Models\\Lecturer','wednesday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (1020,40,'App\\Models\\Lecturer','monday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (1021,40,'App\\Models\\Lecturer','sunday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (1022,41,'App\\Models\\Lecturer','thursday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (1023,41,'App\\Models\\Lecturer','tuesday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (1024,41,'App\\Models\\Lecturer','wednesday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (1025,41,'App\\Models\\Lecturer','monday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (1026,41,'App\\Models\\Lecturer','sunday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (1027,41,'App\\Models\\Lecturer','sunday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (1028,41,'App\\Models\\Lecturer','monday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (1029,41,'App\\Models\\Lecturer','tuesday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (1030,41,'App\\Models\\Lecturer','wednesday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (1031,41,'App\\Models\\Lecturer','thursday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (1032,41,'App\\Models\\Lecturer','thursday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (1033,41,'App\\Models\\Lecturer','wednesday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (1034,41,'App\\Models\\Lecturer','tuesday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (1035,41,'App\\Models\\Lecturer','monday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (1036,41,'App\\Models\\Lecturer','sunday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (1037,41,'App\\Models\\Lecturer','sunday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (1038,41,'App\\Models\\Lecturer','monday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (1039,41,'App\\Models\\Lecturer','tuesday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (1040,41,'App\\Models\\Lecturer','thursday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (1041,41,'App\\Models\\Lecturer','wednesday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (1042,41,'App\\Models\\Lecturer','thursday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (1043,41,'App\\Models\\Lecturer','wednesday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (1044,41,'App\\Models\\Lecturer','tuesday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (1045,41,'App\\Models\\Lecturer','monday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (1046,41,'App\\Models\\Lecturer','sunday','17:00','19:00');
INSERT INTO `time_preferences` VALUES (1047,6,'App\\Models\\Lap','friday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (1048,6,'App\\Models\\Lap','saturday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (1049,6,'App\\Models\\Lap','sunday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (1050,6,'App\\Models\\Lap','monday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (1051,3,'App\\Models\\Hall','tuesday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (1052,3,'App\\Models\\Hall','tuesday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (1053,3,'App\\Models\\Hall','monday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (1054,3,'App\\Models\\Hall','monday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (1055,3,'App\\Models\\Hall','tuesday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (1056,3,'App\\Models\\Hall','wednesday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (1057,3,'App\\Models\\Hall','thursday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (1058,3,'App\\Models\\Hall','tuesday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (1059,3,'App\\Models\\Hall','sunday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (1060,3,'App\\Models\\Hall','saturday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (1061,3,'App\\Models\\Hall','sunday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (1062,7,'App\\Models\\Lap','tuesday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (1063,7,'App\\Models\\Lap','tuesday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (1064,7,'App\\Models\\Lap','monday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (1065,7,'App\\Models\\Lap','sunday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (1066,7,'App\\Models\\Lap','sunday','11:00','13:00');
INSERT INTO `time_preferences` VALUES (1067,7,'App\\Models\\Lap','monday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (1068,7,'App\\Models\\Lap','sunday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (1069,7,'App\\Models\\Lap','tuesday','09:00','11:00');
INSERT INTO `time_preferences` VALUES (1070,7,'App\\Models\\Lap','tuesday','15:00','17:00');
INSERT INTO `time_preferences` VALUES (1071,7,'App\\Models\\Lap','sunday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (1072,7,'App\\Models\\Lap','monday','13:00','15:00');
INSERT INTO `time_preferences` VALUES (1073,7,'App\\Models\\Lap','monday','11:00','13:00');
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
INSERT INTO `users` VALUES (1,'hossam','hossam@gmail.com','$2y$12$tRNvHvaYM.9ObzrH9YNG2eyRYhhOq92Ytzh2PqiKpbo5M7sn91u9u',NULL,NULL,'2025-05-19 18:13:56','2025-05-19 18:13:56');
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-29 14:11:04

