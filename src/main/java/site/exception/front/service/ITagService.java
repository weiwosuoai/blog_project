package site.exception.front.service;

import java.util.List;







import site.exception.front.model.Article;
import site.exception.front.model.Category;
import site.exception.front.model.Tag;
import site.exception.front.model.vo.ArticleVo;
import site.exception.front.model.vo.CategoryVo;

public interface ITagService {
	
	List<Tag> getAll();
	
}
