-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         5.7.24-log - MySQL Community Server (GPL)
-- SO del servidor:              Win32
-- HeidiSQL Versión:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para appbienes
CREATE DATABASE IF NOT EXISTS `appbienes` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `appbienes`;

-- Volcando estructura para tabla appbienes.banners
CREATE TABLE IF NOT EXISTS `banners` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `archivo` varchar(255) DEFAULT NULL,
  `estatus` varchar(255) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla appbienes.banners: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `banners` DISABLE KEYS */;
INSERT INTO `banners` (`id`, `archivo`, `estatus`, `fecha`, `titulo`) VALUES
	(8, 'MEJ90XV8uce.jpg', 'Activo', '2019-10-24 00:26:40', 'uce'),
	(9, 'YTYUDTZ2titulo.jpg', 'Activo', '2019-10-23 10:40:21', 'titulo'),
	(10, 'HF28XMZPcivil.jpg', 'Activo', '2019-10-23 20:47:25', 'civil');
/*!40000 ALTER TABLE `banners` ENABLE KEYS */;

-- Volcando estructura para tabla appbienes.bienes
CREATE TABLE IF NOT EXISTS `bienes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `alta_anterior` varchar(255) DEFAULT NULL,
  `alta` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `costo` double DEFAULT NULL,
  `depresiacion` int(11) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `fecha_ingreso` datetime DEFAULT NULL,
  `garantia` datetime DEFAULT NULL,
  `material` varchar(255) DEFAULT NULL,
  `serial` varchar(255) DEFAULT NULL,
  `vida_util` int(11) NOT NULL,
  `control` varchar(50) NOT NULL DEFAULT '',
  `id_detalle` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKq137l3yi4oevo4q1upvtn9l6l` (`id_detalle`),
  CONSTRAINT `FKq137l3yi4oevo4q1upvtn9l6l` FOREIGN KEY (`id_detalle`) REFERENCES `detalles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla appbienes.bienes: ~9 rows (aproximadamente)
/*!40000 ALTER TABLE `bienes` DISABLE KEYS */;
INSERT INTO `bienes` (`id`, `alta_anterior`, `alta`, `color`, `costo`, `depresiacion`, `descripcion`, `fecha_ingreso`, `garantia`, `material`, `serial`, `vida_util`, `control`, `id_detalle`) VALUES
	(38, '253555', '9173645', 'Negro', 400, 2, 'PROYECTOR  PARA IMAGEN INCLUYE CABLES CONTROL REMOTO ', '2019-10-25 12:12:42', '2020-08-22 00:00:00', 'Plástico', '5001777', 2, 'Activo', 39),
	(39, '239785', '7112883', 'Negro', 450, 2, 'C.P.U.', '2019-10-25 12:14:42', '2020-03-31 00:00:00', 'Metal', 'S/S', 2, 'Activo', 40),
	(40, '239837', '7112930', 'Negro', 150, 2, 'MONITOR, PLANO', '2019-10-25 12:29:42', '2020-08-22 00:00:00', 'LCD', '006TPTM28849', 2, 'Activo', 41),
	(41, '253291', '7113054', 'Negro', 15, 2, 'MOUSE', '2019-10-25 12:20:01', '2020-08-22 00:00:00', 'Plástico', 'S/S', 2, 'Activo', 42),
	(42, '253346', '7113099', 'Negro', 21, 2, 'TECLADO', '2019-10-25 12:22:37', '2020-08-22 00:00:00', 'Plástico', 'S/S', 2, 'Activo', 43),
	(43, '232854', '9173630', 'Blanco', 250, 2, 'PANTALLA DE PROYECCION, MANUAL, DE: 1.80 X 1.80 MTS.', '2019-10-25 12:25:35', '2020-08-22 00:00:00', 'Plástico', 'S/S', 2, 'Activo', 44),
	(44, '253561', '9173650', 'Negro', 500, 2, 'PROYECTOR  PARA IMAGEN INCLUYE CABLES CONTROL REMOTO ', '2019-10-25 12:36:34', '2020-08-22 00:00:00', 'Plástico', '5001749', 2, 'Activo', 45),
	(45, '248750', '7113026', 'Negro', 300, 2, 'CPU., CLON, CORE I3, DE 3.2 GHZ DE VELOCIDAD, 4 GB DE MEMORIA, 500 GB DE DISCO DURO, DVD-WR.', '2019-10-25 13:37:03', '2020-08-22 00:00:00', 'Circuitos Electrónicos', 'S/S', 2, 'Activo', 46),
	(46, '248660', '7113025', 'Negro', 150, 2, 'MONITOR PANTALLA PLANA DE 21"', '2019-10-25 13:42:45', '2020-08-22 00:00:00', 'LCD', '203NDCR4T699', 2, 'Activo', 47);
/*!40000 ALTER TABLE `bienes` ENABLE KEYS */;

-- Volcando estructura para tabla appbienes.bienes_estaciones
CREATE TABLE IF NOT EXISTS `bienes_estaciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_bien` int(11) NOT NULL,
  `id_estacion` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_bien` (`id_bien`),
  KEY `bienes_estaciones_ibfk_2` (`id_estacion`),
  CONSTRAINT `bienes_estaciones_ibfk_1` FOREIGN KEY (`id_bien`) REFERENCES `bienes` (`id`),
  CONSTRAINT `bienes_estaciones_ibfk_2` FOREIGN KEY (`id_estacion`) REFERENCES `estaciones` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla appbienes.bienes_estaciones: ~9 rows (aproximadamente)
