package group.one.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import group.one.dao.UserDAO;
import group.one.entity.UserEntity;
import group.one.service.UserService;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.*;
import java.util.logging.Logger;
import java.util.stream.Collectors;

import group.one.utils.Result;
import org.apache.poi.ss.usermodel.*;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;

@Service("userService")
public class UserServiceImpl extends ServiceImpl<UserDAO, UserEntity>
        implements UserService {

    private static final Logger log = Logger.getLogger(UserService.class.getName());
    public static Map<String, TokenInformation> tokenUserMap = new HashMap<>();

    //对用户进行增加，老师或管理员，需查看是否已存在，对新增用户密码进行加密处理
    @Override
    public boolean addUser(UserEntity user) {
        if(this.getUserInformation(user)!= null){
            return false;
        }
        this.md5WithSalt(user);
        return baseMapper.insert(user) > 0;
    }

    //对用户进行删除，老师或管理员，需查看是否已存在
    @Override
    public UserEntity deleteUser(UserEntity user){
        UserEntity deletedUser = this.getUserInformation(user);
        if(deletedUser != null){
            removeById(deletedUser.getId());
        }
        return deletedUser;
    }


    @Override
    public UserEntity getUserInformation(UserEntity user){
        LambdaQueryWrapper<UserEntity> query = Wrappers.lambdaQuery();
        boolean hasConditions = false;

        if (user.getRealname() != null){
            query.or().eq(UserEntity::getRealname, user.getRealname());
            hasConditions = true;
        } else if (user.getId() != null) {
            query.or().eq(UserEntity::getId, user.getId());
            hasConditions = true;
        } else if (user.getUsername()!= null) {
            query.or().eq(UserEntity::getUsername, user.getUsername());
            hasConditions = true;
        }else if (user.getEmail() != null) {
            query.or().eq(UserEntity::getEmail, user.getEmail());
            hasConditions = true;
        }

        if (!hasConditions) {
            return null;
        }
        return this.getOne(query);
    }

    //pageNum显示第几页，pageSize显示每页显示多少条数据
    @Override
    public IPage<UserEntity> getAllUsers(UserEntity user,int pageNum,int pageSize){
        LambdaQueryWrapper<UserEntity> query = Wrappers.lambdaQuery();
        if (user != null && user.getUsername() != null) {
            query.like(UserEntity::getUsername, user.getUsername());
        }
        Page<UserEntity> page = new Page<>(pageNum, pageSize);
        return baseMapper.selectPage(page, query);
    }

    //更新用户信息，每个人可以改自己的信息，但不能修改权限，老师可以修改学生的班级和学校，管理员可以修改所有人的权限和班级学校
    @Override
    public Result<?> updateUser(String token,UserEntity user){
        String privilege = this.getPrivilegeByToken(token);
        UserEntity targetUser = this.getUserInformation(user);
        if(privilege == null){
            return Result.error(401,"User not logged in.");
        }
        else if(targetUser == null){
            return Result.error(401,"User not found.");
        }
        else if(tokenUserMap.get(token).getUserEntity().getUsername().equals(targetUser.getUsername())) {
            user.setPrivilege(targetUser.getPrivilege());
            user.setId(targetUser.getId());
            String userEncryptedPassword = DigestUtils.md5DigestAsHex((user.getPassword()+targetUser.getSalt()).getBytes());
            user.setPassword(userEncryptedPassword);
            boolean response = updateById(user);
            user.setPassword("");
            if (response) {
                return Result.success(user);
            } else {
                return Result.error(500,"Failed to update user.Please try later.");
            }
        }
        else if(privilege.equals("ADMIN")||(privilege.equals("TEACHER")&&targetUser.getPrivilege().equals("STUDENT"))){
            if(privilege.equals("ADMIN")&&user.getPrivilege()!=null)
                targetUser.setPrivilege(user.getPrivilege());
            if(user.getClassId()!=null)
                targetUser.setClassId(user.getClassId());
            if(user.getSchoolId()!=null)
                targetUser.setSchoolId(user.getSchoolId());
            boolean response = updateById(targetUser);
            UserEntity updatedUser = this.getById(targetUser.getId());
            updatedUser.setPassword("");
            updatedUser.setSalt("");
            if (response) {
                return Result.success(updatedUser);
            } else {
                return Result.error(500,"Failed to update user.Please try later.");
            }

        }
        else{
            return Result.error(401,"You don't have the privilege to update this user.");
        }
    }

    //登录，需查看是否已存在
    @Override
    public boolean login(UserEntity user){
        UserEntity targetUser = this.getUserInformation(user);
        if(targetUser == null){
            return false;
        }
        String userEncryptedPassword = DigestUtils.md5DigestAsHex((user.getPassword()+targetUser.getSalt()).getBytes());
        return targetUser.getPassword().equals(userEncryptedPassword);
    }

    //注册，需查看是否已存在，对密码进行加密处理
    @Override
    public boolean register(UserEntity user){
        if(this.getUserInformation(user) != null){
            return false;
        }
        this.md5WithSalt(user);
        return baseMapper.insert(user) > 0;
    }

    //给定一个用户生成一个他的token，并将token和用户信息存入tokenUserMap中，后续可根据token获取用户信息
    //token有效期为2小时,后面进行鉴权
    @Override
    public String generateToken(UserEntity user){
        UserEntity targetUser = this.getUserInformation(user);  //获取用户信息必须为数据库存储的
        String token = UUID.randomUUID().toString();
        Date expirationTime = new Date(System.currentTimeMillis() + 3600 * 1000 * 2);
        tokenUserMap.put(token, new TokenInformation(targetUser, expirationTime));
        return token;
    }

    //根据token获取用户信息，若token已过期则返回null
    @Override
    public String getPrivilegeByToken(String token){
        String privilege = tokenUserMap.get(token).getUserEntity().getPrivilege();
        if(privilege.isEmpty()){
            return null;
        }
        return privilege;
    }

    //判断token是否已过期
    public boolean isTokenExpired(String token) {
        log.info("Checking token expiration for token: " + token);
        log.info(tokenUserMap.toString());
        TokenInformation tokenInformation = tokenUserMap.get(token);
        if (tokenInformation == null) {
            return true;
        }
        Date now = new Date();
//        Date now = new Date(System.currentTimeMillis() + 3600 * 1000 * 2);
        return now.after(tokenInformation.getExpirationTime());
    }

    //删除token
    public static boolean exit(String token){
        return tokenUserMap.remove(token)!= null;
    }

    //根据班级ID获取学生ID列表
    @Override
    public List<Long> getStudentsId(Long classId){
        if (classId == null) {
            return Collections.emptyList();
        }
        LambdaQueryWrapper<UserEntity> query = Wrappers.lambdaQuery();
        query.eq(UserEntity::getClassId, classId);
        List<UserEntity> students = super.list(query);
        return students.stream()
                .map(UserEntity::getId)
                .collect(Collectors.toList());
    }

    //从excel文件批量导入用户，按行逐行进行录入信息
    @Override
    public boolean batchImportUsers(File excelFile) {
        try {
            FileInputStream fis = new FileInputStream(excelFile);
            Workbook workbook = WorkbookFactory.create(fis);
            Sheet sheet = workbook.getSheetAt(0);   // 取第一个sheet
            List<UserEntity> userEntities = new ArrayList<>();
            int rowIndex = 1;  // 忽略标题行
            while (rowIndex < sheet.getLastRowNum()) {
                Row row = sheet.getRow(rowIndex);
                if (row == null) {
                    continue;
                }
                UserEntity user = new UserEntity();
                user.setUsername(getCellValue(row.getCell(0)));
                user.setRealname(getCellValue(row.getCell(1)));
                user.setPassword(getCellValue(row.getCell(2)));
                user.setEmail(getCellValue(row.getCell(3)));
                user.setPrivilege(getCellValue(row.getCell(4)));
                user.setClassId(Long.valueOf(getCellValue(row.getCell(5))));
                user.setSchoolId(Long.valueOf(getCellValue(row.getCell(6))));
                md5WithSalt(user);     //注意要对新增加的用户密码进行加密处理
                if (this.getUserInformation(user) == null) {
                    userEntities.add(user);
                }
                rowIndex++;
            }
            fis.close();
            workbook.close();
            return saveBatch(userEntities);
        } catch (IOException e) {
            return false;
        }
    }

    //获取单元格的值,返回类型均为String
    private String getCellValue(Cell cell) {
        if (cell == null) {
            return "";
        }
        switch (cell.getCellType()) {
            case STRING:
                return cell.getStringCellValue();
            case NUMERIC:
                return String.valueOf(cell.getNumericCellValue());
            default:
                return "";
        }
    }


    @Override
    public void md5WithSalt(UserEntity user) {
        String salt = UUID.randomUUID().toString();
        user.setSalt(salt);
        String encryptedPassword = DigestUtils.md5DigestAsHex((user.getPassword()+salt).getBytes());
        user.setPassword(encryptedPassword);
    }

}

class TokenInformation {
    private UserEntity userEntity;
    private Date expirationTime;

    public TokenInformation(UserEntity userEntity, Date expirationTime) {
        this.userEntity = userEntity;
        this.expirationTime = expirationTime;
    }

    public UserEntity getUserEntity() {
        return userEntity;
    }

    public Date getExpirationTime() {
        return expirationTime;
    }
}