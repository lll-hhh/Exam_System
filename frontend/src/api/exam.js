import request from '@/utils/request'

// 获取所有考试（分页）
export const listAllExams = (data) => {
  return request({
    url: '/exam/list-all',
    method: 'get',
    data
  })
}

// 根据ID获取考试
export const getExamById = (id) => {
  return request({
    url: `/exam/get-by-id/${id}`,
    method: 'get'
  })
}

// 添加考试
export const addExam = (data) => {
  return request({
    url: '/exam/add',
    method: 'post',
    data
  })
}

// 删除考试
export const deleteExam = (id) => {
  return request({
    url: `/exam/delete-by-id/${id}`,
    method: 'get'
  })
}

// 更新考试
export const updateExam = (id, data) => {
  return request({
    url: `/exam/update/${id}`,
    method: 'post',
    data
  })
}
