-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: localhost    Database: geesat
-- ------------------------------------------------------
-- Server version	8.0.45

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
-- Table structure for table `curso`
--

DROP TABLE IF EXISTS `curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `curso` (
  `idcurso` int NOT NULL AUTO_INCREMENT,
  `nombre_curso` varchar(45) NOT NULL,
  `nivel` varchar(45) NOT NULL,
  `letra` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idcurso`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curso`
--

LOCK TABLES `curso` WRITE;
/*!40000 ALTER TABLE `curso` DISABLE KEYS */;
INSERT INTO `curso` VALUES (1,'4to Medio A','Secundaria','A');
/*!40000 ALTER TABLE `curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estudiantes`
--

DROP TABLE IF EXISTS `estudiantes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estudiantes` (
  `idestudiantes` int NOT NULL AUTO_INCREMENT,
  `rut` varchar(12) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `especialidad` varchar(45) DEFAULT NULL,
  `idcurso` int DEFAULT NULL,
  PRIMARY KEY (`idestudiantes`),
  UNIQUE KEY `rut` (`rut`),
  KEY `fk_estudiantes_curso` (`idcurso`),
  CONSTRAINT `fk_estudiantes_curso` FOREIGN KEY (`idcurso`) REFERENCES `curso` (`idcurso`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estudiantes`
--

LOCK TABLES `estudiantes` WRITE;
/*!40000 ALTER TABLE `estudiantes` DISABLE KEYS */;
INSERT INTO `estudiantes` VALUES (1,'21.234.567-8','Juan','Pérez','Programación',1);
/*!40000 ALTER TABLE `estudiantes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profesores`
--

DROP TABLE IF EXISTS `profesores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profesores` (
  `idprofesores` int NOT NULL AUTO_INCREMENT,
  `rut` varchar(12) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `especialidad` varchar(100) DEFAULT NULL,
  `idusuario` int DEFAULT NULL,
  PRIMARY KEY (`idprofesores`),
  UNIQUE KEY `rut` (`rut`),
  KEY `fk_profesores_usuarios1` (`idusuario`),
  CONSTRAINT `fk_profesores_usuarios1` FOREIGN KEY (`idusuario`) REFERENCES `usuarios` (`idusuarios`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profesores`
--

LOCK TABLES `profesores` WRITE;
/*!40000 ALTER TABLE `profesores` DISABLE KEYS */;
INSERT INTO `profesores` VALUES (1,'15.432.109-K','Carlos','Mendoza','Informática',1);
/*!40000 ALTER TABLE `profesores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salida_participante`
--

DROP TABLE IF EXISTS `salida_participante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salida_participante` (
  `idsalida_participante` int NOT NULL AUTO_INCREMENT,
  `idsalida_terreno` int NOT NULL,
  `idestudiantes` int NOT NULL,
  PRIMARY KEY (`idsalida_participante`),
  KEY `fk_participante_salida` (`idsalida_terreno`),
  KEY `fk_participante_estudiante` (`idestudiantes`),
  CONSTRAINT `fk_participante_estudiante` FOREIGN KEY (`idestudiantes`) REFERENCES `estudiantes` (`idestudiantes`) ON DELETE CASCADE,
  CONSTRAINT `fk_participante_salida` FOREIGN KEY (`idsalida_terreno`) REFERENCES `salida_terreno` (`idsalida_terreno`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salida_participante`
--

LOCK TABLES `salida_participante` WRITE;
/*!40000 ALTER TABLE `salida_participante` DISABLE KEYS */;
INSERT INTO `salida_participante` VALUES (1,1,1);
/*!40000 ALTER TABLE `salida_participante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salida_terreno`
--

DROP TABLE IF EXISTS `salida_terreno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salida_terreno` (
  `idsalida_terreno` int NOT NULL AUTO_INCREMENT,
  `nombre_salida` varchar(100) NOT NULL,
  `fecha_salida` date NOT NULL,
  `hora_salida` time DEFAULT NULL,
  `hora_regreso` time DEFAULT NULL,
  `lugar` varchar(100) DEFAULT NULL,
  `motivo` text,
  `estado` varchar(45) NOT NULL DEFAULT 'Pendiente',
  `idprofesor` int NOT NULL,
  PRIMARY KEY (`idsalida_terreno`),
  KEY `fk_salida_terreno_profesores1` (`idprofesor`),
  CONSTRAINT `fk_salida_terreno_profesores1` FOREIGN KEY (`idprofesor`) REFERENCES `profesores` (`idprofesores`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salida_terreno`
--

LOCK TABLES `salida_terreno` WRITE;
/*!40000 ALTER TABLE `salida_terreno` DISABLE KEYS */;
INSERT INTO `salida_terreno` VALUES (1,'Visita Congreso Nacional','2026-11-12','08:30:00','16:00:00','Valparaíso','Salida Cívica','Pendiente',1);
/*!40000 ALTER TABLE `salida_terreno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `idusuarios` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `contraseña` varchar(150) NOT NULL,
  `rol` varchar(30) NOT NULL,
  PRIMARY KEY (`idusuarios`),
  UNIQUE KEY `correo` (`correo`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'Carlos Mendoza','carlos@colegio.cl','123','Profesor');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-09-25 16:28:33
