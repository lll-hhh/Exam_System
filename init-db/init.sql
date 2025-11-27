-- 创建数据库
CREATE DATABASE IF NOT EXISTS exam DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

USE exam;

-- 用户表
CREATE TABLE IF NOT EXISTS `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `salt` varchar(50) DEFAULT NULL COMMENT '盐值',
  `name` varchar(50) DEFAULT NULL COMMENT '姓名',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `role` varchar(20) DEFAULT 'student' COMMENT '角色：admin/teacher/student',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户表';

-- 题目表
CREATE TABLE IF NOT EXISTS `problem` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '题目ID',
  `content` text NOT NULL COMMENT '题目内容',
  `type` tinyint(4) NOT NULL COMMENT '题目类型：1单选/2多选/3判断/4简答',
  `difficulty` tinyint(4) DEFAULT '1' COMMENT '难度：1简单/2中等/3困难',
  `score` int(11) DEFAULT '5' COMMENT '分值',
  `options` text COMMENT '选项（JSON格式）',
  `answer` text NOT NULL COMMENT '答案',
  `analysis` text COMMENT '解析',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='题目表';

-- 考试表
CREATE TABLE IF NOT EXISTS `exam` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '考试ID',
  `name` varchar(100) NOT NULL COMMENT '考试名称',
  `description` text COMMENT '考试描述',
  `start_time` datetime NOT NULL COMMENT '开始时间',
  `end_time` datetime NOT NULL COMMENT '结束时间',
  `duration` int(11) NOT NULL COMMENT '时长（分钟）',
  `total_score` int(11) NOT NULL COMMENT '总分',
  `pass_score` int(11) DEFAULT NULL COMMENT '及格分',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='考试表';

-- 试卷表
CREATE TABLE IF NOT EXISTS `paper` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '试卷ID',
  `name` varchar(100) NOT NULL COMMENT '试卷名称',
  `total_score` int(11) NOT NULL COMMENT '总分',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='试卷表';

-- 试卷题目关联表
CREATE TABLE IF NOT EXISTS `paper_problem` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `paper_id` bigint(20) NOT NULL COMMENT '试卷ID',
  `problem_id` bigint(20) NOT NULL COMMENT '题目ID',
  `order_num` int(11) DEFAULT NULL COMMENT '题目顺序',
  PRIMARY KEY (`id`),
  KEY `idx_paper_id` (`paper_id`),
  KEY `idx_problem_id` (`problem_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='试卷题目关联表';

-- 用户答案表
CREATE TABLE IF NOT EXISTS `user_answer` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `exam_id` bigint(20) NOT NULL COMMENT '考试ID',
  `problem_id` bigint(20) NOT NULL COMMENT '题目ID',
  `answer` text COMMENT '用户答案',
  `is_correct` tinyint(1) DEFAULT NULL COMMENT '是否正确',
  `score` int(11) DEFAULT NULL COMMENT '得分',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_user_exam` (`user_id`, `exam_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户答案表';

-- 插入默认管理员账号（密码：admin123）
INSERT INTO `user` (`username`, `password`, `name`, `email`, `role`) 
VALUES ('admin', 'e10adc3949ba59abbe56e057f20f883e', '管理员', 'admin@example.com', 'admin')
ON DUPLICATE KEY UPDATE `username` = `username`;
