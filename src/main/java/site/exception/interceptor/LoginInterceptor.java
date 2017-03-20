package site.exception.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

/**
 * 登录拦截器(验证用户是否登录)
 * @author Allen
 *
 */
public class LoginInterceptor implements HandlerInterceptor {

	public void afterCompletion(HttpServletRequest arg0,
			HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
	}

	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1,
			Object arg2, ModelAndView arg3) throws Exception {
	}

	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
			Object obj) throws Exception {

		String requestURI = request.getRequestURI();
		
		// 若访问登录界面，直接返回 true
		if (requestURI.contains("login")) {
			return true;
		}
		
		HttpSession session = request.getSession();
		Integer userId = (Integer) session.getAttribute("userid");
		if (userId != null) {
			return true;
		}
		
		// 用户还未登录,转发到登录页面
		request.getRequestDispatcher("/sys/login_view").forward(request, response);
		return false;
	}
	
}
