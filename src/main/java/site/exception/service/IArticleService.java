package site.exception.service;

import java.util.List;


import site.exception.model.Article;
import site.exception.model.vo.ArticleVo;

public interface IArticleService {
	/**
	 * 保存文章
	 * @param article
	 * @return
	 */
	int save(ArticleVo vo, Integer userId);
	
	List<Article> findAll();
	
	List<Article> findByCategory(Integer category);
	
	ArticleVo parseMarkdown(Integer id);
	
	List<ArticleVo> findArticleNumPerMonth();
	
	List<ArticleVo> findArticleByYearMonth(String yearMonth);
	
	ArticleVo findArticleContentById(Integer id);
	
	void updateArticleContent(Integer id, String content);
	
	int delete(Integer id);
	
	int articleViewdIncrementById(Integer id);
}
