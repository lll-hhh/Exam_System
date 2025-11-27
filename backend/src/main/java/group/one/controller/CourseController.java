package group.one.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import group.one.entity.CourseEntity;
import group.one.entity.ProblemEntity;
import group.one.service.CourseService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import group.one.utils.Result;

import java.util.List;
import java.util.Map;

@Slf4j
@RestController
@RequestMapping("/course")
public class CourseController {
    @Autowired
    private CourseService service;

    @PostMapping("/select")
    public Result courseSelect(@RequestBody Map<String, Object> params) {
        return Result.success(service.select(params));
    }
    @PostMapping("/insert")
    public Result courseInsert(@RequestBody CourseEntity course) {
        return Result.success( service.insert(course));
    }
    @PostMapping("/delete")
    public Result courseDelete(@RequestBody CourseEntity course) {
        return Result.success(service.delete(course));
    }
    @PostMapping("/update")
    public Result courseUpdate(@RequestBody CourseEntity course) {
        return Result.success( service.update(course));
    }
    @PostMapping("/list-all")
    public Result courseListAll(@RequestParam(defaultValue = "1") int current,
                                 @RequestParam(defaultValue = "5") int size){

        List<CourseEntity> allTags=service.getAllCourse();

        if (allTags.isEmpty()) {
            return Result.success(new Page<>());
        }

        // 计算总记录数
        long total = allTags.size();

        // 计算起始索引和结束索引
        int start = (current - 1) * size;
        int end = Math.min(start + size, (int) total);

        // 截取分页后的数据
        List<CourseEntity> pageData = allTags.subList(Math.max(0, start), end);

        // 创建 IPage 对象并设置分页信息
        IPage<CourseEntity> page = new Page<>(current, size, total);
        page.setRecords(pageData);

        // 返回分页结果
        return Result.success(page);
    }
}