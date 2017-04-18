package site.exception.front.dao;

import java.util.List;

import site.exception.front.model.Category;
import site.exception.front.model.Tag;

public interface ITagDao {
    int deleteByPrimaryKey(Integer id);

    int insert(Tag record);

    int insertSelective(Tag record);

    Tag selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Tag record);

    int updateByPrimaryKey(Tag record);
    
    List<Tag> getAll();
}