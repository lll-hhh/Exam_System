<template>
  <div class="exam-take">
    <el-card>
      <template #header>
        <div class="card-header">
          <span>{{ examInfo.name }}</span>
          <div class="timer">
            <el-icon><Clock /></el-icon>
            剩余时间：{{ formatTime(remainingTime) }}
          </div>
        </div>
      </template>
      
      <el-empty description="考试功能开发中..." />
      
      <div style="margin-top: 20px; text-align: center;">
        <el-button type="primary" @click="handleSubmit">提交试卷</el-button>
        <el-button @click="$router.back()">返回</el-button>
      </div>
    </el-card>
  </div>
</template>

<script setup>
import { ref, onMounted, onUnmounted } from 'vue'
import { useRoute, useRouter } from 'vue-router'
import { Clock } from '@element-plus/icons-vue'
import { ElMessage, ElMessageBox } from 'element-plus'
import { getExamById } from '@/api/exam'

const route = useRoute()
const router = useRouter()

const examInfo = ref({})
const remainingTime = ref(3600) // 秒
let timer = null

const formatTime = (seconds) => {
  const h = Math.floor(seconds / 3600)
  const m = Math.floor((seconds % 3600) / 60)
  const s = seconds % 60
  return `${h.toString().padStart(2, '0')}:${m.toString().padStart(2, '0')}:${s.toString().padStart(2, '0')}`
}

const fetchExamInfo = async () => {
  try {
    const res = await getExamById(route.params.id)
    examInfo.value = res.data
    remainingTime.value = (examInfo.value.duration || 60) * 60
    startTimer()
  } catch (error) {
    console.error(error)
    ElMessage.error('获取考试信息失败')
    router.back()
  }
}

const startTimer = () => {
  timer = setInterval(() => {
    if (remainingTime.value > 0) {
      remainingTime.value--
    } else {
      clearInterval(timer)
      handleSubmit()
    }
  }, 1000)
}

const handleSubmit = async () => {
  await ElMessageBox.confirm('确定要提交试卷吗？', '提示', {
    confirmButtonText: '确定',
    cancelButtonText: '取消',
    type: 'warning'
  })
  
  ElMessage.success('提交成功')
  router.push('/exam')
}

onMounted(() => {
  fetchExamInfo()
})

onUnmounted(() => {
  if (timer) {
    clearInterval(timer)
  }
})
</script>

<style scoped>
.exam-take {
  width: 100%;
}

.card-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.timer {
  display: flex;
  align-items: center;
  gap: 8px;
  color: #f56c6c;
  font-size: 18px;
  font-weight: bold;
}
</style>
