package group.one.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import group.one.dao.ClassDAO;
import group.one.entity.ClassEntity;
import group.one.service.ClassService;
import org.springframework.stereotype.Service;

@Service("classService")
public class ClassServiceImpl extends ServiceImpl<ClassDAO, ClassEntity>
        implements ClassService {
    @Override
    public boolean addClass(ClassEntity clas) {
        if(this.getClassInformation(clas)!= null){
            return false;
        }
        return baseMapper.insert(clas) > 0;
    }

    @Override
    public ClassEntity deleteClass(ClassEntity clas){
        ClassEntity deletedClass = this.getClassInformation(clas);
        if(deletedClass != null){
            removeById(deletedClass.getId());
        }
        return deletedClass;
    }

    @Override
    public ClassEntity getClassInformation(ClassEntity clas){
        LambdaQueryWrapper<ClassEntity> query = Wrappers.lambdaQuery();
        boolean hasConditions = false;

        if (clas.getClassName() != null){
            query.or().eq(ClassEntity::getClassName,clas.getClassName());
            hasConditions = true;
        } else if (clas.getId() != null) {
            query.or().eq(ClassEntity::getId, clas.getId());
            hasConditions = true;
        }

        if (!hasConditions) {
            return null;
        }
        return this.getOne(query);
    }

    @Override
    public IPage<ClassEntity> getAllClasses(ClassEntity clas,int pageNum,int pageSize){
        LambdaQueryWrapper<ClassEntity> query = Wrappers.lambdaQuery();
        if(clas!=null&&clas.getClassName()!=null){
            query.like(ClassEntity::getClassName,clas.getClassName());
        }
        Page<ClassEntity> page = new Page<>(pageNum,pageSize);
        return  baseMapper.selectPage(page, query);
    }

    @Override
    public boolean updateClass(ClassEntity clas){
        ClassEntity targetClass = this.getClassInformation(clas);
        if(targetClass == null){
            return false;
        }
        clas.setId(targetClass.getId());
        return updateById(clas);
    }

}