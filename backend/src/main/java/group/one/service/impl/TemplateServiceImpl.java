package group.one.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import group.one.dao.LogicalPaperDAO;
import group.one.entity.LogicalPaperEntity;
import group.one.entity.PaperTemplateEntity;
import group.one.service.TemplateService;
import org.springframework.stereotype.Service;

@Service("TemplateService")
public class TemplateServiceImpl implements TemplateService {
    @Override
    public TemplateService browseTemplate(PaperTemplateEntity paperTemplateEntity) {
        return null;
    }
}
