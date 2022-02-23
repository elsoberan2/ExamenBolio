-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.7.1-MariaDB-1:10.7.1+maria~focal - mariadb.org binary distribution
-- SO del servidor:              debian-linux-gnu
-- HeidiSQL Versión:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para apidatabase
CREATE DATABASE IF NOT EXISTS `apidatabase` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `apidatabase`;

-- Volcando estructura para tabla apidatabase.api_actors
CREATE TABLE IF NOT EXISTS `api_actors` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(250) NOT NULL,
  `lastName` varchar(250) NOT NULL,
  `age` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla apidatabase.api_actors: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `api_actors` DISABLE KEYS */;
INSERT INTO `api_actors` (`id`, `firstName`, `lastName`, `age`) VALUES
	(1, 'Miguel', 'Tostado', 25),
	(2, 'Roger', 'Almeida', 30),
	(3, 'Francisco', 'Zamudio', 28),
	(4, 'Willian', 'Cachon', 23);
/*!40000 ALTER TABLE `api_actors` ENABLE KEYS */;

-- Volcando estructura para tabla apidatabase.api_filmdirector
CREATE TABLE IF NOT EXISTS `api_filmdirector` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla apidatabase.api_filmdirector: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `api_filmdirector` DISABLE KEYS */;
INSERT INTO `api_filmdirector` (`id`, `name`) VALUES
	(1, 'Guillermo Del Toro'),
	(2, 'Jesus Jose Maria '),
	(3, 'Alma Marcela Gozo'),
	(4, 'Jacinto Perez');
/*!40000 ALTER TABLE `api_filmdirector` ENABLE KEYS */;

-- Volcando estructura para tabla apidatabase.api_movie
CREATE TABLE IF NOT EXISTS `api_movie` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `description` varchar(500) NOT NULL,
  `ranking` int(11) NOT NULL,
  `category_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `api_movie_category_id_9097c8bb_fk_api_moviecategories_id` (`category_id`),
  CONSTRAINT `api_movie_category_id_9097c8bb_fk_api_moviecategories_id` FOREIGN KEY (`category_id`) REFERENCES `api_moviecategories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla apidatabase.api_movie: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `api_movie` DISABLE KEYS */;
INSERT INTO `api_movie` (`id`, `name`, `description`, `ranking`, `category_id`) VALUES
	(1, 'Son como niños', 'God', 2, 1),
	(2, 'Son como niños 2', 'God x2', 1, 1),
	(3, 'Matrix', 'Fumada', 4, 2),
	(4, 'Secreto en la montaña ', 'xd?', 3, 3);
/*!40000 ALTER TABLE `api_movie` ENABLE KEYS */;

-- Volcando estructura para tabla apidatabase.api_moviecategories
CREATE TABLE IF NOT EXISTS `api_moviecategories` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla apidatabase.api_moviecategories: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `api_moviecategories` DISABLE KEYS */;
INSERT INTO `api_moviecategories` (`id`, `name`) VALUES
	(1, 'Comedia'),
	(2, 'Adultos'),
	(3, 'Drama');
/*!40000 ALTER TABLE `api_moviecategories` ENABLE KEYS */;

-- Volcando estructura para tabla apidatabase.api_movie_actors
CREATE TABLE IF NOT EXISTS `api_movie_actors` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `movie_id` bigint(20) NOT NULL,
  `actors_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `api_movie_actors_movie_id_actors_id_e2b26479_uniq` (`movie_id`,`actors_id`),
  KEY `api_movie_actors_actors_id_0d1d3994_fk_api_actors_id` (`actors_id`),
  CONSTRAINT `api_movie_actors_actors_id_0d1d3994_fk_api_actors_id` FOREIGN KEY (`actors_id`) REFERENCES `api_actors` (`id`),
  CONSTRAINT `api_movie_actors_movie_id_fa15de27_fk_api_movie_id` FOREIGN KEY (`movie_id`) REFERENCES `api_movie` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla apidatabase.api_movie_actors: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `api_movie_actors` DISABLE KEYS */;
INSERT INTO `api_movie_actors` (`id`, `movie_id`, `actors_id`) VALUES
	(3, 3, 1),
	(1, 3, 3),
	(6, 4, 3),
	(4, 4, 4);
/*!40000 ALTER TABLE `api_movie_actors` ENABLE KEYS */;

-- Volcando estructura para tabla apidatabase.api_movie_director
CREATE TABLE IF NOT EXISTS `api_movie_director` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `movie_id` bigint(20) NOT NULL,
  `filmdirector_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `api_movie_director_movie_id_filmdirector_id_ccb5a2c2_uniq` (`movie_id`,`filmdirector_id`),
  KEY `api_movie_director_filmdirector_id_0778aac9_fk_api_filmd` (`filmdirector_id`),
  CONSTRAINT `api_movie_director_filmdirector_id_0778aac9_fk_api_filmd` FOREIGN KEY (`filmdirector_id`) REFERENCES `api_filmdirector` (`id`),
  CONSTRAINT `api_movie_director_movie_id_301762f6_fk_api_movie_id` FOREIGN KEY (`movie_id`) REFERENCES `api_movie` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla apidatabase.api_movie_director: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `api_movie_director` DISABLE KEYS */;
