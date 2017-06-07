package site.exception.portal.controller;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.github.pagehelper.PageInfo;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import site.exception.common.model.MyHttpSession;
import site.exception.portal.model.User;
import site.exception.portal.service.IArticleService;
import site.exception.portal.service.IUserService;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 * 用户controller
 *
 * @author Allen
 * @CreatTime 2017年4月12日 下午12:17:16
 */
@Controller
public class UserController {

	private static final Log logger = LogFactory.getLog(UserController.class);

	@Resource
	private IUserService userService;
	@Resource
	private IArticleService articleService;

	/**
	 * 用户榜视图
	 *
	 * @return
	 */
	@RequestMapping(value = "/users", method = RequestMethod.GET)
	public String viewUsers(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
							@RequestParam(value = "pageSize", defaultValue = "36") int pageSize,
							@RequestParam(value = "search", defaultValue = "") String search,
							Model model) {
		model.addAttribute("navbarRef", "users");
		model.addAttribute("pageInfo", userService.findByPagination(pageNum, pageSize, search));
		model.addAttribute("search", search);
		return "user";
	}

	/**
	 * 用户榜视图
	 *
	 * @return
	 */
	@RequestMapping(value = "/users/{id}/detail", method = RequestMethod.GET)
	public String viewUsersDetail(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
								  @RequestParam(value = "pageSize", defaultValue = "10") int pageSize,
								  Model model) {
		model.addAttribute("navbarRef", "users");
		model.addAttribute("pageInfo", articleService.findByPagination(pageNum, pageSize));
		return "user-detail";
	}

	/**
	 * 用户登录视图
	 *
	 * @return
	 */
	@RequestMapping(value = "/users/login", method = RequestMethod.GET)
	public String viewLogin(Model model) {
		model.addAttribute("navbarRef", "users");
		return "user-login";
	}

	/**
	 * 用户注册视图
	 *
	 * @return
	 */
	@RequestMapping(value = "/users/signup", method = RequestMethod.GET)
	public String viewSignup(Model model) {
		model.addAttribute("navbarRef", "users");
		return "user-signup";
	}

	/**
	 * 登录
	 *
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/users/login", method = RequestMethod.POST)
	public Map<String, String> login(User user, HttpSession session) {
		user = userService.findByNameAndPassword(user);

		Map<String, String> map = new HashMap<>(1);
		if (user != null) {
			// 查询数据库，id 存入 session 中
			session.setAttribute(MyHttpSession.USER_ID, user.getId());
			map.put("success", "true");
			return map;
		}
		return map;
	}

}
