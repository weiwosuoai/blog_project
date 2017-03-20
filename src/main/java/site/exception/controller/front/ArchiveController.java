package site.exception.controller.front;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import site.exception.service.IArticleService;

/**
 * 归档页
 * @author Allen
 *
 */
@Controller
@RequestMapping("/archive")
public class ArchiveController {
	
	private static final Log logger = LogFactory.getLog(ArchiveController.class);
	
	@Resource
	private IArticleService articleService;
	
	@RequestMapping("/all")
	public String viewArchive(Model model) {
		logger.info("viewArchive");
		model.addAttribute("articles", articleService.findAll());
		model.addAttribute("topNavType", 1);
		return "archive";
	}
	
	@RequestMapping("/javaweb")
	public String viewJavaWebArchive(Model model) {
		logger.info("viewJavaArchive");
		model.addAttribute("articles", articleService.findByCategory(1));
		model.addAttribute("topNavType", 2);
		return "archive";
	}
	
	@RequestMapping("/android")
	public String viewAndroidArchive(Model model) {
		logger.info("viewAndroidArchive");
		model.addAttribute("articles", articleService.findByCategory(2));
		model.addAttribute("topNavType", 3);
		return "archive";
	}
	
	@RequestMapping(value = "/{yearMonth}")
	public String viewMonthArchive(@PathVariable String yearMonth, Model model) {
		logger.info("viewMonthArchive - " + yearMonth);
		model.addAttribute("articles", articleService.findArticleByYearMonth(yearMonth));
		model.addAttribute("topNavType", 1);
		return "archive";
	}

}
