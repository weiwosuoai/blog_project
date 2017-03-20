package site.exception.service;

import site.exception.model.User;

public interface IUserService {
	
	User findById(int userId);
	
	User findByNameAndPassword(User user);
}
