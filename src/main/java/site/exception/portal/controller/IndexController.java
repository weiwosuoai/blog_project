package site.exception.portal.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import com.github.pagehelper.PageInfo;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.bind.annotation.RequestParam;
import site.exception.common.model.Pagination;
import site.exception.portal.model.Article;
import site.exception.portal.model.vo.ArticleVo;
import site.exception.portal.service.IArticleService;
import site.exception.portal.service.IIndexService;
import site.exception.portal.service.ITagService;

/**
 * 首页
 * 
 * @CreatTime 2017年4月13日 下午12:21:39
 * @author Allen
 *
 */
@Controller
public class IndexController {

	private static final Log logger = LogFactory.getLog(IndexController.class);
	
	@Resource
	private IIndexService indexService;
	@Resource
	private IArticleService articleService;

	/**
	 * 首页信息
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String viewIndex(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
							@RequestParam(value = "pageSize", defaultValue = "10") int pageSize,
							Model model) {
		model.addAttribute("pageInfo", articleService.findByPagination(pageNum, pageSize));
		model.addAttribute("navbarRef", "blogs");
		return "index";
	}

}
