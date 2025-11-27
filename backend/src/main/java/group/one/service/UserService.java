package group.one.service;


import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import group.one.entity.UserEntity;
import group.one.utils.Result;

import java.io.File;
import java.util.List;


public interface UserService extends IService<UserEntity> {
    boolean addUser(UserEntity user);

    UserEntity deleteUser(UserEntity user);

    UserEntity getUserInformation(UserEntity user);

    IPage<UserEntity> getAllUsers(UserEntity user, int page, int size);

    Result<?> updateUser(String token, UserEntity user);

    boolean login(UserEntity user);

    boolean register(UserEntity user);

    String generateToken(UserEntity user);

    String getPrivilegeByToken(String token);

    boolean isTokenExpired(String token);

    List<Long> getStudentsId(Long classId);

    boolean batchImportUsers(File excelFile);

    void md5WithSalt(UserEntity user);


}
