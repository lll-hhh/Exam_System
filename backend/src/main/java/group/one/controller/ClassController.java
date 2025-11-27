package group.one.controller;


import com.baomidou.mybatisplus.core.metadata.IPage;
import group.one.entity.ClassEntity;
import group.one.service.ClassService;
import group.one.utils.Result;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;


@Slf4j
@RestController
@RequestMapping("/class")
public class ClassController {

    @Autowired
    private ClassService classService;

    @PostMapping("/add")
    public Result<?> addClass(@RequestBody ClassEntity clas) {
        boolean response = classService.addClass(clas);
        if (response) {
            return Result.success("Class added successfully.");
        } else {
            return Result.error("Failed to add class.Please try later.");
        }
    }

    @PostMapping("/delete")
    public Result<?> deleteClass(@RequestBody ClassEntity clas) {
        ClassEntity deletedClass = classService.deleteClass(clas);
        if (deletedClass != null) {
            return Result.success(deletedClass);
        } else {
            return Result.error("Failed to delete class.Please try later.");
        }
    }

    @PostMapping("/search")
    public Result<?> getClass(@RequestBody ClassEntity clas) {
        ClassEntity searchedClass = classService.getClassInformation(clas);
        if (searchedClass != null) {return Result.success(searchedClass);}
        else {return Result.error("Failed to search class.Please try later.");}
    }

    @PostMapping("/get-all")
    public Result<?> getAllClasses(@RequestBody ClassEntity clas,
                                   @RequestParam(defaultValue = "1", required = false) int pageNum,
                                   @RequestParam(defaultValue = "5", required = false) int pageSize){
        IPage<ClassEntity> allClasses = classService.getAllClasses(clas, pageNum, pageSize);
        if (allClasses != null) {return Result.success(allClasses);}
        else {return Result.error("No class data exists.");}
    }

    @PostMapping("/update")
    public Result<?> updateClass(@RequestBody ClassEntity clas) {
        boolean response = classService.updateClass(clas);
        if (response) {
            return Result.success("Class updated successfully.");
        } else {
            return Result.error(500,"Failed to update class.Please try later.");
        }
    }
}