INSERT INTO `api_movie_director` (`id`, `movie_id`, `filmdirector_id`) VALUES
	(4, 2, 2),
	(3, 2, 4),
	(2, 3, 1),
	(1, 3, 3);
/*!40000 ALTER TABLE `api_movie_director` ENABLE KEYS */;

-- Volcando estructura para tabla apidatabase.auth_group
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla apidatabase.auth_group: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;

-- Volcando estructura para tabla apidatabase.auth_group_permissions
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla apidatabase.auth_group_permissions: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;

-- Volcando estructura para tabla apidatabase.auth_permission
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla apidatabase.auth_permission: ~44 rows (aproximadamente)
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
	(1, 'Can add log entry', 1, 'add_logentry'),
	(2, 'Can change log entry', 1, 'change_logentry'),
	(3, 'Can delete log entry', 1, 'delete_logentry'),
	(4, 'Can view log entry', 1, 'view_logentry'),
	(5, 'Can add permission', 2, 'add_permission'),
	(6, 'Can change permission', 2, 'change_permission'),
	(7, 'Can delete permission', 2, 'delete_permission'),
	(8, 'Can view permission', 2, 'view_permission'),
	(9, 'Can add group', 3, 'add_group'),
	(10, 'Can change group', 3, 'change_group'),
	(11, 'Can delete group', 3, 'delete_group'),
	(12, 'Can view group', 3, 'view_group'),
	(13, 'Can add user', 4, 'add_user'),
	(14, 'Can change user', 4, 'change_user'),
	(15, 'Can delete user', 4, 'delete_user'),
	(16, 'Can view user', 4, 'view_user'),
	(17, 'Can add content type', 5, 'add_contenttype'),
	(18, 'Can change content type', 5, 'change_contenttype'),
	(19, 'Can delete content type', 5, 'delete_contenttype'),
	(20, 'Can view content type', 5, 'view_contenttype'),
	(21, 'Can add session', 6, 'add_session'),
	(22, 'Can change session', 6, 'change_session'),
	(23, 'Can delete session', 6, 'delete_session'),
	(24, 'Can view session', 6, 'view_session'),
	(25, 'Can add movie', 7, 'add_movie'),
	(26, 'Can change movie', 7, 'change_movie'),
	(27, 'Can delete movie', 7, 'delete_movie'),
	(28, 'Can view movie', 7, 'view_movie'),
	(29, 'Can add movie categories', 8, 'add_moviecategories'),
	(30, 'Can change movie categories', 8, 'change_moviecategories'),
	(31, 'Can delete movie categories', 8, 'delete_moviecategories'),
	(32, 'Can view movie categories', 8, 'view_moviecategories'),
	(33, 'Can add API key', 9, 'add_apikey'),
	(34, 'Can change API key', 9, 'change_apikey'),
	(35, 'Can delete API key', 9, 'delete_apikey'),
	(36, 'Can view API key', 9, 'view_apikey'),
	(37, 'Can add actors', 10, 'add_actors'),
	(38, 'Can change actors', 10, 'change_actors'),
	(39, 'Can delete actors', 10, 'delete_actors'),
	(40, 'Can view actors', 10, 'view_actors'),
	(41, 'Can add film director', 11, 'add_filmdirector'),
	(42, 'Can change film director', 11, 'change_filmdirector'),
	(43, 'Can delete film director', 11, 'delete_filmdirector'),
	(44, 'Can view film director', 11, 'view_filmdirector');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;

