package group.one.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import group.one.entity.TagEntity;
import group.one.service.TagService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import group.one.utils.Result;

import java.util.List;
import java.util.Map;

@Slf4j
@RestController
@RequestMapping("/tag")
public class TagController {
    @Autowired
    private TagService service;

    @PostMapping("/select")
    public Result tagSelect(@RequestBody Map<String, Object> params) {
        return Result.success(service.select(params));
    }
    @PostMapping("/insert")
    public Result tagInsert(@RequestBody TagEntity tag) {
        return Result.success(service.insert(tag));
    }
    @PostMapping("/delete")
    public Result tagDelete(@RequestBody TagEntity tag) {
        return Result.success( service.delete(tag));
    }
    @PostMapping("/update")
    public Result tagUpdate(@RequestBody TagEntity tag) {
        return  Result.success(service.update(tag));
    }
    @PostMapping("/list-all")
    public Result tagListAll(@RequestParam(defaultValue = "1") int current,
                             @RequestParam(defaultValue = "5") int size){

        List<TagEntity> allTags=service.getAllTags();

        if (allTags.isEmpty()) {
            return Result.success(new Page<>());
        }

        // 计算总记录数
        long total = allTags.size();

        // 计算起始索引和结束索引
        int start = (current - 1) * size;
        int end = Math.min(start + size, (int) total);

        // 截取分页后的数据
        List<TagEntity> pageData = allTags.subList(Math.max(0, start), end);

        // 创建 IPage 对象并设置分页信息
        IPage<TagEntity> page = new Page<>(current, size, total);
        page.setRecords(pageData);

        // 返回分页结果
        return Result.success(page);
    }
}