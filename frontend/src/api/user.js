import request from '@/utils/request'

// 用户登录
export const login = (data) => {
  return request({
    url: '/user/login',
    method: 'post',
    data
  })
}

// 用户注册
export const register = (data) => {
  return request({
    url: '/user/register',
    method: 'post',
    data
  })
}

// 用户退出
export const exit = () => {
  return request({
    url: '/user/exit',
    method: 'post'
  })
}

// 获取用户信息
export const getUserInfo = (data) => {
  return request({
    url: '/user/search',
    method: 'post',
    data
  })
}

// 获取所有用户（分页）
export const getAllUsers = (data, pageNum = 1, pageSize = 10) => {
  return request({
    url: '/user/get-all',
    method: 'post',
    data,
    params: { pageNum, pageSize }
  })
}

// 添加用户
export const addUser = (data) => {
  return request({
    url: '/user/add',
    method: 'post',
    data
  })
}

// 更新用户
export const updateUser = (data) => {
  return request({
    url: '/user/update',
    method: 'post',
    data
  })
}

// 删除用户
export const deleteUser = (data) => {
  return request({
    url: '/user/delete',
    method: 'post',
    data
  })
}

// 批量导入用户
export const batchImportUsers = (file) => {
  const formData = new FormData()
  formData.append('file', file)
  return request({
    url: '/user/batch-import',
    method: 'post',
    data: formData,
    headers: {
      'Content-Type': 'multipart/form-data'
    }
  })
}