-- Volcando estructura para tabla apidatabase.auth_user
CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla apidatabase.auth_user: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
	(1, 'pbkdf2_sha256$320000$fFIZz7GwQKlcf2wByshsAz$bDVqsVVEzhBORHGUUCrZ41FqrlrXGtOffqufnc57HPw=', '2022-02-10 02:32:56.204318', 1, 'admin', '', '', 'admin@hotmail.com', 1, 1, '2022-02-10 02:32:46.807925'),
	(2, 'pbkdf2_sha256$320000$Veh9Y3gAXWXS481UtYeFdG$n7XIFD155v3fM9Ky1wU183lfTyWE1/+tw3+t++qbkng=', '2022-02-23 18:45:23.112859', 1, 'root', '', '', 'willycachon@hotmail.com', 1, 1, '2022-02-23 18:45:14.413441');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;

-- Volcando estructura para tabla apidatabase.auth_user_groups
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla apidatabase.auth_user_groups: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;

-- Volcando estructura para tabla apidatabase.auth_user_user_permissions
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla apidatabase.auth_user_user_permissions: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;

-- Volcando estructura para tabla apidatabase.django_admin_log
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla apidatabase.django_admin_log: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
	(1, '2022-02-10 02:34:39.992807', '7m7Cw8MB.pbkdf2_sha256$320000$A5liTHMAmAKm6gSEf12jeX$ZIYoTCY/W4CjoUa/XL4O7tkXU5Su7qe7W4vhk0tbyz0=', 'Api1', 1, '[{"added": {}}]', 9, 1),
	(2, '2022-02-23 18:45:47.519025', 'QeKJpUCt.pbkdf2_sha256$320000$6DaT9OjQ1NxBT65EtkWTzQ$XO8YM55AXh0QGPRNP2PPLJ88yZkY1LMGXKM2YIsoibk=', 'api1', 1, '[{"added": {}}]', 9, 2);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;

