package group.one.controller;


import com.baomidou.mybatisplus.core.metadata.IPage;
import group.one.entity.UserEntity;
import group.one.service.UserService;
import group.one.service.impl.UserServiceImpl;
import group.one.utils.Result;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;

@Slf4j
@RestController
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;

    @PostMapping("/add")
    public Result<?> addUser(@RequestBody UserEntity user) {
        boolean response = userService.addUser(user);
        if (response) {
            return Result.success("User added successfully.");
        } else {
            return Result.error("This user already exists.");
        }
    }

    @PostMapping("/delete")
    public Result<?> deleteUser(@RequestBody UserEntity user) {
        UserEntity deletedUser = userService.deleteUser(user);
        if (deletedUser != null) {
            return Result.success(deletedUser);
        } else {
            return Result.error("Failed to delete user.Please try later.");
        }
    }

    @PostMapping("/search")
    public Result<?> getUser(@RequestBody UserEntity user) {
        UserEntity searchedUser = userService.getUserInformation(user);
        if (searchedUser != null) {
            searchedUser.setPassword("");
            searchedUser.setSalt("");
            return Result.success(searchedUser);
        } else {
            return Result.error("Failed to search user.Please try later.");
        }
    }

    //pageNum显示第几页，pageNum默认为1，pageSize显示每页显示多少条数据，pageSize默认为5
    @PostMapping("/get-all")
    public Result<?> getAllUsers(@RequestBody UserEntity user,
                                 @RequestParam(defaultValue = "1", required = false) int pageNum,
                                 @RequestParam(defaultValue = "5", required = false) int pageSize) {
        IPage<UserEntity> allUsers = userService.getAllUsers(user, pageNum, pageSize);
        if (allUsers.getTotal() > 0) {
            return Result.success(allUsers);
        } else {
            return Result.error("No user data exists.");
        }
    }

    @PostMapping("/update")
    public Result<?> updateUser(@RequestHeader("Token") String token,@RequestBody UserEntity user) {
        return userService.updateUser(token,user);
    }

    @PostMapping("/login")
    public Result<?> login(@RequestBody UserEntity user) {
        boolean response = userService.login(user);
        if (response) {
            String token = userService.generateToken(user);
            return Result.success(token);
        } else {
            return Result.error(401,"Invalid username or password.");
        }
    }

    @PostMapping("/register")
    public Result<?> register(@RequestBody UserEntity user) {
        boolean response = userService.register(user);
        if (response) {
            return Result.success(user);
        } else {
            return Result.error("This user already exists, please login directly.");
        }
    }

    @PostMapping("/exit")
    public Result<?> exit(@RequestHeader("Token") String token) {
        boolean response = UserServiceImpl.exit(token);
        if (response) {
            return Result.success("User logged out successfully.");
        } else {
            return Result.error(500,"Failed to log out user.Please try later.");
        }
    }

    // 批量导入用户信息
    @PostMapping("/batch-import")
    public Result<?> batchImport(@RequestParam("file") MultipartFile file ){
        if (file == null || file.isEmpty()) {
            return Result.error(500,"Error importing file. Please import file again");
        }
        try {
            File excelFile = File.createTempFile("temp", ".xlsx"); // 创建临时文件，可根据实际调整存储方式
            file.transferTo(excelFile);
            boolean response = userService.batchImportUsers(excelFile);
            if (response) {
                return Result.success("User information batch import successfully");
            } else {
                return Result.error(500,"Failed to import user information in batches. Please try again later");
            }
        } catch (IOException e) {
            e.printStackTrace();
            return Result.error(500,"An error occurred while processing the file. Please try again later");
        }
    }

}
