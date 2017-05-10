package site.exception.portal.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import site.exception.portal.model.vo.ArticleVo;
import site.exception.portal.service.IArticleService;

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
        logger.info("updateArticleMarkdownContent");
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
    @RequestMapping(value = "/articles/{id}", method = RequestMethod.DELETE)
    public String deleteArticle(@PathVariable Integer id) {
        logger.info("deleteArticle");
        articleService.delete(id);
        return "redirect:/index";
    }

    /**
     * 文章浏览数增加
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "/articles/{id}/viewd_increment")
    public void articleViewdIncrement(@PathVariable Integer id) {
        logger.info("articleViewdIncrement");
        articleService.articleViewdIncrementById(id);
    }

}
