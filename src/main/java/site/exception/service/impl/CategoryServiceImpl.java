package site.exception.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import site.exception.dao.ICategoryDao;
import site.exception.model.Category;
import site.exception.model.vo.CategoryVo;
import site.exception.service.ICategoryService;

@Service("categoryService")
public class CategoryServiceImpl implements ICategoryService {
	
	private static final Log logger = LogFactory.getLog(CategoryServiceImpl.class);
	
	@Resource
	private ICategoryDao categoryDao;

	public List<CategoryVo> getByCreateUserId(Integer id) {
		return categoryDao.getByCreateUserId(id);
	}

	
}
