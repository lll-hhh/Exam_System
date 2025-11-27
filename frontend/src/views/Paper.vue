<template>
  <div class="paper-management">
    <el-card>
      <template #header>
        <div class="card-header">
          <span>试卷管理</span>
          <el-button type="primary" :icon="Plus" @click="handleAdd">创建试卷</el-button>
        </div>
      </template>
      
      <el-empty description="试卷管理功能开发中..." />
    </el-card>
  </div>
</template>

<script setup>
import { Plus } from '@element-plus/icons-vue'

const handleAdd = () => {
  console.log('创建试卷')
}
</script>

<style scoped>
.paper-management {
  width: 100%;
}

.card-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
}
</style>