/*!40000 ALTER TABLE `bienes_estaciones` DISABLE KEYS */;
INSERT INTO `bienes_estaciones` (`id`, `id_bien`, `id_estacion`) VALUES
	(70, 38, 21),
	(71, 39, 21),
	(72, 40, 21),
	(73, 41, 21),
	(75, 42, 21),
	(76, 43, 21),
	(77, 44, 22),
	(78, 45, 22),
	(79, 46, 22);
/*!40000 ALTER TABLE `bienes_estaciones` ENABLE KEYS */;

-- Volcando estructura para tabla appbienes.detalles
CREATE TABLE IF NOT EXISTS `detalles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `asignado` varchar(255) DEFAULT NULL,
  `causionado` varchar(255) DEFAULT NULL,
  `estado` varchar(255) DEFAULT NULL,
  `estatus` varchar(255) DEFAULT NULL,
  `guarda_almacen` varchar(255) DEFAULT NULL,
  `marca` varchar(255) DEFAULT NULL,
  `modelo` varchar(255) DEFAULT NULL,
  `tipo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla appbienes.detalles: ~9 rows (aproximadamente)
/*!40000 ALTER TABLE `detalles` DISABLE KEYS */;
INSERT INTO `detalles` (`id`, `asignado`, `causionado`, `estado`, `estatus`, `guarda_almacen`, `marca`, `modelo`, `tipo`) VALUES
	(39, 'Profesor', 'RAMIRO PILALUISA', 'Bueno', 'Activo', 'UDAY ORTIZ BERTHA JIMENA', 'SONY', 'VPL-EX275', 'MAQUINARIA Y EQUIPO'),
	(40, 'Profesor', 'RAMIRO PILALUISA', 'Bueno', 'Activo', 'UDAY ORTIZ BERTHA JIMENA', 'FLAME', 'S/M', 'MAQUINARIA Y EQUIPO'),
	(41, 'Profesor', 'RAMIRO PILALUISA', 'Bueno', 'Activo', 'UDAY ORTIZ BERTHA JIMENA', 'L.G.', 'W2243ST', 'MAQUINARIA Y EQUIPO'),
	(42, 'Profesor', 'RAMIRO PILALUISA', 'Bueno', 'Activo', 'UDAY ORTIZ BERTHA JIMENA', 'ADIKT@', 'S/M', 'MAQUINARIA Y EQUIPO'),
	(43, 'Profesor', 'RAMIRO PILALUISA', 'Bueno', 'Activo', 'UDAY ORTIZ BERTHA JIMENA', 'ADIKT@', 'S/M', 'MAQUINARIA Y EQUIPO'),
	(44, 'Profesor', 'RAMIRO PILALUISA', 'Bueno', 'Activo', 'UDAY ORTIZ BERTHA JIMENA', 'OMEGA', 'S/M', 'MAQUINARIA Y EQUIPO'),
	(45, 'Profesor', 'RAMIRO PILALUISA', 'Bueno', 'Activo', 'UDAY ORTIZ BERTHA JIMENA', 'SONY', 'VPL-EX275', 'MAQUINARIA Y EQUIPO'),
	(46, 'Profesor', 'RAMIRO PILALUISA', 'Bueno', 'Activo', 'UDAY ORTIZ BERTHA JIMENA', 'S/M', 'S/M', 'MAQUINARIA Y EQUIPO'),
	(47, 'Profesor', 'RAMIRO PILALUISA', 'Bueno', 'Activo', 'UDAY ORTIZ BERTHA JIMENA', 'L.G.', 'E2242C', 'MAQUINARIA Y EQUIPO');
