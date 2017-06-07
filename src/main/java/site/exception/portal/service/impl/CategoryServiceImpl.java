package site.exception.portal.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import site.exception.portal.dao.IArticleCategoryMapDao;
import site.exception.portal.dao.ICategoryDao;
import site.exception.portal.model.Category;
import site.exception.portal.model.vo.CategoryVo;
import site.exception.portal.service.ICategoryService;

@Service("categoryService")
public class CategoryServiceImpl implements ICategoryService {
	
	private static final Log logger = LogFactory.getLog(CategoryServiceImpl.class);
	
	@Resource
	private ICategoryDao categoryDao;
	@Resource
	private IArticleCategoryMapDao articleCategoryMapperDao;

	public List<CategoryVo> getArticleNumByCreateUserId(Integer id) {

		return categoryDao.getArticleNumByCreateUserId(id);
	}

	public List<Category> getByCreateUserId(Integer id) {
		return categoryDao.getByCreateUserId(id);
	}
	
}
