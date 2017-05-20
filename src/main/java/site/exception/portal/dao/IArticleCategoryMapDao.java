package site.exception.portal.dao;

import site.exception.portal.model.ArticleCategoryMap;
import site.exception.portal.model.vo.ArticleCategoryMapVo;

public interface IArticleCategoryMapDao {
    int deleteByPrimaryKey(Integer id);

    int insert(ArticleCategoryMap record);

    int insertSelective(ArticleCategoryMap record);

    ArticleCategoryMap selectByPrimaryKey(Integer id);

    ArticleCategoryMapVo selectByArticleId(Integer id);

    int updateByPrimaryKeySelective(ArticleCategoryMap record);

    int updateByPrimaryKey(ArticleCategoryMap record);
}