# Result<T> 响应类使用指南

`Result<T>` 是一个用于构建统一响应格式的通用类，适用于处理 API 请求的成功和错误响应。它提供了多种静态方法来创建不同类型的响应，并支持链式调用来动态修改响应对象的属性。

## 目录

1. [成功响应](#成功响应)
2. [错误响应](#错误响应)
3. [根据枚举创建响应](#根据枚举创建响应)
4. [自定义状态码和消息](#自定义状态码和消息)
5. [链式调用](#链式调用)
6. [示例：控制器中的使用](#示例控制器中的使用)

---

## 成功响应

### 1.1 没有数据的成功响应

如果你只需要返回一个成功状态码和消息，而不需要返回任何数据，可以使用 `success()` 方法：

```java
// 返回 200 操作成功，且没有数据
Result<Void> response = Result.success();

Result<?> response = Result.success();
```
### 1.2 带有数据的成功响应
如果你需要返回成功状态码、消息以及response一些业务数据，可以使用 success(T data) 方法：
```java
// 返回 200 操作成功，并附带用户数据
User user = new User("john", "password");
Result<User> response = Result.success(user);

Result<?> response = Result.success(user);
```
## 错误响应
### 2.1 通用错误响应
如果你想要返回一个通用的错误响应（例如服务器内部错误），可以使用 error() 方法：
```java
// 返回 500 服务器内部错误，且没有数据
Result<Void> response = Result.error();

Result<?> response =Result.error();
```
### 2.2 带有自定义消息的错误响应
如果你想要返回一个带有自定义错误消息的响应，可以使用 error(String msg) 方法：
```java
// 返回 500 服务器内部错误，并附带自定义消息
Result<Void> response = Result.error("数据库连接失败，请稍后再试。");

Result<?> response = Result.error("数据库连接失败，请稍后再试。");
```

### 2.3 带有自定义状态码和消息的错误响应
如果你需要返回一个带有自定义状态码和消息的响应，可以使用 error(Integer code, String msg) 方法：
```java
// 返回 403 禁止访问，并附带自定义消息
Result<Void> response = Result.error(403, "您没有权限访问此资源。");

Result<?> response = Result.error(403, "您没有权限访问此资源。");
```
## 根据枚举创建响应
你可以使用 of(RCode resultCode) 或 of(RCode resultCode, T data) 方法根据 RCode 枚举创建响应。这使得你可以根据不同的业务场景选择合适的状态码和消息。
### 3.1 没有数据的响应
```java
// 返回 404 资源未找到，且没有数据
Result<Void> response = Result.of(RCode.NOT_FOUND);
```
### 3.2 带有数据的响应
```java
// 返回 201 创建成功，并附带新创建的用户数据
User newUser = new User("alice", "password");
Result<User> response = Result.of(RCode.CREATED, newUser);

Result<?> response = Result.of(RCode.CREATED, newUser);
```
## 自定义状态码和消息
如果你需要返回一个完全自定义的状态码、消息和数据，可以使用 custom(Integer code, String msg, T data) 方法：
```java
// 返回 418 我是一个茶壶，并附带自定义消息和数据
Teapot teapot = new Teapot("陶瓷", "红色");
Result<Teapot> response = Result.custom(418, "我是一个茶壶", teapot);

R<?> response = Result.custom(418, "我是一个茶壶", teapot);
```
## 链式调用
你可以通过链式调用来动态修改响应对象的属性。例如，你可以先创建一个响应对象，然后根据业务逻辑动态设置状态码、消息或数据。
```java
// 返回 200 操作成功，并动态设置消息
Result<Void> response = Result.of(RCode.SUCCESS).setMsg("操作已完成");

// 返回 400 参数错误，并动态设置消息和数据
String errorMessage = "用户名不能为空";
response = Result.of(RCode.BAD_REQUEST).setMsg(errorMessage);

// 返回 201 创建成功，并动态设置数据
User newUser = new User("bob", "password");
response = Result.of(RCode.CREATED).setData(newUser);
```
## 示例：控制器中的使用
假设你在 Spring Boot 的控制器中处理一个创建用户的请求，以下是如何使用 R<T> 类来构建响应的示例：
```java
@RestController
@RequestMapping("/users")
public class UserController {

    @Autowired
    private UserService userService;

    @PostMapping
    public Result<User> createUser(@RequestBody User user) {
        try {
            // 验证用户输入
            if (user.getUsername() == null || user.getPassword() == null) {
                return Result.error("用户名和密码不能为空");
            }

            // 检查用户名是否已存在
            if (userService.existsByUsername(user.getUsername())) {
                return Result.of(RCode.CONFLICT);  // 返回 409 冲突
            }

            // 创建用户
            User createdUser = userService.save(user);

            // 返回创建成功的响应
            return Result.of(RCode.CREATED, createdUser);  // 返回 201 创建成功
        } catch (Exception e) {
            // 记录日志并返回系统错误
            logger.error("Failed to create user: {}", e.getMessage());
            return Result.error("系统错误，请联系管理员");  // 返回 500 服务器内部错误
        }
    }
}
```