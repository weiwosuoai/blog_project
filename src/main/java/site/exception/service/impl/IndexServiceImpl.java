package site.exception.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import com.github.rjeschke.txtmark.Processor;

import site.exception.dao.IArticleDao;
import site.exception.model.Article;
import site.exception.model.vo.ArticleVo;
import site.exception.service.IIndexService;

@Service("indexService")
public class IndexServiceImpl implements IIndexService {
	
	private static final Log logger = LogFactory.getLog(IndexServiceImpl.class);
	
	@Resource
	private IArticleDao articleDao;

	public List<ArticleVo> findIndexInfo() {
		List<Article> articles = articleDao.selectAll();
		
		List<ArticleVo> articlesVo = new ArrayList<ArticleVo>();
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
				vo.setBeViewdNum(article.getBeViewdNum());
				
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
