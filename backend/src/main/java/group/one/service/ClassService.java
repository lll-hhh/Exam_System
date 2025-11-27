package group.one.service;


import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import group.one.entity.ClassEntity;


public interface ClassService extends IService<ClassEntity> {
    boolean addClass(ClassEntity clas);

    ClassEntity deleteClass(ClassEntity clas);

    ClassEntity getClassInformation(ClassEntity clas);

    IPage<ClassEntity> getAllClasses(ClassEntity clas,int pageNum,int pageSize);

    boolean updateClass(ClassEntity clas);
}