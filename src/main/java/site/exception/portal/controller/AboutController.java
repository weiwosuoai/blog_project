package site.exception.portal.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 关于
 * @author Allen
 *
 */
@Controller
public class AboutController {
	
	@RequestMapping("/about")
	public String viewAbout(Model model) {
		model.addAttribute("topNavType", 4);
		return "about";
	}

}
