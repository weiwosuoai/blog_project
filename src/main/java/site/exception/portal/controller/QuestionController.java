package site.exception.portal.controller;

import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import site.exception.portal.dao.*;
import site.exception.portal.model.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * 关于
 * @author Allen
 *
 */
@Controller
public class QuestionController {

	@RequestMapping("/questions")
	public String viewAbout(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
							@RequestParam(value = "pageSize", defaultValue = "20") int pageSize,
							Model model) {
		model.addAttribute("navbarRef", "questions");
		PageInfo pageInfo = new PageInfo();
		pageInfo.setPageNum(pageNum);
		pageInfo.setPageSize(pageSize);
		pageInfo.setTotal(200);
		model.addAttribute("pageInfo", pageInfo);
		return "question";
	}

}
