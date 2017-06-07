package site.exception.portal.service.impl;

import javax.annotation.Resource;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Service;

import site.exception.portal.dao.IUserDao;
import site.exception.portal.model.User;
import site.exception.portal.service.IUserService;

import java.util.List;

@Service("userService")
public class UserServiceImpl implements IUserService {
	
	@Resource
	private IUserDao userDao;

	public User findById(int userId) {
		return null;
	}

	@Override
	public PageInfo findByPagination(int pageNum, int pageSize, String search) {
		PageHelper.startPage(pageNum, pageSize);
		User user = new User();
		user.setName(search);
		List<User> users = userDao.selectAll(user);
		// 用 PageInfo 对结果进行包装
		PageInfo<User> pageInfo = new PageInfo(users);
		return pageInfo;
	}

	/**
	 * 根据用户名和密码查询用户是否存在
	 */
	public User findByNameAndPassword(User user) {
		return userDao.selectByUser(user);
	}

	@Override
	public User findByName(User user) {
		return userDao.selectByName(user);
	}
}
