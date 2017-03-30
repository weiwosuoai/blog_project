package site.exception.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import site.exception.dao.IUserDao;
import site.exception.model.User;
import site.exception.service.IUserService;

@Service("userService")
public class UserServiceImpl implements IUserService {
	
	@Resource
	private IUserDao userDao;

	public User findById(int userId) {
		return null;
	}

	/**
	 * 根据用户名和密码查询用户是否存在
	 */
	public User findByNameAndPassword(User user) {
		return userDao.selectByUser(user);
	}

}
