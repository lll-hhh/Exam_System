package group.one.service;


import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import group.one.entity.SchoolEntity;


public interface SchoolService extends IService<SchoolEntity> {
    boolean addSchool(SchoolEntity school);

    SchoolEntity deleteSchool(SchoolEntity school);

    SchoolEntity getSchoolInformation(SchoolEntity school);

    IPage<SchoolEntity> getAllSchools(SchoolEntity school, int pageNum, int pageSize);

    boolean updateSchool(SchoolEntity school);
}