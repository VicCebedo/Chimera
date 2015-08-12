CREATE DATABASE  IF NOT EXISTS `test` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `test`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
--
-- Host: 127.0.0.1    Database: test
-- ------------------------------------------------------
-- Server version	5.6.24

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `assignments_user_role`
--

DROP TABLE IF EXISTS `assignments_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assignments_user_role` (
  `securityrole_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`securityrole_id`,`user_id`),
  KEY `FK_assignments_user` (`user_id`),
  CONSTRAINT `FK_assignments_user` FOREIGN KEY (`user_id`) REFERENCES `system_users` (`user_id`),
  CONSTRAINT `FK_assignments_user_role` FOREIGN KEY (`securityrole_id`) REFERENCES `security_roles` (`securityrole_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assignments_user_role`
--

LOCK TABLES `assignments_user_role` WRITE;
/*!40000 ALTER TABLE `assignments_user_role` DISABLE KEYS */;
INSERT INTO `assignments_user_role` VALUES (11,32),(12,32),(13,32),(14,32),(15,32),(16,32),(17,32),(18,32),(19,32),(20,32),(12,34),(13,34),(14,34),(15,34),(16,34),(17,34),(19,34),(11,35),(12,35),(13,35),(14,35),(15,35),(16,35),(17,35),(18,35),(19,35),(20,35),(11,36),(12,36),(13,36),(14,36),(15,36),(16,36),(17,36),(18,36),(19,36),(20,36),(11,37),(12,37),(13,37),(14,37),(15,37),(16,37),(17,37),(18,37),(19,37),(20,37),(11,38),(12,38),(13,38),(14,38),(15,38),(16,38),(17,38),(18,38),(19,38),(20,38),(11,39),(12,39),(13,39),(14,39),(15,39),(16,39),(17,39),(18,39),(19,39),(20,39),(11,40),(12,40),(13,40),(14,40),(15,40),(16,40),(17,40),(18,40),(19,40),(20,40),(11,41),(12,41),(13,41),(14,41),(15,41),(16,41),(17,41),(18,41),(19,41),(20,41),(11,42),(12,42),(13,42),(14,42),(15,42),(16,42),(17,42),(18,42),(19,42),(20,42),(11,43),(12,43),(13,43),(14,43),(15,43),(16,43),(17,43),(18,43),(19,43),(20,43),(11,44),(12,44),(13,44),(14,44),(15,44),(16,44),(17,44),(18,44),(19,44),(20,44),(11,45),(12,45),(13,45),(14,45),(15,45),(16,45),(17,45),(18,45),(19,45),(20,45),(11,46),(12,46),(13,46),(14,46),(15,46),(16,46),(17,46),(18,46),(19,46),(20,46),(11,47),(12,47),(13,47),(14,47),(15,47),(16,47),(17,47),(18,47),(19,47),(20,47),(11,48),(12,48),(13,48),(14,48),(15,48),(16,48),(17,48),(18,48),(19,48),(20,48),(11,49),(12,49),(13,49),(14,49),(15,49),(16,49),(17,49),(18,49),(19,49),(20,49),(11,50),(12,50),(13,50),(14,50),(15,50),(16,50),(17,50),(18,50),(19,50),(20,50),(11,51),(12,51),(13,51),(14,51),(15,51),(16,51),(17,51),(18,51),(19,51),(20,51),(11,52),(12,52),(13,52),(14,52),(15,52),(16,52),(17,52),(18,52),(19,52),(20,52),(11,53),(12,53),(13,53),(14,53),(15,53),(16,53),(17,53),(18,53),(19,53),(20,53),(11,54),(12,54),(13,54),(14,54),(15,54),(16,54),(17,54),(18,54),(19,54),(20,54),(11,55),(12,55),(13,55),(14,55),(15,55),(16,55),(17,55),(18,55),(19,55),(20,55),(11,56),(12,56),(13,56),(14,56),(15,56),(16,56),(17,56),(18,56),(19,56),(20,56),(11,57),(12,57),(13,57),(14,57),(15,57),(16,57),(17,57),(18,57),(19,57),(20,57),(11,58),(12,58),(13,58),(14,58),(15,58),(16,58),(17,58),(18,58),(19,58),(20,58),(11,59),(12,59),(13,59),(14,59),(15,59),(16,59),(17,59),(18,59),(19,59),(20,59),(11,60),(12,60),(13,60),(14,60),(15,60),(16,60),(17,60),(18,60),(19,60),(20,60),(11,61),(12,61),(13,61),(14,61),(15,61),(16,61),(17,61),(18,61),(19,61),(20,61),(11,62),(12,62),(13,62),(14,62),(15,62),(16,62),(17,62),(18,62),(19,62),(20,62),(11,63),(12,63),(13,63),(14,63),(15,63),(16,63),(17,63),(18,63),(19,63),(20,63),(11,64),(12,64),(13,64),(14,64),(15,64),(16,64),(17,64),(18,64),(19,64),(20,64),(11,65),(12,65),(13,65),(14,65),(15,65),(16,65),(17,65),(18,65),(19,65),(20,65),(11,66),(12,66),(13,66),(14,66),(15,66),(16,66),(17,66),(18,66),(19,66),(20,66),(11,67),(12,67),(13,67),(14,67),(15,67),(16,67),(17,67),(18,67),(19,67),(20,67),(11,68),(12,68),(13,68),(14,68),(15,68),(16,68),(17,68),(18,68),(19,68),(20,68),(11,69),(12,69),(13,69),(14,69),(15,69),(16,69),(17,69),(18,69),(19,69),(20,69),(11,70),(12,70),(13,70),(14,70),(15,70),(16,70),(17,70),(18,70),(19,70),(20,70),(11,71),(12,71),(13,71),(14,71),(15,71),(16,71),(17,71),(18,71),(19,71),(20,71),(11,72),(12,72),(13,72),(14,72),(15,72),(16,72),(17,72),(18,72),(19,72),(20,72),(11,73),(12,73),(13,73),(14,73),(15,73),(16,73),(17,73),(18,73),(19,73),(20,73),(11,74),(12,74),(13,74),(14,74),(15,74),(16,74),(17,74),(18,74),(19,74),(20,74),(11,75),(12,75),(13,75),(14,75),(15,75),(16,75),(17,75),(18,75),(19,75),(20,75),(11,76),(12,76),(13,76),(14,76),(15,76),(16,76),(17,76),(18,76),(19,76),(20,76),(11,77),(12,77),(13,77),(14,77),(15,77),(16,77),(17,77),(18,77),(19,77),(20,77),(11,78),(12,78),(13,78),(14,78),(15,78),(16,78),(17,78),(18,78),(19,78),(20,78),(11,79),(12,79),(13,79),(14,79),(15,79),(16,79),(17,79),(18,79),(19,79),(20,79),(11,80),(12,80),(13,80),(14,80),(15,80),(16,80),(17,80),(18,80),(19,80),(20,80),(11,81),(12,81),(13,81),(14,81),(15,81),(16,81),(17,81),(18,81),(19,81),(20,81),(11,82),(12,82),(13,82),(14,82),(15,82),(16,82),(17,82),(18,82),(19,82),(20,82),(11,83),(12,83),(13,83),(14,83),(15,83),(16,83),(17,83),(18,83),(19,83),(20,83),(11,84),(12,84),(13,84),(14,84),(15,84),(16,84),(17,84),(18,84),(19,84),(20,84),(11,85),(12,85),(13,85),(14,85),(15,85),(16,85),(17,85),(18,85),(19,85),(20,85),(11,86),(12,86),(13,86),(14,86),(15,86),(16,86),(17,86),(18,86),(19,86),(20,86),(11,87),(12,87),(13,87),(14,87),(15,87),(16,87),(17,87),(18,87),(19,87),(20,87),(11,88),(12,88),(13,88),(14,88),(15,88),(16,88),(17,88),(18,88),(19,88),(20,88),(11,89),(12,89),(13,89),(14,89),(15,89),(16,89),(17,89),(18,89),(19,89),(20,89),(11,90),(12,90),(13,90),(14,90),(15,90),(16,90),(17,90),(18,90),(19,90),(20,90),(11,91),(12,91),(13,91),(14,91),(15,91),(16,91),(17,91),(18,91),(19,91),(20,91),(11,92),(12,92),(13,92),(14,92),(15,92),(16,92),(17,92),(18,92),(19,92),(20,92),(11,93),(12,93),(13,93),(14,93),(15,93),(16,93),(17,93),(18,93),(19,93),(20,93),(11,94),(12,94),(13,94),(14,94),(15,94),(16,94),(17,94),(18,94),(19,94),(20,94),(11,95),(12,95),(13,95),(14,95),(15,95),(16,95),(17,95),(18,95),(19,95),(20,95),(11,96),(12,96),(13,96),(14,96),(15,96),(16,96),(17,96),(18,96),(19,96),(20,96),(11,97),(12,97),(13,97),(14,97),(15,97),(16,97),(17,97),(18,97),(19,97),(20,97),(11,98),(12,98),(13,98),(14,98),(15,98),(16,98),(17,98),(18,98),(19,98),(20,98),(11,99),(12,99),(13,99),(14,99),(15,99),(16,99),(17,99),(18,99),(19,99),(20,99),(11,100),(12,100),(13,100),(14,100),(15,100),(16,100),(17,100),(18,100),(19,100),(20,100),(11,101),(12,101),(13,101),(14,101),(15,101),(16,101),(17,101),(18,101),(19,101),(20,101),(11,102),(12,102),(13,102),(14,102),(15,102),(16,102),(17,102),(18,102),(19,102),(20,102),(11,103),(12,103),(13,103),(14,103),(15,103),(16,103),(17,103),(18,103),(19,103),(20,103),(11,104),(12,104),(13,104),(14,104),(15,104),(16,104),(17,104),(18,104),(19,104),(20,104),(11,105),(12,105),(13,105),(14,105),(15,105),(16,105),(17,105),(18,105),(19,105),(20,105),(11,106),(12,106),(13,106),(14,106),(15,106),(16,106),(17,106),(18,106),(19,106),(20,106),(11,107),(12,107),(13,107),(14,107),(15,107),(16,107),(17,107),(18,107),(19,107),(20,107),(11,108),(12,108),(13,108),(14,108),(15,108),(16,108),(17,108),(18,108),(19,108),(20,108),(11,109),(12,109),(13,109),(14,109),(15,109),(16,109),(17,109),(18,109),(19,109),(20,109),(11,110),(12,110),(13,110),(14,110),(15,110),(16,110),(17,110),(18,110),(19,110),(20,110),(11,111),(12,111),(13,111),(14,111),(15,111),(16,111),(17,111),(18,111),(19,111),(20,111),(11,112),(12,112),(13,112),(14,112),(15,112),(16,112),(17,112),(18,112),(19,112),(20,112),(11,113),(12,113),(13,113),(14,113),(15,113),(16,113),(17,113),(18,113),(19,113),(20,113),(11,114),(12,114),(13,114),(14,114),(15,114),(16,114),(17,114),(18,114),(19,114),(20,114),(11,115),(12,115),(13,115),(14,115),(15,115),(16,115),(17,115),(18,115),(19,115),(20,115),(11,116),(12,116),(13,116),(14,116),(15,116),(16,116),(17,116),(18,116),(19,116),(20,116),(11,117),(12,117),(13,117),(14,117),(15,117),(16,117),(17,117),(18,117),(19,117),(20,117),(11,118),(12,118),(13,118),(14,118),(15,118),(16,118),(17,118),(18,118),(19,118),(20,118),(11,119),(12,119),(13,119),(14,119),(15,119),(16,119),(17,119),(18,119),(19,119),(20,119),(11,120),(12,120),(13,120),(14,120),(15,120),(16,120),(17,120),(18,120),(19,120),(20,120),(11,121),(12,121),(13,121),(14,121),(15,121),(16,121),(17,121),(18,121),(19,121),(20,121),(11,122),(12,122),(13,122),(14,122),(15,122),(16,122),(17,122),(18,122),(19,122),(20,122),(11,123),(12,123),(13,123),(14,123),(15,123),(16,123),(17,123),(18,123),(19,123),(20,123),(11,124),(12,124),(13,124),(14,124),(15,124),(16,124),(17,124),(18,124),(19,124),(20,124),(11,125),(12,125),(13,125),(14,125),(15,125),(16,125),(17,125),(18,125),(19,125),(20,125),(11,126),(12,126),(13,126),(14,126),(15,126),(16,126),(17,126),(18,126),(19,126),(20,126),(11,127),(12,127),(13,127),(14,127),(15,127),(16,127),(17,127),(18,127),(19,127),(20,127),(11,128),(12,128),(13,128),(14,128),(15,128),(16,128),(17,128),(18,128),(19,128),(20,128),(11,129),(12,129),(13,129),(14,129),(15,129),(16,129),(17,129),(18,129),(19,129),(20,129),(11,130),(12,130),(13,130),(14,130),(15,130),(16,130),(17,130),(18,130),(19,130),(20,130),(11,131),(12,131),(13,131),(14,131),(15,131),(16,131),(17,131),(18,131),(19,131),(20,131),(11,132),(12,132),(13,132),(14,132),(15,132),(16,132),(17,132),(18,132),(19,132),(20,132),(11,133),(12,133),(13,133),(14,133),(15,133),(16,133),(17,133),(18,133),(19,133),(20,133),(11,134),(12,134),(13,134),(14,134),(15,134),(16,134),(17,134),(18,134),(19,134),(20,134),(11,135),(12,135),(13,135),(14,135),(15,135),(16,135),(17,135),(18,135),(19,135),(20,135),(11,136),(12,136),(13,136),(14,136),(15,136),(16,136),(17,136),(18,136),(19,136),(20,136),(11,137),(12,137),(13,137),(14,137),(15,137),(16,137),(17,137),(18,137),(19,137),(20,137),(11,138),(12,138),(13,138),(14,138),(15,138),(16,138),(17,138),(18,138),(19,138),(20,138),(11,139),(12,139),(13,139),(14,139),(15,139),(16,139),(17,139),(18,139),(19,139),(20,139),(11,140),(12,140),(13,140),(14,140),(15,140),(16,140),(17,140),(18,140),(19,140),(20,140),(11,141),(12,141),(13,141),(14,141),(15,141),(16,141),(17,141),(18,141),(19,141),(20,141),(11,142),(12,142),(13,142),(14,142),(15,142),(16,142),(17,142),(18,142),(19,142),(20,142),(11,143),(12,143),(13,143),(14,143),(15,143),(16,143),(17,143),(18,143),(19,143),(20,143),(11,144),(12,144),(13,144),(14,144),(15,144),(16,144),(17,144),(18,144),(19,144),(20,144),(11,145),(12,145),(13,145),(14,145),(15,145),(16,145),(17,145),(18,145),(19,145),(20,145),(11,146),(12,146),(13,146),(14,146),(15,146),(16,146),(17,146),(18,146),(19,146),(20,146),(11,147),(12,147),(13,147),(14,147),(15,147),(16,147),(17,147),(18,147),(19,147),(20,147),(11,148),(12,148),(13,148),(14,148),(15,148),(16,148),(17,148),(18,148),(19,148),(20,148),(11,149),(12,149),(13,149),(14,149),(15,149),(16,149),(17,149),(18,149),(19,149),(20,149),(11,150),(12,150),(13,150),(14,150),(15,150),(16,150),(17,150),(18,150),(19,150),(20,150),(11,151),(12,151),(13,151),(14,151),(15,151),(16,151),(17,151),(18,151),(19,151),(20,151),(11,152),(12,152),(13,152),(14,152),(15,152),(16,152),(17,152),(18,152),(19,152),(20,152),(11,153),(12,153),(13,153),(14,153),(15,153),(16,153),(17,153),(18,153),(19,153),(20,153),(11,154),(12,154),(13,154),(14,154),(15,154),(16,154),(17,154),(18,154),(19,154),(20,154),(11,155),(12,155),(13,155),(14,155),(15,155),(16,155),(17,155),(18,155),(19,155),(20,155),(11,156),(12,156),(13,156),(14,156),(15,156),(16,156),(17,156),(18,156),(19,156),(20,156),(11,157),(12,157),(13,157),(14,157),(15,157),(16,157),(17,157),(18,157),(19,157),(20,157),(11,158),(12,158),(13,158),(14,158),(15,158),(16,158),(17,158),(18,158),(19,158),(20,158),(11,159),(12,159),(13,159),(14,159),(15,159),(16,159),(17,159),(18,159),(19,159),(20,159),(11,160),(12,160),(13,160),(14,160),(15,160),(16,160),(17,160),(18,160),(19,160),(20,160),(11,161),(12,161),(13,161),(14,161),(15,161),(16,161),(17,161),(18,161),(19,161),(20,161),(11,162),(12,162),(13,162),(14,162),(15,162),(16,162),(17,162),(18,162),(19,162),(20,162),(11,163),(12,163),(13,163),(14,163),(15,163),(16,163),(17,163),(18,163),(19,163),(20,163),(11,164),(12,164),(13,164),(14,164),(15,164),(16,164),(17,164),(18,164),(19,164),(20,164),(11,165),(12,165),(13,165),(14,165),(15,165),(16,165),(17,165),(18,165),(19,165),(20,165),(11,166),(12,166),(13,166),(14,166),(15,166),(16,166),(17,166),(18,166),(19,166),(20,166),(11,167),(12,167),(13,167),(14,167),(15,167),(16,167),(17,167),(18,167),(19,167),(20,167),(11,168),(12,168),(13,168),(14,168),(15,168),(16,168),(17,168),(18,168),(19,168),(20,168),(11,169),(12,169),(13,169),(14,169),(15,169),(16,169),(17,169),(18,169),(19,169),(20,169),(11,170),(12,170),(13,170),(14,170),(15,170),(16,170),(17,170),(18,170),(19,170),(20,170),(11,171),(12,171),(13,171),(14,171),(15,171),(16,171),(17,171),(18,171),(19,171),(20,171),(11,172),(12,172),(13,172),(14,172),(15,172),(16,172),(17,172),(18,172),(19,172),(20,172);
/*!40000 ALTER TABLE `assignments_user_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-08-12 17:51:14
