# 启动/停止脚本使用说明

## 快速启动

### 方式一：使用启动脚本（推荐）

```bash
# 给脚本添加执行权限
chmod +x start.sh stop.sh

# 启动前后端服务
./start.sh

# 停止所有服务
./stop.sh
```

### 方式二：手动启动

**前端：**
```bash
cd frontend
npm install  # 首次运行需要
npm run dev
```
访问：http://localhost:3000

**后端：**
```bash
cd backend
mvn spring-boot:run
```
访问：http://localhost:8080

## 数据库配置

后端需要MySQL数据库，请确保：

1. MySQL已安装并运行
2. 导入初始化脚本：
```bash
mysql -u root -p < init-db/init.sql
```

3. 修改 `backend/src/main/resources/application.yml` 中的数据库连接信息

## 访问系统

- **前端地址：** http://localhost:3000
- **后端API：** http://localhost:8080
- **默认账号：** admin / admin123

## 查看日志

```bash
# 前端日志
tail -f logs/frontend.log

# 后端日志
tail -f logs/backend.log
```

## Docker部署

如果需要使用Docker一键部署（包含数据库）：

```bash
# 启动所有服务
docker compose up -d

# 查看日志
docker compose logs -f

# 停止服务
docker compose down
```

## 常见问题

### 1. 端口被占用
- 前端默认端口：3000
- 后端默认端口：8080
- MySQL默认端口：3306

如需修改端口：
- 前端：修改 `frontend/vite.config.js`
- 后端：修改 `backend/src/main/resources/application.yml`

### 2. 后端无法连接数据库
确保：
- MySQL服务已启动
- 数据库 `exam` 已创建
- 用户名密码正确

### 3. 前端API请求失败
检查：
- 后端是否成功启动
- 代理配置是否正确（vite.config.js）
