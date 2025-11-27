/*
 Navicat Premium Dump SQL

 Source Server         : exam
 Source Server Type    : MySQL
 Source Server Version : 90100 (9.1.0)
 Source Host           : wpcwzy.top:3306
 Source Schema         : exam1

 Target Server Type    : MySQL
 Target Server Version : 90100 (9.1.0)
 File Encoding         : 65001

 Date: 31/12/2024 20:51:41
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of class
-- ----------------------------
BEGIN;
INSERT INTO `class` (`id`, `class_name`, `create_time`, `modify_time`) VALUES (1, '班级92', '2011-01-22 04:21:19', '2000-02-14 15:16:55');
INSERT INTO `class` (`id`, `class_name`, `create_time`, `modify_time`) VALUES (2, '班级43', '2014-01-23 21:02:04', '2011-12-15 10:51:08');
INSERT INTO `class` (`id`, `class_name`, `create_time`, `modify_time`) VALUES (3, '班级98', '2000-07-20 21:00:54', '2005-04-09 10:14:07');
INSERT INTO `class` (`id`, `class_name`, `create_time`, `modify_time`) VALUES (4, '班级26', '2009-10-06 05:56:40', '2001-11-26 03:24:30');
INSERT INTO `class` (`id`, `class_name`, `create_time`, `modify_time`) VALUES (5, '班级70', '2012-09-26 19:31:27', '2003-09-10 17:57:04');
INSERT INTO `class` (`id`, `class_name`, `create_time`, `modify_time`) VALUES (6, '班级18', '2000-12-24 12:11:11', '2020-06-19 09:34:53');
INSERT INTO `class` (`id`, `class_name`, `create_time`, `modify_time`) VALUES (7, '班级28', '2004-12-25 22:14:53', '2017-12-08 22:48:02');
INSERT INTO `class` (`id`, `class_name`, `create_time`, `modify_time`) VALUES (8, '班级41', '2014-08-24 05:24:48', '2022-01-18 02:22:52');
INSERT INTO `class` (`id`, `class_name`, `create_time`, `modify_time`) VALUES (9, '班级85', '2024-09-06 07:16:58', '2003-04-26 14:23:41');
INSERT INTO `class` (`id`, `class_name`, `create_time`, `modify_time`) VALUES (10, '班级27', '2016-05-19 21:40:07', '2016-12-28 08:22:58');
INSERT INTO `class` (`id`, `class_name`, `create_time`, `modify_time`) VALUES (11, '班级23', '2024-12-31 16:39:35', '2024-12-31 16:39:37');
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of course
-- ----------------------------
BEGIN;
INSERT INTO `course` (`id`, `course_name`, `create_time`, `modify_time`) VALUES (1, '语文', NULL, NULL);
INSERT INTO `course` (`id`, `course_name`, `create_time`, `modify_time`) VALUES (2, '数学', NULL, NULL);
INSERT INTO `course` (`id`, `course_name`, `create_time`, `modify_time`) VALUES (3, '英语', NULL, NULL);
INSERT INTO `course` (`id`, `course_name`, `create_time`, `modify_time`) VALUES (4, '物理', NULL, NULL);
INSERT INTO `course` (`id`, `course_name`, `create_time`, `modify_time`) VALUES (5, '化学', NULL, NULL);
INSERT INTO `course` (`id`, `course_name`, `create_time`, `modify_time`) VALUES (6, '生物', NULL, NULL);
INSERT INTO `course` (`id`, `course_name`, `create_time`, `modify_time`) VALUES (7, '政治', NULL, NULL);
INSERT INTO `course` (`id`, `course_name`, `create_time`, `modify_time`) VALUES (8, '历史', NULL, NULL);
INSERT INTO `course` (`id`, `course_name`, `create_time`, `modify_time`) VALUES (9, '地理', NULL, NULL);
INSERT INTO `course` (`id`, `course_name`, `create_time`, `modify_time`) VALUES (10, '心理健康', NULL, NULL);
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
  CONSTRAINT `logical_paper_fk` FOREIGN KEY (`logical_paper_id`) REFERENCES `logical_paper` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of exam
-- ----------------------------
BEGIN;
INSERT INTO `exam` (`id`, `name`, `logical_paper_id`, `start_time`, `end_time`, `duration`, `show_score`, `shuffle`, `create_time`, `modify_time`) VALUES (1, '数学测试', 1, '2024-12-31 16:05:36', '2025-01-02 16:05:39', 2147483647, 1, 1, NULL, NULL);
INSERT INTO `exam` (`id`, `name`, `logical_paper_id`, `start_time`, `end_time`, `duration`, `show_score`, `shuffle`, `create_time`, `modify_time`) VALUES (2, '语文测试', 2, '2024-12-31 16:10:35', '2025-01-04 16:10:37', 2147483647, 0, 0, NULL, NULL);
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
  CONSTRAINT `course_fk` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of logical_paper
-- ----------------------------
BEGIN;
INSERT INTO `logical_paper` (`id`, `course_id`, `difficulty`, `create_time`, `modify_time`) VALUES (1, 2, 3, NULL, NULL);
INSERT INTO `logical_paper` (`id`, `course_id`, `difficulty`, `create_time`, `modify_time`) VALUES (2, 1, 4, NULL, NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of paper
-- ----------------------------
BEGIN;
INSERT INTO `paper` (`id`, `logical_paper_id`, `create_time`, `modify_time`) VALUES (1, 1, NULL, NULL);
INSERT INTO `paper` (`id`, `logical_paper_id`, `create_time`, `modify_time`) VALUES (2, 1, NULL, NULL);
INSERT INTO `paper` (`id`, `logical_paper_id`, `create_time`, `modify_time`) VALUES (3, 2, NULL, NULL);
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
  KEY `paper_id_fk2` (`paper_id`) USING BTREE,
  CONSTRAINT `paper_id_fk2` FOREIGN KEY (`paper_id`) REFERENCES `paper` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `problem_id_fk3` FOREIGN KEY (`problem_id`) REFERENCES `problem` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of paper_problem
-- ----------------------------
BEGIN;
INSERT INTO `paper_problem` (`id`, `paper_id`, `problem_id`, `problem_order`, `point`, `create_time`, `modify_time`) VALUES (1, 1, 1, 1, 3, NULL, NULL);
INSERT INTO `paper_problem` (`id`, `paper_id`, `problem_id`, `problem_order`, `point`, `create_time`, `modify_time`) VALUES (2, 1, 2, 2, 3, NULL, NULL);
INSERT INTO `paper_problem` (`id`, `paper_id`, `problem_id`, `problem_order`, `point`, `create_time`, `modify_time`) VALUES (3, 2, 1, 2, 3, NULL, NULL);
INSERT INTO `paper_problem` (`id`, `paper_id`, `problem_id`, `problem_order`, `point`, `create_time`, `modify_time`) VALUES (4, 2, 2, 1, 3, NULL, NULL);
INSERT INTO `paper_problem` (`id`, `paper_id`, `problem_id`, `problem_order`, `point`, `create_time`, `modify_time`) VALUES (5, 3, 3, 1, 5, NULL, NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of problem
-- ----------------------------
BEGIN;
INSERT INTO `problem` (`id`, `type`, `title`, `description`, `difficulty`, `pass_rate`, `img_url`, `course_id`, `create_time`, `modify_time`) VALUES (1, '选择', '选出以下是二次函数的', NULL, '2', 2, NULL, 2, NULL, NULL);
INSERT INTO `problem` (`id`, `type`, `title`, `description`, `difficulty`, `pass_rate`, `img_url`, `course_id`, `create_time`, `modify_time`) VALUES (2, '选择', '选出以下不是二次函数的选项', NULL, '2', 2, NULL, 2, NULL, NULL);
INSERT INTO `problem` (`id`, `type`, `title`, `description`, `difficulty`, `pass_rate`, `img_url`, `course_id`, `create_time`, `modify_time`) VALUES (3, '简答', '现代文阅读', '这是议论文和记叙文的结合体文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章', '4', 4, NULL, 1, NULL, NULL);
INSERT INTO `problem` (`id`, `type`, `title`, `description`, `difficulty`, `pass_rate`, `img_url`, `course_id`, `create_time`, `modify_time`) VALUES (4, '简答', '四大名著', '分析《红楼梦》中贾宝玉的性格特征及其对个人命运的影响', '3', 3, NULL, 1, NULL, NULL);
INSERT INTO `problem` (`id`, `type`, `title`, `description`, `difficulty`, `pass_rate`, `img_url`, `course_id`, `create_time`, `modify_time`) VALUES (5, '简答', '解方程：x*21+12=83', NULL, '1', 1, NULL, NULL, NULL, NULL);
INSERT INTO `problem` (`id`, `type`, `title`, `description`, `difficulty`, `pass_rate`, `img_url`, `course_id`, `create_time`, `modify_time`) VALUES (6, '填空', '四大名著', '探讨《红楼梦》中贾宝玉的性格特质如何影响了他的命运走向。', '3', 3, NULL, 1, NULL, NULL);
INSERT INTO `problem` (`id`, `type`, `title`, `description`, `difficulty`, `pass_rate`, `img_url`, `course_id`, `create_time`, `modify_time`) VALUES (7, '判断', '四大名著', '考察《红楼梦》中贾宝玉的性格，解释这种性格如何决定了他的命运。', '3', 3, NULL, 1, NULL, NULL);
INSERT INTO `problem` (`id`, `type`, `title`, `description`, `difficulty`, `pass_rate`, `img_url`, `course_id`, `create_time`, `modify_time`) VALUES (8, '填空', '四大名著', '论述《红楼梦》中贾宝玉的性格因素及其对他个人命运的决定性影响。', '3', 3, NULL, 1, NULL, NULL);
INSERT INTO `problem` (`id`, `type`, `title`, `description`, `difficulty`, `pass_rate`, `img_url`, `course_id`, `create_time`, `modify_time`) VALUES (9, '简答', '几何问题', '一个矩形的长是宽的3倍，如果它的周长是48厘米，那么这个矩形的面积是多少平方厘米？', '4', 4, NULL, 2, NULL, NULL);
INSERT INTO `problem` (`id`, `type`, `title`, `description`, `difficulty`, `pass_rate`, `img_url`, `course_id`, `create_time`, `modify_time`) VALUES (10, '判断', '代数问题', '任何非零实数的零次幂等于1', '4', 4, NULL, 2, NULL, NULL);
INSERT INTO `problem` (`id`, `type`, `title`, `description`, `difficulty`, `pass_rate`, `img_url`, `course_id`, `create_time`, `modify_time`) VALUES (11, '判断', '几何问题', '一个圆的直径是其半径的两倍', '3', 3, NULL, 2, NULL, NULL);
INSERT INTO `problem` (`id`, `type`, `title`, `description`, `difficulty`, `pass_rate`, `img_url`, `course_id`, `create_time`, `modify_time`) VALUES (12, '判断', '几何问题', '平行四边形的对角线总是相等的', '2', 2, NULL, 2, NULL, NULL);
INSERT INTO `problem` (`id`, `type`, `title`, `description`, `difficulty`, `pass_rate`, `img_url`, `course_id`, `create_time`, `modify_time`) VALUES (13, '判断', '几何问题', '三角形内角和为180度。', '4', 4, NULL, 2, NULL, NULL);
INSERT INTO `problem` (`id`, `type`, `title`, `description`, `difficulty`, `pass_rate`, `img_url`, `course_id`, `create_time`, `modify_time`) VALUES (14, '判断', '几何问题', '正方形的四个角都是直角。', '1', 1, NULL, 2, NULL, NULL);
INSERT INTO `problem` (`id`, `type`, `title`, `description`, `difficulty`, `pass_rate`, `img_url`, `course_id`, `create_time`, `modify_time`) VALUES (15, '简答', '几何问题', '圆柱的底面直径是 4 厘米，高是 6 厘米，求其体积', '2', 2, NULL, 2, NULL, NULL);
INSERT INTO `problem` (`id`, `type`, `title`, `description`, `difficulty`, `pass_rate`, `img_url`, `course_id`, `create_time`, `modify_time`) VALUES (16, '解答', '圆柱的底面半径是 2 厘米，高是 5 厘米，求它的表面积', NULL, '2', 2, NULL, 2, NULL, NULL);
INSERT INTO `problem` (`id`, `type`, `title`, `description`, `difficulty`, `pass_rate`, `img_url`, `course_id`, `create_time`, `modify_time`) VALUES (17, '简答', '几何问题', '解释什么是勾股定理，并给出一个实际应用场景。', '1', 1, NULL, 2, NULL, NULL);
INSERT INTO `problem` (`id`, `type`, `title`, `description`, `difficulty`, `pass_rate`, `img_url`, `course_id`, `create_time`, `modify_time`) VALUES (18, '简答', '几何问题', '描述函数 \r\nf\r\n(\r\nx\r\n)\r\n=\r\n2\r\nx\r\n+\r\n3\r\nf(x)=2x+3 的图像特征，并说明它的斜率代表什么。', '3', 3, NULL, 2, NULL, NULL);
INSERT INTO `problem` (`id`, `type`, `title`, `description`, `difficulty`, `pass_rate`, `img_url`, `course_id`, `create_time`, `modify_time`) VALUES (19, '简答', '几何问题', '描述函数 \r\nf\r\n(\r\nx\r\n)\r\n=\r\n2\r\nx\r\n+\r\n3\r\nf(x)=2x+3 的图像特征，并说明它的斜率代表什么。', '4', 4, NULL, 2, NULL, NULL);
INSERT INTO `problem` (`id`, `type`, `title`, `description`, `difficulty`, `pass_rate`, `img_url`, `course_id`, `create_time`, `modify_time`) VALUES (20, '简答', '几何问题', '解释平行四边形的面积公式 \r\nA\r\n=\r\nb\r\nh\r\nA=bh，并说明 \r\nb\r\nb 和 \r\nh\r\nh 各自代表什么。', '5', 5, NULL, 2, NULL, NULL);
INSERT INTO `problem` (`id`, `type`, `title`, `description`, `difficulty`, `pass_rate`, `img_url`, `course_id`, `create_time`, `modify_time`) VALUES (21, '选择', '已知一个球的半径3为，则其体积为', NULL, '3', 3, NULL, 2, NULL, NULL);
INSERT INTO `problem` (`id`, `type`, `title`, `description`, `difficulty`, `pass_rate`, `img_url`, `course_id`, `create_time`, `modify_time`) VALUES (22, '填空', '球的体积为972π/3，则其半径为_____', NULL, '2', 2, NULL, 2, NULL, NULL);
INSERT INTO `problem` (`id`, `type`, `title`, `description`, `difficulty`, `pass_rate`, `img_url`, `course_id`, `create_time`, `modify_time`) VALUES (23, '填空', '一个球的体积是另一个球体积的8倍，则它们半径之比为____', NULL, '2', 2, NULL, 2, NULL, NULL);
INSERT INTO `problem` (`id`, `type`, `title`, `description`, `difficulty`, `pass_rate`, `img_url`, `course_id`, `create_time`, `modify_time`) VALUES (24, '选择', '请从下列选项中选出正确的答案：x+8-lnx=1', NULL, '4', 4, NULL, 2, NULL, NULL);
INSERT INTO `problem` (`id`, `type`, `title`, `description`, `difficulty`, `pass_rate`, `img_url`, `course_id`, `create_time`, `modify_time`) VALUES (25, '填空', '(ln2+ln3)/ln6-1=____', NULL, '3', 3, NULL, 2, NULL, NULL);
INSERT INTO `problem` (`id`, `type`, `title`, `description`, `difficulty`, `pass_rate`, `img_url`, `course_id`, `create_time`, `modify_time`) VALUES (26, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of problem_choices
-- ----------------------------
BEGIN;
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (1, 1, 'a', '0', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (2, 1, 'a^2', '1', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (3, 1, 'a+a', '0', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (4, 1, 'a-1', '0', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (5, 2, 'a^2', '1', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (6, 2, 'a^2+1', '1', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (7, 2, 'a^2-1', '1', NULL, NULL);
INSERT INTO `problem_choices` (`id`, `problem_id`, `choice`, `is_answer`, `create_time`, `modify_time`) VALUES (8, 2, 'a', '0', NULL, NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of problem_tag
-- ----------------------------
BEGIN;
INSERT INTO `problem_tag` (`id`, `problem_id`, `tag_id`) VALUES (1, 1, 1);
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of school
-- ----------------------------
BEGIN;
INSERT INTO `school` (`id`, `school_name`, `create_time`, `modify_time`) VALUES (1, 'xL7大学', '2019-12-16 23:27:05', '2016-12-09 18:29:54');
INSERT INTO `school` (`id`, `school_name`, `create_time`, `modify_time`) VALUES (2, 'hcB大学', '2021-03-18 17:01:53', '2015-02-11 08:58:37');
INSERT INTO `school` (`id`, `school_name`, `create_time`, `modify_time`) VALUES (3, 'TRI大学', '2019-12-09 00:00:40', '2000-12-13 14:08:22');
INSERT INTO `school` (`id`, `school_name`, `create_time`, `modify_time`) VALUES (4, 'vrb大学', '2004-10-18 05:33:12', '2021-06-21 01:11:44');
INSERT INTO `school` (`id`, `school_name`, `create_time`, `modify_time`) VALUES (5, 'EPx大学', '2010-06-19 09:23:41', '2020-09-19 21:52:32');
INSERT INTO `school` (`id`, `school_name`, `create_time`, `modify_time`) VALUES (6, 'Ma4大学', '2019-01-08 01:26:55', '2009-06-21 10:08:01');
INSERT INTO `school` (`id`, `school_name`, `create_time`, `modify_time`) VALUES (7, '5gl大学', '2016-02-19 11:22:17', '2016-09-07 12:31:34');
INSERT INTO `school` (`id`, `school_name`, `create_time`, `modify_time`) VALUES (8, 'nCj大学', '2003-04-15 19:02:33', '2021-03-07 04:59:10');
INSERT INTO `school` (`id`, `school_name`, `create_time`, `modify_time`) VALUES (9, 'kib大学', '2000-05-31 10:51:45', '2019-03-15 17:29:05');
INSERT INTO `school` (`id`, `school_name`, `create_time`, `modify_time`) VALUES (10, 'QYQ大学', '2018-01-19 20:24:23', '2021-11-05 22:29:05');
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
  KEY `id` (`id`) USING BTREE,
  CONSTRAINT `exam_id_fk` FOREIGN KEY (`exam_id`) REFERENCES `exam` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `paper_id_fk` FOREIGN KEY (`paper_id`) REFERENCES `paper` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of session
-- ----------------------------
BEGIN;
INSERT INTO `session` (`id`, `user_id`, `start_time`, `end_time`, `score`, `ranking`, `answer`, `correctness`, `pdf_url`, `exam_id`, `raw_data`, `paper_id`, `create_time`, `modify_time`) VALUES (1, 1, '2024-12-31 16:10:04', '2024-12-31 16:10:06', 0, 0, NULL, NULL, NULL, 1, NULL, 1, NULL, NULL);
INSERT INTO `session` (`id`, `user_id`, `start_time`, `end_time`, `score`, `ranking`, `answer`, `correctness`, `pdf_url`, `exam_id`, `raw_data`, `paper_id`, `create_time`, `modify_time`) VALUES (2, 2, '2024-12-31 16:36:01', '2025-01-05 16:36:04', NULL, NULL, NULL, NULL, NULL, 1, NULL, 2, NULL, NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of tag
-- ----------------------------
BEGIN;
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (1, '二次函数', NULL, NULL);
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (2, '议论文阅读', NULL, NULL);
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (3, '定语从句', NULL, NULL);
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (4, '牛顿第三定律', NULL, NULL);
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (5, '置换反应', NULL, NULL);
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (6, '细胞结构', NULL, NULL);
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (7, '法治社会', NULL, NULL);
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (8, '人民史观', NULL, NULL);
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (9, '城市', NULL, NULL);
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (10, '积极心理', NULL, NULL);
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (11, '记叙文阅读', NULL, NULL);
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (12, '判别式', NULL, NULL);
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (13, '状语从句', NULL, NULL);
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (14, '电磁感应', NULL, NULL);
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (15, '相对分子质量', NULL, NULL);
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (16, '病毒', NULL, NULL);
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (17, '道德', NULL, NULL);
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (18, '外国近代史', NULL, NULL);
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (19, '河流', NULL, NULL);
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (20, '情绪宣泄', NULL, NULL);
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (21, '平面几何', NULL, NULL);
INSERT INTO `tag` (`id`, `tag_name`, `create_time`, `modify_time`) VALUES (22, '几何图形', NULL, NULL);
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
  `salt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `modify_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `username` (`username`) USING BTREE,
  KEY `user_class_fk` (`class_id`) USING BTREE,
  KEY `user_school_fk` (`school_id`) USING BTREE,
  CONSTRAINT `user_class_fk` FOREIGN KEY (`class_id`) REFERENCES `class` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT,
  CONSTRAINT `user_school_fk` FOREIGN KEY (`school_id`) REFERENCES `school` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
BEGIN;
INSERT INTO `user` (`id`, `username`, `realname`, `password`, `email`, `privilege`, `class_id`, `school_id`, `salt`, `create_time`, `modify_time`) VALUES (1, 'user1', 'user1', 'f699f6dc5497a37cbaed08fcc95a5956', '34129912@qq.com', 'ADMIN', 1, 1, '3b56f843-db24-4f73-bc9a-e8acbb61494c', '2024-12-31 16:00:07', '2024-12-31 16:00:07');
INSERT INTO `user` (`id`, `username`, `realname`, `password`, `email`, `privilege`, `class_id`, `school_id`, `salt`, `create_time`, `modify_time`) VALUES (2, 'user2', 'user2', 'fb1d64da2b13f3239a84dc493e4413c6', '341121112@qq.com', 'ADMIN', 1, 7, '00b8ec72-0938-4ba9-97d4-4ce3f21249ba', '2024-12-31 16:00:12', '2024-12-31 16:00:12');
INSERT INTO `user` (`id`, `username`, `realname`, `password`, `email`, `privilege`, `class_id`, `school_id`, `salt`, `create_time`, `modify_time`) VALUES (3, 'user3', 'user3', '668c1d863b2dfca0c05ce0f6ec19e943', '129219912@232.com', 'TEACHER', 4, 1, 'adf49506-4cce-49d9-885d-693ae4cca773', '2024-12-31 16:00:15', '2024-12-31 16:00:15');
INSERT INTO `user` (`id`, `username`, `realname`, `password`, `email`, `privilege`, `class_id`, `school_id`, `salt`, `create_time`, `modify_time`) VALUES (4, 'user4', 'user4', '6de3aa13768a3bd7b19f308f5ef6efe2', '341299122112@qq.com', 'TEACHER', 1, 1, 'cf6e4386-f6e8-4d15-8e0f-437a36e26af8', '2024-12-31 16:00:18', '2024-12-31 16:00:18');
INSERT INTO `user` (`id`, `username`, `realname`, `password`, `email`, `privilege`, `class_id`, `school_id`, `salt`, `create_time`, `modify_time`) VALUES (5, 'user5', 'user5', '1ea311be4f0851c3fd97709c329fe75b', '12553128@163.com', 'TEACHER', 2, 8, '195f2a2b-54c9-448c-bd16-639c7a0ed8ad', '2024-12-31 16:00:20', '2024-12-31 16:00:20');
INSERT INTO `user` (`id`, `username`, `realname`, `password`, `email`, `privilege`, `class_id`, `school_id`, `salt`, `create_time`, `modify_time`) VALUES (6, 'user6', 'user6', '0ddb543185eeb71d8c3fadc377d1c79d', '129121219912@232.com', 'STUDENT', 2, 1, '5d77bcfa-6774-457a-a847-e09b7b551bd0', '2024-12-31 16:00:23', '2024-12-31 16:00:23');
INSERT INTO `user` (`id`, `username`, `realname`, `password`, `email`, `privilege`, `class_id`, `school_id`, `salt`, `create_time`, `modify_time`) VALUES (7, 'user7', 'user7', '29c900c52fa1d22b8a8595cfacead606', '3412911912@qq.com', 'STUDENT', 7, 1, 'b65f52cd-dcb7-4cd9-ad01-cbfc51e5b069', '2024-12-31 16:00:29', '2024-12-31 16:00:29');
INSERT INTO `user` (`id`, `username`, `realname`, `password`, `email`, `privilege`, `class_id`, `school_id`, `salt`, `create_time`, `modify_time`) VALUES (8, 'user8', 'user8', '1e82c33866199d37061a0b959775836e', '4441121112@qq.com', 'STUDENT', 3, 2, '9f5edc96-3295-451b-b0bc-ef84e24dee60', '2024-12-31 16:00:39', '2024-12-31 16:00:39');
INSERT INTO `user` (`id`, `username`, `realname`, `password`, `email`, `privilege`, `class_id`, `school_id`, `salt`, `create_time`, `modify_time`) VALUES (9, 'user9', 'user9', '0fd372b352890680876fdd6dbe504e87', '121219912@232.com', 'STUDENT', 3, 9, 'e4a6d354-c397-4060-8b23-220d345c54fa', '2024-12-31 16:00:42', '2024-12-31 16:00:42');
INSERT INTO `user` (`id`, `username`, `realname`, `password`, `email`, `privilege`, `class_id`, `school_id`, `salt`, `create_time`, `modify_time`) VALUES (10, 'user10', 'user10', 'cc708dc82bb75571df1c98459d98c2ed', '4321299122112@qq.com', 'STUDENT', 3, 2, '0b98c6af-c51b-4d78-9ff0-0340712fbeec', '2024-12-31 16:00:45', '2024-12-31 16:00:45');
INSERT INTO `user` (`id`, `username`, `realname`, `password`, `email`, `privilege`, `class_id`, `school_id`, `salt`, `create_time`, `modify_time`) VALUES (11, 'user11', 'user11', 'b19f6af901b776b5e7552d9bb5fe7ea3', '12551223128@163.com', 'STUDENT', 2, 4, '4e2bef58-5815-4681-b2f3-5445ab935083', '2024-12-31 16:36:39', '2024-12-31 16:36:45');
INSERT INTO `user` (`id`, `username`, `realname`, `password`, `email`, `privilege`, `class_id`, `school_id`, `salt`, `create_time`, `modify_time`) VALUES (12, 'user12', 'user12', '57cddafd5ed3da5f1052e44b18d917b1', '099211219912@232.com', 'STUDENT', 4, 2, '9caa4f0c-a4c2-481d-80c4-a0660376fa01', '2024-12-31 16:36:47', '2024-12-31 16:36:49');
INSERT INTO `user` (`id`, `username`, `realname`, `password`, `email`, `privilege`, `class_id`, `school_id`, `salt`, `create_time`, `modify_time`) VALUES (13, 'user13', 'user13', '3891983d8d96fd3a47ac3146855328d8', '1551223128@163.com', 'STUDENT', 5, 8, '81472ba9-01f0-464f-a91f-9b0e28dbdf26', '2024-12-31 16:36:52', '2024-12-31 16:36:54');
INSERT INTO `user` (`id`, `username`, `realname`, `password`, `email`, `privilege`, `class_id`, `school_id`, `salt`, `create_time`, `modify_time`) VALUES (14, 'user14', 'user14', 'f0ad07ef63b4a5de7acbe3afa068c1b6', '0992099219912@232.com', 'STUDENT', 8, 5, '5dcbfb7d-7ba3-4ac8-bec9-ad4bc6ff6432', '2024-12-31 16:36:59', '2024-12-31 16:36:57');
COMMIT;

-- ----------------------------
-- Table structure for user_answer
-- ----------------------------
DROP TABLE IF EXISTS `user_answer`;
CREATE TABLE `user_answer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `session_id` int NOT NULL,
  `problem_id` int NOT NULL,
  `answer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `correct` int DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `modify_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`,`session_id`,`problem_id`) USING BTREE,
  KEY `session_id_fk` (`session_id`) USING BTREE,
  KEY `problem_id_fk1` (`problem_id`) USING BTREE,
  CONSTRAINT `problem_id_fk1` FOREIGN KEY (`problem_id`) REFERENCES `problem` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `session_id_fk` FOREIGN KEY (`session_id`) REFERENCES `session` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

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
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `modify_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `problem_fk` (`problem_id`) USING BTREE,
  KEY `user_fk` (`user_id`) USING BTREE,
  CONSTRAINT `problem_fk` FOREIGN KEY (`problem_id`) REFERENCES `problem` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `user_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of wrong_problem_set
-- ----------------------------
BEGIN;
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
