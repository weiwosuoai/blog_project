package site.exception.portal.controller;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import site.exception.portal.model.Tag;
import site.exception.portal.service.ITagService;

/**
 * 标签
 * 
 * @CreatTime 2017年4月1日 下午2:32:26
 * @author Allen
 * 
 */
@Controller
public class TagController {

	private static final Log logger = LogFactory.getLog(TagController.class);

	@Resource
	private ITagService tagService;

	/**
	 * 获取分类信息
	 *
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/tags", produces = "application/json", method = RequestMethod.GET)
	public List<Tag> getAllTagsJson() {
		return tagService.getAll();
	}

}
