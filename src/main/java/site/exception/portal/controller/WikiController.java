package site.exception.portal.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 标签
 * 
 * @CreatTime 2017年4月1日 下午2:32:26
 * @author Allen
 * 
 */
@Controller
public class WikiController {

	private static final Log logger = LogFactory.getLog(WikiController.class);

	/**
	 * wiki视图
	 *
	 * @return
	 */
	@RequestMapping(value = "/wiki", method = RequestMethod.GET)
	public String viewUsers(Model model) {
		model.addAttribute("topNavType", 3);
		return "wiki";
	}

}
