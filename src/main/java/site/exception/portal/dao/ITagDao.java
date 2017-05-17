package site.exception.portal.dao;

import java.util.List;

import site.exception.portal.model.Article;
import site.exception.portal.model.Tag;

public interface ITagDao {
    int deleteByPrimaryKey(Integer id);

    int insert(Tag record);

    int insertSelective(Tag record);

    Tag selectByPrimaryKey(Integer id);
    List<Tag> selectByArticleId(Article article);

    int updateByPrimaryKeySelective(Tag record);

    int updateByPrimaryKey(Tag record);
    
    List<Tag> getAllTagsByUserId(Integer id);

    List<Tag> getAll();
}