-- MySQL dump 10.19  Distrib 10.3.38-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: dm
-- ------------------------------------------------------
-- Server version	10.3.38-MariaDB-0+deb10u1
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping routines for database 'dm'
--
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;

DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `ToCapital`(palabra VARCHAR(20)) RETURNS varchar(20) CHARSET utf8
BEGIN
	DECLARE salida VARCHAR(20);
	
	set salida = CONCAT(UPPER(LEFT(palabra, 1)), LOWER(MID(palabra,2)));
	return salida;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `antDIM_TIEMPO`()
BEGIN
 
DELETE FROM DIM_TIEMPO;
 SET lc_time_names = 'es_VE';
SELECT '2016-11-01' INTO @fi; 
SELECT '2030-12-31' INTO @ff; 
 
 
WHILE (@fi <= @ff) DO 
  
INSERT INTO DIM_TIEMPO
    (
        sk_date,
        Fecha,
        Anio,
        Trimestre,
        Mes,
        Semana,
        Dia,
        DiaSemana,
        NTrimestre,
        NMes,
        NMes3L,
        NSemana,
        NDia,
        NDiaSemana,
        Aniomes
    )
SELECT YEAR(@fi)*10000+MONTH(@fi)*100+DAY(@fi) AS sk_date,
        (@fi) Fecha,
        YEAR(@fi) Anio,
        QUARTER(@fi) Trimestre,
        MONTH(@fi) Mes,
        WEEK(@fi) Semana,
        RIGHT(CONCAT('0',DAY(@fi)),2) Dia,
        WEEKDAY(@fi) DiaSemana,
        CONCAT('T',QUARTER(@fi),'/',YEAR(@fi))NTrimestre,
        ToCapital(MONTHNAME(@fi)) NMes,
        upper(LEFT(MONTHNAME(@fi),3)) NMes3L,
        CONCAT('Sem ',WEEK(@fi) ,'/', YEAR(@fi)) NSemana,
        CONCAT(RIGHT(CONCAT('0',DAY(@fi)),2),' ',ToCapital(MONTHNAME(@fi))) NDia,
        ToCapital(DAYNAME(@fi)) NDiaSemana,
        concat(YEAR(@fi),lpad(MONTH(@fi),2,'0'));
 
SET @fi = DATE_ADD(@fi, INTERVAL 1 DAY); 
 
END WHILE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;

CREATE  or replace DEFINER=`dm`@`localhost` PROCEDURE `genTiempo`()
BEGIN
 
DELETE FROM dim_tiempo;
 SET lc_time_names = 'es_VE';
SELECT '2016-11-01' INTO @fi; 
SELECT '2030-12-31' INTO @ff; 
 
 
WHILE (@fi <= @ff) DO 
  
INSERT INTO dim_tiempo
    (
        sk_date,
        Fecha,
        Anio,
        Trimestre,
        Mes,
        Semana,
        Dia,
        DiaSemana,
        NTrimestre,
        NMes,
        NMes3L,
        NSemana,
        NDia,
        NDiaSemana,
        Aniomes
    )
SELECT YEAR(@fi)*10000+MONTH(@fi)*100+DAY(@fi) AS sk_date,
        (@fi) Fecha,
        YEAR(@fi) Anio,
        QUARTER(@fi) Trimestre,
        MONTH(@fi) Mes,
        WEEK(@fi) Semana,
        RIGHT(CONCAT('0',DAY(@fi)),2) Dia,
        WEEKDAY(@fi) DiaSemana,
        CONCAT('T',QUARTER(@fi),'/',YEAR(@fi))NTrimestre,
        ToCapital(MONTHNAME(@fi)) NMes,
        upper(LEFT(MONTHNAME(@fi),3)) NMes3L,
        CONCAT('Sem ',WEEK(@fi) ,'/', YEAR(@fi)) NSemana,
        CONCAT(RIGHT(CONCAT('0',DAY(@fi)),2),' ',ToCapital(MONTHNAME(@fi))) NDia,
        ToCapital(DAYNAME(@fi)) NDiaSemana,
        concat(YEAR(@fi),lpad(MONTH(@fi),2,'0'));
 
SET @fi = DATE_ADD(@fi, INTERVAL 1 DAY); 
 
END WHILE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-20 22:04:09
