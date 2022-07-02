CREATE DATABASE  IF NOT EXISTS `universidade_bd` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `universidade_bd`;
-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: universidade_bd
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `aluno`
--

DROP TABLE IF EXISTS `aluno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aluno` (
  `id_aluno` int NOT NULL AUTO_INCREMENT,
  `nome_aluno` varchar(30) NOT NULL,
  `nascimento` date DEFAULT NULL,
  `sexo` enum('M','F') DEFAULT NULL,
  `cpf_aluno` varchar(11) DEFAULT NULL,
  `rg_aluno` varchar(11) DEFAULT NULL,
  `cidade` varchar(30) DEFAULT NULL,
  `estado` varchar(30) DEFAULT NULL,
  `pais` varchar(20) DEFAULT 'Brasil',
  PRIMARY KEY (`id_aluno`),
  UNIQUE KEY `cpf_aluno` (`cpf_aluno`),
  UNIQUE KEY `rg_aluno` (`rg_aluno`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aluno`
--

LOCK TABLES `aluno` WRITE;
/*!40000 ALTER TABLE `aluno` DISABLE KEYS */;
INSERT INTO `aluno` VALUES (25,'Iverson Rômulo','1996-07-07','M','12345678910','258471852','Curitiba','Paraná','Brasil'),(26,'José da Silva','1980-05-01','M','11121314151','354152365','Rio Branco','Acre','Brasil'),(27,'Bruna Oliveira','1983-02-25','F','16145678935','854123658','Montgomery','Alabama','Estados Unidos'),(28,'Carlos Alberto da Silva','1976-03-04','M','24836935758','258654852','Manáus','Amazonas','Brasil'),(29,'Juliana Andrade Leite','1980-12-08','F','85296357826','369852456','Salvador','Bahia','Brasil'),(30,'Maria Joana Gonçalves','1999-01-01','F','75315985256','125485478','Fortaleza','Ceará','Brasil'),(31,'Oliver Pereira','1996-03-03','M','76358965214','369582456','São Luís','Maranhão','Brasil');
/*!40000 ALTER TABLE `aluno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curso`
--

DROP TABLE IF EXISTS `curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `curso` (
  `idcurso` int NOT NULL AUTO_INCREMENT,
  `nome_curso` varchar(30) NOT NULL,
  `tipo` varchar(20) DEFAULT NULL,
  `curso_horas` int unsigned DEFAULT NULL,
  `valor_curso` decimal(7,2) unsigned DEFAULT NULL,
  PRIMARY KEY (`idcurso`),
  UNIQUE KEY `nome_curso` (`nome_curso`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curso`
--

LOCK TABLES `curso` WRITE;
/*!40000 ALTER TABLE `curso` DISABLE KEYS */;
INSERT INTO `curso` VALUES (1,'Administração','Bacharel',3000,38400.00),(2,'Educação Física','Bacharel',2400,18000.00),(3,'Quimica','Bacharel',7200,64200.00),(4,'Marketing','Tecnólogo',3000,12000.00),(5,'Logística','Tecnólogo',1600,7200.00);
/*!40000 ALTER TABLE `curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matricula`
--

DROP TABLE IF EXISTS `matricula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `matricula` (
  `matricula` int NOT NULL AUTO_INCREMENT,
  `nome` int DEFAULT NULL,
  `curso` int DEFAULT NULL,
  `professor` int DEFAULT NULL,
  PRIMARY KEY (`matricula`),
  KEY `nome` (`nome`),
  KEY `curso` (`curso`),
  KEY `professor` (`professor`),
  CONSTRAINT `matricula_ibfk_1` FOREIGN KEY (`nome`) REFERENCES `aluno` (`id_aluno`),
  CONSTRAINT `matricula_ibfk_2` FOREIGN KEY (`curso`) REFERENCES `curso` (`idcurso`),
  CONSTRAINT `matricula_ibfk_3` FOREIGN KEY (`professor`) REFERENCES `professor` (`id_prof`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matricula`
--

LOCK TABLES `matricula` WRITE;
/*!40000 ALTER TABLE `matricula` DISABLE KEYS */;
INSERT INTO `matricula` VALUES (1,25,1,1),(2,31,4,4),(3,29,5,5),(4,27,2,2),(5,25,2,2),(6,30,1,1),(7,26,3,3),(8,28,4,4),(9,31,3,3),(10,27,5,5);
/*!40000 ALTER TABLE `matricula` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professor`
--

DROP TABLE IF EXISTS `professor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `professor` (
  `id_prof` int NOT NULL AUTO_INCREMENT,
  `nome_prof` varchar(30) DEFAULT NULL,
  `nascimento` date DEFAULT NULL,
  `sexo` enum('F','M') DEFAULT NULL,
  `cpf_prof` varchar(11) NOT NULL,
  `rg_prof` varchar(9) NOT NULL,
  `cidade` varchar(30) DEFAULT NULL,
  `estado` varchar(30) DEFAULT NULL,
  `pais` varchar(30) DEFAULT NULL,
  `salario` decimal(7,2) DEFAULT NULL,
  `carga_hp` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id_prof`),
  UNIQUE KEY `cpf_prof` (`cpf_prof`),
  UNIQUE KEY `rg_prof` (`rg_prof`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professor`
--

LOCK TABLES `professor` WRITE;
/*!40000 ALTER TABLE `professor` DISABLE KEYS */;
INSERT INTO `professor` VALUES (1,'André Manuel Figueira','1975-05-05','M','78941256366','365145852','Cuiabá','Mato Grosso','Brasil',2400.00,900),(2,'Gustavo Andrade','1988-06-03','M','78985212354','369582145','Belém','Pará','Brasil',3200.00,860),(3,'Geraldo Carlos Pinto','1981-04-06','M','96374158955','254785356','Juneau','Alasca','Estados Unidos',3300.00,600),(4,'Tereza da Luz','1989-02-03','F','65485248534','325658741','Curitiba','Paraná','Brasil',2650.00,300),(5,'Geovan Neto','2003-05-05','M','85248565425','259687415','São Paulo','São Paulo','Brasil',3400.00,700);
/*!40000 ALTER TABLE `professor` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-06 21:02:05
