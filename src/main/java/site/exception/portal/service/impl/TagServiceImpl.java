package site.exception.portal.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import site.exception.portal.dao.ITagDao;
import site.exception.portal.model.Tag;
import site.exception.portal.service.ITagService;

@Service("tagService")
public class TagServiceImpl implements ITagService {
	
	private static final Log logger = LogFactory.getLog(TagServiceImpl.class);
	
	@Resource
	private ITagDao tagDao;

	public List<Tag> getAll() {
		return tagDao.getAll();
	}

}
