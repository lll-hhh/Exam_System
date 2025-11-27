package group.one.config;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import group.one.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import group.one.utils.Result;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.List;
import java.util.regex.Pattern;

//实现了Spring的HandlerInterceptor接口，用于拦截处理Web请求，进行权限相关验证等操作
public class AuthInterceptor implements HandlerInterceptor {

    @Autowired
    private UserService userService;
    // 定义学生的功能,因为此处默认老师和管理员都可以访问，故不需要定义学生的特有功能
    private List<Pattern> studentsFeatures = Arrays.asList();
    //使用正则表达式进行路径的匹配，一次性初始化了包含多个正则表达式编译对象的列表
    private List<Pattern> adminOrTeacherPatterns = Arrays.asList(
            Pattern.compile("^/user/add.*"),
            Pattern.compile("^/user/delete.*"),
            Pattern.compile("^/user/batchImport.*"),
            Pattern.compile("^/class/.*"),
            Pattern.compile("^/school/.*") ,
            Pattern.compile("^/course/.*"),
            Pattern.compile("^/exam/.*"),
            Pattern.compile("^/logicalpaper/.*"),
            Pattern.compile("^/problem/.*"),
            Pattern.compile("^/tag/.*")
    );

    // 在请求处理之前进行拦截，进行权限验证等
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        // 获取请求的URI路径
        String requestURI = request.getRequestURI();

        if(requestURI.equals("/user/login")||requestURI.equals("/user/register")){
            return true;
        }

        String token = request.getHeader("Token");
        if(token==null || token.isEmpty()){
            handleUnauthorized(response,"未提供授权信息");
            return false;
        }

        if (userService.isTokenExpired(token)) {
            handleUnauthorized(response, "token已过期，请重新登录");
            return false;
        }


        String privilege = userService.getPrivilegeByToken(token);
        if(privilege == null){
            handleUnauthorized(response,"无效的授权信息");
            return false;
        }

        for (Pattern pattern : adminOrTeacherPatterns) {
            if (pattern.matcher(requestURI).matches()) {
                if (!isAdminOrTeacher(privilege)) {
                    handleUnauthorized(response, "权限不足");
                    return false;
                }
                break;
            }
        }
        return true;
    }

    private boolean isAdminOrTeacher(String privilege){
        return privilege.equals("ADMIN") || privilege.equals("TEACHER");
    }

    private boolean idStudent(String privilege){
        return privilege.equals("STUDENT");
    }


    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }

    //在应用程序判定用户未授权、没有通过认证或者权限不足等情况时，向客户端返回相应响应信息
    private void handleUnauthorized(HttpServletResponse response, String message) throws IOException {
        response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
        response.setContentType("application/json;charset=UTF-8");
        PrintWriter writer = response.getWriter();
        Result<?> result = Result.error(403,message);
        writer.write(result.toString());
        writer.flush();
        writer.close();
    }
}
