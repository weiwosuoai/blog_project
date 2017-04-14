package site.exception.controller.front;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import site.exception.model.vo.ArticleVo;
import site.exception.model.vo.SearchVo;
import site.exception.service.IArticleService;

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
		model.addAttribute("topNavType", 1);
		return "archive";
	}

	/**
	 * 获取 java web 文章的目录信息
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping("/archive/javaweb")
	public String viewJavaWebArchive(Model model) {
		logger.info("viewJavaWebArchive");
		model.addAttribute("articles", articleService.findByCategory(1));
		model.addAttribute("topNavType", 2);
		return "archive";
	}

	/**
	 * 获取 android 文章的目录信息
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping("/archive/android")
	public String viewAndroidArchive(Model model) {
		logger.info("viewAndroidArchive");
		model.addAttribute("articles", articleService.findByCategory(2));
		model.addAttribute("topNavType", 3);
		return "archive";
	}

	/**
	 * 根据月份显示文章目录
	 * 
	 * @param model
	 * @return 文章 Json 数据
	 */
	@ResponseBody
	@RequestMapping(value = "/archive/monthInfo", produces = "application/json")
	public List<ArticleVo> articleMonthInfo() {
		logger.info("articleMonthInfo");
		List<ArticleVo> articles = articleService.findArticleNumPerMonth();
		return articles;
	}

	/**
	 * 根据年月份显示具体的文章目录
	 * 
	 * @param yearMonth
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/archive/{yearMonth}")
	public String viewMonthArchive(@PathVariable String yearMonth, Model model) {
		logger.info("viewMonthArchive - " + yearMonth);
		model.addAttribute("articles",
				articleService.findArticleByYearMonth(yearMonth));
		model.addAttribute("topNavType", 1);
		return "archive";
	}

	/**
	 * 根据所属分类获取文章的目录信息
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping("/archive/category/{id}")
	public String viewArchiveByCategory(@PathVariable Integer id, Model model) {
		logger.info("viewAndroidArchive");
		model.addAttribute("articles", articleService.findByCategory(id));
		model.addAttribute("topNavType", 1);
		return "archive";
	}

	/**
	 * 根据标签获取文章的目录信息
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping("/archive/tag/{id}")
	public String viewArchiveByTag(@PathVariable Integer id, Model model) {
		logger.info("viewArchiveByTag");
		model.addAttribute("articles", articleService.getByTag(id));
		model.addAttribute("topNavType", 1);
		return "archive";
	}

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
