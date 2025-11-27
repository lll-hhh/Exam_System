package group.one.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import group.one.dao.SchoolDAO;
import group.one.entity.SchoolEntity;
import group.one.service.SchoolService;
import org.springframework.stereotype.Service;

@Service("schoolService")
public class SchoolServiceImpl extends ServiceImpl<SchoolDAO, SchoolEntity>
        implements SchoolService {

    @Override
    public boolean addSchool(SchoolEntity school) {
        if(this.getSchoolInformation(school)!= null){
            return false;
        }
        return baseMapper.insert(school) > 0;
    }

    @Override
    public SchoolEntity deleteSchool(SchoolEntity school){
        SchoolEntity deletedSchool = this.getSchoolInformation(school);
        if(deletedSchool != null){
            removeById(deletedSchool.getId());
        }
        return deletedSchool;
    }

    @Override
    public SchoolEntity getSchoolInformation(SchoolEntity school){
        LambdaQueryWrapper<SchoolEntity> query = Wrappers.lambdaQuery();
        boolean hasConditions = false;

        if (school.getSchoolName() != null){
            query.or().eq(SchoolEntity::getSchoolName,school.getSchoolName());
            hasConditions = true;
        } else if (school.getId() != null) {
            query.or().eq(SchoolEntity::getId,school.getId());
            hasConditions = true;
        }

        if (!hasConditions) {
            return null;
        }
        return this.getOne(query);
    }

    @Override
    public IPage<SchoolEntity> getAllSchools(SchoolEntity school, int pageNum, int pageSize){
        LambdaQueryWrapper<SchoolEntity> query = Wrappers.lambdaQuery();
        if( school!=null && school.getSchoolName()!=null){
            query.like(SchoolEntity::getSchoolName,school.getSchoolName());
        }
        Page<SchoolEntity> page = new Page<>(pageNum, pageSize);
        return baseMapper.selectPage(page, query);
    }

    @Override
    public boolean updateSchool(SchoolEntity school){
        SchoolEntity targetSchool = this.getSchoolInformation(school);
        if(targetSchool == null){
            return false;
        }
        school.setId(targetSchool.getId());
        return updateById(school);
    }

}