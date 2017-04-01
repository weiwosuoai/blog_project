package site.exception.dao;

import java.util.List;

import site.exception.model.Category;
import site.exception.model.Tag;

public interface ITagDao {
    int deleteByPrimaryKey(Integer id);

    int insert(Tag record);

    int insertSelective(Tag record);

    Tag selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Tag record);

    int updateByPrimaryKey(Tag record);
    
    List<Tag> getAll();
}