-- Volcando estructura para tabla apidatabase.django_content_type
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla apidatabase.django_content_type: ~11 rows (aproximadamente)
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
	(1, 'admin', 'logentry'),
	(10, 'api', 'actors'),
	(11, 'api', 'filmdirector'),
	(7, 'api', 'movie'),
	(8, 'api', 'moviecategories'),
	(3, 'auth', 'group'),
	(2, 'auth', 'permission'),
	(4, 'auth', 'user'),
	(5, 'contenttypes', 'contenttype'),
	(9, 'rest_framework_api_key', 'apikey'),
	(6, 'sessions', 'session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;

-- Volcando estructura para tabla apidatabase.django_migrations
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla apidatabase.django_migrations: ~24 rows (aproximadamente)
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
	(1, 'contenttypes', '0001_initial', '2022-02-10 01:46:59.828774'),
	(2, 'auth', '0001_initial', '2022-02-10 01:47:00.767740'),
	(3, 'admin', '0001_initial', '2022-02-10 01:47:01.020280'),
	(4, 'admin', '0002_logentry_remove_auto_add', '2022-02-10 01:47:01.059740'),
	(5, 'admin', '0003_logentry_add_action_flag_choices', '2022-02-10 01:47:01.098048'),
	(6, 'contenttypes', '0002_remove_content_type_name', '2022-02-10 01:47:01.256769'),
	(7, 'auth', '0002_alter_permission_name_max_length', '2022-02-10 01:47:01.397373'),
	(8, 'auth', '0003_alter_user_email_max_length', '2022-02-10 01:47:01.468186'),
	(9, 'auth', '0004_alter_user_username_opts', '2022-02-10 01:47:01.504335'),
	(10, 'auth', '0005_alter_user_last_login_null', '2022-02-10 01:47:01.614266'),
	(11, 'auth', '0006_require_contenttypes_0002', '2022-02-10 01:47:01.639246'),
	(12, 'auth', '0007_alter_validators_add_error_messages', '2022-02-10 01:47:01.673563'),
	(13, 'auth', '0008_alter_user_username_max_length', '2022-02-10 01:47:01.740680'),
	(14, 'auth', '0009_alter_user_last_name_max_length', '2022-02-10 01:47:01.804508'),
	(15, 'auth', '0010_alter_group_name_max_length', '2022-02-10 01:47:01.891026'),
	(16, 'auth', '0011_update_proxy_permissions', '2022-02-10 01:47:01.933511'),
	(17, 'auth', '0012_alter_user_first_name_max_length', '2022-02-10 01:47:01.995921'),
	(18, 'sessions', '0001_initial', '2022-02-10 01:47:02.097473'),
	(19, 'api', '0001_initial', '2022-02-10 02:11:45.810455'),
	(20, 'rest_framework_api_key', '0001_initial', '2022-02-10 02:24:05.630135'),
	(21, 'rest_framework_api_key', '0002_auto_20190529_2243', '2022-02-10 02:24:05.670594'),
	(22, 'rest_framework_api_key', '0003_auto_20190623_1952', '2022-02-10 02:24:05.691796'),
	(23, 'rest_framework_api_key', '0004_prefix_hashed_key', '2022-02-10 02:24:05.855565'),
	(24, 'api', '0002_actors_filmdirector_movie_actors_movie_director', '2022-02-23 19:22:58.847428');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;

-- Volcando estructura para tabla apidatabase.django_session
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla apidatabase.django_session: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
	('imzibedcugm89t9k2vx843c4wv191o35', '.eJxVjEEOwiAUBe_C2hA-H0tx6b5nIMCjUjU0Ke3KeHdt0oVu38y8l_BhW4vfWl78BHERWpx-txjSI9cd4B7qbZZprusyRbkr8qBNDjPy83q4fwcltPKtI0ZjDduQdHTUB7KEc7RZkYvcORB6raA7pxzYQikaASgwZcNMEO8P3TA3jg:1nMwdf:4WtjAKEWyRAf74l4X9ngeuwWWqYEHOHowTk45KrAcg0', '2022-03-09 18:45:23.221013'),
	('la5xb3jfu5dn24kov5oo2wso1wgj05vx', '.eJxVjDkOwjAUBe_iGlne5IWSnjNYf7FxADlSnFSIu0OkFNC-mXkvkWFbW95GWfLE4iy0OP1uCPQofQd8h36bJc19XSaUuyIPOuR15vK8HO7fQYPRvjU6g6o6m1TwkSkGXdAbXVk5a7xjZcETVEtJu-AhIiayoCCwt5oMivcH02Y3uQ:1nHzGS:shRCssmLvJdkiBVOoaUNUEqmZw92hvs0V_HDN6fIdmQ', '2022-02-24 02:32:56.206960');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;

-- Volcando estructura para tabla apidatabase.rest_framework_api_key_apikey
CREATE TABLE IF NOT EXISTS `rest_framework_api_key_apikey` (
  `id` varchar(100) NOT NULL,
  `created` datetime(6) NOT NULL,
  `name` varchar(50) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expiry_date` datetime(6) DEFAULT NULL,
  `hashed_key` varchar(100) NOT NULL,
  `prefix` varchar(8) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `prefix` (`prefix`),
  KEY `rest_framework_api_key_apikey_created_c61872d9` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla apidatabase.rest_framework_api_key_apikey: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `rest_framework_api_key_apikey` DISABLE KEYS */;
INSERT INTO `rest_framework_api_key_apikey` (`id`, `created`, `name`, `revoked`, `expiry_date`, `hashed_key`, `prefix`) VALUES
	('7m7Cw8MB.pbkdf2_sha256$320000$A5liTHMAmAKm6gSEf12jeX$ZIYoTCY/W4CjoUa/XL4O7tkXU5Su7qe7W4vhk0tbyz0=', '2022-02-10 02:34:39.992135', 'Api1', 0, NULL, 'pbkdf2_sha256$320000$A5liTHMAmAKm6gSEf12jeX$ZIYoTCY/W4CjoUa/XL4O7tkXU5Su7qe7W4vhk0tbyz0=', '7m7Cw8MB'),
	('QeKJpUCt.pbkdf2_sha256$320000$6DaT9OjQ1NxBT65EtkWTzQ$XO8YM55AXh0QGPRNP2PPLJ88yZkY1LMGXKM2YIsoibk=', '2022-02-23 18:45:47.517402', 'api1', 0, NULL, 'pbkdf2_sha256$320000$6DaT9OjQ1NxBT65EtkWTzQ$XO8YM55AXh0QGPRNP2PPLJ88yZkY1LMGXKM2YIsoibk=', 'QeKJpUCt');
/*!40000 ALTER TABLE `rest_framework_api_key_apikey` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
