package site.exception.front.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import site.exception.front.dao.ICategoryDao;
import site.exception.front.dao.ITagDao;
import site.exception.front.model.Category;
import site.exception.front.model.Tag;
import site.exception.front.model.vo.CategoryVo;
import site.exception.front.service.ICategoryService;
import site.exception.front.service.ITagService;

@Service("tagService")
public class TagServiceImpl implements ITagService {
	
	private static final Log logger = LogFactory.getLog(TagServiceImpl.class);
	
	@Resource
	private ITagDao tagDao;

	public List<Tag> getAll() {
		return tagDao.getAll();
	}

}
