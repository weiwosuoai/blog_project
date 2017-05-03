package site.exception.portal.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 模态框内容
 * @CreatTime 2017年4月12日 下午12:17:16
 * @author Allen
 *
 */
@RequestMapping("/modal/content")
@Controller
public class ModalContentController {
	
	private static final Log logger = LogFactory.getLog(ModalContentController.class);
	
	/**
	 * 登录模态框内容
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String viewModalContentLogin(HttpServletRequest request) {
		return "modal-content-login";
	}
	

}
