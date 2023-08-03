-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         8.0.30 - MySQL Community Server - GPL
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para dblogin
DROP DATABASE IF EXISTS `dblogin`;
CREATE DATABASE IF NOT EXISTS `dblogin` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `dblogin`;

-- Volcando estructura para tabla dblogin.catpersons
DROP TABLE IF EXISTS `catpersons`;
CREATE TABLE IF NOT EXISTS `catpersons` (
  `personId` int NOT NULL AUTO_INCREMENT,
  `personName` varchar(50) NOT NULL,
  `personLName` varchar(80) DEFAULT NULL,
  `personEmail` varchar(150) NOT NULL,
  `personPhone` varchar(20) NOT NULL,
  `dtCreatedAt` datetime DEFAULT NULL,
  `bActive` bit(1) DEFAULT b'1',
  PRIMARY KEY (`personId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla dblogin.catpersons: ~6 rows (aproximadamente)
DELETE FROM `catpersons`;
INSERT INTO `catpersons` (`personId`, `personName`, `personLName`, `personEmail`, `personPhone`, `dtCreatedAt`, `bActive`) VALUES
	(1, 'Super Admin', 'Sistema', 'laboratorios_ti@utem.edu.mx', '3140000001', '2023-05-24 13:55:39', b'1'),
	(2, 'Administrador', 'Biblioteca', 'admin-biblio@utem.edu.mx', '3140000002', '2023-05-24 13:55:39', b'1'),
	(3, 'Director', 'Carrera TI', 'direccion-ti@utem.edu.mx', '3140000003', '2023-05-24 13:55:39', b'1'),
	(4, 'Docente', 'TI', 'docente-ti@utem.edu.mx', '3140000004', '2023-05-24 13:55:39', b'1'),
	(5, 'Alumno', 'Pruebas1', 'a20230001@utem.edu.mx', '3140000005', '2023-05-24 13:55:39', b'1'),
	(6, 'Externo', 'CETis', 'laboratorios_ti@utem.edu.mx', '3140000006', '2023-05-24 13:55:39', b'1');

-- Volcando estructura para tabla dblogin.catusers
DROP TABLE IF EXISTS `catusers`;
CREATE TABLE IF NOT EXISTS `catusers` (
  `userId` int NOT NULL AUTO_INCREMENT,
  `fk_personId` int DEFAULT NULL,
  `fk_UserTypeId` int DEFAULT NULL,
  `cveUser` varchar(20) NOT NULL,
  `userPass` varchar(50) NOT NULL,
  `departament` varchar(50) DEFAULT NULL,
  `groupStdnt` varchar(20) DEFAULT NULL,
  `career` varchar(100) DEFAULT NULL,
  `dependence` varchar(200) DEFAULT NULL,
  `dtCreatedAt` datetime DEFAULT NULL,
  `bActive` bit(1) DEFAULT b'1',
  PRIMARY KEY (`userId`),
  KEY `fk_personId` (`fk_personId`),
  KEY `fk_UserTypeId` (`fk_UserTypeId`),
  CONSTRAINT `catusers_ibfk_1` FOREIGN KEY (`fk_personId`) REFERENCES `catpersons` (`personId`),
  CONSTRAINT `catusers_ibfk_2` FOREIGN KEY (`fk_UserTypeId`) REFERENCES `catusertypes` (`userTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla dblogin.catusers: ~6 rows (aproximadamente)
DELETE FROM `catusers`;
INSERT INTO `catusers` (`userId`, `fk_personId`, `fk_UserTypeId`, `cveUser`, `userPass`, `departament`, `groupStdnt`, `career`, `dependence`, `dtCreatedAt`, `bActive`) VALUES
	(1, 1, 1, 'ADMIN001', 'admin123', 'Sistemas', ' ', ' ', ' ', '2023-05-24 14:00:39', b'1'),
	(2, 2, 2, 'ADBI001', 'admin2023', 'Servicios Escolares', '', '', '', '2023-05-24 14:00:39', b'1'),
	(4, 3, 3, 'DCTI0012', 'director2023', 'Dirección Académica', '', 'TSU e ING en TI', '', '2023-05-24 14:00:39', b'1'),
	(5, 4, 4, 'PTC180399', 'docente2023', 'Dirección Académica', '', 'ING en TI', '', '2023-05-24 14:00:39', b'1'),
	(6, 5, 5, 'AL20230001', 'alumno2023', 'Escolares/Académico', '3TID1', 'TSU en TI', '', '2023-05-24 14:00:39', b'1'),
	(7, 6, 6, 'EX20230001', 'externo2023', '', '', '', 'CEtis', '2023-05-24 14:00:39', b'1');

-- Volcando estructura para tabla dblogin.catusertypes
DROP TABLE IF EXISTS `catusertypes`;
CREATE TABLE IF NOT EXISTS `catusertypes` (
  `userTypeId` int NOT NULL AUTO_INCREMENT,
  `userType` varchar(50) NOT NULL,
  `typeDesc` varchar(200) DEFAULT NULL,
  `dtCreatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`userTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla dblogin.catusertypes: ~6 rows (aproximadamente)
DELETE FROM `catusertypes`;
INSERT INTO `catusertypes` (`userTypeId`, `userType`, `typeDesc`, `dtCreatedAt`) VALUES
	(1, 'Super Administrador', NULL, '2023-05-24 13:34:40'),
	(2, 'Administrador Biblioteca', NULL, '2023-05-24 13:39:38'),
	(3, 'Administrativo', NULL, '2023-05-24 13:39:37'),
	(4, 'Docente', NULL, '2023-05-24 13:39:36'),
	(5, 'Alumno', NULL, '2023-05-24 13:39:36'),
	(6, 'Externo', NULL, '2023-05-24 13:39:35');

-- Volcando estructura para tabla dblogin.sessions
DROP TABLE IF EXISTS `sessions`;
CREATE TABLE IF NOT EXISTS `sessions` (
  `sessionId` int NOT NULL AUTO_INCREMENT,
  `fk_userId` int NOT NULL,
  `cveSession` int NOT NULL,
  `dtLogIn` datetime DEFAULT NULL,
  `dtLogOut` datetime DEFAULT NULL,
  `bActive` bit(1) DEFAULT b'1',
  PRIMARY KEY (`sessionId`),
  KEY `fk_userId` (`fk_userId`),
  CONSTRAINT `sessions_ibfk_1` FOREIGN KEY (`fk_userId`) REFERENCES `catusers` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla dblogin.sessions: ~0 rows (aproximadamente)
DELETE FROM `sessions`;

-- Volcando estructura para vista dblogin.usersactive
DROP VIEW IF EXISTS `usersactive`;
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `usersactive` (
	`uId` INT(10) NOT NULL,
	`userCode` VARCHAR(20) NOT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`Pass` VARCHAR(50) NOT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`UserType` INT(10) NULL
) ENGINE=MyISAM;

-- Volcando estructura para vista dblogin.vwadministrativos
DROP VIEW IF EXISTS `vwadministrativos`;
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `vwadministrativos` (
	`user_id` INT(10) NOT NULL,
	`NumTrab` VARCHAR(20) NOT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`Departamento_Area` VARCHAR(50) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`userActive` BIT(1) NULL,
	`Nombre_Admin` VARCHAR(50) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`Apellidos_Admin` VARCHAR(80) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`Nombre_Completo_Admin` VARCHAR(131) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`Email_Admin` VARCHAR(150) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`Telefono_Admin` VARCHAR(20) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`userTypeId` INT(10) NULL,
	`userType` VARCHAR(50) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`typeDesc` VARCHAR(200) NULL COLLATE 'utf8mb4_0900_ai_ci'
) ENGINE=MyISAM;

-- Volcando estructura para vista dblogin.vwadmins
DROP VIEW IF EXISTS `vwadmins`;
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `vwadmins` (
	`user_id` INT(10) NOT NULL,
	`user_code` VARCHAR(20) NOT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`departament` VARCHAR(50) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`userActive` BIT(1) NULL,
	`first_name` VARCHAR(50) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`last_name` VARCHAR(80) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`email` VARCHAR(150) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`phone` VARCHAR(20) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`userTypeId` INT(10) NULL,
	`userType` VARCHAR(50) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`typeDesc` VARCHAR(200) NULL COLLATE 'utf8mb4_0900_ai_ci'
) ENGINE=MyISAM;

-- Volcando estructura para vista dblogin.vwallusersdata
DROP VIEW IF EXISTS `vwallusersdata`;
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `vwallusersdata` (
	`user_id` INT(10) NOT NULL,
	`user_code` VARCHAR(20) NOT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`departament` VARCHAR(50) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`std_group` VARCHAR(20) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`career` VARCHAR(100) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`dependence` VARCHAR(200) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`userActive` BIT(1) NULL,
	`first_name` VARCHAR(50) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`last_name` VARCHAR(80) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`email` VARCHAR(150) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`phone` VARCHAR(20) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`userTypeId` INT(10) NULL,
	`userType` VARCHAR(50) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`typeDesc` VARCHAR(200) NULL COLLATE 'utf8mb4_0900_ai_ci'
) ENGINE=MyISAM;

-- Volcando estructura para vista dblogin.vwalumnos
DROP VIEW IF EXISTS `vwalumnos`;
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `vwalumnos` (
	`user_id` INT(10) NOT NULL,
	`NumCtrl` VARCHAR(20) NOT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`Grupo` VARCHAR(20) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`Carrera` VARCHAR(100) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`userActive` BIT(1) NULL,
	`Nombre_Alumno` VARCHAR(50) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`Apellidos_Alumno` VARCHAR(80) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`Nombre_Completo_Alumno` VARCHAR(131) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`Email_Alumno` VARCHAR(150) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`Telefono_Alumno` VARCHAR(20) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`userTypeId` INT(10) NULL,
	`userType` VARCHAR(50) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`typeDesc` VARCHAR(200) NULL COLLATE 'utf8mb4_0900_ai_ci'
) ENGINE=MyISAM;

-- Volcando estructura para vista dblogin.vwdocente
DROP VIEW IF EXISTS `vwdocente`;
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `vwdocente` (
	`user_id` INT(10) NOT NULL,
	`NumTrab` VARCHAR(20) NOT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`Departamento_Area` VARCHAR(50) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`Carrera` VARCHAR(100) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`userActive` BIT(1) NULL,
	`Nombre_Docente` VARCHAR(50) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`Apellidos_Docente` VARCHAR(80) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`Nombre_Completo_Docente` VARCHAR(131) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`Email_Docente` VARCHAR(150) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`Telefono_Docente` VARCHAR(20) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`userTypeId` INT(10) NULL,
	`userType` VARCHAR(50) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`typeDesc` VARCHAR(200) NULL COLLATE 'utf8mb4_0900_ai_ci'
) ENGINE=MyISAM;

-- Volcando estructura para vista dblogin.vwexternos
DROP VIEW IF EXISTS `vwexternos`;
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `vwexternos` (
	`user_id` INT(10) NOT NULL,
	`cveExterno` VARCHAR(20) NOT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`Dependencia` VARCHAR(200) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`userActive` BIT(1) NULL,
	`Nombre_Externo` VARCHAR(50) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`Apellidos_Externo` VARCHAR(80) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`Nombre_Completo_Externo` VARCHAR(131) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`Email_Externo` VARCHAR(150) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`Telefono_Externo` VARCHAR(20) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`userTypeId` INT(10) NULL,
	`userType` VARCHAR(50) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`typeDesc` VARCHAR(200) NULL COLLATE 'utf8mb4_0900_ai_ci'
) ENGINE=MyISAM;

-- Volcando estructura para vista dblogin.usersactive
DROP VIEW IF EXISTS `usersactive`;
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `usersactive`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `usersactive` AS select `catusers`.`userId` AS `uId`,`catusers`.`cveUser` AS `userCode`,`catusers`.`userPass` AS `Pass`,`catusers`.`fk_UserTypeId` AS `UserType` from `catusers` where (`catusers`.`bActive` = 1);

-- Volcando estructura para vista dblogin.vwadministrativos
DROP VIEW IF EXISTS `vwadministrativos`;
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `vwadministrativos`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vwadministrativos` AS select `u`.`userId` AS `user_id`,`u`.`cveUser` AS `NumTrab`,`u`.`departament` AS `Departamento_Area`,`u`.`bActive` AS `userActive`,`p`.`personName` AS `Nombre_Admin`,`p`.`personLName` AS `Apellidos_Admin`,concat(`p`.`personName`,' ',`p`.`personLName`) AS `Nombre_Completo_Admin`,`p`.`personEmail` AS `Email_Admin`,`p`.`personPhone` AS `Telefono_Admin`,`t`.`userTypeId` AS `userTypeId`,`t`.`userType` AS `userType`,`t`.`typeDesc` AS `typeDesc` from ((`catusers` `u` left join `catpersons` `p` on((`u`.`fk_personId` = `p`.`personId`))) left join `catusertypes` `t` on((`u`.`fk_UserTypeId` = `t`.`userTypeId`))) where (`t`.`userTypeId` = 3);

-- Volcando estructura para vista dblogin.vwadmins
DROP VIEW IF EXISTS `vwadmins`;
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `vwadmins`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vwadmins` AS select `u`.`userId` AS `user_id`,`u`.`cveUser` AS `user_code`,`u`.`departament` AS `departament`,`u`.`bActive` AS `userActive`,`p`.`personName` AS `first_name`,`p`.`personLName` AS `last_name`,`p`.`personEmail` AS `email`,`p`.`personPhone` AS `phone`,`t`.`userTypeId` AS `userTypeId`,`t`.`userType` AS `userType`,`t`.`typeDesc` AS `typeDesc` from ((`catusers` `u` left join `catpersons` `p` on((`u`.`fk_personId` = `p`.`personId`))) left join `catusertypes` `t` on((`u`.`fk_UserTypeId` = `t`.`userTypeId`))) where (`t`.`userTypeId` between 1 and 2);

-- Volcando estructura para vista dblogin.vwallusersdata
DROP VIEW IF EXISTS `vwallusersdata`;
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `vwallusersdata`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vwallusersdata` AS select `u`.`userId` AS `user_id`,`u`.`cveUser` AS `user_code`,`u`.`departament` AS `departament`,`u`.`groupStdnt` AS `std_group`,`u`.`career` AS `career`,`u`.`dependence` AS `dependence`,`u`.`bActive` AS `userActive`,`p`.`personName` AS `first_name`,`p`.`personLName` AS `last_name`,`p`.`personEmail` AS `email`,`p`.`personPhone` AS `phone`,`t`.`userTypeId` AS `userTypeId`,`t`.`userType` AS `userType`,`t`.`typeDesc` AS `typeDesc` from ((`catusers` `u` left join `catpersons` `p` on((`u`.`fk_personId` = `p`.`personId`))) left join `catusertypes` `t` on((`u`.`fk_UserTypeId` = `t`.`userTypeId`)));

-- Volcando estructura para vista dblogin.vwalumnos
DROP VIEW IF EXISTS `vwalumnos`;
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `vwalumnos`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vwalumnos` AS select `u`.`userId` AS `user_id`,`u`.`cveUser` AS `NumCtrl`,`u`.`groupStdnt` AS `Grupo`,`u`.`career` AS `Carrera`,`u`.`bActive` AS `userActive`,`p`.`personName` AS `Nombre_Alumno`,`p`.`personLName` AS `Apellidos_Alumno`,concat(`p`.`personName`,' ',`p`.`personLName`) AS `Nombre_Completo_Alumno`,`p`.`personEmail` AS `Email_Alumno`,`p`.`personPhone` AS `Telefono_Alumno`,`t`.`userTypeId` AS `userTypeId`,`t`.`userType` AS `userType`,`t`.`typeDesc` AS `typeDesc` from ((`catusers` `u` left join `catpersons` `p` on((`u`.`fk_personId` = `p`.`personId`))) left join `catusertypes` `t` on((`u`.`fk_UserTypeId` = `t`.`userTypeId`))) where (`t`.`userTypeId` = 5);

-- Volcando estructura para vista dblogin.vwdocente
DROP VIEW IF EXISTS `vwdocente`;
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `vwdocente`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vwdocente` AS select `u`.`userId` AS `user_id`,`u`.`cveUser` AS `NumTrab`,`u`.`departament` AS `Departamento_Area`,`u`.`career` AS `Carrera`,`u`.`bActive` AS `userActive`,`p`.`personName` AS `Nombre_Docente`,`p`.`personLName` AS `Apellidos_Docente`,concat(`p`.`personName`,' ',`p`.`personLName`) AS `Nombre_Completo_Docente`,`p`.`personEmail` AS `Email_Docente`,`p`.`personPhone` AS `Telefono_Docente`,`t`.`userTypeId` AS `userTypeId`,`t`.`userType` AS `userType`,`t`.`typeDesc` AS `typeDesc` from ((`catusers` `u` left join `catpersons` `p` on((`u`.`fk_personId` = `p`.`personId`))) left join `catusertypes` `t` on((`u`.`fk_UserTypeId` = `t`.`userTypeId`))) where (`t`.`userTypeId` = 4);

-- Volcando estructura para vista dblogin.vwexternos
DROP VIEW IF EXISTS `vwexternos`;
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `vwexternos`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vwexternos` AS select `u`.`userId` AS `user_id`,`u`.`cveUser` AS `cveExterno`,`u`.`dependence` AS `Dependencia`,`u`.`bActive` AS `userActive`,`p`.`personName` AS `Nombre_Externo`,`p`.`personLName` AS `Apellidos_Externo`,concat(`p`.`personName`,' ',`p`.`personLName`) AS `Nombre_Completo_Externo`,`p`.`personEmail` AS `Email_Externo`,`p`.`personPhone` AS `Telefono_Externo`,`t`.`userTypeId` AS `userTypeId`,`t`.`userType` AS `userType`,`t`.`typeDesc` AS `typeDesc` from ((`catusers` `u` left join `catpersons` `p` on((`u`.`fk_personId` = `p`.`personId`))) left join `catusertypes` `t` on((`u`.`fk_UserTypeId` = `t`.`userTypeId`))) where (`t`.`userTypeId` = 6);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
