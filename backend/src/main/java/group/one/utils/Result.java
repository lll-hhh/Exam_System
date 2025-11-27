package group.one.utils;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Result<T> {
    private Integer code;
    private String msg;
    private T data;

    // 成功响应
    public static <T> Result<T> success() {
        return of(RCode.SUCCESS);
    }

    public static <T> Result<T> success(T data) {
        return of(RCode.SUCCESS, data);
    }

    // 错误响应
    public static <T> Result<T> error() {
        return of(RCode.INTERNAL_SERVER_ERROR);
    }

    public static <T> Result<T> error(String msg) {
        return Result.<T>of(RCode.INTERNAL_SERVER_ERROR).setMsg(msg);
    }

    public static <T> Result<T> error(Integer code, String msg) {
        return custom(code, msg, null);
    }

    // 根据枚举创建响应
    public static <T> Result<T> of(RCode resultCode) {
        return new Result<>(resultCode.getCode(), resultCode.getMsg(), null);
    }

    public static <T> Result<T> of(RCode resultCode, T data) {
        return new Result<>(resultCode.getCode(), resultCode.getMsg(), data);
    }

    // 自定义状态码和消息
    public static <T> Result<T> custom(Integer code, String msg, T data) {
        return new Result<>(code, msg, data);
    }

    // 可选：添加链式调用支持
    public Result<T> setCode(Integer code) {
        this.code = code;
        return this;
    }

    public Result<T> setMsg(String msg) {
        this.msg = msg;
        return this;
    }

    public Result<T> setData(T data) {
        this.data = data;
        return this;
    }
}