package site.exception.controller.front;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import site.exception.model.Article;
import site.exception.model.vo.ArticleVo;
import site.exception.service.IArticleService;

/**
 * 文章控制器
 * @author Allen
 *
 */
@Controller
@RequestMapping("/article")
public class ArticleController {
	
	private static final Log logger = LogFactory.getLog(ArticleController.class);
	
	@Resource
	private IArticleService articleService;
	
	/**
	 * 文章视图显示
	 * @param id 文章 id
	 * @param model
	 * @return
	 */
	@RequestMapping("/{id}")
	public String viewArticle(@PathVariable Integer id, Model model) {
		logger.info("viewArchive - " + id);
		ArticleVo articleVo = articleService.parseMarkdown(id);
		model.addAttribute("article", articleVo);
		return "article";
	}
	
	/**
	 * 获取文章 markdown 内容
	 * @param id 文章 id
	 * @return 文章 text 数据
	 */
	@ResponseBody
	@RequestMapping(value = "/{id}/md_content")
	public String getArticleMarkdownContent(@PathVariable Integer id) {
		logger.info("getArticleMarkdownContent");
		ArticleVo article = articleService.findArticleContentById(id);
		return article.getContent();
	}
	
	/**
	 * 更新文章 markdown 内容
	 * @param id 文章 id
	 * @return 文章 text 数据
	 */
	@ResponseBody
	@RequestMapping("/{id}/update_md_content")
	public String updateArticleMarkdownContent(@PathVariable Integer id, HttpServletRequest request) {
		logger.info("updateArticleMarkdownContent");
		articleService.updateArticleContent(id, request.getParameter("content"));
		return "success";
	} 
	
}
