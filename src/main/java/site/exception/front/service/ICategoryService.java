package site.exception.front.service;

import java.util.List;






import site.exception.front.model.Article;
import site.exception.front.model.Category;
import site.exception.front.model.vo.ArticleVo;
import site.exception.front.model.vo.CategoryVo;

public interface ICategoryService {
	
	List<CategoryVo> getArticleNumByCreateUserId(Integer id);

	List<Category> getByCreateUserId(Integer id);
	
}