/*!40000 ALTER TABLE `detalles` ENABLE KEYS */;

-- Volcando estructura para tabla appbienes.estaciones
CREATE TABLE IF NOT EXISTS `estaciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `imagen` varchar(255) DEFAULT NULL,
  `lugar` varchar(255) DEFAULT NULL,
  `ubicacion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla appbienes.estaciones: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `estaciones` DISABLE KEYS */;
INSERT INTO `estaciones` (`id`, `imagen`, `lugar`, `ubicacion`) VALUES
	(21, 'PYRW6SU5SalaA.jpg', 'Sala A', 'LAB . CÓMPUTO INGENIERÍA CIVIL N°2'),
	(22, 'PBJF0CNASalaB.jpg', 'Sala B', 'LAB . CÓMPUTO INGENIERÍA CIVIL N°1'),
	(30, '8EGAHVQ5SalaC.jpg', 'Sala C', 'Laboratorios Civil');
/*!40000 ALTER TABLE `estaciones` ENABLE KEYS */;

-- Volcando estructura para tabla appbienes.noticias
CREATE TABLE IF NOT EXISTS `noticias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `detalle` varchar(255) DEFAULT NULL,
  `estatus` varchar(255) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla appbienes.noticias: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `noticias` DISABLE KEYS */;
INSERT INTO `noticias` (`id`, `detalle`, `estatus`, `fecha`, `titulo`) VALUES
	(3, '<p>Utilizar JS para el DOM</p>', 'Activa', '2019-10-23 20:47:45', 'Creando Búsquedas '),
	(4, '<p>Crear un atributo \'no se \'</p>\r\n<p>Contructor por defecto habil</p>\r\n<p>Buscar todos los bienes habiles</p>\r\n<p>Cuando se asigne modifocar el \'no se \' a inabil</p>', 'Activa', '2019-10-23 15:37:36', 'Solo mostrar los que aun no estan asignados '),
	(5, '<p>Implemnetar los metodos editar y eliminar Para los Usuarios</p>\r\n<p>Tomar en cuenta que al eliminar se debe borrar tambien el rol al cual esta asignado</p>\r\n<p>y en editar se debe tambien poder cambiar de rol</p>', 'Activa', '2019-10-25 00:21:49', 'Para el vienes');
/*!40000 ALTER TABLE `noticias` ENABLE KEYS */;

-- Volcando estructura para tabla appbienes.perfiles
CREATE TABLE IF NOT EXISTS `perfiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cuenta` varchar(100) NOT NULL,
  `perfil` varchar(70) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `authorities_idx_2` (`cuenta`,`perfil`),
  UNIQUE KEY `cuenta_perfil_UNIQUE` (`cuenta`,`perfil`),
  CONSTRAINT `authorities_ibfk_2` FOREIGN KEY (`cuenta`) REFERENCES `usuarios` (`cuenta`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla appbienes.perfiles: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `perfiles` DISABLE KEYS */;
INSERT INTO `perfiles` (`id`, `cuenta`, `perfil`) VALUES
	(1, 'dscumbajin', 'ADMINISTRADOR'),
	(2, 'wssalazar', 'ESTANDAR');
/*!40000 ALTER TABLE `perfiles` ENABLE KEYS */;

-- Volcando estructura para tabla appbienes.usuarios
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cuenta` varchar(100) NOT NULL,
  `pwd` varchar(100) NOT NULL,
  `activo` tinyint(1) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telefono` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cuenta_UNIQUE` (`cuenta`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla appbienes.usuarios: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` (`id`, `cuenta`, `pwd`, `activo`, `email`, `telefono`) VALUES
	(1, 'dscumbajin', '$2a$10$CnYDdJvlpwXWIfe0iaH4POd/5KmTA9Jj7bhTjUen.HqkSXpYxL5MK', 1, 'dscumbajin@uce.edu.ec', '022087386'),
	(2, 'wssalazar', '$2a$10$GLMYSHnZwmm4RyRL/dYRBO.Kyv4dSsU8mLoUs/Fc9LiWsWYhvEAL6', 1, 'wssalazar@uce.edu.ec', '022965865');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
