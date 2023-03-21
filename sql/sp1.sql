
DELIMITER ;;

DROP PROCEDURE IF EXISTS antDIM_TIEMPO ;;

CREATE OR REPLACE DEFINER=`root`@`localhost` PROCEDURE `antDIM_TIEMPO`()
BEGIN
 
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
