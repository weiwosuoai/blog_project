package site.exception.controller.front;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import site.exception.service.IIndexService;

/**
 * 首页
 * @author Allen
 *
 */
@Controller
public class IndexController {
	
	private static final Log logger = LogFactory.getLog(IndexController.class);
	
	@Resource
	private IIndexService indexService;
	
	@RequestMapping("/index")
	public String viewIndex(HttpServletRequest request, Model model) {
		String ip = request.getRemoteAddr();
		logger.info("request ip ： " + ip);
		// 查询首页信息
		model.addAttribute("articles", indexService.findIndexInfo());
		model.addAttribute("topNavType", 0);
		return "index";
	}
	

}
