package site.exception.portal.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import site.exception.common.model.Pagination;
import site.exception.portal.model.vo.ArticleVo;
import site.exception.portal.service.IIndexService;

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
	
	private Pagination<ArticleVo> pagination = new Pagination<>(); 

	@Resource
	private IIndexService indexService;

	@RequestMapping("/index")
	public String viewIndex(HttpServletRequest request, Model model) {
		String ip = request.getRemoteAddr();
		logger.info("request ip ： " + ip);
		// 查询首页信息
		pagination.setPageSize(5);
		pagination.setCurrentPage(1);
		pagination.setOffset();
		
		model.addAttribute("articles", indexService.findByPagination(pagination));
		model.addAttribute("topNavType", 0);
		return "index";
	}
	
	@ResponseBody
	@RequestMapping(value = "/index/more", produces = "application/json", method = RequestMethod.GET)
	public List<ArticleVo> loadMore(HttpServletRequest request, Model model) {
		String pageSize = request.getParameter("pageSize");
		String currentPage = request.getParameter("currentPage");
		pagination.setPageSize(Integer.valueOf(pageSize));
		pagination.setCurrentPage(Integer.valueOf(currentPage));
		pagination.setOffset();
		
		List<ArticleVo> list = indexService.findByPagination(pagination);
		return list;
	}

}
