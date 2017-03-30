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
import site.exception.service.IArticleService;
import site.exception.service.ICategoryService;

/**
 * 分类
 * 
 * @CreatTime 2017年3月30日 下午5:29:05
 * @author Allen
 *
 */
@Controller
public class CategoryController {
	
	private static final Log logger = LogFactory
			.getLog(CategoryController.class);
	
	@Resource
	private ICategoryService categoryService;
	
	/**
	 * 获取分类信息
	 * @param model
	 * @param session
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/category", produces = "application/json", method = RequestMethod.GET)
	public List<Category> info(Model model, HttpSession session) {
		return categoryService.getByCreateUserId(1);
	}
	

}
