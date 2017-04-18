package site.exception.front.service;

import site.exception.front.model.User;

public interface IUserService {
	
	User findById(int userId);
	
	User findByNameAndPassword(User user);
}
