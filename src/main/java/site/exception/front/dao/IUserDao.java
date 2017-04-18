package site.exception.front.dao;

import site.exception.front.model.User;

public interface IUserDao {
	User selectByUser(User user);
    int deleteByPrimaryKey(Integer id);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer id);
    

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
}