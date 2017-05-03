package site.exception.portal.dao;

import java.util.List;

import site.exception.portal.model.Category;
import site.exception.portal.model.vo.CategoryVo;

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