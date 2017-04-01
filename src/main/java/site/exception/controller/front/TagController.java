package site.exception.controller.front;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import site.exception.model.Category;
import site.exception.model.Tag;
import site.exception.model.vo.CategoryVo;
import site.exception.service.IArticleService;
import site.exception.service.ICategoryService;
import site.exception.service.ITagService;

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
	 * 获取分类信息 TODO 未来添加缓存
	 * 
	 * @param model
	 * @param session
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/tags", produces = "application/json", method = RequestMethod.GET)
	public List<Tag> list(Model model) {
		logger.info("list");
		return tagService.getAll();
	}

}
