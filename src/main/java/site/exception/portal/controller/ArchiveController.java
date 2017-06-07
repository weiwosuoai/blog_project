package site.exception.portal.controller;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import site.exception.portal.model.Article;
import site.exception.portal.model.vo.ArticleVo;
import site.exception.portal.model.vo.SearchVo;
import site.exception.portal.service.IArticleService;

/**
 * 文章目录控制器
 * 
 * @author Allen
 * 
 */
@Controller
public class ArchiveController {

	private static final Log logger = LogFactory
			.getLog(ArchiveController.class);

	@Resource
	private IArticleService articleService;

	/**
	 * 获取所有文章的目录信息
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping("/archive/all")
	public String viewArchive(Model model) {
		logger.info("viewArchive");
		model.addAttribute("articles", articleService.findAll());
		model.addAttribute("navbarRef", "all");
		return "archive";
	}

//	/**
//	 * 获取 java web 文章的目录信息
//	 *
//	 * @param model
//	 * @return
//	 */
//	@RequestMapping("/archive/javaweb")
//	public String viewJavaWebArchive(Model model) {
//		logger.info("viewJavaWebArchive");
//		model.addAttribute("articles", articleService.findByCategory(1));
//		model.addAttribute("topNavType", 2);
//		return "archive";
//	}

//	/**
//	 * 获取 android 文章的目录信息
//	 *
//	 * @param model
//	 * @return
//	 */
//	@RequestMapping("/archive/android")
//	public String viewAndroidArchive(Model model) {
//		logger.info("viewAndroidArchive");
//		model.addAttribute("articles", articleService.findByCategory(2));
//		model.addAttribute("topNavType", 3);
//		return "archive";
//	}


	/**
	 * 根据搜索的关键字获取文章的目录信息
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping("/archive")
	public String viewArchiveByKey(SearchVo search, Model model) {
		logger.info("viewArchiveByKey");
		model.addAttribute("articles", articleService.findByKey(search.getQ()));
		model.addAttribute("topNavType", 1);
		return "archive";
	}

}
