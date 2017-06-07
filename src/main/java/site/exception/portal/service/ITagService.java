package site.exception.portal.service;

import java.util.List;


import site.exception.portal.model.Tag;

public interface ITagService {
	
	List<Tag> getAllTagsByUserId(Integer id);
	List<Tag> getAll();

}
