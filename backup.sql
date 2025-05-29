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
/*!40000 ALTER TABLE `academic_degrees` DISABLE KEYS */;
INSERT INTO `academic_degrees` VALUES (1,'professor','أستاذ','Prof.','أ. د.'),(2,'associate professor','أستاذ مساعد','Dr.','د.'),(3,'assistant professor','مدرس','Dr.','د.'),(4,'assistant lecturer','مدرس مساعد','Eng.','م.'),(5,'teaching assistant','معيد','Eng.','م.');
/*!40000 ALTER TABLE `academic_degrees` ENABLE KEYS */;
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
/*!40000 ALTER TABLE `academic_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `academic_items` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `academics`
--

LOCK TABLES `academics` WRITE;
/*!40000 ALTER TABLE `academics` DISABLE KEYS */;
INSERT INTO `academics` VALUES (2,'Regulation 2022 - Level','اللائحة 2022 - المستوى الأول- ذكاء اصطناعي',5);
/*!40000 ALTER TABLE `academics` ENABLE KEYS */;
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
/*!40000 ALTER TABLE `acadmic_spaces` DISABLE KEYS */;
/*!40000 ALTER TABLE `acadmic_spaces` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_assignments`
--

LOCK TABLES `course_assignments` WRITE;
/*!40000 ALTER TABLE `course_assignments` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_assignments` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES (2,'UNV102','لغه انجليزيه في التخصص','English Language','',2,0,2,2),(3,'UNV103','الكتابة الفنية والعلمية','Technical and Scientific Writing','',2,0,2,2),(4,'UNV104','الذكاء الاصطناعي والتحول الرقمي في المجتمع','Artificial Intelligence and Digital Transformation in Society','',2,0,2,2),(5,'BS102','الهياكل المتقطعة','DiscreteDiscrete Structures  Structures','',2,2,3,2),(6,'BS103','الجبر الخطي','Linear Algebra','',2,2,3,2),(7,'CS103','برمجة كائنية التوجه','Object Programming','',2,2,3,2),(8,'BS104','تطبيقات الاحتمالات والإحصاء في الحاسب','Probability and Statistics Applications in Computer','',2,2,3,2),(9,'Math0','رياضه تكميليه','Complementary Mathematics for Science','',0,0,0,2),(10,'IS202','نظم قواعد البيانات','Database Systems','CS101',2,2,3,2),(11,'IT203','شبكات الحاسوب','Computer Networks','IT202',2,2,3,2),(12,'CS206','مقدمة في الذكاء الاصطناعي','Introduction to Artificial Intelligence','CS102',2,2,3,2),(13,'CS311','تصميم وتحليل الخوارزميات','Design and Analysis of Algorithms','CS205',2,2,3,2),(14,'IT309','معالجة الإشارات الرقمية','Digital Signals Processing','BS101',2,2,3,2),(15,'BS209','بحوث العمليات (2)','Operations Research','BS104',0,0,0,2),(16,'CS314','معالجة الصور','Image Processing','BS103',2,2,3,2),(17,'CS321','الذكاء التطوري وذكاء السرب','Evolutionary and Swarm Intelligence','CS206',2,2,3,2),(18,'IT423','إنترنت الأشياء','Internet of Things','1T203',2,2,3,2),(19,'CS429','التشفير','Cryptography','BS102',2,2,3,2),(20,'CS443','الذكاء الاصطناعي للروبوت','Artificial Intelligence for Robot','CS206',2,2,3,2),(21,'IT416','الواقع الافتراضي والمعزز','Virtual and Agumented Reality','CS103',2,2,3,2),(22,'IT427','مقدمة في المركبات ذاتية القيادة','Introduction to Autonomous Vehicles','IT312',2,2,3,2),(23,'CS309','الحوسبة اللينة','Soft Computing','CS102',2,2,3,2),(24,'PRA1401','مشروع','Project','',1,2,2,2),(25,'CS437','علم البيانات','Data Science','BS104',0,0,0,2),(26,'CS441','التعلم العميق','Deep Learning','CS313',0,0,0,2),(27,'CS434','التعرف علي الانماط','Pattern Recognition','CS313',2,2,3,2);
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
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
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (1,'general','عام'),(2,'computer science','علوم الحاسب'),(3,'information technology','تكنولوجيا المعلومات'),(4,'information systems','نظم المعلومات'),(5,'artificial intelligence','الذكاء الاصطناعي'),(6,'cybersecurity','الأمن السيبراني'),(7,'biomedical','الطب الحيوي');
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
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
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `halls`
--

LOCK TABLES `halls` WRITE;
/*!40000 ALTER TABLE `halls` DISABLE KEYS */;
INSERT INTO `halls` VALUES (1,'206',150),(2,'207',80);
/*!40000 ALTER TABLE `halls` ENABLE KEYS */;
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
/*!40000 ALTER TABLE `lab_assignments` DISABLE KEYS */;
/*!40000 ALTER TABLE `lab_assignments` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `laps`
--

LOCK TABLES `laps` WRITE;
/*!40000 ALTER TABLE `laps` DISABLE KEYS */;
INSERT INTO `laps` VALUES (1,'105',90,'specialist',1),(2,'105',99,'specialist',1);
/*!40000 ALTER TABLE `laps` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lecturer_assignments`
--

LOCK TABLES `lecturer_assignments` WRITE;
/*!40000 ALTER TABLE `lecturer_assignments` DISABLE KEYS */;
/*!40000 ALTER TABLE `lecturer_assignments` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lecturers`
--

LOCK TABLES `lecturers` WRITE;
/*!40000 ALTER TABLE `lecturers` DISABLE KEYS */;
INSERT INTO `lecturers` VALUES (3,'Ahmed Mohammed  Rabiea','أحمد سيد ربيع',3,1,1),(5,'Ahmed Elharby','احمد الحربي',2,1,1),(6,'Wael Abdelkader Awad','وائل عبد القادر عوض',2,1,1),(7,'Samar El-Badawy','سمر البدوي',2,3,1),(8,'Tamer Zakaria','تامر زكريا',3,2,1),(9,'Mona Nagi El-Badawy','منى ناجي البدوي',2,2,1),(10,'Abeer saber','عبير صابر',3,3,1),(11,'Ali elbaz','علي الباز',5,1,1),(19,'Gamal Mohamed Behairy','جمال محمد بحيري',2,1,1),(20,'Nesma Ibrahim','نسمه ابراهيم',2,3,1),(21,'Amira Elzeny','اميره الزيني',4,3,1),(23,'Mohammed Taha','محمد طه',3,2,1),(24,'Heba Elhadidy','هبه الحديدي',2,3,1);
/*!40000 ALTER TABLE `lecturers` ENABLE KEYS */;
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
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_reset_tokens_table',1),(3,'2019_08_19_000000_create_failed_jobs_table',1),(4,'2019_12_14_000001_create_personal_access_tokens_table',1),(5,'2025_01_02_213131_create_academic_degrees_table',1),(6,'2025_01_10_160232_create_departments_table',1),(7,'2025_02_05_160117_create_academics_table',1),(8,'2025_02_10_152447_create_acadmic_spaces_table',1),(9,'2025_02_10_154811_create_term_plans_table',1),(10,'2025_02_10_154927_create_courses_table',1),(11,'2025_02_10_160547_create_academic_items_table',1),(12,'2025_02_10_164139_create_lecturers_table',1),(13,'2025_02_10_164634_create_term_items_table',1),(14,'2025_02_18_012655_create_permission_tables',1),(15,'2025_03_02_133103_create_time_preferences_table',1),(16,'2025_03_02_133218_create_halls_table',1),(17,'2025_03_02_153616_create_laps_table',1),(18,'2025_03_08_150430_create_study_planes_table',1),(19,'2025_03_08_154924_create_course_assignments_table',1),(20,'2025_03_08_203444_create_lecturer_assignments_table',1),(21,'2025_03_08_203740_create_lab_assignments_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
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
/*!40000 ALTER TABLE `model_has_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `model_has_permissions` ENABLE KEYS */;
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
/*!40000 ALTER TABLE `model_has_roles` DISABLE KEYS */;
INSERT INTO `model_has_roles` VALUES (1,'App\\Models\\User',1);
/*!40000 ALTER TABLE `model_has_roles` ENABLE KEYS */;
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
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
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
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,'view academic spaces','web','2025-05-19 18:13:55','2025-05-19 18:13:55'),(2,'create academic space','web','2025-05-19 18:13:55','2025-05-19 18:13:55'),(3,'show academic space','web','2025-05-19 18:13:55','2025-05-19 18:13:55'),(4,'update academic space','web','2025-05-19 18:13:55','2025-05-19 18:13:55'),(5,'delete academic space','web','2025-05-19 18:13:55','2025-05-19 18:13:55'),(6,'view departments','web','2025-05-19 18:13:55','2025-05-19 18:13:55'),(7,'create department','web','2025-05-19 18:13:55','2025-05-19 18:13:55'),(8,'show department','web','2025-05-19 18:13:55','2025-05-19 18:13:55'),(9,'update department','web','2025-05-19 18:13:55','2025-05-19 18:13:55'),(10,'delete department','web','2025-05-19 18:13:55','2025-05-19 18:13:55'),(11,'view lecturers','web','2025-05-19 18:13:55','2025-05-19 18:13:55'),(12,'create lecturer','web','2025-05-19 18:13:55','2025-05-19 18:13:55'),(13,'show lecturer','web','2025-05-19 18:13:55','2025-05-19 18:13:55'),(14,'update lecturer','web','2025-05-19 18:13:55','2025-05-19 18:13:55'),(15,'delete lecturer','web','2025-05-19 18:13:55','2025-05-19 18:13:55'),(16,'view courses','web','2025-05-19 18:13:55','2025-05-19 18:13:55'),(17,'create course','web','2025-05-19 18:13:55','2025-05-19 18:13:55'),(18,'show course','web','2025-05-19 18:13:55','2025-05-19 18:13:55'),(19,'update course','web','2025-05-19 18:13:55','2025-05-19 18:13:55'),(20,'delete course','web','2025-05-19 18:13:55','2025-05-19 18:13:55'),(21,'view academics','web','2025-05-19 18:13:55','2025-05-19 18:13:55'),(22,'create academic','web','2025-05-19 18:13:55','2025-05-19 18:13:55'),(23,'show academic','web','2025-05-19 18:13:55','2025-05-19 18:13:55'),(24,'update academic','web','2025-05-19 18:13:55','2025-05-19 18:13:55'),(25,'delete academic','web','2025-05-19 18:13:55','2025-05-19 18:13:55'),(26,'add course to academic','web','2025-05-19 18:13:55','2025-05-19 18:13:55'),(27,'remove course from academic','web','2025-05-19 18:13:55','2025-05-19 18:13:55'),(28,'view term plans','web','2025-05-19 18:13:55','2025-05-19 18:13:55'),(29,'create term plan','web','2025-05-19 18:13:55','2025-05-19 18:13:55'),(30,'show term plan','web','2025-05-19 18:13:55','2025-05-19 18:13:55'),(31,'update term plan','web','2025-05-19 18:13:55','2025-05-19 18:13:55'),(32,'delete term plan','web','2025-05-19 18:13:55','2025-05-19 18:13:55'),(33,'add item to term plan','web','2025-05-19 18:13:55','2025-05-19 18:13:55'),(34,'remove item from term plan','web','2025-05-19 18:13:55','2025-05-19 18:13:55'),(35,'show term plan item','web','2025-05-19 18:13:55','2025-05-19 18:13:55'),(36,'assign role','web','2025-05-19 18:13:55','2025-05-19 18:13:55'),(37,'remove role','web','2025-05-19 18:13:55','2025-05-19 18:13:55'),(38,'assign permission','web','2025-05-19 18:13:55','2025-05-19 18:13:55'),(39,'remove permission','web','2025-05-19 18:13:55','2025-05-19 18:13:55');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
INSERT INTO `personal_access_tokens` VALUES (30,'App\\Models\\User',1,'auth_token','d7ce8a3218e59eacb94497c65ce9fe08f445b2faf641f9cdea6814702c820386','[\"*\"]','2025-05-20 08:16:45',NULL,'2025-05-20 08:16:07','2025-05-20 08:16:45'),(31,'App\\Models\\User',1,'auth_token','43670f95df2d2765004db93c5e54c91a9b9adf0da303b2d3ed87fb6ab6419e20','[\"*\"]','2025-05-20 08:22:27',NULL,'2025-05-20 08:17:30','2025-05-20 08:22:27'),(32,'App\\Models\\User',1,'auth_token','f0a5b4c5d387b05914db6c3cce5d63c439810232e0b03050c23722fbf40bdcc7','[\"*\"]','2025-05-20 08:21:59',NULL,'2025-05-20 08:20:28','2025-05-20 08:21:59'),(33,'App\\Models\\User',1,'auth_token','371acc9d41ed31a358548b5466e6d35ecf1b26f1fb0cfebe157713fb6424be86','[\"*\"]','2025-05-20 08:31:49',NULL,'2025-05-20 08:25:52','2025-05-20 08:31:49'),(34,'App\\Models\\User',1,'auth_token','22245f02738400dc38d58f10ba40a2d7f8b39352f9780fac66f1607dde3a81d2','[\"*\"]','2025-05-20 08:55:13',NULL,'2025-05-20 08:28:57','2025-05-20 08:55:13'),(35,'App\\Models\\User',1,'auth_token','7389bddbb6bf790f05794846af35ba246a4a69e8353d64232644983efbf01211','[\"*\"]','2025-05-20 08:36:48',NULL,'2025-05-20 08:34:47','2025-05-20 08:36:48'),(36,'App\\Models\\User',1,'auth_token','1fe9275d75c6d26821fdd194d1fc945ca347f6cbc40b82fad36c774997887447','[\"*\"]','2025-05-20 08:38:03',NULL,'2025-05-20 08:37:24','2025-05-20 08:38:03'),(37,'App\\Models\\User',1,'auth_token','815aefbd5cadcf7d23a4e282f70060f197d97d0ba7ed8da2bf7450f8b6af0e49','[\"*\"]','2025-05-20 08:55:12',NULL,'2025-05-20 08:42:47','2025-05-20 08:55:12'),(38,'App\\Models\\User',1,'auth_token','439d8eded9d06fb4a25fc219d2b9f83a0c30fe1c259cedef26ac8116940a77b1','[\"*\"]','2025-05-20 08:53:59',NULL,'2025-05-20 08:44:36','2025-05-20 08:53:59'),(39,'App\\Models\\User',1,'auth_token','318904fa9e1f5cd243f3c6b675adb747441c6d77f48444f167760855560298eb','[\"*\"]',NULL,NULL,'2025-05-20 08:46:51','2025-05-20 08:46:51'),(40,'App\\Models\\User',1,'auth_token','cc9228951c982f31f3362342e96891639ae65e8d674571e814180d8623635904','[\"*\"]',NULL,NULL,'2025-05-20 08:48:52','2025-05-20 08:48:52'),(41,'App\\Models\\User',1,'auth_token','42fc4a8385d055b1b3acb6f76b81efc2df4e0773e048e3676dd103fa1e4a3cbe','[\"*\"]','2025-05-20 11:36:48',NULL,'2025-05-20 11:35:50','2025-05-20 11:36:48');
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
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
/*!40000 ALTER TABLE `role_has_permissions` DISABLE KEYS */;
INSERT INTO `role_has_permissions` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1),(11,1),(12,1),(13,1),(14,1),(15,1),(16,1),(17,1),(18,1),(19,1),(20,1),(21,1),(22,1),(23,1),(24,1),(25,1),(26,1),(27,1),(28,1),(29,1),(30,1),(31,1),(32,1),(33,1),(34,1),(35,1),(36,1),(37,1),(38,1),(39,1);
/*!40000 ALTER TABLE `role_has_permissions` ENABLE KEYS */;
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
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin','web','2025-05-19 18:13:55','2025-05-19 18:13:55');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `study_planes`
--

