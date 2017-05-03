package site.exception.portal.service;

import java.util.List;


import site.exception.portal.model.Category;
import site.exception.portal.model.vo.CategoryVo;

public interface ICategoryService {
	
	List<CategoryVo> getArticleNumByCreateUserId(Integer id);

	List<Category> getByCreateUserId(Integer id);
	
}
