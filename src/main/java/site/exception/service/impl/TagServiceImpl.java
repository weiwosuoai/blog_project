package site.exception.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import site.exception.dao.ICategoryDao;
import site.exception.dao.ITagDao;
import site.exception.model.Category;
import site.exception.model.Tag;
import site.exception.model.vo.CategoryVo;
import site.exception.service.ICategoryService;
import site.exception.service.ITagService;

@Service("tagService")
public class TagServiceImpl implements ITagService {
	
	private static final Log logger = LogFactory.getLog(TagServiceImpl.class);
	
	@Resource
	private ITagDao tagDao;

	public List<Tag> getAll() {
		return tagDao.getAll();
	}

}
