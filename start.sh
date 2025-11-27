#!/bin/bash

echo "==================================="
echo "考试系统启动脚本"
echo "==================================="

# 检查前端依赖
if [ ! -d "frontend/node_modules" ]; then
    echo "📦 安装前端依赖..."
    cd frontend && npm install && cd ..
fi

# 启动前端（后台运行）
echo "🚀 启动前端服务..."
cd frontend
npm run dev > ../logs/frontend.log 2>&1 &
FRONTEND_PID=$!
echo "前端进程 PID: $FRONTEND_PID"
cd ..

# 等待前端启动
sleep 3

# 启动后端（需要MySQL数据库）
echo "🚀 启动后端服务..."
cd backend
mvn spring-boot:run > ../logs/backend.log 2>&1 &
BACKEND_PID=$!
echo "后端进程 PID: $BACKEND_PID"
cd ..

echo ""
echo "==================================="
echo "✅ 服务启动完成！"
echo "==================================="
echo "前端地址: http://localhost:3000"
echo "后端地址: http://localhost:8080"
echo ""
echo "前端进程 PID: $FRONTEND_PID"
echo "后端进程 PID: $BACKEND_PID"
echo ""
echo "日志文件:"
echo "  - 前端: logs/frontend.log"
echo "  - 后端: logs/backend.log"
echo ""
echo "停止服务:"
echo "  kill $FRONTEND_PID $BACKEND_PID"
echo "==================================="

# 保存 PID
echo $FRONTEND_PID > logs/frontend.pid
echo $BACKEND_PID > logs/backend.pid
