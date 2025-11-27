package group.one.utils;

public enum RCode {
    // 成功状态码
    SUCCESS(200, "操作成功"),
    CREATED(201, "创建成功"),
    NO_CONTENT(204, "无内容"),

    // 客户端错误状态码
    BAD_REQUEST(400, "参数错误"),
    UNAUTHORIZED(401, "未授权"),
    FORBIDDEN(403, "禁止访问"),
    NOT_FOUND(404, "资源未找到"),
    CONFLICT(409, "冲突"),
    UNPROCESSABLE_ENTITY(422, "验证失败"),

    // 服务器错误状态码
    INTERNAL_SERVER_ERROR(500, "服务器内部错误"),
    SERVICE_UNAVAILABLE(503, "服务不可用"),
    TIMEOUT(504, "请求超时"),

    // 自定义业务状态码
    PARAM_ERROR(400, "参数错误"),
    AUTHENTICATION_FAILED(401, "认证失败"),
    PERMISSION_DENIED(403, "权限不足"),
    RESOURCE_NOT_FOUND(404, "资源未找到"),
    DATA_CONFLICT(409, "数据冲突"),
    VALIDATION_ERROR(422, "验证失败"),
    SYSTEM_ERROR(500, "系统错误，请联系管理员"),
    SERVICE_BUSY(503, "服务繁忙，请稍后再试");

    private final int code;
    private final String msg;

    RCode(int code, String msg) {
        this.code = code;
        this.msg = msg;
    }

    public int getCode() {
        return code;
    }

    public String getMsg() {
        return msg;
    }
}