package site.exception.front.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import site.exception.front.dao.ICategoryDao;
import site.exception.front.model.Category;
import site.exception.front.model.vo.CategoryVo;
import site.exception.front.service.ICategoryService;

@Service("categoryService")
public class CategoryServiceImpl implements ICategoryService {
	
	private static final Log logger = LogFactory.getLog(CategoryServiceImpl.class);
	
	@Resource
	private ICategoryDao categoryDao;

	public List<CategoryVo> getArticleNumByCreateUserId(Integer id) {
		return categoryDao.getArticleNumByCreateUserId(id);
	}

	public List<Category> getByCreateUserId(Integer id) {
		return categoryDao.getByCreateUserId(id);
	}
	
}
