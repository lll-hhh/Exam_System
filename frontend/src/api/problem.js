import request from '@/utils/request'

// 查询题目
export const selectProblem = (data) => {
  return request({
    url: '/problem/select',
    method: 'post',
    data
  })
}

// 获取所有题目（分页）
export const listAllProblems = (current = 1, size = 10) => {
  return request({
    url: '/problem/list-all',
    method: 'post',
    params: { current, size }
  })
}

// 添加单个题目
export const insertOneProblem = (data) => {
  return request({
    url: '/problem/insert-one',
    method: 'post',
    data
  })
}

// 批量导入题目
export const insertProblemFile = (file) => {
  const formData = new FormData()
  formData.append('file', file)
  return request({
    url: '/problem/insert-file',
    method: 'post',
    data: formData,
    headers: {
      'Content-Type': 'multipart/form-data'
    }
  })
}

// 删除题目
export const deleteProblem = (data) => {
  return request({
    url: '/problem/delete',
    method: 'post',
    data
  })
}

// 更新题目
export const updateProblem = (data) => {
  return request({
    url: '/problem/update',
    method: 'post',
    data
  })
}
