package site.exception.front.dao;

import java.util.List;

import site.exception.front.model.Category;
import site.exception.front.model.vo.CategoryVo;

public interface ICategoryDao {
    int deleteByPrimaryKey(Integer id);

    int insert(Category record);

    int insertSelective(Category record);

    Category selectByPrimaryKey(Integer id);
    
    List<CategoryVo> getArticleNumByCreateUserId(Integer id);
    
    List<Category> getByCreateUserId(Integer id);

    int updateByPrimaryKeySelective(Category record);

    int updateByPrimaryKey(Category record);
}