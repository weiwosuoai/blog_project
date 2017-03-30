package site.exception.service;

import java.util.List;




import site.exception.model.Article;
import site.exception.model.Category;
import site.exception.model.vo.ArticleVo;
import site.exception.model.vo.CategoryVo;

public interface ICategoryService {
	
	List<CategoryVo> getByCreateUserId(Integer id);
	
}
