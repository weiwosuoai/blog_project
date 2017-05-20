package site.exception.portal.dao;

import site.exception.portal.model.ArticleTagMapper;

import java.util.List;

public interface IArticleTagMapDao {
    int deleteByPrimaryKey(Integer id);

    int insert(ArticleTagMapper record);

    int insertSelective(ArticleTagMapper record);

    ArticleTagMapper selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ArticleTagMapper record);

    int updateByPrimaryKey(ArticleTagMapper record);
}