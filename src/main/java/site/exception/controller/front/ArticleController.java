package site.exception.controller.front;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import site.exception.model.Article;
import site.exception.model.vo.ArticleVo;
import site.exception.service.IArticleService;

/**
 * 文章详情页
 * @author Allen
 *
 */
@Controller
@RequestMapping("/article")
public class ArticleController {
	
	private static final Log logger = LogFactory.getLog(ArticleController.class);
	
	@Resource
	private IArticleService articleService;
	
	@RequestMapping("/{id}")
	public String viewArticle(@PathVariable Integer id, Model model) {
		logger.info("viewArchive - " + id);
		ArticleVo articleVo = articleService.parseMarkdown(id);
		model.addAttribute("article", articleVo);
		return "article";
	}
	
	@ResponseBody
	@RequestMapping(value = "/numByMonth", produces = "application/json")
	public List<ArticleVo> articleNumInfoByMonth(Model model) {
		logger.info("articleNumInfoByMonth");
		List<ArticleVo> articles = articleService.findArticleNumPerMonth();
		model.addAttribute("articles", articles);
		return articles;
	}
	
}
