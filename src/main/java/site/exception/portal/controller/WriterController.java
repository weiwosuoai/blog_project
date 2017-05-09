package site.exception.portal.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Markdown 在线编辑器
 */
@Controller
public class WriterController {
	
	@RequestMapping("/writer")
	public String viewWriter(Model model) {
		return "writer";
	}

}
