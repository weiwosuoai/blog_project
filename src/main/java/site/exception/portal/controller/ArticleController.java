package site.exception.portal.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.github.pagehelper.PageInfo;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import site.exception.common.model.Pagination;
import site.exception.portal.model.Article;
import site.exception.portal.model.Category;
import site.exception.portal.model.Tag;
import site.exception.portal.model.vo.ArticleVo;
import site.exception.portal.model.vo.CategoryVo;
import site.exception.portal.service.IArticleService;
import site.exception.portal.service.ICategoryService;
import site.exception.portal.service.ITagService;

import java.util.List;

/**
 * 文章控制器
 *
 * @author Allen
 */
@Controller
public class ArticleController {

    private static final Log logger = LogFactory
            .getLog(ArticleController.class);

    @Resource
    private IArticleService articleService;
    @Resource
    private ICategoryService categoryService;
    @Resource
    private ITagService tagService;

	/**
     * 文章目录
     * @param pageSize
     * @param model
     * @return
     */
    @RequestMapping(value = "/articles", method = RequestMethod.GET)
    public String viewIndex(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
                            @RequestParam(value = "pageSize", defaultValue = "10") int pageSize,
                            Model model) {
        model.addAttribute("pageInfo", articleService.findByPagination(pageNum, pageSize));
        model.addAttribute("navbarRef", "blogs");
        return "index";
    }

    /**
     * 文章视图显示
     *
     * @param id    文章 id
     * @param model
     * @return
     */
    @RequestMapping(value = "/articles/{id}", method = RequestMethod.GET)
    public String viewArticle(@PathVariable Integer id, Model model) {
        logger.info("viewArchive - " + id);
        ArticleVo articleVo = articleService.parseMarkdown(id);
        model.addAttribute("article", articleVo);
        model.addAttribute("navbarRef", "blogs");
        return "article";
    }

    /**
     * 添加一篇博文
     * @param vo
	 */
    @RequestMapping(value = "/articles", method = RequestMethod.POST)
    public String saveArticle(@ModelAttribute ArticleVo vo, HttpSession session) {
        articleService.save(vo, (Integer) session.getAttribute("userid"));
        return "redirect:index";
    }

    /**
     * 获取某年某月内的所有文章
     */
    @ResponseBody
    @RequestMapping(value = "/articles/month", method = RequestMethod.GET)
    public List<ArticleVo> getArticlesNumJsonByYearMonth() {
        return articleService.findArticleNumPerMonth();
    }

    /**
     * 根据年月份显示具体的文章目录
     *
     * @param model
     * @return
     */
    @RequestMapping(value = "/articles/{year}/{month}")
    public String viewMonthArchive(@PathVariable String year,@PathVariable String month, Model model) {
        model.addAttribute("articles",
                articleService.findArticleByYearMonth(year, month));
        return "archive";
    }

    /**
     * 获取分类信息(包括分类中包含的文章信息)
     *
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/articles/category/num", produces = "application/json", method = RequestMethod.GET)
    public List<CategoryVo> getArticlesCategoryNum() {
        return categoryService.getArticleNumByCreateUserId(1);
    }

    /**
     * 根据所属分类获取文章的目录信息
     *
     * @param model
     * @return
     */
    @RequestMapping("/articles/category/{id}")
    public String viewArticleArchiveByCategory(@PathVariable Integer id, Model model) {
        ArticleVo vo = new ArticleVo();
        vo.setCreateUserId(1);
        Category category = new Category();
        category.setId(id);
        vo.setCategory(category);
        model.addAttribute("articles", articleService.findByCategory(vo));
        model.addAttribute("topNavType", 1);
        return "archive";
    }
    /**
     * 获取标签信息
     *
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/articles/tags", produces = "application/json", method = RequestMethod.GET)
    public List<Tag> getTagsByUserId() {
        return tagService.getAllTagsByUserId(1);
    }

    /**
     * 根据标签获取文章的目录信息
     *
     * @param model
     * @return
     */
    @RequestMapping("/articles/tags/{tagId}")
    public String viewArchiveByTag(@PathVariable Integer tagId, Model model) {
        ArticleVo vo = new ArticleVo();
        vo.setTagId(tagId);
        vo.setCreateUserId(1);
        model.addAttribute("articles", articleService.getArticleListByTag(vo));
        model.addAttribute("topNavType", 1);
        return "archive";
    }

    /**
     * 获取文章 markdown 内容
     *
     * @param id 文章 id
     * @return 文章 text 数据
     */
    @ResponseBody
    @RequestMapping(value = "/articles/{id}/md_content")
    public String getArticleMarkdownContent(@PathVariable Integer id) {
        logger.info("getArticleMarkdownContent");
        ArticleVo article = articleService.findArticleContentById(id);
        return article.getContent();
    }

    /**
     * 更新文章 markdown 内容
     *
     * @param id 文章 id
     * @return 文章 text 数据
     */
    @ResponseBody
    @RequestMapping("/articles/{id}/update_md_content")
    public String updateArticleMarkdownContent(@PathVariable Integer id,
                                               HttpServletRequest request) {
        articleService
                .updateArticleContent(id, request.getParameter("content"));
        return "success";
    }

    /**
     * 删除文章
     *
     * @param id
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/articles/{id}", method = RequestMethod.DELETE)
    public String deleteArticle(@PathVariable Integer id) {
        articleService.delete(id);
        return "success";
    }

    /**
     * 文章浏览数增加
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "/articles/{id}/viewd_increment")
    public void articleViewdIncrement(@PathVariable Integer id) {
        articleService.articleViewdIncrementById(id);
    }

}
