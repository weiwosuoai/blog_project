package site.exception.portal.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.omg.CORBA.Object;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import site.exception.common.model.MyHttpRequestUri;
import site.exception.common.model.MyHttpSession;
import site.exception.portal.model.User;
import site.exception.portal.service.IUserService;

/**
 * 用户controller
 *
 * @author Allen
 * @CreatTime 2017年4月12日 下午12:17:16
 */
@RequestMapping("/users")
@Controller
public class UserController {

	private static final Log logger = LogFactory.getLog(UserController.class);

	@Resource
	private IUserService userService;
	/**
	 * 用户登录视图
	 *
	 * @return
	 */
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String viewLogin() {
		return "modal-content-login"; // 登录模态框视图
	}

	/**
	 * 登录
	 *
	 * @return
	 */
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(User user, HttpSession session) {
		user = userService.findByNameAndPassword(user);
		if (user != null) {
			// 查询数据库，id 存入 session 中
			session.setAttribute(MyHttpSession.USER_ID, user.getId());
		}

		// 重定向到首页
		return "redirect:/index";
	}

//	/**
//	 * 用户登录视图
//	 *
//	 * @return
//	 */
//	@RequestMapping(value = "/write", method = RequestMethod.GET)
//	public String viewWrite(HttpServletRequest request, HttpSession session) {
//		// 先判断用户是否登录
//		Integer userId = (Integer) session.getAttribute(MyHttpSession.USER_ID);
//		if (userId == null) {
//			return "modal-content-login";
//		}
//		return "redirect:/writer";
//	}


}
