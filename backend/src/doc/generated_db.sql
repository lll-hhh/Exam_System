/*
 Navicat Premium Dump SQL

 Source Server         : exam
 Source Server Type    : MySQL
 Source Server Version : 90100 (9.1.0)
 Source Host           : wpcwzy.top:3306
 Source Schema         : exam

 Target Server Type    : MySQL
 Target Server Version : 90100 (9.1.0)
 File Encoding         : 65001

 Date: 31/12/2024 20:51:24
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for class
-- ----------------------------
DROP TABLE IF EXISTS `class`;
CREATE TABLE `class` (
  `id` int NOT NULL AUTO_INCREMENT,
  `class_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `modify_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of class
-- ----------------------------
BEGIN;
INSERT INTO `class` (`id`, `class_name`, `create_time`, `modify_time`) VALUES (1, '班级9940', '2012-02-24 02:56:41', '2024-06-02 19:49:24');
INSERT INTO `class` (`id`, `class_name`, `create_time`, `modify_time`) VALUES (2, '班级7993', '2023-08-20 16:46:47', '2024-07-01 15:02:26');
INSERT INTO `class` (`id`, `class_name`, `create_time`, `modify_time`) VALUES (3, '班级8844', '2006-02-17 22:44:12', '2021-12-17 14:49:52');
INSERT INTO `class` (`id`, `class_name`, `create_time`, `modify_time`) VALUES (4, '班级7416', '2015-11-01 04:01:24', '2002-04-09 20:17:09');
INSERT INTO `class` (`id`, `class_name`, `create_time`, `modify_time`) VALUES (5, '班级1365', '2011-12-19 15:37:21', '2004-08-15 15:37:31');
INSERT INTO `class` (`id`, `class_name`, `create_time`, `modify_time`) VALUES (6, '班级5627', '2004-01-14 23:19:07', '2023-08-29 01:26:49');
INSERT INTO `class` (`id`, `class_name`, `create_time`, `modify_time`) VALUES (7, '班级3449', '2018-06-03 23:02:16', '2021-02-13 02:09:19');
INSERT INTO `class` (`id`, `class_name`, `create_time`, `modify_time`) VALUES (8, '班级2116', '2012-07-25 12:30:45', '2002-09-04 02:58:18');
INSERT INTO `class` (`id`, `class_name`, `create_time`, `modify_time`) VALUES (9, '班级5361', '2018-11-07 09:31:06', '2024-05-26 22:43:10');
INSERT INTO `class` (`id`, `class_name`, `create_time`, `modify_time`) VALUES (10, '班级4134', '2010-07-06 22:50:13', '2001-03-11 03:58:56');
INSERT INTO `class` (`id`, `class_name`, `create_time`, `modify_time`) VALUES (11, '班级6599', '2011-02-20 03:10:57', '2021-09-07 09:36:13');
INSERT INTO `class` (`id`, `class_name`, `create_time`, `modify_time`) VALUES (12, '班级6798', '2002-05-20 11:59:42', '2002-06-11 06:03:36');
INSERT INTO `class` (`id`, `class_name`, `create_time`, `modify_time`) VALUES (13, '班级9098', '2020-12-17 11:03:32', '2019-07-25 13:15:02');
INSERT INTO `class` (`id`, `class_name`, `create_time`, `modify_time`) VALUES (14, '班级9037', '2005-03-11 22:13:22', '2011-08-26 08:06:22');
INSERT INTO `class` (`id`, `class_name`, `create_time`, `modify_time`) VALUES (15, '班级4573', '2010-06-27 08:57:57', '2005-02-03 18:16:40');
INSERT INTO `class` (`id`, `class_name`, `create_time`, `modify_time`) VALUES (16, '班级8179', '2018-02-05 13:50:37', '2016-01-10 06:39:31');
INSERT INTO `class` (`id`, `class_name`, `create_time`, `modify_time`) VALUES (17, '班级1689', '2004-04-08 22:02:40', '2005-09-19 14:12:35');
INSERT INTO `class` (`id`, `class_name`, `create_time`, `modify_time`) VALUES (18, '班级3988', '2012-03-02 11:57:06', '2020-08-10 23:29:22');
INSERT INTO `class` (`id`, `class_name`, `create_time`, `modify_time`) VALUES (19, '班级6964', '2022-03-24 06:59:00', '2012-03-27 11:04:47');
INSERT INTO `class` (`id`, `class_name`, `create_time`, `modify_time`) VALUES (20, '班级4619', '2011-08-04 01:14:19', '2012-08-20 19:02:08');
INSERT INTO `class` (`id`, `class_name`, `create_time`, `modify_time`) VALUES (21, NULL, '2024-12-31 20:26:16', '2024-12-31 20:26:16');
INSERT INTO `class` (`id`, `class_name`, `create_time`, `modify_time`) VALUES (22, NULL, '2024-12-31 20:27:33', '2024-12-31 20:27:33');
INSERT INTO `class` (`id`, `class_name`, `create_time`, `modify_time`) VALUES (23, NULL, '2024-12-31 20:34:31', '2024-12-31 20:34:31');
COMMIT;

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `id` int NOT NULL AUTO_INCREMENT,
  `course_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `modify_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of course
-- ----------------------------
BEGIN;
INSERT INTO `course` (`id`, `course_name`, `create_time`, `modify_time`) VALUES (1, 'SjuP课', '2009-10-28 14:00:16', '2003-07-22 15:49:37');
INSERT INTO `course` (`id`, `course_name`, `create_time`, `modify_time`) VALUES (2, 'mcum课', '2012-09-16 21:23:03', '2017-08-20 01:28:48');
INSERT INTO `course` (`id`, `course_name`, `create_time`, `modify_time`) VALUES (3, 'm3mm课', '2015-12-24 03:02:09', '2004-08-25 14:19:29');
INSERT INTO `course` (`id`, `course_name`, `create_time`, `modify_time`) VALUES (4, '2W2B课', '2015-06-17 12:15:48', '2008-08-21 22:54:21');
INSERT INTO `course` (`id`, `course_name`, `create_time`, `modify_time`) VALUES (5, 'Nmux课', '2019-04-10 21:49:39', '2020-10-06 11:25:44');
INSERT INTO `course` (`id`, `course_name`, `create_time`, `modify_time`) VALUES (6, 'xaLt课', '2010-04-20 23:30:25', '2002-05-17 18:18:26');
INSERT INTO `course` (`id`, `course_name`, `create_time`, `modify_time`) VALUES (7, '1fxf课', '2018-06-18 07:18:11', '2005-07-30 15:26:43');
INSERT INTO `course` (`id`, `course_name`, `create_time`, `modify_time`) VALUES (8, '2gb0课', '2001-07-09 16:12:16', '2001-06-13 16:31:06');
INSERT INTO `course` (`id`, `course_name`, `create_time`, `modify_time`) VALUES (9, 'lXjf课', '2021-05-20 10:48:41', '2007-02-04 23:29:56');
INSERT INTO `course` (`id`, `course_name`, `create_time`, `modify_time`) VALUES (10, 'Q0p5课', '2023-02-06 16:37:13', '2024-01-04 08:40:42');
INSERT INTO `course` (`id`, `course_name`, `create_time`, `modify_time`) VALUES (11, 'LlAp课', '2010-12-18 13:05:30', '2023-08-20 00:43:24');
INSERT INTO `course` (`id`, `course_name`, `create_time`, `modify_time`) VALUES (12, 'CCMG课', '2019-08-23 11:08:03', '2004-10-04 16:22:29');
INSERT INTO `course` (`id`, `course_name`, `create_time`, `modify_time`) VALUES (13, 'n1pv课', '2012-10-31 02:15:26', '2007-11-18 16:32:07');
INSERT INTO `course` (`id`, `course_name`, `create_time`, `modify_time`) VALUES (14, 'AIDw课', '2001-10-15 17:00:49', '2004-03-11 12:38:05');
INSERT INTO `course` (`id`, `course_name`, `create_time`, `modify_time`) VALUES (15, '7ECp课', '2017-03-09 02:12:01', '2020-02-14 15:26:11');
INSERT INTO `course` (`id`, `course_name`, `create_time`, `modify_time`) VALUES (16, 'XGL6课', '2003-04-21 14:20:07', '2011-02-07 18:00:05');
INSERT INTO `course` (`id`, `course_name`, `create_time`, `modify_time`) VALUES (17, 'pMuk课', '2021-07-14 11:41:37', '2008-04-05 12:15:28');
INSERT INTO `course` (`id`, `course_name`, `create_time`, `modify_time`) VALUES (18, 'ybiz课', '2002-02-18 07:43:14', '2014-08-15 11:53:54');
INSERT INTO `course` (`id`, `course_name`, `create_time`, `modify_time`) VALUES (19, 'aRSj课', '2008-01-26 19:41:57', '2002-01-11 03:31:11');
INSERT INTO `course` (`id`, `course_name`, `create_time`, `modify_time`) VALUES (20, 'P7ba课', '2023-02-21 08:17:43', '2023-02-03 18:15:32');
COMMIT;

-- ----------------------------
-- Table structure for exam
-- ----------------------------
DROP TABLE IF EXISTS `exam`;
CREATE TABLE `exam` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `logical_paper_id` int NOT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `duration` int DEFAULT NULL,
  `show_score` int DEFAULT NULL,
  `shuffle` int DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `modify_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id` (`id`) USING BTREE,
  KEY `logical_paper_fk` (`logical_paper_id`) USING BTREE,
  CONSTRAINT `logical_paper_fk` FOREIGN KEY (`logical_paper_id`) REFERENCES `logical_paper` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of exam
-- ----------------------------
BEGIN;
INSERT INTO `exam` (`id`, `name`, `logical_paper_id`, `start_time`, `end_time`, `duration`, `show_score`, `shuffle`, `create_time`, `modify_time`) VALUES (1, '考试Bmbdt', 1, '2024-12-30 06:40:14', '2029-10-29 05:52:54', 698, 1, 1, '2019-06-12 05:20:06', '2004-03-22 11:38:39');
INSERT INTO `exam` (`id`, `name`, `logical_paper_id`, `start_time`, `end_time`, `duration`, `show_score`, `shuffle`, `create_time`, `modify_time`) VALUES (2, '考试9Lm0T', 6, '2018-04-26 03:21:02', '2005-05-27 01:06:36', 531, 0, 0, '2013-12-11 04:45:32', '2007-07-31 13:51:30');
INSERT INTO `exam` (`id`, `name`, `logical_paper_id`, `start_time`, `end_time`, `duration`, `show_score`, `shuffle`, `create_time`, `modify_time`) VALUES (3, '考试uST6u', 4, '2024-02-27 17:28:48', '2016-07-28 03:43:24', 307, 1, 1, '2014-01-17 09:11:58', '2023-05-14 16:30:10');
INSERT INTO `exam` (`id`, `name`, `logical_paper_id`, `start_time`, `end_time`, `duration`, `show_score`, `shuffle`, `create_time`, `modify_time`) VALUES (4, '考试UdyAP', 3, '2005-05-25 03:27:10', '2022-09-16 11:01:55', 199, 0, 1, '2016-11-15 13:18:50', '2008-08-18 16:32:27');
INSERT INTO `exam` (`id`, `name`, `logical_paper_id`, `start_time`, `end_time`, `duration`, `show_score`, `shuffle`, `create_time`, `modify_time`) VALUES (5, '考试YGZ3w', 20, '2008-09-05 20:30:28', '2004-11-05 05:40:18', 987, 0, 1, '2014-11-03 09:13:43', '2011-10-13 22:14:17');
INSERT INTO `exam` (`id`, `name`, `logical_paper_id`, `start_time`, `end_time`, `duration`, `show_score`, `shuffle`, `create_time`, `modify_time`) VALUES (6, '考试mRJAn', 19, '2008-06-09 18:44:13', '2000-02-03 04:47:03', 542, 0, 1, '2001-02-07 20:16:10', '2012-06-30 15:07:48');
INSERT INTO `exam` (`id`, `name`, `logical_paper_id`, `start_time`, `end_time`, `duration`, `show_score`, `shuffle`, `create_time`, `modify_time`) VALUES (7, '考试h577F', 1, '2012-10-31 09:40:09', '2011-11-18 00:25:37', 207, 0, 0, '2007-08-02 18:16:01', '2003-02-24 18:54:07');
INSERT INTO `exam` (`id`, `name`, `logical_paper_id`, `start_time`, `end_time`, `duration`, `show_score`, `shuffle`, `create_time`, `modify_time`) VALUES (8, '考试EuJ1P', 4, '2004-09-06 03:33:44', '2011-07-20 09:21:33', 278, 1, 1, '2009-04-14 19:37:47', '2024-03-31 13:49:31');
INSERT INTO `exam` (`id`, `name`, `logical_paper_id`, `start_time`, `end_time`, `duration`, `show_score`, `shuffle`, `create_time`, `modify_time`) VALUES (9, '考试k9Cs1', 2, '2000-07-14 20:54:12', '2022-09-05 23:30:46', 196, 0, 0, '2020-08-01 02:19:14', '2008-10-21 17:09:35');
INSERT INTO `exam` (`id`, `name`, `logical_paper_id`, `start_time`, `end_time`, `duration`, `show_score`, `shuffle`, `create_time`, `modify_time`) VALUES (10, '考试lqnOt', 7, '2001-12-31 06:35:01', '2021-02-15 10:48:57', 930, 0, 1, '2021-11-26 13:27:54', '2010-04-23 12:33:11');
INSERT INTO `exam` (`id`, `name`, `logical_paper_id`, `start_time`, `end_time`, `duration`, `show_score`, `shuffle`, `create_time`, `modify_time`) VALUES (11, '考试y1Ril', 20, '2016-10-25 05:33:41', '2021-11-17 13:05:21', 919, 1, 0, '2021-09-21 21:44:42', '2021-07-18 02:19:22');
INSERT INTO `exam` (`id`, `name`, `logical_paper_id`, `start_time`, `end_time`, `duration`, `show_score`, `shuffle`, `create_time`, `modify_time`) VALUES (12, '考试emPOI', 19, '2021-04-22 19:33:48', '2010-03-18 22:51:41', 621, 0, 0, '2012-03-17 07:50:45', '2022-07-18 08:40:29');
INSERT INTO `exam` (`id`, `name`, `logical_paper_id`, `start_time`, `end_time`, `duration`, `show_score`, `shuffle`, `create_time`, `modify_time`) VALUES (13, '考试WrNjv', 10, '2019-12-26 04:07:15', '2005-04-04 16:42:19', 829, 1, 1, '2021-12-29 11:32:37', '2003-02-28 14:24:19');
INSERT INTO `exam` (`id`, `name`, `logical_paper_id`, `start_time`, `end_time`, `duration`, `show_score`, `shuffle`, `create_time`, `modify_time`) VALUES (14, '考试tWpEu', 16, '2009-10-23 20:59:30', '2013-02-03 08:06:46', 287, 0, 1, '2018-01-26 01:25:57', '2021-11-20 21:20:43');
INSERT INTO `exam` (`id`, `name`, `logical_paper_id`, `start_time`, `end_time`, `duration`, `show_score`, `shuffle`, `create_time`, `modify_time`) VALUES (15, '考试P8nOv', 18, '2008-03-04 05:29:05', '2010-01-04 12:46:41', 808, 1, 1, '2024-04-30 14:19:11', '2017-11-13 21:09:11');
INSERT INTO `exam` (`id`, `name`, `logical_paper_id`, `start_time`, `end_time`, `duration`, `show_score`, `shuffle`, `create_time`, `modify_time`) VALUES (16, '考试UY8Vn', 8, '2002-05-08 15:39:18', '2017-07-18 00:04:43', 976, 0, 0, '2017-04-28 05:42:44', '2019-03-22 10:42:07');
INSERT INTO `exam` (`id`, `name`, `logical_paper_id`, `start_time`, `end_time`, `duration`, `show_score`, `shuffle`, `create_time`, `modify_time`) VALUES (17, '考试Fz9w9', 10, '2007-03-30 09:44:44', '2014-03-11 13:43:00', 474, 0, 1, '2011-09-15 16:52:03', '2018-01-07 04:45:21');
INSERT INTO `exam` (`id`, `name`, `logical_paper_id`, `start_time`, `end_time`, `duration`, `show_score`, `shuffle`, `create_time`, `modify_time`) VALUES (18, '考试FL0iX', 20, '2009-10-25 18:59:24', '2033-04-05 12:59:45', 181, 0, 1, '2015-03-01 07:12:37', '2029-10-26 02:57:48');
INSERT INTO `exam` (`id`, `name`, `logical_paper_id`, `start_time`, `end_time`, `duration`, `show_score`, `shuffle`, `create_time`, `modify_time`) VALUES (19, '考试QdX0f', 9, '2022-04-16 01:05:39', '2014-09-17 11:10:35', 718, 1, 1, '2018-04-14 02:43:36', '2007-10-05 21:46:08');
INSERT INTO `exam` (`id`, `name`, `logical_paper_id`, `start_time`, `end_time`, `duration`, `show_score`, `shuffle`, `create_time`, `modify_time`) VALUES (20, '考试vgw3Y', 11, '2006-12-13 08:52:46', '2021-05-04 04:31:59', 443, 0, 0, '2014-03-19 23:01:37', '2009-06-11 15:42:42');
COMMIT;

-- ----------------------------
-- Table structure for logical_paper
-- ----------------------------
DROP TABLE IF EXISTS `logical_paper`;
CREATE TABLE `logical_paper` (
  `id` int NOT NULL AUTO_INCREMENT,
  `course_id` int DEFAULT NULL,
  `difficulty` double DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `modify_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `course_fk` (`course_id`) USING BTREE,
  CONSTRAINT `course_fk` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of logical_paper
-- ----------------------------
BEGIN;
INSERT INTO `logical_paper` (`id`, `course_id`, `difficulty`, `create_time`, `modify_time`) VALUES (1, 1, 1, '2006-11-13 16:17:18', '2013-05-24 03:34:28');
INSERT INTO `logical_paper` (`id`, `course_id`, `difficulty`, `create_time`, `modify_time`) VALUES (2, 2, 2, '2000-04-14 21:17:11', '2003-04-20 18:31:08');
INSERT INTO `logical_paper` (`id`, `course_id`, `difficulty`, `create_time`, `modify_time`) VALUES (3, 3, 3, '2005-01-08 14:44:43', '2009-09-16 05:50:35');
INSERT INTO `logical_paper` (`id`, `course_id`, `difficulty`, `create_time`, `modify_time`) VALUES (4, 4, 4, '2016-08-22 00:40:07', '2023-01-12 20:16:39');
INSERT INTO `logical_paper` (`id`, `course_id`, `difficulty`, `create_time`, `modify_time`) VALUES (5, 5, 5, '2004-10-24 00:46:25', '2007-11-14 01:24:58');
INSERT INTO `logical_paper` (`id`, `course_id`, `difficulty`, `create_time`, `modify_time`) VALUES (6, 1, 1, '2017-11-11 19:36:50', '2006-10-22 21:31:31');
INSERT INTO `logical_paper` (`id`, `course_id`, `difficulty`, `create_time`, `modify_time`) VALUES (7, 2, 2, '2022-10-10 08:50:49', '2021-10-12 03:25:21');
INSERT INTO `logical_paper` (`id`, `course_id`, `difficulty`, `create_time`, `modify_time`) VALUES (8, 3, 3, '2008-10-03 02:58:20', '2024-01-30 02:41:06');
INSERT INTO `logical_paper` (`id`, `course_id`, `difficulty`, `create_time`, `modify_time`) VALUES (9, 4, 4, '2020-03-05 12:05:56', '2015-10-01 08:57:21');
INSERT INTO `logical_paper` (`id`, `course_id`, `difficulty`, `create_time`, `modify_time`) VALUES (10, 5, 5, '2013-11-16 15:49:49', '2004-03-30 14:13:10');
INSERT INTO `logical_paper` (`id`, `course_id`, `difficulty`, `create_time`, `modify_time`) VALUES (11, 1, 1, '2024-08-03 15:40:28', '2015-04-06 02:41:30');
INSERT INTO `logical_paper` (`id`, `course_id`, `difficulty`, `create_time`, `modify_time`) VALUES (12, 2, 2, '2000-12-10 20:22:54', '2010-03-17 21:46:41');
INSERT INTO `logical_paper` (`id`, `course_id`, `difficulty`, `create_time`, `modify_time`) VALUES (13, 3, 3, '2003-07-15 03:41:20', '2008-06-26 17:23:20');
INSERT INTO `logical_paper` (`id`, `course_id`, `difficulty`, `create_time`, `modify_time`) VALUES (14, 4, 4, '2020-09-01 16:33:36', '2017-10-31 14:26:28');
INSERT INTO `logical_paper` (`id`, `course_id`, `difficulty`, `create_time`, `modify_time`) VALUES (15, 5, 5, '2017-11-26 09:17:25', '2021-02-11 10:27:29');
INSERT INTO `logical_paper` (`id`, `course_id`, `difficulty`, `create_time`, `modify_time`) VALUES (16, 1, 1, '2013-01-12 12:05:52', '2021-01-02 16:39:29');
INSERT INTO `logical_paper` (`id`, `course_id`, `difficulty`, `create_time`, `modify_time`) VALUES (17, 2, 2, '2009-11-09 12:09:10', '2022-04-06 07:24:58');
INSERT INTO `logical_paper` (`id`, `course_id`, `difficulty`, `create_time`, `modify_time`) VALUES (18, 3, 3, '2006-11-24 05:37:04', '2017-05-13 17:32:53');
INSERT INTO `logical_paper` (`id`, `course_id`, `difficulty`, `create_time`, `modify_time`) VALUES (19, 4, 4, '2003-04-07 03:12:02', '2024-08-31 11:55:42');
INSERT INTO `logical_paper` (`id`, `course_id`, `difficulty`, `create_time`, `modify_time`) VALUES (20, 5, 5, '2001-03-04 14:06:42', '2020-11-25 16:20:59');
INSERT INTO `logical_paper` (`id`, `course_id`, `difficulty`, `create_time`, `modify_time`) VALUES (21, 1, NULL, '2024-12-30 18:09:35', '2024-12-30 18:09:35');
INSERT INTO `logical_paper` (`id`, `course_id`, `difficulty`, `create_time`, `modify_time`) VALUES (22, 1, NULL, '2024-12-30 18:10:00', '2024-12-30 18:10:00');
INSERT INTO `logical_paper` (`id`, `course_id`, `difficulty`, `create_time`, `modify_time`) VALUES (23, 1, NULL, '2024-12-30 18:15:06', '2024-12-30 18:15:06');
INSERT INTO `logical_paper` (`id`, `course_id`, `difficulty`, `create_time`, `modify_time`) VALUES (24, 1, 3, '2024-12-30 18:18:27', '2024-12-30 18:18:27');
INSERT INTO `logical_paper` (`id`, `course_id`, `difficulty`, `create_time`, `modify_time`) VALUES (25, 1, 3, '2024-12-30 18:18:53', '2024-12-30 18:18:53');
INSERT INTO `logical_paper` (`id`, `course_id`, `difficulty`, `create_time`, `modify_time`) VALUES (26, 1, 3, '2024-12-30 18:19:45', '2024-12-30 18:19:45');
INSERT INTO `logical_paper` (`id`, `course_id`, `difficulty`, `create_time`, `modify_time`) VALUES (27, 1, 3, '2024-12-30 18:51:11', '2024-12-30 18:51:11');
INSERT INTO `logical_paper` (`id`, `course_id`, `difficulty`, `create_time`, `modify_time`) VALUES (28, 1, 3, '2024-12-30 18:52:07', '2024-12-30 18:52:07');
INSERT INTO `logical_paper` (`id`, `course_id`, `difficulty`, `create_time`, `modify_time`) VALUES (29, 1, 3, '2024-12-30 19:13:27', '2024-12-30 19:13:27');
INSERT INTO `logical_paper` (`id`, `course_id`, `difficulty`, `create_time`, `modify_time`) VALUES (30, 1, 3, '2024-12-30 19:24:34', '2024-12-30 19:24:34');
INSERT INTO `logical_paper` (`id`, `course_id`, `difficulty`, `create_time`, `modify_time`) VALUES (31, 1, 3, '2024-12-30 19:26:28', '2024-12-30 19:26:28');
INSERT INTO `logical_paper` (`id`, `course_id`, `difficulty`, `create_time`, `modify_time`) VALUES (32, 1, 3, '2024-12-30 19:29:45', '2024-12-30 19:29:45');
INSERT INTO `logical_paper` (`id`, `course_id`, `difficulty`, `create_time`, `modify_time`) VALUES (33, 1, 3, '2024-12-30 19:31:51', '2024-12-30 19:31:51');
INSERT INTO `logical_paper` (`id`, `course_id`, `difficulty`, `create_time`, `modify_time`) VALUES (34, 1, 3, '2024-12-30 19:41:29', '2024-12-30 19:41:29');
INSERT INTO `logical_paper` (`id`, `course_id`, `difficulty`, `create_time`, `modify_time`) VALUES (35, 1, 3, '2024-12-30 19:44:12', '2024-12-30 19:44:12');
INSERT INTO `logical_paper` (`id`, `course_id`, `difficulty`, `create_time`, `modify_time`) VALUES (36, 1, 3, '2024-12-30 19:49:37', '2024-12-30 19:49:37');
INSERT INTO `logical_paper` (`id`, `course_id`, `difficulty`, `create_time`, `modify_time`) VALUES (37, 1, 3, '2024-12-30 20:00:22', '2024-12-30 20:00:22');
INSERT INTO `logical_paper` (`id`, `course_id`, `difficulty`, `create_time`, `modify_time`) VALUES (38, 1, 3, '2024-12-30 20:03:46', '2024-12-30 20:03:46');
INSERT INTO `logical_paper` (`id`, `course_id`, `difficulty`, `create_time`, `modify_time`) VALUES (39, 1, 3, '2024-12-30 20:04:23', '2024-12-30 20:04:23');
INSERT INTO `logical_paper` (`id`, `course_id`, `difficulty`, `create_time`, `modify_time`) VALUES (40, 1, 3, '2024-12-30 20:16:01', '2024-12-30 20:16:01');
INSERT INTO `logical_paper` (`id`, `course_id`, `difficulty`, `create_time`, `modify_time`) VALUES (41, 1, 3, '2024-12-30 21:15:42', '2024-12-30 21:15:42');
COMMIT;

-- ----------------------------
-- Table structure for paper
-- ----------------------------
DROP TABLE IF EXISTS `paper`;
CREATE TABLE `paper` (
  `id` int NOT NULL AUTO_INCREMENT,
  `logical_paper_id` int DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `modify_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id` (`id`) USING BTREE,
  KEY `logical_id_fk` (`logical_paper_id`) USING BTREE,
  CONSTRAINT `logical_id_fk` FOREIGN KEY (`logical_paper_id`) REFERENCES `logical_paper` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of paper
-- ----------------------------
BEGIN;
INSERT INTO `paper` (`id`, `logical_paper_id`, `create_time`, `modify_time`) VALUES (1, 1, '2002-07-05 03:33:27', '2021-03-01 04:40:02');
INSERT INTO `paper` (`id`, `logical_paper_id`, `create_time`, `modify_time`) VALUES (2, 1, '2022-12-09 15:29:23', '2006-07-20 07:45:21');
INSERT INTO `paper` (`id`, `logical_paper_id`, `create_time`, `modify_time`) VALUES (3, 1, '2007-12-04 01:47:03', '2017-11-13 03:25:25');
INSERT INTO `paper` (`id`, `logical_paper_id`, `create_time`, `modify_time`) VALUES (4, 1, '2004-11-20 07:17:52', '2022-11-06 17:10:58');
INSERT INTO `paper` (`id`, `logical_paper_id`, `create_time`, `modify_time`) VALUES (5, 1, '2018-06-30 09:53:49', '2008-05-21 09:42:58');
INSERT INTO `paper` (`id`, `logical_paper_id`, `create_time`, `modify_time`) VALUES (6, 2, '2006-05-11 01:17:58', '2013-10-06 02:10:47');
INSERT INTO `paper` (`id`, `logical_paper_id`, `create_time`, `modify_time`) VALUES (7, 2, '2003-12-29 20:43:54', '2014-01-27 22:53:12');
INSERT INTO `paper` (`id`, `logical_paper_id`, `create_time`, `modify_time`) VALUES (8, 2, '2019-06-01 15:38:22', '2003-04-30 13:25:47');
INSERT INTO `paper` (`id`, `logical_paper_id`, `create_time`, `modify_time`) VALUES (9, 2, '2013-12-06 13:28:03', '2013-08-09 06:17:25');
INSERT INTO `paper` (`id`, `logical_paper_id`, `create_time`, `modify_time`) VALUES (10, 2, '2022-02-04 05:11:14', '2022-10-11 15:49:37');
INSERT INTO `paper` (`id`, `logical_paper_id`, `create_time`, `modify_time`) VALUES (11, 3, '2000-12-28 15:35:38', '2022-08-21 19:17:40');
INSERT INTO `paper` (`id`, `logical_paper_id`, `create_time`, `modify_time`) VALUES (12, 3, '2016-07-14 20:04:00', '2016-08-12 06:21:56');
INSERT INTO `paper` (`id`, `logical_paper_id`, `create_time`, `modify_time`) VALUES (13, 3, '2007-04-28 12:40:47', '2011-08-29 05:25:33');
INSERT INTO `paper` (`id`, `logical_paper_id`, `create_time`, `modify_time`) VALUES (14, 3, '2009-01-06 09:26:27', '2008-08-20 22:48:12');
INSERT INTO `paper` (`id`, `logical_paper_id`, `create_time`, `modify_time`) VALUES (15, 3, '2017-01-24 04:33:42', '2013-11-07 01:04:03');
INSERT INTO `paper` (`id`, `logical_paper_id`, `create_time`, `modify_time`) VALUES (16, 4, '2001-11-08 10:04:21', '2014-08-14 11:55:39');
INSERT INTO `paper` (`id`, `logical_paper_id`, `create_time`, `modify_time`) VALUES (17, 4, '2023-03-29 20:18:42', '2017-05-20 13:30:06');
INSERT INTO `paper` (`id`, `logical_paper_id`, `create_time`, `modify_time`) VALUES (18, 4, '2012-05-23 06:47:21', '2019-02-26 07:37:12');
INSERT INTO `paper` (`id`, `logical_paper_id`, `create_time`, `modify_time`) VALUES (19, 4, '2006-04-27 06:10:01', '2021-03-28 17:14:50');
INSERT INTO `paper` (`id`, `logical_paper_id`, `create_time`, `modify_time`) VALUES (20, 4, '2014-09-03 00:44:35', '2000-10-04 02:11:11');
INSERT INTO `paper` (`id`, `logical_paper_id`, `create_time`, `modify_time`) VALUES (21, 5, '2002-06-17 01:10:52', '2011-05-14 18:31:22');
INSERT INTO `paper` (`id`, `logical_paper_id`, `create_time`, `modify_time`) VALUES (22, 5, '2012-10-15 20:05:38', '2000-04-02 09:18:05');
INSERT INTO `paper` (`id`, `logical_paper_id`, `create_time`, `modify_time`) VALUES (23, 5, '2015-09-13 01:38:34', '2021-04-12 11:04:32');
INSERT INTO `paper` (`id`, `logical_paper_id`, `create_time`, `modify_time`) VALUES (24, 5, '2015-11-15 02:00:19', '2018-01-27 22:21:28');
INSERT INTO `paper` (`id`, `logical_paper_id`, `create_time`, `modify_time`) VALUES (25, 5, '2017-03-10 11:28:39', '2005-02-11 18:07:14');
INSERT INTO `paper` (`id`, `logical_paper_id`, `create_time`, `modify_time`) VALUES (26, 6, '2009-03-08 09:51:54', '2018-11-23 15:23:59');
INSERT INTO `paper` (`id`, `logical_paper_id`, `create_time`, `modify_time`) VALUES (27, 6, '2024-01-09 08:20:12', '2011-10-19 13:37:48');
INSERT INTO `paper` (`id`, `logical_paper_id`, `create_time`, `modify_time`) VALUES (28, 6, '2011-09-19 21:09:57', '2016-10-31 21:03:41');
INSERT INTO `paper` (`id`, `logical_paper_id`, `create_time`, `modify_time`) VALUES (29, 6, '2006-07-11 09:55:18', '2021-06-08 17:59:00');
INSERT INTO `paper` (`id`, `logical_paper_id`, `create_time`, `modify_time`) VALUES (30, 6, '2024-10-30 03:58:33', '2009-11-14 09:42:23');
INSERT INTO `paper` (`id`, `logical_paper_id`, `create_time`, `modify_time`) VALUES (31, 7, '2004-04-09 12:46:56', '2012-01-24 09:22:52');
INSERT INTO `paper` (`id`, `logical_paper_id`, `create_time`, `modify_time`) VALUES (32, 7, '2004-02-26 09:22:40', '2011-03-10 23:49:17');
INSERT INTO `paper` (`id`, `logical_paper_id`, `create_time`, `modify_time`) VALUES (33, 7, '2009-09-25 21:44:38', '2024-05-07 09:37:02');
INSERT INTO `paper` (`id`, `logical_paper_id`, `create_time`, `modify_time`) VALUES (34, 7, '2020-03-17 13:34:42', '2013-12-23 16:54:34');
INSERT INTO `paper` (`id`, `logical_paper_id`, `create_time`, `modify_time`) VALUES (35, 7, '2023-04-30 04:42:39', '2016-02-27 15:14:08');
INSERT INTO `paper` (`id`, `logical_paper_id`, `create_time`, `modify_time`) VALUES (36, 8, '2009-06-30 08:52:50', '2008-09-11 06:23:37');
INSERT INTO `paper` (`id`, `logical_paper_id`, `create_time`, `modify_time`) VALUES (37, 8, '2009-06-05 22:53:57', '2005-07-27 03:59:21');
INSERT INTO `paper` (`id`, `logical_paper_id`, `create_time`, `modify_time`) VALUES (38, 8, '2010-06-10 10:00:22', '2014-10-14 05:54:59');
INSERT INTO `paper` (`id`, `logical_paper_id`, `create_time`, `modify_time`) VALUES (39, 8, '2018-12-22 06:32:42', '2013-01-06 06:02:11');
INSERT INTO `paper` (`id`, `logical_paper_id`, `create_time`, `modify_time`) VALUES (40, 8, '2005-01-30 22:06:49', '2022-10-31 16:05:23');
INSERT INTO `paper` (`id`, `logical_paper_id`, `create_time`, `modify_time`) VALUES (41, 9, '2020-12-27 12:37:12', '2023-07-06 09:18:49');
INSERT INTO `paper` (`id`, `logical_paper_id`, `create_time`, `modify_time`) VALUES (42, 9, '2002-07-04 01:04:24', '2016-06-22 06:56:16');
INSERT INTO `paper` (`id`, `logical_paper_id`, `create_time`, `modify_time`) VALUES (43, 9, '2001-12-17 23:14:09', '2016-02-08 11:32:50');
INSERT INTO `paper` (`id`, `logical_paper_id`, `create_time`, `modify_time`) VALUES (44, 9, '2009-04-08 04:43:27', '2007-03-18 23:49:55');
INSERT INTO `paper` (`id`, `logical_paper_id`, `create_time`, `modify_time`) VALUES (45, 9, '2010-11-06 12:05:01', '2002-07-07 20:23:27');
INSERT INTO `paper` (`id`, `logical_paper_id`, `create_time`, `modify_time`) VALUES (46, 10, '2004-03-29 01:42:43', '2002-03-07 05:19:28');
INSERT INTO `paper` (`id`, `logical_paper_id`, `create_time`, `modify_time`) VALUES (47, 10, '2021-07-16 22:45:05', '2008-08-17 01:39:16');
INSERT INTO `paper` (`id`, `logical_paper_id`, `create_time`, `modify_time`) VALUES (48, 10, '2016-10-22 17:52:24', '2016-10-10 05:09:50');
INSERT INTO `paper` (`id`, `logical_paper_id`, `create_time`, `modify_time`) VALUES (49, 10, '2000-05-28 14:31:55', '2004-11-17 14:51:47');
INSERT INTO `paper` (`id`, `logical_paper_id`, `create_time`, `modify_time`) VALUES (50, 10, '2005-04-07 11:54:22', '2005-11-30 11:10:45');
INSERT INTO `paper` (`id`, `logical_paper_id`, `create_time`, `modify_time`) VALUES (51, 11, '2017-12-14 04:12:11', '2018-05-05 06:07:14');
INSERT INTO `paper` (`id`, `logical_paper_id`, `create_time`, `modify_time`) VALUES (52, 11, '2017-08-12 03:25:25', '2019-06-01 05:06:13');
INSERT INTO `paper` (`id`, `logical_paper_id`, `create_time`, `modify_time`) VALUES (53, 11, '2000-07-25 06:56:18', '2023-07-28 08:23:10');
INSERT INTO `paper` (`id`, `logical_paper_id`, `create_time`, `modify_time`) VALUES (54, 11, '2009-10-14 03:24:51', '2009-06-05 02:35:39');
INSERT INTO `paper` (`id`, `logical_paper_id`, `create_time`, `modify_time`) VALUES (55, 11, '2024-02-26 08:39:51', '2012-03-15 12:38:58');
INSERT INTO `paper` (`id`, `logical_paper_id`, `create_time`, `modify_time`) VALUES (56, 12, '2012-04-29 23:14:07', '2000-02-11 11:25:39');
INSERT INTO `paper` (`id`, `logical_paper_id`, `create_time`, `modify_time`) VALUES (57, 12, '2022-04-09 09:04:24', '2007-09-13 03:07:28');
INSERT INTO `paper` (`id`, `logical_paper_id`, `create_time`, `modify_time`) VALUES (58, 12, '2012-10-26 15:53:53', '2018-06-13 00:40:07');
INSERT INTO `paper` (`id`, `logical_paper_id`, `create_time`, `modify_time`) VALUES (59, 12, '2024-10-28 18:39:38', '2015-12-20 13:39:40');
INSERT INTO `paper` (`id`, `logical_paper_id`, `create_time`, `modify_time`) VALUES (60, 12, '2020-04-04 12:51:42', '2009-03-05 19:01:31');
INSERT INTO `paper` (`id`, `logical_paper_id`, `create_time`, `modify_time`) VALUES (61, 13, '2001-10-12 18:00:16', '2023-08-23 14:12:29');
INSERT INTO `paper` (`id`, `logical_paper_id`, `create_time`, `modify_time`) VALUES (62, 13, '2014-11-07 11:11:28', '2002-07-07 02:15:10');
INSERT INTO `paper` (`id`, `logical_paper_id`, `create_time`, `modify_time`) VALUES (63, 13, '2019-10-20 02:18:40', '2006-08-25 16:41:31');
INSERT INTO `paper` (`id`, `logical_paper_id`, `create_time`, `modify_time`) VALUES (64, 13, '2014-01-20 07:31:32', '2015-11-02 19:30:56');
INSERT INTO `paper` (`id`, `logical_paper_id`, `create_time`, `modify_time`) VALUES (65, 13, '2012-02-07 16:19:55', '2004-12-11 08:17:00');
INSERT INTO `paper` (`id`, `logical_paper_id`, `create_time`, `modify_time`) VALUES (66, 14, '2005-07-02 02:56:58', '2012-09-05 07:04:29');
INSERT INTO `paper` (`id`, `logical_paper_id`, `create_time`, `modify_time`) VALUES (67, 14, '2018-02-03 20:58:08', '2022-05-01 23:40:08');
INSERT INTO `paper` (`id`, `logical_paper_id`, `create_time`, `modify_time`) VALUES (68, 14, '2021-07-10 14:09:41', '2006-09-23 13:27:37');
INSERT INTO `paper` (`id`, `logical_paper_id`, `create_time`, `modify_time`) VALUES (69, 14, '2006-07-09 18:15:24', '2012-05-24 15:41:07');
INSERT INTO `paper` (`id`, `logical_paper_id`, `create_time`, `modify_time`) VALUES (70, 14, '2017-10-31 23:34:00', '2019-11-05 02:48:06');
INSERT INTO `paper` (`id`, `logical_paper_id`, `create_time`, `modify_time`) VALUES (71, 15, '2011-12-23 17:41:51', '2021-05-14 04:29:13');
INSERT INTO `paper` (`id`, `logical_paper_id`, `create_time`, `modify_time`) VALUES (72, 15, '2007-05-14 15:51:53', '2013-12-14 22:53:41');
INSERT INTO `paper` (`id`, `logical_paper_id`, `create_time`, `modify_time`) VALUES (73, 15, '2017-06-28 06:07:01', '2024-08-14 16:02:49');
INSERT INTO `paper` (`id`, `logical_paper_id`, `create_time`, `modify_time`) VALUES (74, 15, '2014-07-27 03:53:31', '2000-07-20 01:50:52');
INSERT INTO `paper` (`id`, `logical_paper_id`, `create_time`, `modify_time`) VALUES (75, 15, '2014-07-28 20:07:28', '2002-11-27 02:00:16');
INSERT INTO `paper` (`id`, `logical_paper_id`, `create_time`, `modify_time`) VALUES (76, 16, '2014-11-18 12:10:03', '2019-12-30 12:48:39');
INSERT INTO `paper` (`id`, `logical_paper_id`, `create_time`, `modify_time`) VALUES (77, 16, '2017-10-23 19:05:36', '2024-06-28 16:22:10');
INSERT INTO `paper` (`id`, `logical_paper_id`, `create_time`, `modify_time`) VALUES (78, 16, '2014-07-02 13:13:23', '2003-05-02 21:02:13');
INSERT INTO `paper` (`id`, `logical_paper_id`, `create_time`, `modify_time`) VALUES (79, 16, '2015-12-29 21:11:48', '2024-06-20 20:36:32');
INSERT INTO `paper` (`id`, `logical_paper_id`, `create_time`, `modify_time`) VALUES (80, 16, '2019-08-21 21:40:57', '2024-02-09 18:59:31');
INSERT INTO `paper` (`id`, `logical_paper_id`, `create_time`, `modify_time`) VALUES (81, 17, '2022-02-18 08:17:12', '2018-06-01 07:39:29');
INSERT INTO `paper` (`id`, `logical_paper_id`, `create_time`, `modify_time`) VALUES (82, 17, '2013-02-16 09:23:10', '2002-03-12 14:10:36');
INSERT INTO `paper` (`id`, `logical_paper_id`, `create_time`, `modify_time`) VALUES (83, 17, '2016-01-31 08:50:53', '2016-01-26 08:05:57');
INSERT INTO `paper` (`id`, `logical_paper_id`, `create_time`, `modify_time`) VALUES (84, 17, '2007-03-26 02:44:50', '2004-02-03 13:06:31');
INSERT INTO `paper` (`id`, `logical_paper_id`, `create_time`, `modify_time`) VALUES (85, 17, '2011-06-03 14:19:09', '2005-07-21 14:49:58');
INSERT INTO `paper` (`id`, `logical_paper_id`, `create_time`, `modify_time`) VALUES (86, 18, '2001-12-24 18:18:57', '2016-07-30 13:12:41');
INSERT INTO `paper` (`id`, `logical_paper_id`, `create_time`, `modify_time`) VALUES (87, 18, '2002-04-04 14:00:56', '2001-11-25 18:59:08');
INSERT INTO `paper` (`id`, `logical_paper_id`, `create_time`, `modify_time`) VALUES (88, 18, '2024-04-08 18:10:59', '2004-04-09 22:59:29');
INSERT INTO `paper` (`id`, `logical_paper_id`, `create_time`, `modify_time`) VALUES (89, 18, '2006-09-18 16:13:02', '2023-08-29 21:32:51');
INSERT INTO `paper` (`id`, `logical_paper_id`, `create_time`, `modify_time`) VALUES (90, 18, '2003-12-22 01:43:32', '2017-12-30 04:15:26');
INSERT INTO `paper` (`id`, `logical_paper_id`, `create_time`, `modify_time`) VALUES (91, 19, '2007-08-29 13:40:23', '2021-10-24 07:37:46');
INSERT INTO `paper` (`id`, `logical_paper_id`, `create_time`, `modify_time`) VALUES (92, 19, '2013-06-27 02:20:58', '2004-10-08 17:45:49');
INSERT INTO `paper` (`id`, `logical_paper_id`, `create_time`, `modify_time`) VALUES (93, 19, '2014-01-24 20:53:58', '2023-01-25 16:27:25');
INSERT INTO `paper` (`id`, `logical_paper_id`, `create_time`, `modify_time`) VALUES (94, 19, '2012-02-23 05:07:57', '2007-05-05 03:14:19');
INSERT INTO `paper` (`id`, `logical_paper_id`, `create_time`, `modify_time`) VALUES (95, 19, '2002-05-27 15:38:28', '2017-08-12 05:58:01');
INSERT INTO `paper` (`id`, `logical_paper_id`, `create_time`, `modify_time`) VALUES (96, 20, '2023-01-23 19:57:09', '2016-05-27 09:29:28');
INSERT INTO `paper` (`id`, `logical_paper_id`, `create_time`, `modify_time`) VALUES (97, 20, '2015-12-03 02:18:51', '2017-12-10 05:32:25');
INSERT INTO `paper` (`id`, `logical_paper_id`, `create_time`, `modify_time`) VALUES (98, 20, '2024-05-28 20:55:16', '2005-05-21 11:09:25');
INSERT INTO `paper` (`id`, `logical_paper_id`, `create_time`, `modify_time`) VALUES (99, 20, '2011-07-06 03:31:43', '2019-01-12 17:36:04');
INSERT INTO `paper` (`id`, `logical_paper_id`, `create_time`, `modify_time`) VALUES (100, 20, '2019-12-20 18:05:36', '2017-06-25 23:55:57');
INSERT INTO `paper` (`id`, `logical_paper_id`, `create_time`, `modify_time`) VALUES (101, 30, '2024-12-30 19:25:31', '2024-12-30 19:25:31');
INSERT INTO `paper` (`id`, `logical_paper_id`, `create_time`, `modify_time`) VALUES (102, 34, '2024-12-30 19:43:42', '2024-12-30 19:43:42');
INSERT INTO `paper` (`id`, `logical_paper_id`, `create_time`, `modify_time`) VALUES (103, 35, '2024-12-30 19:47:44', '2024-12-30 19:47:44');
INSERT INTO `paper` (`id`, `logical_paper_id`, `create_time`, `modify_time`) VALUES (104, 36, '2024-12-30 19:53:36', '2024-12-30 19:53:36');
INSERT INTO `paper` (`id`, `logical_paper_id`, `create_time`, `modify_time`) VALUES (105, 37, '2024-12-30 20:02:32', '2024-12-30 20:02:32');
INSERT INTO `paper` (`id`, `logical_paper_id`, `create_time`, `modify_time`) VALUES (106, 39, '2024-12-30 20:05:07', '2024-12-30 20:05:07');
INSERT INTO `paper` (`id`, `logical_paper_id`, `create_time`, `modify_time`) VALUES (107, 40, '2024-12-30 20:18:16', '2024-12-30 20:18:16');
INSERT INTO `paper` (`id`, `logical_paper_id`, `create_time`, `modify_time`) VALUES (108, 41, '2024-12-30 21:17:39', '2024-12-30 21:17:39');
COMMIT;

-- ----------------------------
-- Table structure for paper_problem
-- ----------------------------
DROP TABLE IF EXISTS `paper_problem`;
CREATE TABLE `paper_problem` (
  `id` int NOT NULL AUTO_INCREMENT,
  `paper_id` int NOT NULL,
  `problem_id` int NOT NULL,
  `problem_order` int DEFAULT NULL,
  `point` int DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `modify_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `problem_id_fk` (`problem_id`) USING BTREE,
  KEY `paper_id_fk2` (`paper_id`),
  CONSTRAINT `paper_id_fk2` FOREIGN KEY (`paper_id`) REFERENCES `paper` (`id`) ON DELETE CASCADE,
  CONSTRAINT `problem_id_fk3` FOREIGN KEY (`problem_id`) REFERENCES `problem` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of paper_problem
-- ----------------------------
BEGIN;
INSERT INTO `paper_problem` (`id`, `paper_id`, `problem_id`, `problem_order`, `point`, `create_time`, `modify_time`) VALUES (1, 1, 4, NULL, 3, NULL, NULL);
INSERT INTO `paper_problem` (`id`, `paper_id`, `problem_id`, `problem_order`, `point`, `create_time`, `modify_time`) VALUES (2, 1, 3, NULL, 3, NULL, NULL);
INSERT INTO `paper_problem` (`id`, `paper_id`, `problem_id`, `problem_order`, `point`, `create_time`, `modify_time`) VALUES (3, 1, 2, NULL, 5, NULL, NULL);
INSERT INTO `paper_problem` (`id`, `paper_id`, `problem_id`, `problem_order`, `point`, `create_time`, `modify_time`) VALUES (4, 1, 1, NULL, 5, NULL, NULL);
INSERT INTO `paper_problem` (`id`, `paper_id`, `problem_id`, `problem_order`, `point`, `create_time`, `modify_time`) VALUES (5, 108, 21, NULL, 10, '2024-12-30 21:17:39', '2024-12-30 21:17:39');
INSERT INTO `paper_problem` (`id`, `paper_id`, `problem_id`, `problem_order`, `point`, `create_time`, `modify_time`) VALUES (6, 108, 15, NULL, 10, '2024-12-30 21:17:39', '2024-12-30 21:17:39');
INSERT INTO `paper_problem` (`id`, `paper_id`, `problem_id`, `problem_order`, `point`, `create_time`, `modify_time`) VALUES (7, 108, 14, NULL, 10, '2024-12-30 21:17:40', '2024-12-30 21:17:40');
INSERT INTO `paper_problem` (`id`, `paper_id`, `problem_id`, `problem_order`, `point`, `create_time`, `modify_time`) VALUES (8, 108, 19, NULL, 10, '2024-12-30 21:17:40', '2024-12-30 21:17:40');
INSERT INTO `paper_problem` (`id`, `paper_id`, `problem_id`, `problem_order`, `point`, `create_time`, `modify_time`) VALUES (9, 108, 22, NULL, 15, '2024-12-30 21:17:40', '2024-12-30 21:17:40');
INSERT INTO `paper_problem` (`id`, `paper_id`, `problem_id`, `problem_order`, `point`, `create_time`, `modify_time`) VALUES (10, 108, 20, NULL, 15, '2024-12-30 21:17:40', '2024-12-30 21:17:40');
INSERT INTO `paper_problem` (`id`, `paper_id`, `problem_id`, `problem_order`, `point`, `create_time`, `modify_time`) VALUES (11, 108, 17, NULL, 10, '2024-12-30 21:17:40', '2024-12-30 21:17:40');
INSERT INTO `paper_problem` (`id`, `paper_id`, `problem_id`, `problem_order`, `point`, `create_time`, `modify_time`) VALUES (12, 108, 29, NULL, 10, '2024-12-30 21:17:40', '2024-12-30 21:17:40');
COMMIT;

-- ----------------------------
-- Table structure for problem
-- ----------------------------
DROP TABLE IF EXISTS `problem`;
CREATE TABLE `problem` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `difficulty` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `pass_rate` double DEFAULT NULL,
  `img_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `course_id` int DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `modify_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id` (`id`) USING BTREE,
  KEY `course_id_fk` (`course_id`) USING BTREE,
  CONSTRAINT `course_id_fk` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of problem
-- ----------------------------
BEGIN;
INSERT INTO `problem` (`id`, `type`, `title`, `description`, `difficulty`, `pass_rate`, `img_url`, `course_id`, `create_time`, `modify_time`) VALUES (1, '简答', '题目标题Aa8SCVpN7u', 'Navicat authorizes you to make connection to remote servers running on different platforms (i.e. Windows, macOS, Linux and UNIX), and supports PAM and GSSAPI authentication. If opportunity doesn’t knock, build a door. The repository database            ', '1', 1, NULL, 1, '2012-01-15 10:39:29', '2005-02-16 11:04:57');
INSERT INTO `problem` (`id`, `type`, `title`, `description`, `difficulty`, `pass_rate`, `img_url`, `course_id`, `create_time`, `modify_time`) VALUES (2, '简答', '题目标题7PCunAvhcD', 'All journeys have secret destinations of which the traveler is unaware. Navicat provides powerful tools for working with queries: Query Editor for editing the query text directly, and Query Builder, Find Builder or Aggregate Builder for                   ', '1', 5, NULL, 1, '2008-05-23 23:00:44', '2018-10-17 12:08:59');
INSERT INTO `problem` (`id`, `type`, `title`, `description`, `difficulty`, `pass_rate`, `img_url`, `course_id`, `create_time`, `modify_time`) VALUES (3, '填空', '题目标题XPUUzVIXSv', 'To start working with your server in Navicat, you should first establish a connection or several connections using the Connection window. To successfully establish a new connection to local/remote server - no matter via SSL, SSH or HTTP,                  ', '5', 5, 'https://drive.chimingwo.us/AutomotivePartsAccessories', 1, '2023-04-01 06:30:31', '2024-05-29 23:03:46');
INSERT INTO `problem` (`id`, `type`, `title`, `description`, `difficulty`, `pass_rate`, `img_url`, `course_id`, `create_time`, `modify_time`) VALUES (4, '简答', '题目标题4F2wXIzqg1', 'If your Internet Service Provider (ISP) does not provide direct access to its server, Secure Tunneling Protocol (SSH) / HTTP is another solution. Anyone who has never made a mistake has never tried anything new. After comparing data, the                  ', '5', 5, NULL, 1, '2021-04-29 23:15:48', '2022-03-28 17:13:16');
INSERT INTO `problem` (`id`, `type`, `title`, `description`, `difficulty`, `pass_rate`, `img_url`, `course_id`, `create_time`, `modify_time`) VALUES (5, '填空', '题目标题72W2cboLfw', 'To successfully establish a new connection to local/remote server - no matter via SSL or SSH, set the database login information in the General tab.', '5', 5, NULL, 1, '2017-08-10 22:15:21', '2019-06-10 08:15:11');
INSERT INTO `problem` (`id`, `type`, `title`, `description`, `difficulty`, `pass_rate`, `img_url`, `course_id`, `create_time`, `modify_time`) VALUES (6, '简答', '题目标题7kG1jaAKTO', 'What you get by achieving your goals is not as important as what you become by achieving your goals. Genius is an infinite capacity for taking pains.', '5', 5, 'https://video.mazhennan.xyz/IndustrialScientificSupplies', 1, '2004-10-30 01:05:52', '2021-02-13 18:48:17');
INSERT INTO `problem` (`id`, `type`, `title`, `description`, `difficulty`, `pass_rate`, `img_url`, `course_id`, `create_time`, `modify_time`) VALUES (7, '判断', '题目标题E8YjvQuWi2', 'Typically, it is employed as an encrypted version of Telnet. The repository database can be an existing MySQL, MariaDB, PostgreSQL, SQL Server, or Amazon RDS instance.', '5', 5, 'http://www.yunxiding.jp/Baby', 1, '2011-06-11 06:11:44', '2019-08-24 17:37:42');
INSERT INTO `problem` (`id`, `type`, `title`, `description`, `difficulty`, `pass_rate`, `img_url`, `course_id`, `create_time`, `modify_time`) VALUES (8, '简答', '题目标题sSM5nfPCvb', 'A man is not old until regrets take the place of dreams. To get a secure connection, the first thing you need to do is to install OpenSSL Library and download Database Source. If your Internet Service Provider (ISP) does not provide direct                ', '5', 5, NULL, 1, '2002-11-24 14:39:51', '2005-08-21 12:41:57');
INSERT INTO `problem` (`id`, `type`, `title`, `description`, `difficulty`, `pass_rate`, `img_url`, `course_id`, `create_time`, `modify_time`) VALUES (9, '填空', '题目标题1KXEALS2rL', 'Navicat Monitor requires a repository to store alerts and metrics for historical analysis. It wasn’t raining when Noah built the ark. To successfully establish a new connection to local/remote server - no matter via SSL or SSH, set the                  ', '5', 5, 'http://auth.jiehongli.us/ArtsHandicraftsSewing', 1, '2017-01-24 10:49:27', '2020-07-11 18:57:18');
INSERT INTO `problem` (`id`, `type`, `title`, `description`, `difficulty`, `pass_rate`, `img_url`, `course_id`, `create_time`, `modify_time`) VALUES (10, '判断', '题目标题FzOFZ2pPD2', 'A man’s best friends are his ten fingers. To successfully establish a new connection to local/remote server - no matter via SSL, SSH or HTTP, set the database login information in the General tab. If you wait, all that happens is you get older.', '5', 1, 'http://www.abhazuki.info/AutomotivePartsAccessories', 1, '2019-06-09 12:15:05', '2009-10-23 22:01:13');
INSERT INTO `problem` (`id`, `type`, `title`, `description`, `difficulty`, `pass_rate`, `img_url`, `course_id`, `create_time`, `modify_time`) VALUES (11, '简答', '题目标题JFAhZhulKi', 'In the Objects tab, you can use the List List, Detail Detail and ER Diagram ER Diagram buttons to change the object view. To start working with your server in Navicat, you should first establish a connection or several connections using                   ', '5', 1, NULL, 1, '2012-06-19 08:02:38', '2024-05-19 03:25:40');
INSERT INTO `problem` (`id`, `type`, `title`, `description`, `difficulty`, `pass_rate`, `img_url`, `course_id`, `create_time`, `modify_time`) VALUES (12, '填空', '题目标题ujKA2mFx3z', 'Success consists of going from failure to failure without loss of enthusiasm. Sometimes you win, sometimes you learn. Navicat provides a wide range advanced features, such as compelling code editing capabilities, smart code-completion,                    ', '5', 1, NULL, 1, '2010-11-11 07:24:35', '2010-02-25 16:06:33');
INSERT INTO `problem` (`id`, `type`, `title`, `description`, `difficulty`, `pass_rate`, `img_url`, `course_id`, `create_time`, `modify_time`) VALUES (13, '填空', '题目标题ZMXzlAQzQ1', 'It is used while your ISPs do not allow direct connections, but allows establishing HTTP connections. The Navigation pane employs tree structure which allows you to take action upon the database and their objects through their pop-up menus                ', '5', 1, NULL, 1, '2024-01-31 08:46:46', '2017-08-26 23:57:08');
INSERT INTO `problem` (`id`, `type`, `title`, `description`, `difficulty`, `pass_rate`, `img_url`, `course_id`, `create_time`, `modify_time`) VALUES (14, '选择', '题目标题9Kk3aXICJW', 'There is no way to happiness. Happiness is the way. How we spend our days is, of course, how we spend our lives. I may not have gone where I intended to go, but I think I have ended up where I needed to be.', '3', 1, 'http://video.momosasaki.biz/ClothingShoesandJewelry', 1, '2016-06-23 17:45:45', '2021-05-22 10:55:19');
INSERT INTO `problem` (`id`, `type`, `title`, `description`, `difficulty`, `pass_rate`, `img_url`, `course_id`, `create_time`, `modify_time`) VALUES (15, '判断', '题目标题obtqw4rVO9', 'Anyone who has ever made anything of importance was disciplined. Anyone who has ever made anything of importance was disciplined. Navicat Monitor requires a repository to store alerts and metrics for historical analysis.', '3', 1, NULL, 1, '2008-03-01 21:16:01', '2014-06-23 19:17:55');
INSERT INTO `problem` (`id`, `type`, `title`, `description`, `difficulty`, `pass_rate`, `img_url`, `course_id`, `create_time`, `modify_time`) VALUES (16, '判断', '题目标题OFI70lcsft', 'In other words, Navicat provides the ability for data in different databases and/or schemas to be kept up-to-date so that each repository contains the same information.', '3', 1, NULL, 1, '2004-11-08 00:36:24', '2014-01-25 03:05:18');
INSERT INTO `problem` (`id`, `type`, `title`, `description`, `difficulty`, `pass_rate`, `img_url`, `course_id`, `create_time`, `modify_time`) VALUES (17, '简答', '题目标题t0ay32D8Bc', 'Navicat provides powerful tools for working with queries: Query Editor for editing the query text directly, and Query Builder, Find Builder or Aggregate Builder for building queries visually. Typically, it is employed as an encrypted version of Telnet.', '3', 1, NULL, 1, '2012-02-01 09:32:54', '2002-11-15 22:14:30');
INSERT INTO `problem` (`id`, `type`, `title`, `description`, `difficulty`, `pass_rate`, `img_url`, `course_id`, `create_time`, `modify_time`) VALUES (18, '判断', '题目标题gAOsQ7Xq46', 'The Information Pane shows the detailed object information, project activities, the DDL of database objects, object dependencies, membership of users/roles and preview.', '3', 1, NULL, 1, '2020-09-02 14:51:35', '2022-12-07 04:16:44');
INSERT INTO `problem` (`id`, `type`, `title`, `description`, `difficulty`, `pass_rate`, `img_url`, `course_id`, `create_time`, `modify_time`) VALUES (19, '选择', '题目标题OHCMpdgg5E', 'Navicat is a multi-connections Database Administration tool allowing you to connect to MySQL, Oracle, PostgreSQL, SQLite, SQL Server, MariaDB and/or MongoDB databases, making database administration to multiple kinds of database so easy.', '3', 1, NULL, 1, '2019-04-12 09:55:49', '2024-01-24 03:49:03');
INSERT INTO `problem` (`id`, `type`, `title`, `description`, `difficulty`, `pass_rate`, `img_url`, `course_id`, `create_time`, `modify_time`) VALUES (20, '填空', '题目标题EQfTDmYBNc', 'All journeys have secret destinations of which the traveler is unaware. You cannot save people, you can just love them.', '3', 1, NULL, 1, '2001-10-10 07:41:01', '2013-02-06 03:09:56');
INSERT INTO `problem` (`id`, `type`, `title`, `description`, `difficulty`, `pass_rate`, `img_url`, `course_id`, `create_time`, `modify_time`) VALUES (21, '判断', '题目标题mC2ilsh0yE', 'Navicat Monitor requires a repository to store alerts and metrics for historical analysis. It wasn’t raining when Noah built the ark. A comfort zone is a beautiful place, but nothing ever grows there.', '3', 3, 'https://image.kwokkuen1962.xyz/CellPhonesAccessories', 1, '2022-07-01 09:53:40', '2022-06-04 01:53:49');
INSERT INTO `problem` (`id`, `type`, `title`, `description`, `difficulty`, `pass_rate`, `img_url`, `course_id`, `create_time`, `modify_time`) VALUES (22, '填空', '题目标题bSsTix7XPs', 'You must be the change you wish to see in the world. HTTP Tunneling is a method for connecting to a server that uses the same protocol (http://) and the same port (port 80) as a web server does.', '3', 3, NULL, 1, '2001-11-20 01:52:00', '2007-05-12 12:05:57');
INSERT INTO `problem` (`id`, `type`, `title`, `description`, `difficulty`, `pass_rate`, `img_url`, `course_id`, `create_time`, `modify_time`) VALUES (23, '选择', '题目标题31zUyxkhWU', 'To successfully establish a new connection to local/remote server - no matter via SSL, SSH or HTTP, set the database login information in the General tab. Navicat Monitor can be installed on any local computer or virtual machine and does                  ', '1', 3, NULL, 1, '2017-02-27 23:26:31', '2016-05-24 07:55:51');
INSERT INTO `problem` (`id`, `type`, `title`, `description`, `difficulty`, `pass_rate`, `img_url`, `course_id`, `create_time`, `modify_time`) VALUES (24, '简答', '题目标题c10tfDhfCW', 'If the plan doesn’t work, change the plan, but never the goal. Import Wizard allows you to import data to tables/collections from CSV, TXT, XML, DBF and more.', '1', 3, NULL, 1, '2018-01-10 01:57:38', '2001-04-04 20:12:21');
INSERT INTO `problem` (`id`, `type`, `title`, `description`, `difficulty`, `pass_rate`, `img_url`, `course_id`, `create_time`, `modify_time`) VALUES (25, '判断', '题目标题aAI4xnyD8C', 'Instead of wondering when your next vacation is, maybe you should set up a life you don’t need to escape from. A man’s best friends are his ten fingers. Navicat 15 has added support for the system-wide dark mode. To start working with                 ', '1', 3, 'https://auth.ho3.co.jp/ToysGames', 1, '2000-09-23 19:01:52', '2003-11-17 12:14:58');
INSERT INTO `problem` (`id`, `type`, `title`, `description`, `difficulty`, `pass_rate`, `img_url`, `course_id`, `create_time`, `modify_time`) VALUES (26, '选择', '题目标题1fO3OHY7Xv', 'The Synchronize to Database function will give you a full picture of all database differences. There is no way to happiness. Happiness is the way. To get a secure connection, the first thing you need to do is to install OpenSSL Library                    ', '1', 3, NULL, 1, '2001-09-17 12:30:38', '2006-10-03 15:10:16');
INSERT INTO `problem` (`id`, `type`, `title`, `description`, `difficulty`, `pass_rate`, `img_url`, `course_id`, `create_time`, `modify_time`) VALUES (27, '判断', '题目标题QoW0quEcye', 'Instead of wondering when your next vacation is, maybe you should set up a life you don’t need to escape from. Navicat authorizes you to make connection to remote servers running on different platforms (i.e. Windows, macOS, Linux and                    ', '1', 3, NULL, 1, '2023-06-25 07:16:55', '2022-10-11 16:48:35');
INSERT INTO `problem` (`id`, `type`, `title`, `description`, `difficulty`, `pass_rate`, `img_url`, `course_id`, `create_time`, `modify_time`) VALUES (28, '判断', '题目标题YHowGzuZUo', 'If it scares you, it might be a good thing to try. Navicat Cloud could not connect and access your databases. By which it means, it could only store your connection settings, queries, model files, and virtual group; your database passwords                ', '4', 3, 'https://drive.sitsw324.biz/BaggageTravelEquipment', 1, '2020-01-31 07:43:04', '2019-04-29 02:11:29');
INSERT INTO `problem` (`id`, `type`, `title`, `description`, `difficulty`, `pass_rate`, `img_url`, `course_id`, `create_time`, `modify_time`) VALUES (29, '简答', '题目标题Paeg9JSqMp', 'The Information Pane shows the detailed object information, project activities, the DDL of database objects, object dependencies, membership of users/roles and preview.', '4', 3, NULL, 1, '2017-06-02 00:33:51', '2014-02-13 08:52:39');
INSERT INTO `problem` (`id`, `type`, `title`, `description`, `difficulty`, `pass_rate`, `img_url`, `course_id`, `create_time`, `modify_time`) VALUES (30, '简答', '题目标题6pe6jdZMUH', 'To successfully establish a new connection to local/remote server - no matter via SSL, SSH or HTTP, set the database login information in the General tab. Secure Sockets Layer(SSL) is a protocol for transmitting private documents via the Internet.', '4', 3, NULL, 1, '2024-02-23 00:37:38', '2020-01-06 05:11:55');
INSERT INTO `problem` (`id`, `type`, `title`, `description`, `difficulty`, `pass_rate`, `img_url`, `course_id`, `create_time`, `modify_time`) VALUES (31, '填空', '题目标题13pNWbIFK2', 'Navicat Data Modeler is a powerful and cost-effective database design tool which helps you build high-quality conceptual, logical and physical data models.', '4', 3, NULL, 1, '2003-02-06 07:25:32', '2019-10-16 10:24:18');
INSERT INTO `problem` (`id`, `type`, `title`, `description`, `difficulty`, `pass_rate`, `img_url`, `course_id`, `create_time`, `modify_time`) VALUES (32, '选择', '题目标题s3kAosLLWK', 'A man’s best friends are his ten fingers. Navicat Data Modeler is a powerful and cost-effective database design tool which helps you build high-quality conceptual, logical and physical data models.', '4', 3, NULL, 1, '2000-12-27 01:21:35', '2022-06-09 02:26:23');
INSERT INTO `problem` (`id`, `type`, `title`, `description`, `difficulty`, `pass_rate`, `img_url`, `course_id`, `create_time`, `modify_time`) VALUES (33, '简答', '题目标题GowmedSsLY', 'Flexible settings enable you to set up a custom key for comparison and synchronization. Navicat Monitor is a safe, simple and agentless remote server monitoring tool that is packed with powerful features to make your monitoring effective as possible.', '4', 3, NULL, 1, '2011-08-14 21:59:10', '2015-09-12 05:13:54');
INSERT INTO `problem` (`id`, `type`, `title`, `description`, `difficulty`, `pass_rate`, `img_url`, `course_id`, `create_time`, `modify_time`) VALUES (34, '填空', '题目标题k1F6tz6RIz', 'All journeys have secret destinations of which the traveler is unaware. Navicat Monitor is a safe, simple and agentless remote server monitoring tool that is packed with powerful features to make your monitoring effective as possible.', '4', 3, NULL, 1, '2018-03-12 19:59:13', '2001-12-31 01:12:32');
INSERT INTO `problem` (`id`, `type`, `title`, `description`, `difficulty`, `pass_rate`, `img_url`, `course_id`, `create_time`, `modify_time`) VALUES (35, '判断', '题目标题Y9ZOWHHQ5Y', 'Optimism is the one quality more associated with success and happiness than any other. Instead of wondering when your next vacation is, maybe you should set up a life you don’t need to escape from. It can also manage cloud databases such                ', '4', 2, NULL, 1, '2004-12-30 19:08:29', '2002-01-08 09:31:37');
INSERT INTO `problem` (`id`, `type`, `title`, `description`, `difficulty`, `pass_rate`, `img_url`, `course_id`, `create_time`, `modify_time`) VALUES (36, '判断', '题目标题f3QrWRoBSg', 'Flexible settings enable you to set up a custom key for comparison and synchronization. The Main Window consists of several toolbars and panes for you to work on connections, database objects and advanced tools.', '4', 2, 'http://auth.bella9.us/HouseholdKitchenAppliances', 1, '2018-07-11 15:08:29', '2013-08-17 15:17:28');
INSERT INTO `problem` (`id`, `type`, `title`, `description`, `difficulty`, `pass_rate`, `img_url`, `course_id`, `create_time`, `modify_time`) VALUES (37, '填空', '题目标题3PUXyPOQJX', 'Secure SHell (SSH) is a program to log in into another computer over a network, execute commands on a remote server, and move files from one machine to another. Always keep your eyes open. Keep watching. Because whatever you see can inspire you.', '4', 2, NULL, 1, '2007-04-03 21:49:55', '2023-07-12 01:14:54');
INSERT INTO `problem` (`id`, `type`, `title`, `description`, `difficulty`, `pass_rate`, `img_url`, `course_id`, `create_time`, `modify_time`) VALUES (38, '填空', '题目标题Law6HOZ3rN', 'Navicat Monitor requires a repository to store alerts and metrics for historical analysis. Sometimes you win, sometimes you learn.', '4', 2, NULL, 1, '2021-08-18 21:38:52', '2000-09-06 14:39:41');
INSERT INTO `problem` (`id`, `type`, `title`, `description`, `difficulty`, `pass_rate`, `img_url`, `course_id`, `create_time`, `modify_time`) VALUES (39, '选择', '题目标题RBLYoQKwCD', 'Navicat provides a wide range advanced features, such as compelling code editing capabilities, smart code-completion, SQL formatting, and more. Navicat Monitor requires a repository to store alerts and metrics for historical analysis.                     ', '4', 2, NULL, 1, '2024-12-07 02:05:46', '2009-07-06 20:28:54');
INSERT INTO `problem` (`id`, `type`, `title`, `description`, `difficulty`, `pass_rate`, `img_url`, `course_id`, `create_time`, `modify_time`) VALUES (40, '判断', '题目标题4HoBHIagxR', 'In other words, Navicat provides the ability for data in different databases and/or schemas to be kept up-to-date so that each repository contains the same information.', '4', 2, NULL, 1, '2001-07-04 18:14:39', '2022-09-20 11:12:28');
INSERT INTO `problem` (`id`, `type`, `title`, `description`, `difficulty`, `pass_rate`, `img_url`, `course_id`, `create_time`, `modify_time`) VALUES (41, '选择', '题目标题kVEqilEmyy', 'After logged in the Navicat Cloud feature, the Navigation pane will be divided into Navicat Cloud and My Connections sections. If the Show objects under schema in navigation pane option is checked at the Preferences window, all database                   ', '4', 2, NULL, 1, '2003-12-06 03:52:43', '2016-07-16 08:33:26');
INSERT INTO `problem` (`id`, `type`, `title`, `description`, `difficulty`, `pass_rate`, `img_url`, `course_id`, `create_time`, `modify_time`) VALUES (42, '简答', '题目标题Oay9PkEAPy', 'What you get by achieving your goals is not as important as what you become by achieving your goals. Optimism is the one quality more associated with success and happiness than any other. Optimism is the one quality more associated with                   ', '4', 2, NULL, 1, '2000-06-05 03:30:40', '2021-09-29 18:42:59');
INSERT INTO `problem` (`id`, `type`, `title`, `description`, `difficulty`, `pass_rate`, `img_url`, `course_id`, `create_time`, `modify_time`) VALUES (43, '选择', '题目标题Us7V6js51V', 'Remember that failure is an event, not a person. You cannot save people, you can just love them. Genius is an infinite capacity for taking pains.', '4', 2, NULL, 1, '2000-04-11 03:11:46', '2023-09-18 03:44:51');
INSERT INTO `problem` (`id`, `type`, `title`, `description`, `difficulty`, `pass_rate`, `img_url`, `course_id`, `create_time`, `modify_time`) VALUES (44, '简答', '题目标题j7biP978BG', 'To start working with your server in Navicat, you should first establish a connection or several connections using the Connection window. In the Objects tab, you can use the List List, Detail Detail and ER Diagram ER Diagram buttons to                    ', '4', 3, 'https://www.mitchelldiane.info/CellPhonesAccessories', 1, '2022-11-20 06:56:26', '2002-11-26 19:09:43');
INSERT INTO `problem` (`id`, `type`, `title`, `description`, `difficulty`, `pass_rate`, `img_url`, `course_id`, `create_time`, `modify_time`) VALUES (45, '简答', '题目标题7Owiw3W437', 'The repository database can be an existing MySQL, MariaDB, PostgreSQL, SQL Server, or Amazon RDS instance. Navicat Monitor is a safe, simple and agentless remote server monitoring tool that is packed with powerful features to make your                    ', '4', 3, NULL, 1, '2018-06-24 05:09:10', '2010-01-24 20:23:07');
INSERT INTO `problem` (`id`, `type`, `title`, `description`, `difficulty`, `pass_rate`, `img_url`, `course_id`, `create_time`, `modify_time`) VALUES (46, '选择', '题目标题CAiYS57I7z', 'Typically, it is employed as an encrypted version of Telnet. Such sessions are also susceptible to session hijacking, where a malicious user takes over your session once you have authenticated. There is no way to happiness. Happiness is the way.', '4', 3, NULL, 1, '2009-11-13 00:38:42', '2007-08-31 09:44:05');
INSERT INTO `problem` (`id`, `type`, `title`, `description`, `difficulty`, `pass_rate`, `img_url`, `course_id`, `create_time`, `modify_time`) VALUES (47, '简答', '题目标题8khyWzn91g', 'The Information Pane shows the detailed object information, project activities, the DDL of database objects, object dependencies, membership of users/roles and preview. Anyone who has never made a mistake has never tried anything new.                     ', '4', 3, NULL, 1, '2017-04-17 00:00:15', '2024-12-02 01:38:15');
INSERT INTO `problem` (`id`, `type`, `title`, `description`, `difficulty`, `pass_rate`, `img_url`, `course_id`, `create_time`, `modify_time`) VALUES (48, '判断', '题目标题Ovkou6z8VK', 'Genius is an infinite capacity for taking pains. The past has no power over the present moment. Navicat allows you to transfer data from one database and/or schema to another with detailed analytical process.', '4', 3, NULL, 1, '2023-02-19 12:11:30', '2001-11-19 17:03:36');
INSERT INTO `problem` (`id`, `type`, `title`, `description`, `difficulty`, `pass_rate`, `img_url`, `course_id`, `create_time`, `modify_time`) VALUES (49, '选择', '题目标题vJzIfXAjBi', 'All journeys have secret destinations of which the traveler is unaware. Success consists of going from failure to failure without loss of enthusiasm. HTTP Tunneling is a method for connecting to a server that uses the same protocol (http://)              ', '4', 3, NULL, 1, '2021-07-20 20:22:47', '2003-03-12 18:33:47');
INSERT INTO `problem` (`id`, `type`, `title`, `description`, `difficulty`, `pass_rate`, `img_url`, `course_id`, `create_time`, `modify_time`) VALUES (50, '填空', '题目标题y6M2QrBm0B', 'Anyone who has never made a mistake has never tried anything new. To start working with your server in Navicat, you should first establish a connection or several connections using the Connection window. Monitored servers include MySQL,                   ', '2', 3, NULL, 1, '2010-07-18 10:10:33', '2012-05-08 06:00:52');
INSERT INTO `problem` (`id`, `type`, `title`, `description`, `difficulty`, `pass_rate`, `img_url`, `course_id`, `create_time`, `modify_time`) VALUES (51, '简答', '题目标题47R8RWSR6x', 'Optimism is the one quality more associated with success and happiness than any other. Monitored servers include MySQL, MariaDB and SQL Server, and compatible with cloud databases like Amazon RDS, Amazon Aurora, Oracle Cloud, Google Cloud                 ', '2', 3, NULL, 1, '2004-03-29 01:16:46', '2008-02-07 19:04:26');
INSERT INTO `problem` (`id`, `type`, `title`, `description`, `difficulty`, `pass_rate`, `img_url`, `course_id`, `create_time`, `modify_time`) VALUES (52, '选择', '题目标题fLsqAoPqj4', 'A comfort zone is a beautiful place, but nothing ever grows there. The reason why a great man is great is that he resolves to be a great man.', '2', 3, 'http://auth.lamls.co.jp/BeautyPersonalCare', 1, '2016-10-31 03:42:17', '2001-05-03 10:30:23');
INSERT INTO `problem` (`id`, `type`, `title`, `description`, `difficulty`, `pass_rate`, `img_url`, `course_id`, `create_time`, `modify_time`) VALUES (53, '简答', '题目标题Bj5iBvUE9O', 'HTTP Tunneling is a method for connecting to a server that uses the same protocol (http://) and the same port (port 80) as a web server does. You can select any connections, objects or projects, and then select the corresponding buttons                   ', '2', 3, 'http://image.kidebo.cn/Others', 1, '2010-12-18 23:40:41', '2004-01-25 04:58:50');
INSERT INTO `problem` (`id`, `type`, `title`, `description`, `difficulty`, `pass_rate`, `img_url`, `course_id`, `create_time`, `modify_time`) VALUES (54, '选择', '题目标题GaHjd3xfzx', 'In the middle of winter I at last discovered that there was in me an invincible summer. The Navigation pane employs tree structure which allows you to take action upon the database and their objects through their pop-up menus quickly and easily.', '2', 3, NULL, 1, '2005-01-20 03:39:17', '2015-04-25 13:37:06');
INSERT INTO `problem` (`id`, `type`, `title`, `description`, `difficulty`, `pass_rate`, `img_url`, `course_id`, `create_time`, `modify_time`) VALUES (55, '选择', '题目标题LNwZn2K0Ou', 'Secure SHell (SSH) is a program to log in into another computer over a network, execute commands on a remote server, and move files from one machine to another. Navicat Monitor can be installed on any local computer or virtual machine and                 ', '2', 3, 'http://drive.wonght.net/CellPhonesAccessories', 1, '2020-01-26 10:14:13', '2020-12-04 13:12:10');
INSERT INTO `problem` (`id`, `type`, `title`, `description`, `difficulty`, `pass_rate`, `img_url`, `course_id`, `create_time`, `modify_time`) VALUES (56, '选择', '题目标题p91cfHT8jz', 'Anyone who has ever made anything of importance was disciplined. Always keep your eyes open. Keep watching. Because whatever you see can inspire you.', '2', 3, NULL, 1, '2011-05-21 16:28:50', '2024-04-20 16:30:15');
INSERT INTO `problem` (`id`, `type`, `title`, `description`, `difficulty`, `pass_rate`, `img_url`, `course_id`, `create_time`, `modify_time`) VALUES (57, '填空', '题目标题K08WBWFDuM', 'Always keep your eyes open. Keep watching. Because whatever you see can inspire you. Remember that failure is an event, not a person. There is no way to happiness. Happiness is the way.', '2', 3, NULL, 1, '2015-05-13 02:36:56', '2016-08-13 21:33:45');
INSERT INTO `problem` (`id`, `type`, `title`, `description`, `difficulty`, `pass_rate`, `img_url`, `course_id`, `create_time`, `modify_time`) VALUES (58, '填空', '题目标题3KuZNqRXbX', 'SQL Editor allows you to create and edit SQL text, prepare and execute selected queries. Navicat authorizes you to make connection to remote servers running on different platforms (i.e. Windows, macOS, Linux and UNIX), and supports PAM                    ', '2', 3, NULL, 1, '2000-03-23 18:38:27', '2016-07-23 23:07:47');
INSERT INTO `problem` (`id`, `type`, `title`, `description`, `difficulty`, `pass_rate`, `img_url`, `course_id`, `create_time`, `modify_time`) VALUES (59, '简答', '题目标题lmtElEZCBx', 'Navicat Data Modeler is a powerful and cost-effective database design tool which helps you build high-quality conceptual, logical and physical data models. Navicat Data Modeler is a powerful and cost-effective database design tool which                   ', '2', 3, NULL, 1, '2017-02-03 22:37:56', '2020-07-30 22:16:44');
INSERT INTO `problem` (`id`, `type`, `title`, `description`, `difficulty`, `pass_rate`, `img_url`, `course_id`, `create_time`, `modify_time`) VALUES (60, '简答', '题目标题Un9XkJuaHz', 'Actually it is just in an idea when feel oneself can achieve and cannot achieve. Actually it is just in an idea when feel oneself can achieve and cannot achieve. All journeys have secret destinations of which the traveler is unaware.', '2', 3, NULL, 1, '2001-12-04 16:24:06', '2012-05-21 11:43:00');
INSERT INTO `problem` (`id`, `type`, `title`, `description`, `difficulty`, `pass_rate`, `img_url`, `course_id`, `create_time`, `modify_time`) VALUES (61, '选择', '题目标题zTjA2OGSOj', 'The Navigation pane employs tree structure which allows you to take action upon the database and their objects through their pop-up menus quickly and easily.', '2', 3, 'https://image.yu4.xyz/BeautyPersonalCare', 1, '2017-01-20 00:23:46', '2012-05-26 00:10:22');
INSERT INTO `problem` (`id`, `type`, `title`, `description`, `difficulty`, `pass_rate`, `img_url`, `course_id`, `create_time`, `modify_time`) VALUES (62, '判断', '题目标题HxM37Id8eI', 'If the Show objects under schema in navigation pane option is checked at the Preferences window, all database objects are also displayed in the pane. In the middle of winter I at last discovered that there was in me an invincible summer.', '2', 3, 'http://video.kyto.info/Beauty', 1, '2007-05-10 20:46:06', '2023-12-28 11:09:17');
INSERT INTO `problem` (`id`, `type`, `title`, `description`, `difficulty`, `pass_rate`, `img_url`, `course_id`, `create_time`, `modify_time`) VALUES (63, '填空', '题目标题IbceclRi20', 'You will succeed because most people are lazy. Difficult circumstances serve as a textbook of life for people.', '5', 3, NULL, 1, '2007-06-09 20:08:37', '2003-02-17 00:21:45');
INSERT INTO `problem` (`id`, `type`, `title`, `description`, `difficulty`, `pass_rate`, `img_url`, `course_id`, `create_time`, `modify_time`) VALUES (64, '选择', '题目标题y2471G0a1R', 'Actually it is just in an idea when feel oneself can achieve and cannot achieve. After comparing data, the window shows the number of records that will be inserted, updated or deleted in the target.', '5', 3, NULL, 1, '2007-05-26 16:04:09', '2007-10-09 19:47:08');
INSERT INTO `problem` (`id`, `type`, `title`, `description`, `difficulty`, `pass_rate`, `img_url`, `course_id`, `create_time`, `modify_time`) VALUES (65, '判断', '题目标题G8YiLecOli', 'I may not have gone where I intended to go, but I think I have ended up where I needed to be. Navicat allows you to transfer data from one database and/or schema to another with detailed analytical process. In the middle of winter I at                    ', '5', 3, 'http://video.fochris3.cn/ToysGames', 1, '2023-06-21 21:27:21', '2000-04-29 06:36:32');
INSERT INTO `problem` (`id`, `type`, `title`, `description`, `difficulty`, `pass_rate`, `img_url`, `course_id`, `create_time`, `modify_time`) VALUES (66, '判断', '题目标题VfZx8fN693', 'The Navigation pane employs tree structure which allows you to take action upon the database and their objects through their pop-up menus quickly and easily.', '5', 3, 'http://video.lgladys501.org/Food', 1, '2018-08-31 00:56:22', '2001-09-09 19:21:56');
INSERT INTO `problem` (`id`, `type`, `title`, `description`, `difficulty`, `pass_rate`, `img_url`, `course_id`, `create_time`, `modify_time`) VALUES (67, '简答', '题目标题jXJbRZDNnE', 'If opportunity doesn’t knock, build a door. If the plan doesn’t work, change the plan, but never the goal. A comfort zone is a beautiful place, but nothing ever grows there. Typically, it is employed as an encrypted version of Telnet.', '5', 3, NULL, 1, '2012-01-21 11:15:50', '2024-05-13 20:50:18');
INSERT INTO `problem` (`id`, `type`, `title`, `description`, `difficulty`, `pass_rate`, `img_url`, `course_id`, `create_time`, `modify_time`) VALUES (68, '判断', '题目标题rhNodRVILM', 'To clear or reload various internal caches, flush tables, or acquire locks, control-click your connection in the Navigation pane and select Flush and choose the flush option. You must have the reload privilege to use this feature.', '5', 3, 'http://drive.siuwai75.jp/ToysGames', 1, '2021-02-11 23:23:11', '2004-08-02 20:07:35');
INSERT INTO `problem` (`id`, `type`, `title`, `description`, `difficulty`, `pass_rate`, `img_url`, `course_id`, `create_time`, `modify_time`) VALUES (69, '选择', '题目标题akA4tcNUuh', 'A query is used to extract data from the database in a readable format according to the user\'s request. Navicat 15 has added support for the system-wide dark mode.', '5', 3, NULL, 1, '2020-04-04 08:09:20', '2005-06-12 04:02:25');
INSERT INTO `problem` (`id`, `type`, `title`, `description`, `difficulty`, `pass_rate`, `img_url`, `course_id`, `create_time`, `modify_time`) VALUES (70, '填空', '题目标题aXpyZLHKKN', 'A comfort zone is a beautiful place, but nothing ever grows there. There is no way to happiness. Happiness is the way. Success consists of going from failure to failure without loss of enthusiasm.', '5', 4, NULL, 1, '2019-11-23 21:42:42', '2003-05-09 20:22:56');
INSERT INTO `problem` (`id`, `type`, `title`, `description`, `difficulty`, `pass_rate`, `img_url`, `course_id`, `create_time`, `modify_time`) VALUES (71, '判断', '题目标题BLPtO7td9D', 'If opportunity doesn’t knock, build a door. Optimism is the one quality more associated with success and happiness than any other. With its well-designed Graphical User Interface(GUI), Navicat lets you quickly and easily create, organize,               ', '5', 4, NULL, 1, '2015-02-25 02:01:47', '2024-02-11 16:49:58');
INSERT INTO `problem` (`id`, `type`, `title`, `description`, `difficulty`, `pass_rate`, `img_url`, `course_id`, `create_time`, `modify_time`) VALUES (72, '简答', '题目标题98EYzVdVJ4', 'There is no way to happiness. Happiness is the way. In the Objects tab, you can use the List List, Detail Detail and ER Diagram ER Diagram buttons to change the object view.', '5', 4, NULL, 1, '2020-10-15 08:44:38', '2010-04-06 01:12:24');
INSERT INTO `problem` (`id`, `type`, `title`, `description`, `difficulty`, `pass_rate`, `img_url`, `course_id`, `create_time`, `modify_time`) VALUES (73, '简答', '题目标题IJYmgUZyHB', 'To clear or reload various internal caches, flush tables, or acquire locks, control-click your connection in the Navigation pane and select Flush and choose the flush option. You must have the reload privilege to use this feature.', '5', 4, NULL, 1, '2001-09-04 00:11:52', '2006-11-11 20:33:50');
INSERT INTO `problem` (`id`, `type`, `title`, `description`, `difficulty`, `pass_rate`, `img_url`, `course_id`, `create_time`, `modify_time`) VALUES (74, '判断', '题目标题7ZbcEPXqcS', 'With its well-designed Graphical User Interface(GUI), Navicat lets you quickly and easily create, organize, access and share information in a secure and easy way. All the Navicat Cloud objects are located under different projects. You can                 ', '3', 4, NULL, 1, '2006-02-23 10:16:19', '2000-06-05 04:03:25');
INSERT INTO `problem` (`id`, `type`, `title`, `description`, `difficulty`, `pass_rate`, `img_url`, `course_id`, `create_time`, `modify_time`) VALUES (75, '简答', '题目标题K95c0Obg01', 'A man is not old until regrets take the place of dreams. The repository database can be an existing MySQL, MariaDB, PostgreSQL, SQL Server, or Amazon RDS instance. Navicat Monitor requires a repository to store alerts and metrics for historical analysis.', '3', 4, NULL, 1, '2008-11-09 01:54:07', '2000-12-04 12:53:41');
INSERT INTO `problem` (`id`, `type`, `title`, `description`, `difficulty`, `pass_rate`, `img_url`, `course_id`, `create_time`, `modify_time`) VALUES (76, '判断', '题目标题gqKGQvQ6GQ', 'Flexible settings enable you to set up a custom key for comparison and synchronization. All journeys have secret destinations of which the traveler is unaware.', '3', 4, NULL, 1, '2012-12-03 16:34:11', '2024-03-17 09:10:51');
INSERT INTO `problem` (`id`, `type`, `title`, `description`, `difficulty`, `pass_rate`, `img_url`, `course_id`, `create_time`, `modify_time`) VALUES (77, '选择', '题目标题FDMWMaBQTM', 'The On Startup feature allows you to control what tabs appear when you launch Navicat. Navicat provides a wide range advanced features, such as compelling code editing capabilities, smart code-completion, SQL formatting, and more.', '3', 4, NULL, 1, '2001-04-15 09:26:03', '2021-08-29 18:52:23');
INSERT INTO `problem` (`id`, `type`, `title`, `description`, `difficulty`, `pass_rate`, `img_url`, `course_id`, `create_time`, `modify_time`) VALUES (78, '选择', '题目标题pht0i4bedG', 'To clear or reload various internal caches, flush tables, or acquire locks, control-click your connection in the Navigation pane and select Flush and choose the flush option. You must have the reload privilege to use this feature.', '3', 4, 'https://video.waimanchin1105.org/MusicalInstrument', 1, '2007-12-23 22:10:58', '2008-03-13 01:37:01');
INSERT INTO `problem` (`id`, `type`, `title`, `description`, `difficulty`, `pass_rate`, `img_url`, `course_id`, `create_time`, `modify_time`) VALUES (79, '填空', '题目标题NlVq52TM56', 'Sometimes you win, sometimes you learn. The Navigation pane employs tree structure which allows you to take action upon the database and their objects through their pop-up menus quickly and easily.', '3', 4, NULL, 1, '2012-10-29 10:44:36', '2002-08-21 21:37:19');
INSERT INTO `problem` (`id`, `type`, `title`, `description`, `difficulty`, `pass_rate`, `img_url`, `course_id`, `create_time`, `modify_time`) VALUES (80, '填空', '题目标题yS8V2iZNE3', 'The past has no power over the present moment. A man is not old until regrets take the place of dreams. Navicat Cloud provides a cloud service for synchronizing connections, queries, model files and virtual group information from Navicat,                 ', '3', 4, NULL, 1, '2006-10-17 09:23:04', '2016-09-26 18:39:25');
INSERT INTO `problem` (`id`, `type`, `title`, `description`, `difficulty`, `pass_rate`, `img_url`, `course_id`, `create_time`, `modify_time`) VALUES (112, '选择', '《红楼梦》的作者是（）', '红楼梦是四大名著之一', '2', NULL, 'img-url', 1, '2024-12-30 20:51:52', '2024-12-30 20:51:52');
INSERT INTO `problem` (`id`, `type`, `title`, `description`, `difficulty`, `pass_rate`, `img_url`, `course_id`, `create_time`, `modify_time`) VALUES (113, '简答', '《红楼梦》的作者是谁？', '四大名著都有那些？', '2', NULL, 'img-url', 1, '2024-12-30 20:51:52', '2024-12-30 20:51:52');
INSERT INTO `problem` (`id`, `type`, `title`, `description`, `difficulty`, `pass_rate`, `img_url`, `course_id`, `create_time`, `modify_time`) VALUES (124, '选择', '《红楼梦》的作者是哪个', '红楼梦是四大名著吗', '2', NULL, 'img-url', 1, '2024-12-30 21:09:53', '2024-12-30 21:09:53');
INSERT INTO `problem` (`id`, `type`, `title`, `description`, `difficulty`, `pass_rate`, `img_url`, `course_id`, `create_time`, `modify_time`) VALUES (125, '简答', '《红楼梦》的作者是who？', '介绍一下四大名著', '2', NULL, 'img-url', 1, '2024-12-30 21:09:53', '2024-12-30 21:09:53');
COMMIT;

-- ----------------------------
-- Table structure for problem_choices
-- ----------------------------
DROP TABLE IF EXISTS `problem_choices`;
CREATE TABLE `problem_choices` (
  `id` int NOT NULL AUTO_INCREMENT,
  `problem_id` int NOT NULL,
  `choice` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `is_answer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `modify_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `problem_fk1` (`problem_id`) USING BTREE,
  CONSTRAINT `problem_fk1` FOREIGN KEY (`problem_id`) REFERENCES `problem` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=293 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of problem_choices
-- ----------------------------
BEGIN;
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (1, 25, '阿水淀粉将阿老师地方', '0', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (2, 25, '阿斯顿', '1', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (3, 25, '阿斯顿发水淀粉', '0', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (4, 25, '阿水淀粉啊的顺丰', '0', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (5, 25, '速度发水淀粉', '1', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (6, 26, 'D', '0', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (7, 59, 'B', '0', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (8, 4, 'F', '1', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (9, 13, 'F', '0', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (10, 53, 'I', '0', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (11, 69, 'E', '1', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (12, 80, 'B', '1', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (13, 43, 'F', '1', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (14, 36, 'G', '1', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (15, 61, 'J', '1', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (16, 31, 'F', '1', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (17, 80, 'G', '0', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (18, 47, 'H', '0', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (19, 46, 'I', '1', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (20, 1, 'H', '1', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (21, 1, 'D', '1', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (22, 17, 'G', '0', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (23, 30, 'D', '1', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (24, 42, 'J', '1', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (25, 71, 'G', '1', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (26, 77, 'A', '0', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (27, 31, 'I', '0', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (28, 69, 'H', '0', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (29, 36, 'F', '0', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (30, 62, 'G', '0', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (31, 11, 'H', '1', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (32, 46, 'B', '0', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (33, 45, 'A', '1', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (34, 53, 'B', '0', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (35, 20, 'E', '0', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (36, 21, 'D', '0', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (37, 18, 'F', '1', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (38, 37, 'C', '0', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (39, 58, 'H', '0', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (40, 49, 'A', '1', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (41, 75, 'J', '1', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (42, 68, 'J', '1', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (43, 56, 'I', '1', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (44, 48, 'G', '1', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (45, 53, 'A', '1', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (46, 10, 'B', '0', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (47, 20, 'G', '1', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (48, 6, 'D', '1', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (49, 35, 'J', '0', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (50, 56, 'I', '1', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (51, 8, 'H', '0', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (52, 78, 'E', '1', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (53, 22, 'J', '0', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (54, 78, 'A', '1', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (55, 15, 'G', '0', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (56, 19, 'J', '0', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (57, 61, 'E', '0', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (58, 41, 'E', '0', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (59, 53, 'B', '0', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (60, 16, 'C', '1', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (61, 10, 'I', '1', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (62, 3, 'F', '0', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (63, 26, 'D', '0', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (64, 75, 'G', '0', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (65, 38, 'I', '0', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (66, 11, 'C', '1', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (67, 57, 'F', '0', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (68, 1, 'H', '1', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (69, 39, 'H', '0', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (70, 52, 'D', '0', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (71, 60, 'J', '0', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (72, 17, 'F', '0', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (73, 56, 'D', '0', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (74, 2, 'C', '1', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (75, 31, 'H', '0', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (76, 45, 'A', '0', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (77, 73, 'E', '1', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (78, 17, 'D', '1', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (79, 58, 'B', '0', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (80, 2, 'J', '0', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (81, 52, 'J', '1', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (82, 10, 'I', '1', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (83, 64, 'A', '1', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (84, 25, 'G', '0', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (85, 24, 'C', '0', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (86, 62, 'C', '0', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (87, 59, 'H', '1', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (88, 73, 'F', '1', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (89, 79, 'F', '0', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (90, 9, 'G', '0', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (91, 17, 'H', '0', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (92, 56, 'C', '1', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (93, 3, 'I', '0', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (94, 30, 'C', '0', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (95, 18, 'B', '1', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (96, 58, 'E', '1', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (97, 79, 'J', '1', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (98, 72, 'D', '1', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (99, 49, 'F', '0', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (100, 18, 'C', '1', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (101, 63, 'F', '1', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (102, 42, 'F', '0', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (103, 17, 'F', '1', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (104, 74, 'A', '0', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (105, 44, 'E', '1', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (106, 38, 'B', '1', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (107, 42, 'E', '0', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (108, 80, 'E', '0', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (109, 30, 'A', '0', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (110, 32, 'H', '0', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (111, 58, 'A', '0', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (112, 74, 'J', '1', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (113, 1, 'D', '1', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (114, 76, 'E', '1', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (115, 39, 'F', '1', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (116, 10, 'B', '1', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (117, 28, 'G', '0', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (118, 42, 'G', '1', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (119, 63, 'H', '1', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (120, 39, 'I', '0', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (121, 44, 'B', '0', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (122, 38, 'B', '0', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (123, 23, 'A', '0', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (124, 2, 'E', '1', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (125, 40, 'J', '1', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (126, 34, 'I', '0', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (127, 56, 'G', '0', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (128, 38, 'F', '1', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (129, 80, 'J', '1', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (130, 41, 'E', '0', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (131, 57, 'I', '1', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (132, 44, 'F', '1', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (133, 19, 'D', '1', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (134, 22, 'I', '0', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (135, 35, 'F', '1', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (136, 21, 'I', '0', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (137, 78, 'E', '1', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (138, 69, 'B', '1', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (139, 36, 'H', '1', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (140, 15, 'F', '0', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (141, 30, 'J', '0', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (142, 19, 'G', '1', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (143, 43, 'I', '1', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (144, 34, 'I', '1', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (145, 43, 'E', '0', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (146, 63, 'F', '0', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (147, 29, 'G', '0', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (148, 33, 'E', '0', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (149, 25, 'H', '1', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (150, 9, 'D', '0', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (151, 33, 'E', '0', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (152, 5, 'F', '0', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (153, 18, 'J', '0', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (154, 56, 'C', '1', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (155, 16, 'D', '0', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (156, 63, 'G', '0', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (157, 11, 'I', '0', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (158, 31, 'F', '0', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (159, 8, 'G', '0', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (160, 34, 'F', '0', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (161, 26, 'I', '0', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (162, 45, 'J', '0', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (163, 4, 'E', '1', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (164, 77, 'A', '0', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (165, 37, 'C', '0', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (166, 30, 'B', '1', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (167, 73, 'E', '0', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (168, 40, 'E', '1', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (169, 44, 'I', '1', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (170, 45, 'H', '0', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (171, 19, 'C', '1', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (172, 13, 'G', '0', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (173, 55, 'E', '1', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (174, 4, 'J', '0', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (175, 54, 'F', '0', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (176, 52, 'C', '0', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (177, 3, 'C', '0', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (178, 66, 'G', '0', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (179, 41, 'F', '1', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (180, 37, 'D', '1', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (181, 3, 'E', '0', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (182, 37, 'F', '1', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (183, 43, 'C', '0', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (184, 76, 'I', '1', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (185, 38, 'F', '1', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (186, 10, 'E', '0', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (187, 21, 'D', '1', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (188, 70, 'E', '1', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (189, 33, 'G', '0', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (190, 28, 'D', '1', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (191, 49, 'I', '1', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (192, 66, 'F', '1', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (193, 12, 'D', '0', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (194, 14, 'C', '0', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (195, 62, 'I', '0', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (196, 78, 'F', '1', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (197, 71, 'E', '1', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (198, 55, 'B', '0', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (199, 72, 'E', '1', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (200, 30, 'I', '0', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (258, 112, '曹雪芹', '1', '2024-12-30 20:51:52', '2024-12-30 20:51:52');
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (259, 112, '吴承恩', '0', '2024-12-30 20:51:53', '2024-12-30 20:51:53');
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (260, 112, '罗贯中', '0', '2024-12-30 20:51:53', '2024-12-30 20:51:53');
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (261, 112, '施耐庵', '0', '2024-12-30 20:51:53', '2024-12-30 20:51:53');
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (262, 113, '0', '0', '2024-12-30 20:51:53', '2024-12-30 20:51:53');
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (288, 124, '曹雪芹', '1', '2024-12-30 21:09:53', '2024-12-30 21:09:53');
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (289, 124, '吴承恩', '0', '2024-12-30 21:09:54', '2024-12-30 21:09:54');
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (290, 124, '罗贯中', '0', '2024-12-30 21:09:54', '2024-12-30 21:09:54');
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (291, 124, '施耐庵', '0', '2024-12-30 21:09:54', '2024-12-30 21:09:54');
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (292, 125, '0', '0', '2024-12-30 21:09:54', '2024-12-30 21:09:54');
COMMIT;

-- ----------------------------
-- Table structure for problem_tag
-- ----------------------------
DROP TABLE IF EXISTS `problem_tag`;
CREATE TABLE `problem_tag` (
  `id` int NOT NULL AUTO_INCREMENT,
  `problem_id` int NOT NULL,
  `tag_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `middle_tag_fk` (`tag_id`) USING BTREE,
  KEY `problem_id_fk2` (`problem_id`),
  CONSTRAINT `problem_id_fk2` FOREIGN KEY (`problem_id`) REFERENCES `problem` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tag_id_fk2` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=258 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of problem_tag
-- ----------------------------
BEGIN;
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (1, 21, 1);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (2, 18, 225);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (3, 35, 119);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (4, 74, 140);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (5, 22, 1);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (6, 62, 185);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (7, 11, 254);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (8, 50, 230);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (9, 33, 65);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (10, 18, 168);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (11, 63, 224);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (12, 67, 171);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (13, 48, 98);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (14, 19, 226);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (15, 34, 160);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (16, 44, 73);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (17, 19, 30);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (18, 17, 185);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (19, 53, 173);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (20, 79, 219);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (21, 30, 103);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (22, 21, 33);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (23, 31, 195);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (24, 50, 196);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (25, 3, 233);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (26, 36, 159);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (27, 16, 1);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (28, 17, 49);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (29, 26, 222);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (30, 17, 222);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (31, 61, 77);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (32, 70, 112);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (33, 73, 60);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (34, 65, 54);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (35, 1, 1);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (36, 17, 42);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (37, 32, 160);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (38, 45, 44);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (39, 68, 40);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (40, 66, 212);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (41, 40, 113);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (42, 43, 245);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (43, 38, 104);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (44, 64, 88);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (45, 22, 155);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (46, 8, 198);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (47, 10, 44);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (48, 30, 117);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (49, 64, 71);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (50, 70, 58);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (51, 4, 1);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (52, 51, 169);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (53, 26, 86);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (54, 5, 150);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (55, 7, 132);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (56, 40, 43);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (57, 25, 1);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (58, 53, 237);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (59, 30, 85);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (60, 45, 245);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (61, 12, 117);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (62, 3, 1);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (63, 24, 102);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (64, 23, 1);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (65, 75, 162);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (66, 30, 1);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (67, 46, 256);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (68, 60, 231);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (69, 55, 179);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (70, 61, 231);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (71, 69, 81);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (72, 49, 142);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (73, 48, 114);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (74, 46, 78);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (75, 11, 1);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (76, 8, 153);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (77, 40, 221);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (78, 31, 169);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (79, 71, 228);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (80, 27, 1);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (81, 49, 228);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (82, 46, 227);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (83, 41, 142);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (84, 80, 60);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (85, 25, 214);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (86, 3, 51);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (87, 71, 51);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (88, 17, 118);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (89, 77, 78);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (90, 76, 226);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (91, 5, 1);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (92, 56, 103);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (93, 74, 215);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (94, 49, 128);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (95, 79, 246);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (96, 13, 94);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (97, 32, 55);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (98, 60, 85);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (99, 47, 106);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (100, 52, 215);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (101, 8, 80);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (102, 43, 127);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (103, 12, 122);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (104, 41, 55);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (105, 34, 53);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (106, 13, 1);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (107, 67, 128);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (108, 17, 178);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (109, 12, 119);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (110, 69, 55);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (111, 14, 170);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (112, 38, 253);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (113, 22, 44);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (114, 13, 195);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (115, 7, 1);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (116, 16, 143);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (117, 26, 1);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (118, 17, 60);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (119, 24, 1);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (120, 2, 173);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (121, 16, 178);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (122, 2, 222);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (123, 77, 55);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (124, 2, 1);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (125, 43, 40);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (126, 74, 100);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (127, 34, 238);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (128, 62, 223);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (129, 8, 101);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (130, 36, 88);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (131, 60, 145);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (132, 9, 124);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (133, 50, 140);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (134, 76, 201);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (135, 76, 211);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (136, 73, 164);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (137, 12, 30);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (138, 64, 237);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (139, 29, 1);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (140, 35, 118);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (141, 53, 209);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (142, 2, 78);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (143, 28, 199);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (144, 25, 55);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (145, 75, 71);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (146, 13, 136);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (147, 79, 181);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (148, 18, 1);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (149, 72, 38);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (150, 60, 120);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (151, 57, 135);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (152, 3, 176);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (153, 53, 223);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (154, 10, 73);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (155, 14, 107);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (156, 12, 161);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (157, 67, 215);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (158, 38, 49);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (159, 14, 145);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (160, 52, 61);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (161, 27, 119);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (162, 57, 214);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (163, 22, 173);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (164, 19, 193);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (165, 6, 1);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (166, 18, 231);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (167, 79, 98);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (168, 74, 221);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (169, 5, 115);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (170, 54, 39);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (171, 14, 1);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (172, 63, 78);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (173, 4, 112);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (174, 72, 88);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (175, 29, 237);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (176, 68, 135);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (177, 10, 182);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (178, 69, 132);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (179, 79, 209);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (180, 37, 73);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (181, 36, 64);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (182, 39, 68);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (183, 19, 253);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (184, 8, 112);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (185, 2, 29);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (186, 44, 111);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (187, 15, 1);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (188, 77, 232);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (189, 1, 115);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (190, 28, 1);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (191, 16, 228);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (192, 20, 1);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (193, 55, 254);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (194, 50, 60);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (195, 13, 45);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (196, 71, 237);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (197, 14, 123);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (198, 74, 184);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (199, 53, 39);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (200, 80, 232);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (201, 71, 73);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (202, 44, 181);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (203, 56, 255);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (204, 34, 254);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (205, 24, 210);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (206, 55, 242);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (207, 19, 242);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (208, 5, 31);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (209, 31, 38);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (210, 2, 94);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (211, 13, 71);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (212, 66, 176);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (213, 9, 225);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (214, 35, 145);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (215, 15, 204);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (216, 16, 178);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (217, 17, 1);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (218, 19, 33);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (219, 5, 118);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (220, 54, 216);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (221, 5, 42);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (222, 51, 200);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (223, 11, 163);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (224, 2, 84);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (225, 6, 254);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (226, 47, 153);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (227, 75, 245);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (228, 15, 53);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (229, 7, 207);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (230, 71, 105);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (231, 19, 1);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (232, 22, 100);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (233, 61, 94);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (234, 70, 244);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (235, 79, 228);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (236, 18, 51);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (237, 57, 188);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (238, 31, 57);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (239, 35, 88);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (240, 41, 126);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (241, 22, 209);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (242, 72, 139);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (243, 23, 72);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (244, 2, 146);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (245, 4, 46);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (246, 48, 78);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (247, 14, 157);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (248, 8, 1);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (249, 21, 118);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (250, 4, 236);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (251, 12, 1);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (252, 72, 178);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (253, 41, 217);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (254, 74, 122);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (255, 53, 216);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (256, 74, 213);
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (257, 3, 1);
COMMIT;

-- ----------------------------
-- Table structure for school
-- ----------------------------
DROP TABLE IF EXISTS `school`;
CREATE TABLE `school` (
  `id` int NOT NULL AUTO_INCREMENT,
  `school_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `modify_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of school
-- ----------------------------
BEGIN;
INSERT INTO `school` (`id`, `school_name`, `create_time`, `modify_time`) VALUES (1, '学校MHCfn7Q1dc', '2019-04-07 20:52:29', '2023-01-31 23:13:48');
INSERT INTO `school` (`id`, `school_name`, `create_time`, `modify_time`) VALUES (2, '学校tr5fqzrKo4', '2018-03-15 16:07:31', '2022-11-27 00:32:19');
INSERT INTO `school` (`id`, `school_name`, `create_time`, `modify_time`) VALUES (3, '学校OeUNguGD27', '2004-07-31 11:12:21', '2011-02-09 10:23:11');
INSERT INTO `school` (`id`, `school_name`, `create_time`, `modify_time`) VALUES (4, '学校6DCfwALX7Y', '2016-08-01 11:25:48', '2008-08-12 04:11:37');
INSERT INTO `school` (`id`, `school_name`, `create_time`, `modify_time`) VALUES (5, '学校fKLhkTj2IT', '2019-02-10 06:51:41', '2011-05-26 18:41:43');
INSERT INTO `school` (`id`, `school_name`, `create_time`, `modify_time`) VALUES (6, '学校0mByIZd79f', '2017-11-23 01:24:42', '2020-10-29 01:14:26');
INSERT INTO `school` (`id`, `school_name`, `create_time`, `modify_time`) VALUES (7, '学校aCo8nYYVz7', '2017-07-28 12:42:26', '2007-12-17 01:16:20');
INSERT INTO `school` (`id`, `school_name`, `create_time`, `modify_time`) VALUES (8, '学校vKKSyH9a1i', '2003-07-12 09:19:40', '2019-08-24 11:53:01');
INSERT INTO `school` (`id`, `school_name`, `create_time`, `modify_time`) VALUES (9, '学校ZoeHBsixks', '2020-07-28 01:32:10', '2023-06-13 08:28:30');
INSERT INTO `school` (`id`, `school_name`, `create_time`, `modify_time`) VALUES (10, '学校2cjEy1TQnN', '2009-12-10 10:30:32', '2001-02-04 08:52:07');
INSERT INTO `school` (`id`, `school_name`, `create_time`, `modify_time`) VALUES (11, '学校ggggg', NULL, NULL);
INSERT INTO `school` (`id`, `school_name`, `create_time`, `modify_time`) VALUES (12, NULL, '2024-12-31 19:46:20', '2024-12-31 19:46:20');
INSERT INTO `school` (`id`, `school_name`, `create_time`, `modify_time`) VALUES (13, NULL, '2024-12-31 19:47:30', '2024-12-31 19:47:30');
INSERT INTO `school` (`id`, `school_name`, `create_time`, `modify_time`) VALUES (14, NULL, '2024-12-31 19:47:33', '2024-12-31 19:47:33');
INSERT INTO `school` (`id`, `school_name`, `create_time`, `modify_time`) VALUES (15, NULL, '2024-12-31 19:48:50', '2024-12-31 19:48:50');
INSERT INTO `school` (`id`, `school_name`, `create_time`, `modify_time`) VALUES (16, NULL, '2024-12-31 19:55:26', '2024-12-31 19:55:26');
COMMIT;

-- ----------------------------
-- Table structure for session
-- ----------------------------
DROP TABLE IF EXISTS `session`;
CREATE TABLE `session` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `score` int DEFAULT NULL,
  `ranking` int DEFAULT NULL,
  `answer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `correctness` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `pdf_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `exam_id` int NOT NULL,
  `raw_data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `paper_id` int NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `modify_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `user_id_fk` (`user_id`) USING BTREE,
  KEY `paper_id_fk` (`paper_id`) USING BTREE,
  KEY `exam_id_fk` (`exam_id`) USING BTREE,
  KEY `id` (`id`),
  CONSTRAINT `exam_id_fk` FOREIGN KEY (`exam_id`) REFERENCES `exam` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `paper_id_fk` FOREIGN KEY (`paper_id`) REFERENCES `paper` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=259 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of session
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for tag
-- ----------------------------
DROP TABLE IF EXISTS `tag`;
CREATE TABLE `tag` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tag_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `modify_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=257 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of tag
-- ----------------------------
BEGIN;
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (1, 'tag名HzP93tabrK', '2004-11-22 01:15:28', '12:55:41');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (2, 'tag名MvyBBzV7Yu', '2024-03-25 22:15:48', '11:52:14');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (3, 'tag名9r3U29tqSY', '2018-12-10 23:48:07', '16:47:06');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (4, 'tag名nBV1Al5H2Z', '2009-09-17 08:45:26', '15:57:31');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (5, 'tag名nvHAr4JOnU', '2004-01-13 16:25:32', '14:15:41');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (6, 'tag名aeq8fcrMay', '2019-05-06 02:54:46', '11:45:34');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (7, 'tag名MSZpnyce7v', '2001-10-08 13:49:56', '17:48:39');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (8, 'tag名hTv5q3a5cZ', '2002-11-19 11:53:06', '15:19:27');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (9, 'tag名Vhw5nvG3gJ', '2007-07-23 19:05:18', '15:27:48');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (10, 'tag名yGpjgCH20I', '2018-08-18 05:25:39', '12:38:37');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (11, 'tag名WrCVBTSPAD', '2000-12-22 02:45:31', '12:59:33');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (12, 'tag名mnBthKNvQL', '2020-06-08 22:11:34', '12:57:50');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (13, 'tag名PRCpyrBjuq', '2023-10-25 02:51:24', '15:24:55');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (14, 'tag名VPRQPgaDh6', '2014-06-11 16:47:11', '13:47:10');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (15, 'tag名kv83r7n2qZ', '2003-09-11 00:17:35', '16:45:44');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (16, 'tag名B7PZaFoMkl', '2019-04-28 02:15:53', '13:19:27');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (17, 'tag名YaxfC07awL', '2002-12-22 22:26:31', '10:05:41');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (18, 'tag名gAIiFH78dx', '2011-09-08 20:16:25', '14:35:27');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (19, 'tag名ZxKCaegkvL', '2021-08-19 22:57:25', '14:22:51');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (20, 'tag名sIzo6Y5BVQ', '2007-12-12 10:41:29', '13:41:07');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (21, 'tag名Tc7Gb2qAU2', '2007-07-19 06:58:19', '14:02:29');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (22, 'tag名91tc1pPyRu', '2001-08-25 11:05:18', '15:53:24');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (23, 'tag名Hbl5K7Ft8Y', '2018-04-26 12:47:54', '13:52:28');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (24, 'tag名l9DFkAtiKG', '2018-05-22 14:43:58', '11:44:13');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (25, 'tag名X3c7Copc7n', '2000-05-17 11:38:28', '14:18:56');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (26, 'tag名A48cfms7HS', '2023-08-30 15:31:19', '10:48:32');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (27, 'tag名a2RYK6JwjW', '2019-01-12 22:51:58', '13:44:18');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (28, 'tag名oRsrLArhqc', '2012-02-10 16:46:29', '10:32:29');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (29, 'tag名CVOh2cKyn1', '2004-06-28 21:05:51', '16:01:09');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (30, 'tag名h6p5nTLoxF', '2006-06-19 07:36:57', '15:19:37');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (31, 'tag名4MW5S8aEKj', '2007-06-03 00:25:41', '10:14:45');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (32, 'tag名75EpcJLEb1', '2010-04-17 03:45:33', '12:50:49');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (33, 'tag名xlWEzryoGm', '2006-06-18 06:47:19', '10:52:21');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (34, 'tag名rMlTvFtX8T', '2013-12-07 07:01:47', '15:58:40');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (35, 'tag名R9tXipsLj7', '2008-01-23 17:23:59', '09:40:28');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (36, 'tag名unNEec6rJ4', '2016-10-26 06:55:19', '10:44:54');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (37, 'tag名nUbPITZ91C', '2000-09-17 07:45:12', '14:49:13');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (38, 'tag名S3oasAMxpf', '2013-06-10 04:55:55', '11:43:20');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (39, 'tag名9gQ5jUeyij', '2015-10-28 20:48:54', '11:50:06');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (40, 'tag名SkN4UmQCt4', '2003-12-26 13:13:48', '12:41:09');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (41, 'tag名pr6AZ13Gu2', '2009-05-29 18:58:41', '09:33:42');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (42, 'tag名WyPbJnGMau', '2010-11-10 23:33:57', '11:10:07');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (43, 'tag名1iJsPRZMQJ', '2004-03-14 15:13:33', '16:36:37');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (44, 'tag名SANigwomI5', '2016-12-19 15:03:06', '13:31:10');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (45, 'tag名WXWrsGiNaG', '2006-07-30 13:33:15', '12:30:03');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (46, 'tag名d4Tm9Pzoou', '2001-04-28 15:40:55', '12:05:06');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (47, 'tag名H4Rhdhd4Po', '2012-10-04 00:04:07', '10:48:36');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (48, 'tag名CjF7fN2Dxg', '2004-02-27 16:15:26', '09:55:55');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (49, 'tag名GKzdKjFcjz', '2008-06-18 10:51:13', '15:21:06');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (50, 'tag名mbUUoo0iJ6', '2012-08-03 08:11:28', '11:13:40');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (51, 'tag名BbNNDEMQCU', '2009-02-22 07:50:27', '13:54:02');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (52, 'tag名pA6rzdZ0NQ', '2011-05-07 23:41:39', '15:14:03');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (53, 'tag名vApep9ATX8', '2008-09-14 10:20:05', '16:35:09');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (54, 'tag名UO6QVz5Hyc', '2013-10-21 07:57:23', '13:59:56');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (55, 'tag名hrblvZDf0M', '2003-12-17 01:53:16', '13:23:28');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (56, 'tag名IFrQUZtCX0', '2018-01-03 00:55:31', '14:55:43');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (57, 'tag名TLWW3TltLy', '2017-09-21 19:14:21', '13:38:49');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (58, 'tag名jpgYRLcApw', '2002-11-06 20:37:43', '11:04:55');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (59, 'tag名N5BR2mOQlU', '2021-09-23 13:57:24', '17:45:08');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (60, 'tag名vb7XsAuSFU', '2017-11-26 08:25:38', '15:43:18');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (61, 'tag名YMs3CHfZmS', '2009-05-13 00:25:07', '12:44:44');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (62, 'tag名y2JTrSJWL3', '2008-08-04 03:25:14', '11:27:12');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (63, 'tag名J8oW1oICv9', '2000-09-09 12:53:19', '09:29:48');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (64, 'tag名IyUm0W8CLQ', '2003-01-27 09:32:21', '12:39:56');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (65, 'tag名HULCPuyoPo', '2014-05-30 15:32:49', '13:53:49');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (66, 'tag名xBG2SXP9do', '2014-03-13 23:45:00', '09:09:43');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (67, 'tag名1TY7d4Assd', '2024-11-25 16:58:48', '14:55:41');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (68, 'tag名ec5eNRiz66', '2020-06-19 01:17:31', '11:09:03');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (69, 'tag名iJKvUzAj8M', '2015-04-15 11:33:29', '09:25:46');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (70, 'tag名ZlCO9McPua', '2014-07-31 19:16:35', '16:09:37');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (71, 'tag名Vx6S1g3F9y', '2005-11-09 10:22:33', '13:27:06');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (72, 'tag名xyeYv8EGK5', '2002-12-02 16:35:08', '10:40:17');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (73, 'tag名EWkTvjUWnF', '2023-03-14 05:04:46', '11:41:42');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (74, 'tag名92i8TMGSJT', '2020-12-16 02:40:05', '09:07:59');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (75, 'tag名cTxffgMmSN', '2004-04-14 23:49:49', '16:16:46');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (76, 'tag名M8mQxEkD7v', '2000-06-14 13:16:10', '09:58:12');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (77, 'tag名FXdqU0WvbY', '2014-09-04 14:36:51', '12:30:25');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (78, 'tag名mDnzYq97Y0', '2021-01-19 09:05:02', '13:27:05');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (79, 'tag名vUzzYG0zv2', '2004-11-23 19:56:17', '16:07:48');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (80, 'tag名orq99fWsSt', '2004-08-22 09:15:29', '11:40:42');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (81, 'tag名jD7ZQ39H7f', '2021-11-13 07:50:32', '14:05:09');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (82, 'tag名8bCkKOUloW', '2018-05-22 07:43:40', '15:38:08');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (83, 'tag名UT7yhALn3M', '2014-05-16 18:30:22', '17:55:44');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (84, 'tag名JESGq3BdqT', '2007-10-24 09:30:07', '14:33:07');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (85, 'tag名Qc33Cr9p7Y', '2015-10-21 07:17:00', '17:25:37');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (86, 'tag名qkBC0WVTic', '2008-03-22 14:05:00', '16:52:25');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (87, 'tag名SmPbhVSRCa', '2001-06-04 04:37:16', '10:32:07');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (88, 'tag名BFhEJ7kPL1', '2008-06-18 18:05:59', '11:41:58');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (89, 'tag名gc1QC5o6QR', '2022-10-31 19:28:10', '15:37:37');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (90, 'tag名pe12Fp3RIB', '2015-06-19 17:18:07', '14:47:44');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (91, 'tag名VY71pRMW2D', '2011-01-07 09:06:16', '14:29:39');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (92, 'tag名c5rD10E5Hs', '2007-09-10 12:50:08', '17:32:26');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (93, 'tag名L9iXs0oBMx', '2009-05-30 07:27:47', '14:25:20');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (94, 'tag名e3HqAtcHBd', '2022-06-19 19:27:47', '09:42:43');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (95, 'tag名522NiTq66J', '2020-12-22 13:42:27', '14:29:24');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (96, 'tag名tm4yTjAkSF', '2023-04-30 17:55:24', '17:45:09');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (97, 'tag名ld3J86M28W', '2024-04-05 19:50:57', '16:29:43');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (98, 'tag名NR2qwVnCgO', '2024-11-05 03:53:43', '11:46:32');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (99, 'tag名RH8TQQKnz4', '2000-03-15 05:09:06', '10:40:32');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (100, 'tag名TVOnADcd1D', '2012-04-16 10:54:12', '12:48:37');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (101, 'tag名v2vHsytrQY', '2013-05-18 14:03:13', '14:21:02');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (102, 'tag名B8vVRlKMdu', '2000-09-30 12:02:52', '16:43:23');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (103, 'tag名Ci8qeP1JCK', '2000-07-27 08:23:02', '16:06:32');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (104, 'tag名atC9U9TKAm', '2022-12-11 02:46:16', '14:31:43');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (105, 'tag名vu4sHqPwvU', '2022-11-13 07:15:03', '15:49:58');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (106, 'tag名Ihi7xnazRc', '2022-01-25 00:11:22', '16:34:16');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (107, 'tag名ZyuOrnSP5o', '2016-08-26 08:08:20', '15:48:54');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (108, 'tag名YcxIGnaLND', '2010-09-06 00:44:41', '09:06:49');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (109, 'tag名Bb4d9eW9Cq', '2023-10-09 05:28:18', '14:20:24');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (110, 'tag名ClS9AxQZzc', '2023-09-30 02:52:30', '14:50:43');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (111, 'tag名QR0zkOGXgh', '2022-03-19 02:27:53', '14:58:30');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (112, 'tag名7Hy0kJVzVF', '2006-01-08 02:13:51', '17:02:04');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (113, 'tag名RrvO2mzAg9', '2003-07-08 03:21:10', '17:55:37');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (114, 'tag名LjTgtOm2rW', '2022-03-17 01:19:14', '11:55:35');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (115, 'tag名D5vDxRKtdx', '2005-08-12 12:44:48', '13:20:22');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (116, 'tag名0g5cX9pmh6', '2023-07-19 11:53:09', '16:40:55');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (117, 'tag名91SqNSqtPt', '2023-02-21 20:23:15', '09:05:36');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (118, 'tag名zzUm1JwM9U', '2006-06-18 02:15:30', '17:40:11');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (119, 'tag名lTsPNmg4bq', '2009-10-16 14:20:33', '16:58:57');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (120, 'tag名kb0IzIeIOM', '2002-04-03 20:34:58', '16:17:08');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (121, 'tag名JyBHQDi3Gi', '2024-04-09 10:19:17', '14:43:11');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (122, 'tag名A062ZXwm65', '2001-07-02 02:03:30', '09:41:02');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (123, 'tag名k6yeKlThjU', '2002-12-12 09:37:33', '12:36:02');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (124, 'tag名VTDiF1Nys5', '2013-06-11 17:57:36', '16:14:58');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (125, 'tag名cwiWA1V3JK', '2009-12-24 03:09:24', '12:56:12');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (126, 'tag名E9F9y2ehV8', '2021-12-11 21:57:47', '15:05:06');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (127, 'tag名OiKCpWpwYj', '2007-09-11 09:56:25', '15:06:54');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (128, 'tag名1hazXYaqck', '2013-08-30 17:53:39', '13:22:32');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (129, 'tag名qdSOO3XMBR', '2001-06-27 04:18:50', '10:56:46');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (130, 'tag名RXUAZqsQIB', '2000-10-28 17:44:07', '15:18:16');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (131, 'tag名YnEubH1F56', '2000-07-10 18:36:34', '15:58:07');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (132, 'tag名VjF67B8Uxd', '2003-01-18 05:32:08', '15:30:53');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (133, 'tag名B17jxVGPEg', '2014-02-20 12:15:21', '14:35:54');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (134, 'tag名hPsGWfNAok', '2009-01-10 16:34:30', '17:19:41');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (135, 'tag名3iieVTm5M3', '2018-09-15 22:39:21', '12:34:57');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (136, 'tag名I8tEhmqQyu', '2007-02-28 01:23:26', '14:40:32');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (137, 'tag名NZq7IDgVzW', '2015-08-22 16:59:31', '12:57:36');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (138, 'tag名SXrbNTaDuc', '2013-10-09 13:37:06', '17:44:02');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (139, 'tag名wVNhuZmlh1', '2012-05-20 21:42:29', '14:29:59');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (140, 'tag名XtiXaBXwUm', '2003-05-18 22:35:48', '14:03:02');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (141, 'tag名GWpT5N7rAs', '2021-07-26 15:41:20', '16:25:11');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (142, 'tag名F7iAGdtWkk', '2019-12-27 11:09:17', '10:16:23');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (143, 'tag名DqiYIbrogu', '2023-11-16 23:40:12', '15:59:19');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (144, 'tag名1Ji0K0L2cx', '2005-08-01 04:49:57', '14:17:04');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (145, 'tag名Ph85o232hi', '2000-11-10 23:08:41', '10:07:11');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (146, 'tag名Ndi3i62bXl', '2018-04-02 04:45:31', '15:01:49');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (147, 'tag名q8rERrjQRf', '2017-12-07 19:20:39', '13:42:15');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (148, 'tag名8ESag3wqsV', '2006-01-09 09:39:50', '09:57:09');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (149, 'tag名hKSwvY9AGz', '2004-04-23 02:38:32', '12:34:10');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (150, 'tag名Me6TCwhkUu', '2001-05-14 12:27:56', '17:01:24');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (151, 'tag名s6tetqnNXN', '2014-04-25 23:58:58', '15:00:59');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (152, 'tag名BhOeOrFuew', '2003-12-11 22:48:14', '12:48:49');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (153, 'tag名FogREGkxXY', '2017-05-22 10:50:07', '09:44:43');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (154, 'tag名bwNFEOPOPC', '2008-07-13 09:42:52', '14:33:47');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (155, 'tag名uNtIxKPSYv', '2005-05-09 11:54:21', '15:00:20');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (156, 'tag名Ejql8BTcpv', '2019-07-07 16:41:51', '11:48:01');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (157, 'tag名XgGwSISkda', '2011-05-10 11:12:40', '13:24:30');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (158, 'tag名aKrte3Pupk', '2021-05-03 17:37:38', '12:51:13');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (159, 'tag名05rUeYwZ7D', '2024-10-20 19:29:01', '09:09:19');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (160, 'tag名MhJplwnV8l', '2021-11-22 15:19:16', '17:59:10');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (161, 'tag名DYgrhOQ16q', '2010-06-23 10:45:46', '15:48:08');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (162, 'tag名QTDtbwXhsu', '2004-01-29 05:57:22', '09:43:10');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (163, 'tag名bvdaYpeQwi', '2024-11-30 00:56:39', '11:15:09');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (164, 'tag名rCHbrWqG35', '2012-12-12 09:47:15', '16:26:43');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (165, 'tag名c2Ak0isbdi', '2016-05-18 18:05:53', '17:36:33');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (166, 'tag名jtPSG47yBd', '2001-09-03 14:54:08', '09:18:54');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (167, 'tag名XoyxDe8JC5', '2001-04-04 13:11:33', '10:39:05');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (168, 'tag名uqJQ7yzMUn', '2007-10-01 09:29:54', '13:20:08');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (169, 'tag名73NLYIZgY7', '2017-09-29 12:40:13', '16:46:35');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (170, 'tag名4eWIArdcEO', '2021-07-03 21:25:36', '10:15:52');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (171, 'tag名ibhh4Asey9', '2004-06-22 08:18:32', '10:49:48');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (172, 'tag名5ImLlPZu0U', '2015-10-08 04:46:18', '09:16:08');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (173, 'tag名UrEaFlfC6E', '2019-11-10 09:18:08', '14:14:36');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (174, 'tag名HlfII7jzbV', '2012-05-27 21:29:29', '09:37:56');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (175, 'tag名HtCv00fku3', '2023-05-10 01:15:21', '13:25:07');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (176, 'tag名pIoq2cIxqi', '2014-02-17 12:05:25', '13:47:24');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (177, 'tag名JLwnb9z7CC', '2006-12-25 04:05:52', '11:12:09');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (178, 'tag名o5cCdHyEav', '2014-01-19 10:13:51', '09:12:28');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (179, 'tag名YpldmGSZjX', '2017-05-24 10:01:33', '17:56:00');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (180, 'tag名xfolGdKFuk', '2011-05-10 15:23:23', '11:28:38');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (181, 'tag名auQuv0O6mc', '2010-11-09 18:16:26', '11:54:13');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (182, 'tag名c8YqMBUQzV', '2011-01-30 10:34:04', '13:38:10');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (183, 'tag名es30bApAlY', '2015-06-22 23:46:30', '17:47:32');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (184, 'tag名UY3VzuQIcZ', '2023-02-01 05:46:37', '17:36:56');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (185, 'tag名QSgZ9Mg3vZ', '2024-02-15 08:42:39', '15:17:39');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (186, 'tag名YN3kd6iNk6', '2017-01-17 23:06:09', '11:04:59');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (187, 'tag名eJUxp2VeWe', '2013-02-11 02:58:49', '14:11:17');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (188, 'tag名FO5q0y3DJZ', '2023-07-03 14:01:00', '17:03:42');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (189, 'tag名yLfaoChTVg', '2016-09-20 20:41:22', '15:18:04');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (190, 'tag名VoBqun8ID2', '2004-12-26 05:07:33', '14:35:43');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (191, 'tag名cGLQ3KM3tm', '2015-07-10 01:39:21', '17:07:20');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (192, 'tag名K0AyVX7v07', '2012-09-03 05:59:04', '10:23:09');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (193, 'tag名rQZA3StOdm', '2016-07-29 03:54:11', '14:40:14');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (194, 'tag名6LnJfuOTEc', '2001-02-08 00:52:16', '13:34:34');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (195, 'tag名WB17pgAxWq', '2005-02-03 02:24:06', '15:42:26');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (196, 'tag名EGpnDx216X', '2014-05-17 12:01:16', '14:06:44');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (197, 'tag名RAFblhCskm', '2015-06-30 10:12:13', '09:45:38');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (198, 'tag名XodXDYadiO', '2020-09-29 15:39:40', '17:43:12');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (199, 'tag名9CRWcIq4Wr', '2021-07-23 09:23:41', '15:54:55');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (200, 'tag名8IXUvCdL8L', '2020-02-23 08:44:55', '10:21:40');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (201, 'tag名L5uBU4UXSM', '2007-04-15 01:27:57', '13:31:40');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (202, 'tag名77qjjVMrUU', '2016-11-07 11:05:16', '17:18:35');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (203, 'tag名B8tQE5ZB0i', '2020-03-23 19:52:47', '10:06:55');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (204, 'tag名uXkMQ97XfT', '2023-08-03 08:43:08', '16:07:47');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (205, 'tag名wD2r0JIKXD', '2009-07-17 19:27:03', '14:19:27');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (206, 'tag名8M9oxMJ0mS', '2023-02-11 04:44:11', '14:31:05');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (207, 'tag名neKiqCbOM2', '2023-12-16 05:19:07', '11:37:49');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (208, 'tag名HlP0ClsU6b', '2019-12-23 14:58:55', '14:06:26');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (209, 'tag名oq1d5sUPyL', '2000-05-06 14:04:27', '16:33:55');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (210, 'tag名znB5fTugPy', '2000-03-04 15:03:54', '16:01:50');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (211, 'tag名nmOq9aSlgF', '2004-11-19 14:49:38', '16:25:19');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (212, 'tag名M7z5bX84lQ', '2000-11-28 07:09:24', '15:40:27');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (213, 'tag名ovHPc7Ei51', '2020-11-22 14:09:09', '14:14:08');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (214, 'tag名WMhOE6WiL9', '2012-05-03 18:28:36', '09:41:38');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (215, 'tag名OVDG9iCzaq', '2001-10-23 01:54:35', '17:25:22');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (216, 'tag名aTlPMbIAO0', '2016-04-14 00:31:23', '16:39:48');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (217, 'tag名9ugELQGMk8', '2020-02-08 06:06:44', '12:21:55');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (218, 'tag名ZHSmhtlYge', '2020-09-24 17:37:20', '09:05:37');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (219, 'tag名TbuRzMlyw0', '2019-12-29 14:31:20', '11:15:46');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (220, 'tag名2DoF5xqJ44', '2002-01-30 18:04:54', '16:34:08');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (221, 'tag名zZL3loWLco', '2024-01-23 18:51:35', '12:48:41');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (222, 'tag名40go0aB6O3', '2009-06-01 22:56:44', '09:01:26');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (223, 'tag名AjM7ugcw7X', '2006-04-01 20:20:22', '12:48:41');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (224, 'tag名yUGQMFzvEC', '2021-01-09 17:09:14', '11:15:50');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (225, 'tag名RPsBRAfk4v', '2003-05-10 04:10:10', '11:36:35');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (226, 'tag名ENhoUGrA9O', '2018-07-05 11:38:56', '14:46:33');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (227, 'tag名xUI0VqjcIw', '2018-03-15 22:55:28', '10:28:34');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (228, 'tag名6NHaeyGjnH', '2023-12-24 17:23:28', '09:12:38');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (229, 'tag名lR4xTwhYcg', '2005-05-05 15:00:07', '11:42:58');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (230, 'tag名D0MIVRfBnE', '2007-11-19 05:30:07', '13:00:19');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (231, 'tag名KYODf1RbCH', '2002-05-27 12:21:05', '16:41:30');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (232, 'tag名TeSy7OFao3', '2015-12-01 17:56:24', '17:26:24');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (233, 'tag名tpXMz19Ny3', '2014-04-23 07:50:14', '17:31:31');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (234, 'tag名y5788rxez2', '2020-11-23 20:06:08', '11:19:30');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (235, 'tag名ULr79p8jDX', '2009-05-16 01:36:52', '14:22:31');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (236, 'tag名iWOibaeBMC', '2012-04-27 17:58:31', '10:37:58');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (237, 'tag名XKZC93Jmal', '2018-02-10 10:14:46', '11:53:39');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (238, 'tag名xJZMWXx2fz', '2015-08-27 19:31:01', '09:08:32');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (239, 'tag名lHaTAzI23B', '2014-03-01 06:03:51', '12:30:09');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (240, 'tag名YnWAPkF0qi', '2009-12-31 03:53:01', '11:37:47');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (241, 'tag名n9Ovn9BEGH', '2002-09-29 06:32:49', '14:28:23');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (242, 'tag名CUXcUGDdE7', '2013-11-16 05:36:16', '16:52:01');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (243, 'tag名N49Ym2DgdR', '2016-07-01 19:50:03', '12:24:25');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (244, 'tag名nDhrZywt7b', '2021-12-01 01:58:10', '10:07:45');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (245, 'tag名WznAn88f7V', '2018-03-03 09:30:15', '13:54:28');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (246, 'tag名2UvX8qYATN', '2023-04-04 13:27:07', '16:42:33');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (247, 'tag名1VSow6IcSL', '2004-02-15 19:13:50', '12:58:39');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (248, 'tag名qYceokPs3b', '2021-03-28 01:29:45', '14:27:46');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (249, 'tag名4P4HxXRSzQ', '2004-09-09 12:49:06', '17:52:44');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (250, 'tag名l1DsfKlnxj', '2014-06-11 09:34:31', '16:17:31');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (251, 'tag名cxeLMZ9Iju', '2014-08-24 10:22:11', '17:32:39');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (252, 'tag名4SDfBRK4lr', '2019-07-09 16:14:08', '16:44:54');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (253, 'tag名P1afij19F5', '2015-02-08 20:32:48', '16:56:21');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (254, 'tag名bwocecUuXn', '2005-12-29 13:43:16', '12:36:14');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (255, 'tag名BzcbFM27HA', '2013-09-06 22:26:30', '09:31:45');
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (256, 'tag名EeNxBAm8EY', '2016-07-24 20:16:13', '11:58:25');
COMMIT;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `realname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `privilege` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `class_id` int DEFAULT NULL,
  `school_id` int DEFAULT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `modify_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `username` (`username`) USING BTREE,
  KEY `user_class_fk` (`class_id`) USING BTREE,
  KEY `user_school_fk` (`school_id`) USING BTREE,
  CONSTRAINT `user_class_fk` FOREIGN KEY (`class_id`) REFERENCES `class` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT,
  CONSTRAINT `user_school_fk` FOREIGN KEY (`school_id`) REFERENCES `school` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=2122 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
BEGIN;
INSERT INTO `user` (`id`, `username`, `realname`, `password`, `email`, `privilege`, `class_id`, `school_id`, `salt`, `create_time`, `modify_time`) VALUES (2089, '学生12', '学生12', '1.23456789E8', '', 'STUDENT', 4, 5, NULL, '2024-12-31 15:29:07', '2024-12-31 15:29:07');
INSERT INTO `user` (`id`, `username`, `realname`, `password`, `email`, `privilege`, `class_id`, `school_id`, `salt`, `create_time`, `modify_time`) VALUES (2090, '学生13', '学生13', '1.23456789E8', '', 'STUDENT', 4, 5, NULL, '2024-12-31 15:29:07', '2024-12-31 15:29:07');
INSERT INTO `user` (`id`, `username`, `realname`, `password`, `email`, `privilege`, `class_id`, `school_id`, `salt`, `create_time`, `modify_time`) VALUES (2091, '学生14', '学生14', '1.23456789E8', '', 'STUDENT', 4, 5, NULL, '2024-12-31 15:29:07', '2024-12-31 15:29:07');
INSERT INTO `user` (`id`, `username`, `realname`, `password`, `email`, `privilege`, `class_id`, `school_id`, `salt`, `create_time`, `modify_time`) VALUES (2092, '学生15', '学生15', '1.23456789E8', '', 'STUDENT', 4, 5, NULL, '2024-12-31 15:29:07', '2024-12-31 15:29:07');
INSERT INTO `user` (`id`, `username`, `realname`, `password`, `email`, `privilege`, `class_id`, `school_id`, `salt`, `create_time`, `modify_time`) VALUES (2093, '学生16', '学生16', '1.23456789E8', '', 'STUDENT', 4, 5, NULL, '2024-12-31 15:29:07', '2024-12-31 15:29:07');
INSERT INTO `user` (`id`, `username`, `realname`, `password`, `email`, `privilege`, `class_id`, `school_id`, `salt`, `create_time`, `modify_time`) VALUES (2094, '学生30', '学生30', '1.23456789E8', '', 'STUDENT', 4, 5, NULL, '2024-12-31 15:29:07', '2024-12-31 15:29:07');
INSERT INTO `user` (`id`, `username`, `realname`, `password`, `email`, `privilege`, `class_id`, `school_id`, `salt`, `create_time`, `modify_time`) VALUES (2095, '学生30', '学生30', '1.23456789E8', '', 'STUDENT', 4, 5, NULL, '2024-12-31 15:29:07', '2024-12-31 15:29:07');
INSERT INTO `user` (`id`, `username`, `realname`, `password`, `email`, `privilege`, `class_id`, `school_id`, `salt`, `create_time`, `modify_time`) VALUES (2096, '学生30', '学生30', '1.23456789E8', '', 'STUDENT', 4, 5, NULL, '2024-12-31 15:29:07', '2024-12-31 15:29:07');
INSERT INTO `user` (`id`, `username`, `realname`, `password`, `email`, `privilege`, `class_id`, `school_id`, `salt`, `create_time`, `modify_time`) VALUES (2097, '学生30', '学生30', '1.23456789E8', '', 'STUDENT', 4, 5, NULL, '2024-12-31 15:29:07', '2024-12-31 15:29:07');
INSERT INTO `user` (`id`, `username`, `realname`, `password`, `email`, `privilege`, `class_id`, `school_id`, `salt`, `create_time`, `modify_time`) VALUES (2098, '182132821aj221', NULL, 'ab55513d4cb29f5569fd1751adf77851', NULL, 'TEACHER', 2, 1, '4d8116d3-8a26-4371-8663-49b7f3689787', '2024-12-31 15:33:30', '2024-12-31 15:33:30');
INSERT INTO `user` (`id`, `username`, `realname`, `password`, `email`, `privilege`, `class_id`, `school_id`, `salt`, `create_time`, `modify_time`) VALUES (2099, '学生37', '学生37', '1.23456789E8', '', 'STUDENT', 4, 5, NULL, '2024-12-31 15:34:21', '2024-12-31 15:34:21');
INSERT INTO `user` (`id`, `username`, `realname`, `password`, `email`, `privilege`, `class_id`, `school_id`, `salt`, `create_time`, `modify_time`) VALUES (2100, '学生31', '学生31', '1.23456789E8', '', 'STUDENT', 4, 5, NULL, '2024-12-31 15:34:21', '2024-12-31 15:34:21');
INSERT INTO `user` (`id`, `username`, `realname`, `password`, `email`, `privilege`, `class_id`, `school_id`, `salt`, `create_time`, `modify_time`) VALUES (2101, '学生32', '学生32', '1.23456789E8', '', 'STUDENT', 4, 5, NULL, '2024-12-31 15:34:21', '2024-12-31 15:34:21');
INSERT INTO `user` (`id`, `username`, `realname`, `password`, `email`, `privilege`, `class_id`, `school_id`, `salt`, `create_time`, `modify_time`) VALUES (2102, '学生33', '学生33', '1.23456789E8', '', 'STUDENT', 4, 5, NULL, '2024-12-31 15:34:21', '2024-12-31 15:34:21');
INSERT INTO `user` (`id`, `username`, `realname`, `password`, `email`, `privilege`, `class_id`, `school_id`, `salt`, `create_time`, `modify_time`) VALUES (2103, '', '', '', '', '', NULL, NULL, NULL, '2024-12-31 15:55:13', '2024-12-31 15:55:13');
INSERT INTO `user` (`id`, `username`, `realname`, `password`, `email`, `privilege`, `class_id`, `school_id`, `salt`, `create_time`, `modify_time`) VALUES (2104, '学生40', '学生40', 'b19f6af901b776b5e7552d9bb5fe7ea3', '', 'STUDENT', NULL, NULL, '4e2bef58-5815-4681-b2f3-5445ab935083', '2024-12-31 15:58:34', '2024-12-31 15:58:34');
INSERT INTO `user` (`id`, `username`, `realname`, `password`, `email`, `privilege`, `class_id`, `school_id`, `salt`, `create_time`, `modify_time`) VALUES (2105, '学生41', '学生41', '57cddafd5ed3da5f1052e44b18d917b1', '', 'STUDENT', NULL, NULL, '9caa4f0c-a4c2-481d-80c4-a0660376fa01', '2024-12-31 15:58:34', '2024-12-31 15:58:34');
INSERT INTO `user` (`id`, `username`, `realname`, `password`, `email`, `privilege`, `class_id`, `school_id`, `salt`, `create_time`, `modify_time`) VALUES (2106, '学生42', '学生42', '3891983d8d96fd3a47ac3146855328d8', '', 'STUDENT', NULL, NULL, '81472ba9-01f0-464f-a91f-9b0e28dbdf26', '2024-12-31 15:58:34', '2024-12-31 15:58:34');
INSERT INTO `user` (`id`, `username`, `realname`, `password`, `email`, `privilege`, `class_id`, `school_id`, `salt`, `create_time`, `modify_time`) VALUES (2107, '学生43', '学生43', 'f0ad07ef63b4a5de7acbe3afa068c1b6', '', 'STUDENT', NULL, NULL, '5dcbfb7d-7ba3-4ac8-bec9-ad4bc6ff6432', '2024-12-31 15:58:34', '2024-12-31 15:58:34');
INSERT INTO `user` (`id`, `username`, `realname`, `password`, `email`, `privilege`, `class_id`, `school_id`, `salt`, `create_time`, `modify_time`) VALUES (2108, 'user1', NULL, 'f699f6dc5497a37cbaed08fcc95a5956', NULL, 'STUDENT', NULL, NULL, '3b56f843-db24-4f73-bc9a-e8acbb61494c', '2024-12-31 16:00:07', '2024-12-31 16:00:07');
INSERT INTO `user` (`id`, `username`, `realname`, `password`, `email`, `privilege`, `class_id`, `school_id`, `salt`, `create_time`, `modify_time`) VALUES (2109, 'user2', NULL, 'fb1d64da2b13f3239a84dc493e4413c6', NULL, 'STUDENT', NULL, NULL, '00b8ec72-0938-4ba9-97d4-4ce3f21249ba', '2024-12-31 16:00:12', '2024-12-31 16:00:12');
INSERT INTO `user` (`id`, `username`, `realname`, `password`, `email`, `privilege`, `class_id`, `school_id`, `salt`, `create_time`, `modify_time`) VALUES (2110, 'user3', NULL, '668c1d863b2dfca0c05ce0f6ec19e943', NULL, 'STUDENT', NULL, NULL, 'adf49506-4cce-49d9-885d-693ae4cca773', '2024-12-31 16:00:15', '2024-12-31 16:00:15');
INSERT INTO `user` (`id`, `username`, `realname`, `password`, `email`, `privilege`, `class_id`, `school_id`, `salt`, `create_time`, `modify_time`) VALUES (2111, 'user4', NULL, '6de3aa13768a3bd7b19f308f5ef6efe2', NULL, 'STUDENT', NULL, NULL, 'cf6e4386-f6e8-4d15-8e0f-437a36e26af8', '2024-12-31 16:00:18', '2024-12-31 16:00:18');
INSERT INTO `user` (`id`, `username`, `realname`, `password`, `email`, `privilege`, `class_id`, `school_id`, `salt`, `create_time`, `modify_time`) VALUES (2112, 'user5', NULL, '1ea311be4f0851c3fd97709c329fe75b', NULL, 'STUDENT', NULL, NULL, '195f2a2b-54c9-448c-bd16-639c7a0ed8ad', '2024-12-31 16:00:20', '2024-12-31 16:00:20');
INSERT INTO `user` (`id`, `username`, `realname`, `password`, `email`, `privilege`, `class_id`, `school_id`, `salt`, `create_time`, `modify_time`) VALUES (2113, 'user6', NULL, '0ddb543185eeb71d8c3fadc377d1c79d', NULL, 'STUDENT', NULL, NULL, '5d77bcfa-6774-457a-a847-e09b7b551bd0', '2024-12-31 16:00:23', '2024-12-31 16:00:23');
INSERT INTO `user` (`id`, `username`, `realname`, `password`, `email`, `privilege`, `class_id`, `school_id`, `salt`, `create_time`, `modify_time`) VALUES (2114, 'user7', NULL, '29c900c52fa1d22b8a8595cfacead606', NULL, 'STUDENT', NULL, NULL, 'b65f52cd-dcb7-4cd9-ad01-cbfc51e5b069', '2024-12-31 16:00:29', '2024-12-31 16:00:29');
INSERT INTO `user` (`id`, `username`, `realname`, `password`, `email`, `privilege`, `class_id`, `school_id`, `salt`, `create_time`, `modify_time`) VALUES (2115, 'user8', NULL, '1e82c33866199d37061a0b959775836e', NULL, 'STUDENT', NULL, NULL, '9f5edc96-3295-451b-b0bc-ef84e24dee60', '2024-12-31 16:00:39', '2024-12-31 16:00:39');
INSERT INTO `user` (`id`, `username`, `realname`, `password`, `email`, `privilege`, `class_id`, `school_id`, `salt`, `create_time`, `modify_time`) VALUES (2116, 'user9', NULL, '0fd372b352890680876fdd6dbe504e87', NULL, 'STUDENT', NULL, NULL, 'e4a6d354-c397-4060-8b23-220d345c54fa', '2024-12-31 16:00:42', '2024-12-31 16:00:42');
INSERT INTO `user` (`id`, `username`, `realname`, `password`, `email`, `privilege`, `class_id`, `school_id`, `salt`, `create_time`, `modify_time`) VALUES (2117, 'user10', NULL, 'cc708dc82bb75571df1c98459d98c2ed', NULL, 'STUDENT', NULL, NULL, '0b98c6af-c51b-4d78-9ff0-0340712fbeec', '2024-12-31 16:00:45', '2024-12-31 16:00:45');
INSERT INTO `user` (`id`, `username`, `realname`, `password`, `email`, `privilege`, `class_id`, `school_id`, `salt`, `create_time`, `modify_time`) VALUES (2118, '182132821aj2211', NULL, '3df178fd0f2b4b0ac242df26b1e9ab5b', '23832@qo.xs', 'STUDENT', 1, 1, 'd6df8427-218a-4349-90e8-a42561baf6e8', '2024-12-31 19:28:57', '2024-12-31 19:28:57');
INSERT INTO `user` (`id`, `username`, `realname`, `password`, `email`, `privilege`, `class_id`, `school_id`, `salt`, `create_time`, `modify_time`) VALUES (2119, '学生11', '学生11', 'b0529a8e5135ea5b906a0854889108f2', '', 'STUDENT', NULL, NULL, 'bfb0f778-402a-4db3-be4c-bd53052b3ad8', '2024-12-31 19:45:40', '2024-12-31 19:45:40');
INSERT INTO `user` (`id`, `username`, `realname`, `password`, `email`, `privilege`, `class_id`, `school_id`, `salt`, `create_time`, `modify_time`) VALUES (2120, '182132821ak2211', NULL, '7bbf8ac12e96dd84e89e3451dc9424ba', NULL, 'STUDENT', 2, 1, '054f675a-7811-4c17-aade-130bd7e1411d', '2024-12-31 20:25:04', '2024-12-31 20:25:04');
INSERT INTO `user` (`id`, `username`, `realname`, `password`, `email`, `privilege`, `class_id`, `school_id`, `salt`, `create_time`, `modify_time`) VALUES (2121, '182132821am2211', NULL, 'd5c0afa6ed36affccceaf276d62889af', NULL, 'TEACHER', 2, 1, 'f5590a47-e2cf-4ecb-bbad-9753948a1f0c', '2024-12-31 20:34:07', '2024-12-31 20:34:07');
COMMIT;

-- ----------------------------
-- Table structure for user_answer
-- ----------------------------
DROP TABLE IF EXISTS `user_answer`;
CREATE TABLE `user_answer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `session_id` int NOT NULL,
  `problem_id` int NOT NULL,
  `answer` varchar(255) DEFAULT NULL,
  `correct` int DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `modify_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`,`session_id`,`problem_id`),
  KEY `session_id_fk` (`session_id`),
  KEY `problem_id_fk1` (`problem_id`),
  CONSTRAINT `problem_id_fk1` FOREIGN KEY (`problem_id`) REFERENCES `problem` (`id`),
  CONSTRAINT `session_id_fk` FOREIGN KEY (`session_id`) REFERENCES `session` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of user_answer
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for wrong_problem_set
-- ----------------------------
DROP TABLE IF EXISTS `wrong_problem_set`;
CREATE TABLE `wrong_problem_set` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `problem_id` int NOT NULL,
  `note` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `modify_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `problem_fk` (`problem_id`) USING BTREE,
  KEY `user_fk` (`user_id`) USING BTREE,
  CONSTRAINT `problem_fk` FOREIGN KEY (`problem_id`) REFERENCES `problem` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `user_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=1056 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of wrong_problem_set
-- ----------------------------
BEGIN;
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
