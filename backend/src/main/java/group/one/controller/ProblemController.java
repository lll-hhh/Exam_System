package group.one.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import group.one.entity.ProblemEntity;
import group.one.service.ProblemService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import group.one.utils.Result;

import java.util.List;
import java.util.Map;

@Slf4j
@RestController
@RequestMapping("/problem")
public class ProblemController {
    @Autowired
    private ProblemService service;

    @PostMapping("/select")
    public Result problemSelect(@RequestBody Map<String, Object> params) {
        return Result.success(service.select(params));
    }
    @PostMapping("/insert-one")
    public Result problemInsertOne(@RequestBody ProblemEntity problem) {
        return Result.success(service.insertOne(problem));
    }
    @PostMapping("/insert-file")
    public Result problemInsertFile(@RequestParam("file") MultipartFile file){
        return service.insertFile(file);
    }
    @PostMapping("/delete")
    public Result problemDelete(@RequestBody ProblemEntity problem) {
        return Result.success(service.delete(problem));
    }
    @PostMapping("/update")
    public Result problemUpdate(@RequestBody ProblemEntity problem) {
        return  Result.success(service.update(problem));
    }
    @PostMapping("/list-all")
    public Result problemListAll(@RequestParam(defaultValue = "1") int current,
                             @RequestParam(defaultValue = "5") int size){

        List<ProblemEntity> allTags=service.getAllProblems();

        if (allTags.isEmpty()) {
            return Result.success(new Page<>());
        }

        // 计算总记录数
        long total = allTags.size();

        // 计算起始索引和结束索引
        int start = (current - 1) * size;
        int end = Math.min(start + size, (int) total);

        // 截取分页后的数据
        List<ProblemEntity> pageData = allTags.subList(Math.max(0, start), end);

        // 创建 IPage 对象并设置分页信息
        IPage<ProblemEntity> page = new Page<>(current, size, total);
        page.setRecords(pageData);

        // 返回分页结果
        return Result.success(page);
    }
}