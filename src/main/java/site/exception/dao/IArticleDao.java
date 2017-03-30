package site.exception.dao;

import java.util.List;

import site.exception.model.Article;
import site.exception.model.vo.ArticleVo;

public interface IArticleDao {
	
    int deleteByPrimaryKey(Integer id);

    int insert(Article record);

    int insertSelective(Article record);

    Article selectByPrimaryKey(Integer id);
    
    List<Article> selectAll();
    
    List<Article> selectByCategory(Integer category);
    
    int updateByPrimaryKeySelective(Article record);

    int updateByPrimaryKey(Article record);
    
    List<ArticleVo> selectNumsPerMonth();
    
    List<ArticleVo> selectByYearMonth(String yearMonth);
    
    int articleViewdIncrementById(Integer id);
}