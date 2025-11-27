#!/bin/bash

echo "停止考试系统服务..."

# 读取 PID
if [ -f "logs/frontend.pid" ]; then
    FRONTEND_PID=$(cat logs/frontend.pid)
    kill $FRONTEND_PID 2>/dev/null && echo "✅ 前端服务已停止 (PID: $FRONTEND_PID)"
    rm logs/frontend.pid
fi

if [ -f "logs/backend.pid" ]; then
    BACKEND_PID=$(cat logs/backend.pid)
    kill $BACKEND_PID 2>/dev/null && echo "✅ 后端服务已停止 (PID: $BACKEND_PID)"
    rm logs/backend.pid
fi

# 额外清理可能残留的进程
pkill -f "vite" 2>/dev/null
pkill -f "spring-boot:run" 2>/dev/null

echo "所有服务已停止"
