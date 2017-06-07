package site.exception.portal.service;

import java.util.List;


import com.github.pagehelper.PageInfo;
import site.exception.common.model.Pagination;
import site.exception.portal.model.Article;
import site.exception.portal.model.vo.ArticleVo;

public interface IArticleService {
	int save(ArticleVo vo, Integer userId);
	
	List<Article> findAll();
	
	List<Article> findByCategory(ArticleVo vo);
	
	List<Article> findByKey(String key);
	
	List<Article> getArticleListByTag(ArticleVo vo);

	PageInfo findByPagination(int pageNum, int pageSize);

	ArticleVo parseMarkdown(Integer id);
	
	List<ArticleVo> findArticleNumPerMonth();
	
	List<ArticleVo> findArticleByYearMonth(String year, String month);
	
	ArticleVo findArticleContentById(Integer id);
	
	void updateArticleContent(Integer id, String content);
	
	int delete(Integer id);
	
	int articleViewdIncrementById(Integer id);
}
