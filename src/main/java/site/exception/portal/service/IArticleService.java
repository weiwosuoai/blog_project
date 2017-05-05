package site.exception.portal.service;

import java.util.List;




import site.exception.portal.model.Article;
import site.exception.portal.model.vo.ArticleVo;

public interface IArticleService {
	int save(ArticleVo vo, Integer userId);
	
	List<Article> findAll();
	
	List<Article> findByCategory(Integer category);
	
	List<Article> findByKey(String key);
	
	List<Article> getByTag(Integer tagId);
	
	ArticleVo parseMarkdown(Integer id);
	
	List<ArticleVo> findArticleNumPerMonth();
	
	List<ArticleVo> findArticleByYearMonth(String yearMonth);
	
	ArticleVo findArticleContentById(Integer id);
	
	void updateArticleContent(Integer id, String content);
	
	int delete(Integer id);
	
	int articleViewdIncrementById(Integer id);
}