LOCK TABLES `study_planes` WRITE;
/*!40000 ALTER TABLE `study_planes` DISABLE KEYS */;
/*!40000 ALTER TABLE `study_planes` ENABLE KEYS */;
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
/*!40000 ALTER TABLE `term_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `term_items` ENABLE KEYS */;
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
/*!40000 ALTER TABLE `term_plans` DISABLE KEYS */;
/*!40000 ALTER TABLE `term_plans` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=560 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time_preferences`
--

LOCK TABLES `time_preferences` WRITE;
/*!40000 ALTER TABLE `time_preferences` DISABLE KEYS */;
INSERT INTO `time_preferences` VALUES (14,1,'App\\Models\\Hall','tuesday','09:00','11:00'),(15,1,'App\\Models\\Hall','tuesday','13:00','15:00'),(16,1,'App\\Models\\Hall','wednesday','13:00','15:00'),(17,1,'App\\Models\\Hall','friday','17:00','19:00'),(18,1,'App\\Models\\Hall','saturday','15:00','17:00'),(19,1,'App\\Models\\Hall','sunday','15:00','17:00'),(20,1,'App\\Models\\Hall','sunday','17:00','19:00'),(21,1,'App\\Models\\Hall','sunday','13:00','15:00'),(22,1,'App\\Models\\Hall','sunday','11:00','13:00'),(23,1,'App\\Models\\Hall','monday','11:00','13:00'),(24,1,'App\\Models\\Hall','thursday','11:00','13:00'),(25,1,'App\\Models\\Hall','wednesday','09:00','11:00'),(26,1,'App\\Models\\Hall','thursday','09:00','11:00'),(27,1,'App\\Models\\Hall','wednesday','11:00','13:00'),(28,2,'App\\Models\\Hall','friday','09:00','11:00'),(29,2,'App\\Models\\Hall','sunday','13:00','15:00'),(30,2,'App\\Models\\Hall','sunday','15:00','17:00'),(31,2,'App\\Models\\Hall','tuesday','17:00','19:00'),(32,2,'App\\Models\\Hall','wednesday','17:00','19:00'),(33,2,'App\\Models\\Hall','tuesday','15:00','17:00'),(34,2,'App\\Models\\Hall','monday','15:00','17:00'),(35,2,'App\\Models\\Hall','sunday','17:00','19:00'),(36,2,'App\\Models\\Hall','saturday','11:00','13:00'),(37,2,'App\\Models\\Hall','sunday','11:00','13:00'),(38,2,'App\\Models\\Hall','saturday','09:00','11:00'),(39,2,'App\\Models\\Hall','monday','09:00','11:00'),(40,2,'App\\Models\\Hall','wednesday','09:00','11:00'),(41,2,'App\\Models\\Hall','thursday','11:00','13:00'),(42,2,'App\\Models\\Hall','wednesday','13:00','15:00'),(43,2,'App\\Models\\Hall','monday','11:00','13:00'),(44,2,'App\\Models\\Hall','wednesday','15:00','17:00'),(45,2,'App\\Models\\Hall','thursday','17:00','19:00'),(46,2,'App\\Models\\Hall','thursday','15:00','17:00'),(47,1,'App\\Models\\Lap','monday','09:00','11:00'),(48,1,'App\\Models\\Lap','wednesday','11:00','13:00'),(49,1,'App\\Models\\Lap','sunday','13:00','15:00'),(50,1,'App\\Models\\Lap','sunday','15:00','17:00'),(51,1,'App\\Models\\Lap','tuesday','17:00','19:00'),(52,1,'App\\Models\\Lap','sunday','17:00','19:00'),(53,1,'App\\Models\\Lap','tuesday','13:00','15:00'),(54,1,'App\\Models\\Lap','monday','13:00','15:00'),(55,1,'App\\Models\\Lap','sunday','11:00','13:00'),(56,1,'App\\Models\\Lap','tuesday','11:00','13:00'),(57,2,'App\\Models\\Lap','wednesday','09:00','11:00'),(58,2,'App\\Models\\Lap','wednesday','11:00','13:00'),(59,2,'App\\Models\\Lap','wednesday','13:00','15:00'),(60,2,'App\\Models\\Lap','wednesday','15:00','17:00'),(61,2,'App\\Models\\Lap','sunday','11:00','13:00'),(62,2,'App\\Models\\Lap','tuesday','13:00','15:00'),(63,2,'App\\Models\\Lap','monday','15:00','17:00'),(64,2,'App\\Models\\Lap','saturday','17:00','19:00'),(65,2,'App\\Models\\Lap','friday','17:00','19:00'),(66,2,'App\\Models\\Lap','friday','13:00','15:00'),(67,2,'App\\Models\\Lap','sunday','13:00','15:00'),(68,2,'App\\Models\\Lap','tuesday','17:00','19:00'),(69,2,'App\\Models\\Lap','wednesday','17:00','19:00'),(132,6,'App\\Models\\Lecturer','sunday','09:00','11:00'),(133,6,'App\\Models\\Lecturer','sunday','11:00','13:00'),(134,6,'App\\Models\\Lecturer','sunday','13:00','15:00'),(135,6,'App\\Models\\Lecturer','sunday','15:00','17:00'),(136,6,'App\\Models\\Lecturer','sunday','17:00','19:00'),(137,6,'App\\Models\\Lecturer','monday','17:00','19:00'),(138,6,'App\\Models\\Lecturer','tuesday','15:00','17:00'),(139,6,'App\\Models\\Lecturer','monday','15:00','17:00'),(140,6,'App\\Models\\Lecturer','monday','13:00','15:00'),(141,6,'App\\Models\\Lecturer','monday','11:00','13:00'),(142,6,'App\\Models\\Lecturer','monday','09:00','11:00'),(143,6,'App\\Models\\Lecturer','tuesday','09:00','11:00'),(144,6,'App\\Models\\Lecturer','tuesday','11:00','13:00'),(145,6,'App\\Models\\Lecturer','tuesday','13:00','15:00'),(146,6,'App\\Models\\Lecturer','tuesday','17:00','19:00'),(147,6,'App\\Models\\Lecturer','wednesday','17:00','19:00'),(148,6,'App\\Models\\Lecturer','wednesday','15:00','17:00'),(149,6,'App\\Models\\Lecturer','wednesday','13:00','15:00'),(150,6,'App\\Models\\Lecturer','wednesday','11:00','13:00'),(151,6,'App\\Models\\Lecturer','wednesday','09:00','11:00'),(152,6,'App\\Models\\Lecturer','thursday','09:00','11:00'),(153,6,'App\\Models\\Lecturer','thursday','11:00','13:00'),(154,6,'App\\Models\\Lecturer','thursday','13:00','15:00'),(155,6,'App\\Models\\Lecturer','thursday','15:00','17:00'),(156,6,'App\\Models\\Lecturer','thursday','17:00','19:00'),(157,7,'App\\Models\\Lecturer','sunday','09:00','11:00'),(158,7,'App\\Models\\Lecturer','sunday','11:00','13:00'),(159,7,'App\\Models\\Lecturer','sunday','13:00','15:00'),(160,7,'App\\Models\\Lecturer','sunday','15:00','17:00'),(161,7,'App\\Models\\Lecturer','sunday','17:00','19:00'),(162,7,'App\\Models\\Lecturer','monday','17:00','19:00'),(163,7,'App\\Models\\Lecturer','monday','15:00','17:00'),(164,7,'App\\Models\\Lecturer','monday','13:00','15:00'),(165,7,'App\\Models\\Lecturer','monday','11:00','13:00'),(166,7,'App\\Models\\Lecturer','monday','09:00','11:00'),(167,7,'App\\Models\\Lecturer','tuesday','09:00','11:00'),(168,7,'App\\Models\\Lecturer','tuesday','11:00','13:00'),(169,7,'App\\Models\\Lecturer','tuesday','13:00','15:00'),(170,7,'App\\Models\\Lecturer','tuesday','15:00','17:00'),(171,7,'App\\Models\\Lecturer','tuesday','17:00','19:00'),(172,7,'App\\Models\\Lecturer','wednesday','17:00','19:00'),(173,7,'App\\Models\\Lecturer','wednesday','15:00','17:00'),(174,7,'App\\Models\\Lecturer','wednesday','13:00','15:00'),(175,7,'App\\Models\\Lecturer','wednesday','09:00','11:00'),(176,7,'App\\Models\\Lecturer','wednesday','11:00','13:00'),(177,7,'App\\Models\\Lecturer','thursday','09:00','11:00'),(178,7,'App\\Models\\Lecturer','thursday','11:00','13:00'),(179,7,'App\\Models\\Lecturer','thursday','13:00','15:00'),(180,7,'App\\Models\\Lecturer','thursday','15:00','17:00'),(181,7,'App\\Models\\Lecturer','thursday','17:00','19:00'),(182,8,'App\\Models\\Lecturer','sunday','09:00','11:00'),(183,8,'App\\Models\\Lecturer','sunday','11:00','13:00'),(184,8,'App\\Models\\Lecturer','sunday','13:00','15:00'),(185,8,'App\\Models\\Lecturer','sunday','15:00','17:00'),(186,8,'App\\Models\\Lecturer','sunday','17:00','19:00'),(187,8,'App\\Models\\Lecturer','monday','17:00','19:00'),(188,8,'App\\Models\\Lecturer','monday','13:00','15:00'),(189,8,'App\\Models\\Lecturer','monday','15:00','17:00'),(190,8,'App\\Models\\Lecturer','monday','11:00','13:00'),(191,8,'App\\Models\\Lecturer','monday','09:00','11:00'),(192,8,'App\\Models\\Lecturer','tuesday','09:00','11:00'),(193,8,'App\\Models\\Lecturer','tuesday','11:00','13:00'),(194,8,'App\\Models\\Lecturer','tuesday','13:00','15:00'),(195,8,'App\\Models\\Lecturer','tuesday','15:00','17:00'),(196,8,'App\\Models\\Lecturer','tuesday','17:00','19:00'),(197,8,'App\\Models\\Lecturer','wednesday','17:00','19:00'),(198,8,'App\\Models\\Lecturer','wednesday','15:00','17:00'),(199,8,'App\\Models\\Lecturer','wednesday','13:00','15:00'),(200,8,'App\\Models\\Lecturer','wednesday','11:00','13:00'),(201,8,'App\\Models\\Lecturer','wednesday','09:00','11:00'),(202,8,'App\\Models\\Lecturer','thursday','09:00','11:00'),(203,8,'App\\Models\\Lecturer','thursday','11:00','13:00'),(204,8,'App\\Models\\Lecturer','thursday','13:00','15:00'),(205,8,'App\\Models\\Lecturer','thursday','15:00','17:00'),(206,8,'App\\Models\\Lecturer','thursday','17:00','19:00'),(232,10,'App\\Models\\Lecturer','sunday','09:00','11:00'),(233,10,'App\\Models\\Lecturer','monday','09:00','11:00'),(234,10,'App\\Models\\Lecturer','tuesday','09:00','11:00'),(235,10,'App\\Models\\Lecturer','wednesday','09:00','11:00'),(236,10,'App\\Models\\Lecturer','thursday','09:00','11:00'),(237,10,'App\\Models\\Lecturer','sunday','11:00','13:00'),(238,10,'App\\Models\\Lecturer','monday','11:00','13:00'),(239,10,'App\\Models\\Lecturer','tuesday','11:00','13:00'),(240,10,'App\\Models\\Lecturer','wednesday','11:00','13:00'),(241,10,'App\\Models\\Lecturer','thursday','11:00','13:00'),(242,10,'App\\Models\\Lecturer','sunday','13:00','15:00'),(243,10,'App\\Models\\Lecturer','monday','13:00','15:00'),(244,10,'App\\Models\\Lecturer','tuesday','13:00','15:00'),(245,10,'App\\Models\\Lecturer','wednesday','13:00','15:00'),(246,10,'App\\Models\\Lecturer','thursday','13:00','15:00'),(247,10,'App\\Models\\Lecturer','sunday','15:00','17:00'),(248,10,'App\\Models\\Lecturer','monday','15:00','17:00'),(249,10,'App\\Models\\Lecturer','tuesday','15:00','17:00'),(250,10,'App\\Models\\Lecturer','wednesday','15:00','17:00'),(251,10,'App\\Models\\Lecturer','thursday','15:00','17:00'),(252,10,'App\\Models\\Lecturer','sunday','17:00','19:00'),(253,10,'App\\Models\\Lecturer','tuesday','17:00','19:00'),(254,10,'App\\Models\\Lecturer','monday','17:00','19:00'),(255,10,'App\\Models\\Lecturer','wednesday','17:00','19:00'),(256,10,'App\\Models\\Lecturer','thursday','17:00','19:00'),(282,11,'App\\Models\\Lecturer','sunday','09:00','11:00'),(283,11,'App\\Models\\Lecturer','monday','09:00','11:00'),(284,11,'App\\Models\\Lecturer','tuesday','09:00','11:00'),(285,11,'App\\Models\\Lecturer','wednesday','09:00','11:00'),(286,11,'App\\Models\\Lecturer','thursday','09:00','11:00'),(287,11,'App\\Models\\Lecturer','sunday','11:00','13:00'),(288,11,'App\\Models\\Lecturer','monday','11:00','13:00'),(289,11,'App\\Models\\Lecturer','tuesday','11:00','13:00'),(290,11,'App\\Models\\Lecturer','wednesday','11:00','13:00'),(291,11,'App\\Models\\Lecturer','thursday','11:00','13:00'),(292,11,'App\\Models\\Lecturer','sunday','13:00','15:00'),(293,11,'App\\Models\\Lecturer','monday','13:00','15:00'),(294,11,'App\\Models\\Lecturer','tuesday','13:00','15:00'),(295,11,'App\\Models\\Lecturer','wednesday','13:00','15:00'),(296,11,'App\\Models\\Lecturer','thursday','13:00','15:00'),(297,11,'App\\Models\\Lecturer','sunday','15:00','17:00'),(298,11,'App\\Models\\Lecturer','monday','15:00','17:00'),(299,11,'App\\Models\\Lecturer','tuesday','15:00','17:00'),(300,11,'App\\Models\\Lecturer','wednesday','15:00','17:00'),(301,11,'App\\Models\\Lecturer','thursday','15:00','17:00'),(302,11,'App\\Models\\Lecturer','sunday','17:00','19:00'),(303,11,'App\\Models\\Lecturer','monday','17:00','19:00'),(304,11,'App\\Models\\Lecturer','tuesday','17:00','19:00'),(305,11,'App\\Models\\Lecturer','wednesday','17:00','19:00'),(306,11,'App\\Models\\Lecturer','thursday','17:00','19:00'),(307,3,'App\\Models\\Lecturer','monday','09:00','11:00'),(308,3,'App\\Models\\Lecturer','sunday','09:00','11:00'),(309,3,'App\\Models\\Lecturer','tuesday','09:00','11:00'),(310,3,'App\\Models\\Lecturer','wednesday','09:00','11:00'),(311,3,'App\\Models\\Lecturer','wednesday','11:00','13:00'),(312,3,'App\\Models\\Lecturer','monday','11:00','13:00'),(313,3,'App\\Models\\Lecturer','sunday','11:00','13:00'),(314,3,'App\\Models\\Lecturer','tuesday','11:00','13:00'),(315,3,'App\\Models\\Lecturer','sunday','13:00','15:00'),(316,3,'App\\Models\\Lecturer','sunday','15:00','17:00'),(317,3,'App\\Models\\Lecturer','monday','15:00','17:00'),(318,3,'App\\Models\\Lecturer','tuesday','15:00','17:00'),(319,3,'App\\Models\\Lecturer','wednesday','15:00','17:00'),(320,3,'App\\Models\\Lecturer','wednesday','13:00','15:00'),(321,3,'App\\Models\\Lecturer','tuesday','13:00','15:00'),(322,3,'App\\Models\\Lecturer','monday','13:00','15:00'),(360,5,'App\\Models\\Lecturer','monday','17:00','19:00'),(361,5,'App\\Models\\Lecturer','sunday','15:00','17:00'),(362,5,'App\\Models\\Lecturer','sunday','13:00','15:00'),(363,5,'App\\Models\\Lecturer','sunday','11:00','13:00'),(364,5,'App\\Models\\Lecturer','sunday','09:00','11:00'),(365,5,'App\\Models\\Lecturer','monday','09:00','11:00'),(366,5,'App\\Models\\Lecturer','monday','11:00','13:00'),(367,5,'App\\Models\\Lecturer','monday','13:00','15:00'),(368,5,'App\\Models\\Lecturer','monday','15:00','17:00'),(369,5,'App\\Models\\Lecturer','sunday','17:00','19:00'),(370,5,'App\\Models\\Lecturer','tuesday','17:00','19:00'),(371,5,'App\\Models\\Lecturer','wednesday','15:00','17:00'),(372,5,'App\\Models\\Lecturer','tuesday','15:00','17:00'),(373,5,'App\\Models\\Lecturer','tuesday','13:00','15:00'),(374,5,'App\\Models\\Lecturer','tuesday','11:00','13:00'),(375,5,'App\\Models\\Lecturer','tuesday','09:00','11:00'),(376,5,'App\\Models\\Lecturer','wednesday','11:00','13:00'),(377,5,'App\\Models\\Lecturer','wednesday','09:00','11:00'),(378,5,'App\\Models\\Lecturer','wednesday','13:00','15:00'),(379,5,'App\\Models\\Lecturer','wednesday','17:00','19:00'),(380,5,'App\\Models\\Lecturer','thursday','17:00','19:00'),(381,5,'App\\Models\\Lecturer','thursday','15:00','17:00'),(382,5,'App\\Models\\Lecturer','thursday','13:00','15:00'),(383,5,'App\\Models\\Lecturer','thursday','11:00','13:00'),(384,5,'App\\Models\\Lecturer','thursday','09:00','11:00'),(385,19,'App\\Models\\Lecturer','sunday','09:00','11:00'),(386,19,'App\\Models\\Lecturer','monday','09:00','11:00'),(387,19,'App\\Models\\Lecturer','tuesday','09:00','11:00'),(388,19,'App\\Models\\Lecturer','wednesday','09:00','11:00'),(389,19,'App\\Models\\Lecturer','thursday','09:00','11:00'),(390,19,'App\\Models\\Lecturer','sunday','11:00','13:00'),(391,19,'App\\Models\\Lecturer','monday','11:00','13:00'),(392,19,'App\\Models\\Lecturer','tuesday','11:00','13:00'),(393,19,'App\\Models\\Lecturer','wednesday','11:00','13:00'),(394,19,'App\\Models\\Lecturer','thursday','11:00','13:00'),(395,19,'App\\Models\\Lecturer','sunday','13:00','15:00'),(396,19,'App\\Models\\Lecturer','monday','13:00','15:00'),(397,19,'App\\Models\\Lecturer','wednesday','13:00','15:00'),(398,19,'App\\Models\\Lecturer','tuesday','13:00','15:00'),(399,19,'App\\Models\\Lecturer','thursday','13:00','15:00'),(400,19,'App\\Models\\Lecturer','sunday','15:00','17:00'),(401,19,'App\\Models\\Lecturer','monday','15:00','17:00'),(402,19,'App\\Models\\Lecturer','tuesday','15:00','17:00'),(403,19,'App\\Models\\Lecturer','wednesday','15:00','17:00'),(404,19,'App\\Models\\Lecturer','thursday','15:00','17:00'),(405,19,'App\\Models\\Lecturer','sunday','17:00','19:00'),(406,19,'App\\Models\\Lecturer','monday','17:00','19:00'),(407,19,'App\\Models\\Lecturer','tuesday','17:00','19:00'),(408,19,'App\\Models\\Lecturer','wednesday','17:00','19:00'),(409,19,'App\\Models\\Lecturer','thursday','17:00','19:00'),(410,20,'App\\Models\\Lecturer','sunday','09:00','11:00'),(411,20,'App\\Models\\Lecturer','monday','09:00','11:00'),(412,20,'App\\Models\\Lecturer','tuesday','09:00','11:00'),(413,20,'App\\Models\\Lecturer','wednesday','09:00','11:00'),(414,20,'App\\Models\\Lecturer','thursday','09:00','11:00'),(415,20,'App\\Models\\Lecturer','sunday','11:00','13:00'),(416,20,'App\\Models\\Lecturer','monday','11:00','13:00'),(417,20,'App\\Models\\Lecturer','tuesday','11:00','13:00'),(418,20,'App\\Models\\Lecturer','wednesday','11:00','13:00'),(419,20,'App\\Models\\Lecturer','thursday','11:00','13:00'),(420,20,'App\\Models\\Lecturer','sunday','13:00','15:00'),(421,20,'App\\Models\\Lecturer','monday','13:00','15:00'),(422,20,'App\\Models\\Lecturer','tuesday','13:00','15:00'),(423,20,'App\\Models\\Lecturer','wednesday','13:00','15:00'),(424,20,'App\\Models\\Lecturer','thursday','13:00','15:00'),(425,20,'App\\Models\\Lecturer','sunday','15:00','17:00'),(426,20,'App\\Models\\Lecturer','monday','15:00','17:00'),(427,20,'App\\Models\\Lecturer','tuesday','15:00','17:00'),(428,20,'App\\Models\\Lecturer','wednesday','15:00','17:00'),(429,20,'App\\Models\\Lecturer','thursday','15:00','17:00'),(430,20,'App\\Models\\Lecturer','sunday','17:00','19:00'),(431,20,'App\\Models\\Lecturer','monday','17:00','19:00'),(432,20,'App\\Models\\Lecturer','tuesday','17:00','19:00'),(433,20,'App\\Models\\Lecturer','wednesday','17:00','19:00'),(434,20,'App\\Models\\Lecturer','thursday','17:00','19:00'),(435,21,'App\\Models\\Lecturer','sunday','09:00','11:00'),(436,21,'App\\Models\\Lecturer','monday','09:00','11:00'),(437,21,'App\\Models\\Lecturer','tuesday','09:00','11:00'),(438,21,'App\\Models\\Lecturer','wednesday','09:00','11:00'),(439,21,'App\\Models\\Lecturer','thursday','09:00','11:00'),(440,21,'App\\Models\\Lecturer','sunday','11:00','13:00'),(441,21,'App\\Models\\Lecturer','monday','11:00','13:00'),(442,21,'App\\Models\\Lecturer','tuesday','11:00','13:00'),(443,21,'App\\Models\\Lecturer','wednesday','11:00','13:00'),(444,21,'App\\Models\\Lecturer','thursday','11:00','13:00'),(445,21,'App\\Models\\Lecturer','sunday','13:00','15:00'),(446,21,'App\\Models\\Lecturer','monday','13:00','15:00'),(447,21,'App\\Models\\Lecturer','tuesday','13:00','15:00'),(448,21,'App\\Models\\Lecturer','wednesday','13:00','15:00'),(449,21,'App\\Models\\Lecturer','thursday','13:00','15:00'),(450,21,'App\\Models\\Lecturer','sunday','15:00','17:00'),(451,21,'App\\Models\\Lecturer','monday','15:00','17:00'),(452,21,'App\\Models\\Lecturer','tuesday','15:00','17:00'),(453,21,'App\\Models\\Lecturer','wednesday','15:00','17:00'),(454,21,'App\\Models\\Lecturer','thursday','15:00','17:00'),(455,21,'App\\Models\\Lecturer','sunday','17:00','19:00'),(456,21,'App\\Models\\Lecturer','monday','17:00','19:00'),(457,21,'App\\Models\\Lecturer','tuesday','17:00','19:00'),(458,21,'App\\Models\\Lecturer','wednesday','17:00','19:00'),(459,21,'App\\Models\\Lecturer','thursday','17:00','19:00'),(485,23,'App\\Models\\Lecturer','monday','09:00','11:00'),(486,23,'App\\Models\\Lecturer','sunday','09:00','11:00'),(487,23,'App\\Models\\Lecturer','tuesday','09:00','11:00'),(488,23,'App\\Models\\Lecturer','wednesday','09:00','11:00'),(489,23,'App\\Models\\Lecturer','thursday','09:00','11:00'),(490,23,'App\\Models\\Lecturer','sunday','11:00','13:00'),(491,23,'App\\Models\\Lecturer','monday','11:00','13:00'),(492,23,'App\\Models\\Lecturer','tuesday','11:00','13:00'),(493,23,'App\\Models\\Lecturer','wednesday','11:00','13:00'),(494,23,'App\\Models\\Lecturer','thursday','11:00','13:00'),(495,23,'App\\Models\\Lecturer','sunday','13:00','15:00'),(496,23,'App\\Models\\Lecturer','monday','13:00','15:00'),(497,23,'App\\Models\\Lecturer','tuesday','13:00','15:00'),(498,23,'App\\Models\\Lecturer','wednesday','13:00','15:00'),(499,23,'App\\Models\\Lecturer','thursday','13:00','15:00'),(500,23,'App\\Models\\Lecturer','sunday','15:00','17:00'),(501,23,'App\\Models\\Lecturer','monday','15:00','17:00'),(502,23,'App\\Models\\Lecturer','wednesday','15:00','17:00'),(503,23,'App\\Models\\Lecturer','tuesday','15:00','17:00'),(504,23,'App\\Models\\Lecturer','thursday','15:00','17:00'),(505,23,'App\\Models\\Lecturer','sunday','17:00','19:00'),(506,23,'App\\Models\\Lecturer','monday','17:00','19:00'),(507,23,'App\\Models\\Lecturer','tuesday','17:00','19:00'),(508,23,'App\\Models\\Lecturer','wednesday','17:00','19:00'),(509,23,'App\\Models\\Lecturer','thursday','17:00','19:00'),(510,9,'App\\Models\\Lecturer','sunday','09:00','11:00'),(511,9,'App\\Models\\Lecturer','monday','09:00','11:00'),(512,9,'App\\Models\\Lecturer','tuesday','09:00','11:00'),(513,9,'App\\Models\\Lecturer','wednesday','09:00','11:00'),(514,9,'App\\Models\\Lecturer','thursday','09:00','11:00'),(515,9,'App\\Models\\Lecturer','sunday','11:00','13:00'),(516,9,'App\\Models\\Lecturer','monday','11:00','13:00'),(517,9,'App\\Models\\Lecturer','tuesday','11:00','13:00'),(518,9,'App\\Models\\Lecturer','wednesday','11:00','13:00'),(519,9,'App\\Models\\Lecturer','thursday','11:00','13:00'),(520,9,'App\\Models\\Lecturer','sunday','13:00','15:00'),(521,9,'App\\Models\\Lecturer','monday','13:00','15:00'),(522,9,'App\\Models\\Lecturer','tuesday','13:00','15:00'),(523,9,'App\\Models\\Lecturer','wednesday','13:00','15:00'),(524,9,'App\\Models\\Lecturer','thursday','13:00','15:00'),(525,9,'App\\Models\\Lecturer','sunday','15:00','17:00'),(526,9,'App\\Models\\Lecturer','monday','15:00','17:00'),(527,9,'App\\Models\\Lecturer','tuesday','15:00','17:00'),(528,9,'App\\Models\\Lecturer','thursday','15:00','17:00'),(529,9,'App\\Models\\Lecturer','wednesday','15:00','17:00'),(530,9,'App\\Models\\Lecturer','sunday','17:00','19:00'),(531,9,'App\\Models\\Lecturer','monday','17:00','19:00'),(532,9,'App\\Models\\Lecturer','tuesday','17:00','19:00'),(533,9,'App\\Models\\Lecturer','wednesday','17:00','19:00'),(534,9,'App\\Models\\Lecturer','thursday','17:00','19:00'),(535,24,'App\\Models\\Lecturer','sunday','09:00','11:00'),(536,24,'App\\Models\\Lecturer','monday','09:00','11:00'),(537,24,'App\\Models\\Lecturer','tuesday','09:00','11:00'),(538,24,'App\\Models\\Lecturer','wednesday','09:00','11:00'),(539,24,'App\\Models\\Lecturer','thursday','09:00','11:00'),(540,24,'App\\Models\\Lecturer','sunday','11:00','13:00'),(541,24,'App\\Models\\Lecturer','monday','11:00','13:00'),(542,24,'App\\Models\\Lecturer','tuesday','11:00','13:00'),(543,24,'App\\Models\\Lecturer','wednesday','11:00','13:00'),(544,24,'App\\Models\\Lecturer','thursday','11:00','13:00'),(545,24,'App\\Models\\Lecturer','sunday','13:00','15:00'),(546,24,'App\\Models\\Lecturer','monday','13:00','15:00'),(547,24,'App\\Models\\Lecturer','tuesday','13:00','15:00'),(548,24,'App\\Models\\Lecturer','wednesday','13:00','15:00'),(549,24,'App\\Models\\Lecturer','thursday','13:00','15:00'),(550,24,'App\\Models\\Lecturer','sunday','15:00','17:00'),(551,24,'App\\Models\\Lecturer','monday','15:00','17:00'),(552,24,'App\\Models\\Lecturer','tuesday','15:00','17:00'),(553,24,'App\\Models\\Lecturer','wednesday','15:00','17:00'),(554,24,'App\\Models\\Lecturer','thursday','15:00','17:00'),(555,24,'App\\Models\\Lecturer','monday','17:00','19:00'),(556,24,'App\\Models\\Lecturer','sunday','17:00','19:00'),(557,24,'App\\Models\\Lecturer','wednesday','17:00','19:00'),(558,24,'App\\Models\\Lecturer','tuesday','17:00','19:00'),(559,24,'App\\Models\\Lecturer','thursday','17:00','19:00');
/*!40000 ALTER TABLE `time_preferences` ENABLE KEYS */;
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
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'hossam','hossam@gmail.com','$2y$12$tRNvHvaYM.9ObzrH9YNG2eyRYhhOq92Ytzh2PqiKpbo5M7sn91u9u',NULL,NULL,'2025-05-19 18:13:56','2025-05-19 18:13:56');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-20 12:34:20

