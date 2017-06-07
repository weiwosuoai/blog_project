package site.exception.portal.service.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import com.github.pagehelper.PageHelper;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import site.exception.common.model.Pagination;
import site.exception.common.utils.MarkdownUtil;
import site.exception.portal.dao.IArticleDao;
import site.exception.portal.dao.ITagDao;
import site.exception.portal.model.Article;
import site.exception.portal.model.vo.ArticleVo;
import site.exception.portal.service.IIndexService;

@Service("indexService")
public class IndexServiceImpl implements IIndexService {
	
	private static final Log logger = LogFactory.getLog(IndexServiceImpl.class);
	
	@Resource
	private IArticleDao articleDao;
	@Resource
	private ITagDao tagDao;

	public List<ArticleVo> findByPagination(Pagination<ArticleVo> pagination) {
		PageHelper.startPage(1, 3);
		List<Article> articles = articleDao.selectAll();
		
		List<ArticleVo> articlesVo = new ArrayList<>();
		for (Article article : articles) {

			String htmlStr;
			ArticleVo vo;
			try {
				vo = new ArticleVo();
				vo.setId(article.getId());
				vo.setTitle(article.getTitle());
				vo.setCreateTime(article.getCreateTime());
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
				vo.setCreateTimeStr(sdf.format(article.getCreateTime()));
				vo.setBeViewdNum(article.getBeViewdNum());
				// 缩略内容
				vo.setShortHtmlStr(MarkdownUtil.parse2ShortStr(article.getContent()));
				// 标签信息
				article.setCreateUserId(1);
				vo.setTags(tagDao.selectByArticleId(article));

				articlesVo.add(vo);
			} catch (Exception e) {
				logger.error(e);
			}
		}
		return articlesVo;
	}
}
