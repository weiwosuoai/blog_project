package site.exception.front.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import site.exception.front.dao.IUserDao;
import site.exception.front.model.User;
import site.exception.front.service.IUserService;

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
