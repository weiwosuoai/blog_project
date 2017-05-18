package site.exception.portal.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
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

	@Resource
	private IPersonDao personDao;
	@Resource
	private IScoreDao scoreDao;
	@Resource
	private IClassRoomDao classRoomDao;
	@Resource
	private IBookDao bookDao;

	@RequestMapping("/questions")
	public String viewAbout(Model model) {
		model.addAttribute("topNavType", 4);
		return "questions";
	}

	// TODO 待删除
	/**
	 * 获取所有的个人信息
	 *
	 * @return 文章 Json 数据
	 */
	@ResponseBody
	@RequestMapping(value ="/persons", produces = "application/json", method = RequestMethod.GET)
	public List<Person> getAllPersons() {
		return personDao.selectAll();
	}

	@ResponseBody
	@RequestMapping(value ="/persons/{id}", produces = "application/json", method = RequestMethod.GET)
	public Person getAllPersons(@PathVariable Integer id) {
		return personDao.selectByPrimaryKey(id);
	}

	@ResponseBody
	@RequestMapping(value ="/scores/{id}", produces = "application/json", method = RequestMethod.GET)
	public List<Score> getScoreByBelongToId(@PathVariable String id) {
		return scoreDao.selectByBelongToId(id);
	}

	@ResponseBody
	@RequestMapping(value ="/classrooms", produces = "application/json", method = RequestMethod.GET)
	public List<ClassRoom> getAllClassRooms() {
		return classRoomDao.selectAll();
	}

	@ResponseBody
	@RequestMapping(value ="/books", produces = "application/json", method = RequestMethod.GET)
	public List<Book> getBooksByType(HttpServletRequest request) {
		String type = request.getParameter("type");
		if (!StringUtils.isEmpty(type)) {
			return bookDao.selectByType(Integer.valueOf(type));
		}
		return null;
	}

	@ResponseBody
	@RequestMapping(value ="/books/{id}", produces = "application/json", method = RequestMethod.GET)
	public List<Book> getBooksByType(@PathVariable String id, HttpServletRequest request) {
		String type = request.getParameter("type");
		if (!StringUtils.isEmpty(type)) {
			Book book = new Book();
			book.setBelongToId(id);
			book.setType(Integer.valueOf(type));
			return bookDao.selectByBelongToIdAndType(book);
		}
		return null;
	}

}
