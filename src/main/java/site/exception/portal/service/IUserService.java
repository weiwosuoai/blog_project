package site.exception.portal.service;

import site.exception.portal.model.User;

public interface IUserService {
	
	User findById(int userId);
	
	User findByNameAndPassword(User user);
	User findByName(User user);


}
