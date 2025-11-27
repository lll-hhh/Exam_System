<template>
  <div class="dashboard">
    <el-row :gutter="20">
      <el-col :span="6">
        <el-card class="stat-card">
          <div class="stat-content">
            <el-icon class="stat-icon" color="#409EFF"><User /></el-icon>
            <div class="stat-info">
              <div class="stat-value">{{ stats.userCount }}</div>
              <div class="stat-label">用户总数</div>
            </div>
          </div>
        </el-card>
      </el-col>
      
      <el-col :span="6">
        <el-card class="stat-card">
          <div class="stat-content">
            <el-icon class="stat-icon" color="#67C23A"><Document /></el-icon>
            <div class="stat-info">
              <div class="stat-value">{{ stats.problemCount }}</div>
              <div class="stat-label">题目总数</div>
            </div>
          </div>
        </el-card>
      </el-col>
      
      <el-col :span="6">
        <el-card class="stat-card">
          <div class="stat-content">
            <el-icon class="stat-icon" color="#E6A23C"><Reading /></el-icon>
            <div class="stat-info">
              <div class="stat-value">{{ stats.examCount }}</div>
              <div class="stat-label">考试总数</div>
            </div>
          </div>
        </el-card>
      </el-col>
      
      <el-col :span="6">
        <el-card class="stat-card">
          <div class="stat-content">
            <el-icon class="stat-icon" color="#F56C6C"><Tickets /></el-icon>
            <div class="stat-info">
              <div class="stat-value">{{ stats.paperCount }}</div>
              <div class="stat-label">试卷总数</div>
            </div>
          </div>
        </el-card>
      </el-col>
    </el-row>
    
    <el-row :gutter="20" style="margin-top: 20px;">
      <el-col :span="24">
        <el-card>
          <template #header>
            <span>欢迎使用考试系统</span>
          </template>
          <div class="welcome-content">
            <p>系统功能：</p>
            <ul>
              <li>用户管理：管理系统用户，支持批量导入</li>
              <li>题目管理：创建和管理考试题目，支持多种题型</li>
              <li>考试管理：创建和管理考试，设置考试时间和规则</li>
              <li>试卷管理：组卷和管理试卷模板</li>
              <li>成绩分析：查看考试成绩和统计分析</li>
            </ul>
          </div>
        </el-card>
      </el-col>
    </el-row>
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue'

const stats = ref({
  userCount: 0,
  problemCount: 0,
  examCount: 0,
  paperCount: 0
})

onMounted(() => {
  // 这里可以调用API获取统计数据
  stats.value = {
    userCount: 150,
    problemCount: 500,
    examCount: 25,
    paperCount: 30
  }
})
</script>

<style scoped>
.dashboard {
  width: 100%;
}

.stat-card {
  cursor: pointer;
  transition: all 0.3s;
}

.stat-card:hover {
  transform: translateY(-5px);
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
}

.stat-content {
  display: flex;
  align-items: center;
  padding: 10px;
}

.stat-icon {
  font-size: 48px;
  margin-right: 20px;
}

.stat-info {
  flex: 1;
}

.stat-value {
  font-size: 32px;
  font-weight: bold;
  color: #333;
}

.stat-label {
  font-size: 14px;
  color: #999;
  margin-top: 5px;
}

.welcome-content p {
  font-size: 16px;
  margin-bottom: 10px;
}

.welcome-content ul {
  padding-left: 20px;
}

.welcome-content li {
  margin: 10px 0;
  line-height: 1.8;
}
</style>
