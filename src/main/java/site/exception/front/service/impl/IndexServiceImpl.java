package site.exception.front.service.impl;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.github.rjeschke.txtmark.Processor;

import site.exception.common.model.Pagination;
import site.exception.front.dao.IArticleDao;
import site.exception.front.dao.ITagDao;
import site.exception.front.model.Article;
import site.exception.front.model.Tag;
import site.exception.front.model.vo.ArticleVo;
import site.exception.front.service.IIndexService;

@Service("indexService")
public class IndexServiceImpl implements IIndexService {
	
	private static final Log logger = LogFactory.getLog(IndexServiceImpl.class);
	
	@Resource
	private IArticleDao articleDao;
	@Resource
	private ITagDao tagDao;

	public List<ArticleVo> findByPagination(Pagination<ArticleVo> pagination) {
		List<Article> articles = articleDao.findByPagination(pagination);
		
		List<ArticleVo> articlesVo = new ArrayList<>();
		for (Article article : articles) {
			
			File mdFile = new File(article.getFilePath());
			
			String htmlStr;
			ArticleVo vo;
			try {
				// 解析 md 文件
				htmlStr = Processor.process(mdFile);
				
				vo = new ArticleVo();
				vo.setId(article.getId());
				vo.setTitle(article.getTitle());
				vo.setCategory(article.getCategory());
				vo.setCreateTime(article.getCreateTime());
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				vo.setCreateTimeStr(sdf.format(article.getCreateTime()));
				vo.setBeViewdNum(article.getBeViewdNum());
				// 组合标签信息
				String tagIds = article.getTagIds();
				if (!StringUtils.isEmpty(tagIds)) {
					List<Tag> htmlTagList = new ArrayList<Tag>();
					String[] tagIdArr = article.getTagIds().split(",");
					List<Tag> tagList = tagDao.getAll();
					for (String tagId : tagIdArr) {
						for (Tag tag : tagList) {
							if (String.valueOf(tag.getId()).equals(tagId)) {
								htmlTagList.add(tag);
							}
						}
					}
					vo.setTags(htmlTagList);
				}
				
				// 缩略内容
				vo.setShortHtmlStr(htmlStr.split("<!-- more -->")[0]);
				
				articlesVo.add(vo);
			} catch (IOException e) {
				logger.info(e);
			}
		}
		return articlesVo;
	}

}
