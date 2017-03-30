package site.exception.service;

import java.util.List;



import site.exception.model.Article;
import site.exception.model.Category;
import site.exception.model.vo.ArticleVo;

public interface ICategoryService {
	
	List<Category> getByCreateUserId(Integer id);
	
}
