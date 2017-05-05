package site.exception.portal.dao;

import java.util.List;

import site.exception.common.model.Pagination;
import site.exception.portal.model.Article;
import site.exception.portal.model.vo.ArticleVo;

public interface IArticleDao {
	
    int deleteByPrimaryKey(Integer id);

    int insert(Article record);

    int insertSelective(Article record);

    Article selectByPrimaryKey(Integer id);

	/**
	 * 根据给定 id, 查询相邻记录
     * @param id
     * @return
     */
    List<Article> selectAdjacencyByPrimaryKey(Integer id);

    List<Article> selectAll();
    
    List<Article> selectByCategory(Integer category);
    
    List<Article> getByKey(String key);
    
    int updateByPrimaryKeySelective(Article record);

    int updateByPrimaryKey(Article record);
    
    List<ArticleVo> selectNumsPerMonth();
    
    List<ArticleVo> selectByYearMonth(String yearMonth);
    
    int articleViewdIncrementById(Integer id);

	List<Article> getByTag(Integer tagId);

	List<Article> findByPagination(Pagination<ArticleVo> pagination);
}