package site.exception.portal.dao;

import site.exception.portal.model.User;

public interface IUserDao {
	User selectByUser(User user);
	User selectByName(User user);
    int deleteByPrimaryKey(Integer id);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer id);
    

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
}