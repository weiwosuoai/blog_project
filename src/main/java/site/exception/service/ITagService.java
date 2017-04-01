package site.exception.service;

import java.util.List;





import site.exception.model.Article;
import site.exception.model.Category;
import site.exception.model.Tag;
import site.exception.model.vo.ArticleVo;
import site.exception.model.vo.CategoryVo;

public interface ITagService {
	
	List<Tag> getAll();
	
}
