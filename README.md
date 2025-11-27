# Exam System

考试系统 - 基于 Spring Boot + Vue 3 + MySQL 的在线考试管理系统

## 功能特性

- 用户管理：支持用户注册、登录、批量导入
- 题目管理：支持多种题型（单选、多选、判断、简答），支持批量导入
- 考试管理：创建考试、设置考试时间和规则
- 试卷管理：组卷和管理试卷模板
- 成绩分析：查看考试成绩和统计分析

## 技术栈

### 后端
- Spring Boot 2.6.4
- MyBatis Plus 3.4.3
- MySQL 8.0
- Druid 连接池

### 前端
- Vue 3
- Vite
- Element Plus
- Vue Router
- Pinia

### 部署
- Docker
- Docker Compose
- Nginx

## 快速开始

### 使用 Docker Compose（推荐）

1. 克隆项目
```bash
git clone https://github.com/lll-hhh/Exam_System.git
cd Exam_System
```

2. 启动所有服务
```bash
docker-compose up -d
```

3. 访问应用
- 前端地址：http://localhost
- 后端API：http://localhost:8080
- 数据库：localhost:3306

4. 默认管理员账号
- 用户名：admin
- 密码：admin123

### 手动部署

#### 后端
```bash
cd backend
mvn clean package
java -jar target/exam-1.0-SNAPSHOT.jar
```

#### 前端
```bash
cd frontend
npm install
npm run dev
```

#### 数据库
```bash
# 导入 init-db/init.sql 到 MySQL
mysql -u root -p < init-db/init.sql
```

## 项目结构

```
.
├── backend/                # 后端代码
│   ├── src/
│   │   └── main/
│   │       ├── java/
│   │       └── resources/
│   ├── Dockerfile
│   └── pom.xml
├── frontend/               # 前端代码
│   ├── src/
│   │   ├── api/           # API接口
│   │   ├── router/        # 路由配置
│   │   ├── stores/        # 状态管理
│   │   ├── utils/         # 工具函数
│   │   └── views/         # 页面组件
│   ├── Dockerfile
│   ├── nginx.conf
│   └── package.json
├── init-db/               # 数据库初始化脚本
│   └── init.sql
├── docker-compose.yml     # Docker编排文件
└── README.md
```

## 开发指南

### API 文档

主要API端点：

- 用户相关：`/user/*`
- 题目相关：`/problem/*`
- 考试相关：`/exam/*`
- 试卷相关：`/paper/*`

### 环境变量

可以在 `docker-compose.yml` 中配置以下环境变量：

- `MYSQL_ROOT_PASSWORD`: MySQL root密码
- `MYSQL_DATABASE`: 数据库名称

## 停止服务

```bash
docker-compose down
```

## 清理数据

```bash
docker-compose down -v
```

## 许可证

MIT License
