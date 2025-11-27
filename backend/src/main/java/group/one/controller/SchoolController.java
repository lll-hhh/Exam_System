package group.one.controller;


import com.baomidou.mybatisplus.core.metadata.IPage;
import group.one.entity.SchoolEntity;
import group.one.service.SchoolService;
import group.one.service.impl.UserServiceImpl;
import group.one.utils.Result;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;


@Slf4j
@RestController
@RequestMapping("/school")
public class SchoolController {

    @Autowired
    private SchoolService schoolService;

    @PostMapping("/add")
    public Result<?> addSchool( @RequestBody SchoolEntity school) {
        boolean response = schoolService.addSchool(school);
        if (response) {
            return Result.success("School added successfully.");
        } else {
            return Result.error("Failed to add school.Please try later.");
        }
    }

    @PostMapping("/delete")
    public Result<?> deleteSchool(@RequestBody SchoolEntity school) {
        SchoolEntity deletedSchool = schoolService.deleteSchool(school);
        if (deletedSchool != null) {
            return Result.success(deletedSchool);
        } else {
            return Result.error("Failed to delete school.Please try later.");
        }
    }

    @PostMapping("/search")
    public Result<?> getSchoolById(@RequestBody SchoolEntity school) {
        SchoolEntity searchedSchool = schoolService.getSchoolInformation(school);
        if (searchedSchool != null) {return Result.success(searchedSchool);}
        else {return Result.error("Failed to search school.Please try later.");}
    }

    @PostMapping("/get-all")
    public Result<?> getAllSchools(@RequestBody SchoolEntity school,
                                   @RequestParam(defaultValue = "1", required = false) int pageNum,
                                   @RequestParam(defaultValue = "5", required = false) int pageSize){
        IPage<SchoolEntity> allSchools = schoolService.getAllSchools(school, pageNum, pageSize);
        if (allSchools != null) {return Result.success(allSchools);}
        else {return Result.error("No school data exists.");}
    }

    @PostMapping("/update")
    public Result<?> updateSchool(@RequestBody SchoolEntity school) {
        boolean response = schoolService.updateSchool(school);
        if (response) {
            return Result.success("School updated successfully.");
        } else {
            return Result.error("Failed to update school.Please try later.");
        }
    }
}
