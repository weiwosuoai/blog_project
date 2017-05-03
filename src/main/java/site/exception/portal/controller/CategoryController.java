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

import site.exception.portal.model.Category;
import site.exception.portal.model.vo.CategoryVo;
import site.exception.portal.service.ICategoryService;

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
	 * 获取分类信息(包括分类中包含的文章信息)
	 * 
	 * @param model
	 * @param session
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/category_article_num", produces = "application/json", method = RequestMethod.GET)
	public List<CategoryVo> articleNumInfo(Model model) {
		logger.info("articleNumInfo");
		return categoryService.getArticleNumByCreateUserId(1);
	}
	
	/**
	 * 获取分类信息  TODO 未来添加缓存
	 * 
	 * @param model
	 * @param session
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/category", produces = "application/json", method = RequestMethod.GET)
	public List<Category> info(Model model) {
		logger.info("info");
		return categoryService.getByCreateUserId(1);
	}

}
