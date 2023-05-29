-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        10.5.19-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- m1 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `m1` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci */;
USE `m1`;

-- 테이블 m1.subject 구조 내보내기
CREATE TABLE IF NOT EXISTS `subject` (
  `subject_no` int(11) NOT NULL AUTO_INCREMENT,
  `subject_name` varchar(50) NOT NULL,
  `subject_time` int(11) NOT NULL,
  `createdate` datetime NOT NULL,
  `updatedate` datetime NOT NULL,
  PRIMARY KEY (`subject_no`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- 테이블 데이터 m1.subject:~13 rows (대략적) 내보내기
/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
INSERT INTO `subject` (`subject_no`, `subject_name`, `subject_time`, `createdate`, `updatedate`) VALUES
	(1, 'JAVA', 50, '2023-05-25 14:59:49', '2023-05-25 14:59:49'),
	(2, 'C#', 50, '2023-05-25 14:59:49', '2023-05-25 14:59:49'),
	(3, 'PYTHON', 50, '2023-05-25 14:59:49', '2023-05-25 14:59:49'),
	(4, 'DB', 50, '2023-05-25 14:59:49', '2023-05-25 14:59:49'),
	(5, 'HTML', 50, '2023-05-25 14:59:49', '2023-05-25 14:59:49'),
	(7, 'test1', 50, '2023-05-25 16:41:34', '2023-05-25 16:41:34'),
	(8, 'test', 60, '2023-05-28 20:34:47', '2023-05-28 20:34:47'),
	(10, 'test2', 50, '2023-05-29 13:28:22', '2023-05-29 13:28:22'),
	(11, 'test3', 60, '2023-05-29 13:28:32', '2023-05-29 13:28:32'),
	(12, 'test4', 60, '2023-05-29 13:32:06', '2023-05-29 13:32:06'),
	(13, 'test4', 60, '2023-05-29 13:37:20', '2023-05-29 13:37:20'),
	(15, 'test4', 60, '2023-05-29 19:43:58', '2023-05-29 19:43:58'),
	(16, 'test4', 60, '2023-05-29 19:45:21', '2023-05-29 19:45:21');
/*!40000 ALTER TABLE `subject` ENABLE KEYS */;

-- 테이블 m1.teacher 구조 내보내기
CREATE TABLE IF NOT EXISTS `teacher` (
  `teacher_no` int(11) NOT NULL AUTO_INCREMENT,
  `teacher_id` varchar(50) NOT NULL,
  `teacher_name` varchar(50) NOT NULL,
  `teacher_history` text NOT NULL,
  `createdate` datetime NOT NULL,
  `updatedate` datetime NOT NULL,
  PRIMARY KEY (`teacher_no`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- 테이블 데이터 m1.teacher:~18 rows (대략적) 내보내기
/*!40000 ALTER TABLE `teacher` DISABLE KEYS */;
INSERT INTO `teacher` (`teacher_no`, `teacher_id`, `teacher_name`, `teacher_history`, `createdate`, `updatedate`) VALUES
	(1, 'good', '구원이', '메모', '2023-05-26 09:22:13', '2023-05-26 09:22:13'),
	(2, 'lee', '이강사', '메모', '2023-05-26 10:13:01', '2023-05-26 10:13:01'),
	(3, 'kim', '김강사', '메모', '2023-05-26 10:13:01', '2023-05-26 10:13:01'),
	(4, 'park', '박강사', '메모', '2023-05-26 10:13:01', '2023-05-26 10:13:01'),
	(5, 'test', 'test', 'test', '2023-05-26 10:13:01', '2023-05-26 15:13:38'),
	(6, 'youn', '윤강사', '메모', '2023-05-26 11:48:34', '2023-05-26 11:48:34'),
	(7, 'min', '민강사', '메모', '2023-05-26 11:48:34', '2023-05-26 11:48:34'),
	(8, 'jung', '정강사', '메모', '2023-05-26 11:48:34', '2023-05-26 11:48:34'),
	(9, 'so', '소강사', '메모', '2023-05-26 11:48:34', '2023-05-26 11:48:34'),
	(10, 'im', '임강사', '메모', '2023-05-26 11:48:34', '2023-05-26 11:48:34'),
	(11, 'A', 'A강사', '메모', '2023-05-26 11:50:02', '2023-05-26 11:50:02'),
	(12, 'B', 'B강사', '메모', '2023-05-26 11:50:02', '2023-05-26 11:50:02'),
	(13, 'C', 'C강사', '메모', '2023-05-26 11:50:02', '2023-05-26 11:50:02'),
	(14, 'D', 'D강사', '메모', '2023-05-26 11:50:02', '2023-05-26 11:50:02'),
	(15, 'E', 'E강사', '메모', '2023-05-26 11:50:03', '2023-05-26 11:50:03'),
	(16, 'F', 'F강사', '메모', '2023-05-26 11:52:15', '2023-05-26 11:52:15'),
	(17, 'G1', 'G1강사', '메모1', '2023-05-26 11:52:15', '2023-05-26 17:15:15'),
	(20, 'test55', '55', 'teswt', '2023-05-29 19:41:23', '2023-05-29 19:41:23');
/*!40000 ALTER TABLE `teacher` ENABLE KEYS */;

-- 테이블 m1.teacher_subject 구조 내보내기
CREATE TABLE IF NOT EXISTS `teacher_subject` (
  `teacher_subject_no` int(11) NOT NULL AUTO_INCREMENT,
  `teacher_no` int(11) NOT NULL,
  `subject_no` int(11) NOT NULL,
  `createdate` datetime NOT NULL,
  `updatedate` datetime NOT NULL,
  PRIMARY KEY (`teacher_subject_no`),
  KEY `FK__teacher` (`teacher_no`),
  KEY `FK__subject` (`subject_no`),
  CONSTRAINT `FK__subject` FOREIGN KEY (`subject_no`) REFERENCES `subject` (`subject_no`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK__teacher` FOREIGN KEY (`teacher_no`) REFERENCES `teacher` (`teacher_no`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- 테이블 데이터 m1.teacher_subject:~12 rows (대략적) 내보내기
/*!40000 ALTER TABLE `teacher_subject` DISABLE KEYS */;
INSERT INTO `teacher_subject` (`teacher_subject_no`, `teacher_no`, `subject_no`, `createdate`, `updatedate`) VALUES
	(1, 1, 1, '2023-05-26 09:24:23', '2023-05-26 09:24:23'),
	(2, 1, 2, '2023-05-26 09:24:40', '2023-05-26 09:24:40'),
	(6, 2, 4, '2023-05-26 10:14:38', '2023-05-26 10:14:38'),
	(7, 3, 3, '2023-05-26 10:14:38', '2023-05-26 10:14:38'),
	(9, 3, 4, '2023-05-26 11:51:05', '2023-05-26 11:51:05'),
	(10, 4, 3, '2023-05-26 11:51:05', '2023-05-26 11:51:05'),
	(11, 5, 4, '2023-05-26 11:51:05', '2023-05-26 11:51:05'),
	(12, 6, 3, '2023-05-26 11:51:05', '2023-05-26 11:51:05'),
	(13, 7, 4, '2023-05-26 11:51:05', '2023-05-26 11:51:05'),
	(14, 8, 3, '2023-05-26 11:51:05', '2023-05-26 11:51:05'),
	(15, 9, 4, '2023-05-26 11:51:05', '2023-05-26 11:51:05'),
	(16, 10, 3, '2023-05-26 11:51:05', '2023-05-26 11:51:05');
/*!40000 ALTER TABLE `teacher_subject` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
