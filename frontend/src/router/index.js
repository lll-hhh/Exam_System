import { createRouter, createWebHistory } from 'vue-router'
import { useUserStore } from '@/stores/user'

const router = createRouter({
  history: createWebHistory(),
  routes: [
    {
      path: '/login',
      name: 'Login',
      component: () => import('@/views/Login.vue'),
      meta: { requiresAuth: false }
    },
    {
      path: '/register',
      name: 'Register',
      component: () => import('@/views/Register.vue'),
      meta: { requiresAuth: false }
    },
    {
      path: '/',
      name: 'Layout',
      component: () => import('@/views/Layout.vue'),
      redirect: '/dashboard',
      meta: { requiresAuth: true },
      children: [
        {
          path: '/dashboard',
          name: 'Dashboard',
          component: () => import('@/views/Dashboard.vue'),
          meta: { title: '仪表盘' }
        },
        {
          path: '/user',
          name: 'User',
          component: () => import('@/views/User.vue'),
          meta: { title: '用户管理' }
        },
        {
          path: '/problem',
          name: 'Problem',
          component: () => import('@/views/Problem.vue'),
          meta: { title: '题目管理' }
        },
        {
          path: '/exam',
          name: 'Exam',
          component: () => import('@/views/Exam.vue'),
          meta: { title: '考试管理' }
        },
        {
          path: '/paper',
          name: 'Paper',
          component: () => import('@/views/Paper.vue'),
          meta: { title: '试卷管理' }
        },
        {
          path: '/exam-take/:id',
          name: 'ExamTake',
          component: () => import('@/views/ExamTake.vue'),
          meta: { title: '参加考试' }
        },
        {
          path: '/analyse',
          name: 'Analyse',
          component: () => import('@/views/Analyse.vue'),
          meta: { title: '成绩分析' }
        }
      ]
    }
  ]
})

// 路由守卫
router.beforeEach((to, from, next) => {
  const userStore = useUserStore()
  
  if (to.meta.requiresAuth && !userStore.token) {
    next('/login')
  } else if ((to.path === '/login' || to.path === '/register') && userStore.token) {
    next('/dashboard')
  } else {
    next()
  }
})

export default router
