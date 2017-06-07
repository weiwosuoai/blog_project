package site.exception.portal.service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageInfo;
import site.exception.portal.model.User;

public interface IUserService {
	
	User findById(int userId);
	PageInfo findByPagination(int pageNum, int pageSize, String search);

	User findByNameAndPassword(User user);
	User findByName(User user);


}
