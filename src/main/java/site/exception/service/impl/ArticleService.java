package site.exception.service.impl;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.github.rjeschke.txtmark.Processor;

import site.exception.dao.IArticleDao;
import site.exception.model.Article;
import site.exception.model.vo.ArticleVo;
import site.exception.service.IArticleService;

@Service("articleService")
public class ArticleService implements IArticleService {
	
	private static final Log logger = LogFactory.getLog(ArticleService.class);
	
	@Resource
	private IArticleDao articleDao;

	/**
	 * 上传文章保存
	 */
	public int save(ArticleVo vo, Integer userId) {
		MultipartFile multipartFile = vo.getFiles().get(0);
		
		String fileName = multipartFile.getOriginalFilename();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		String fileDir = File.separator + "opt" + File.separator 
				+ "mds" + File.separator + userId + File.separator + sdf.format(new Date());
		
		File dir = new File(fileDir);
		if (!dir.exists()) {
			dir.mkdirs();
		}
		
		File mdFile = new File(fileDir, fileName);

		try {
			multipartFile.transferTo(mdFile);
		} catch (Exception e) {
			logger.info(e.getMessage());
		}
		
		Article article = new Article();
		article.setTitle(vo.getTitle());
		article.setCategory(vo.getCategory());
		article.setCreateTime(vo.getCreateTime());
		article.setUpdateTime(vo.getCreateTime());
		article.setFileName(fileName);
		article.setFilePath(fileDir + File.separator + fileName);
		article.setCreateUserId(userId);
		
		return articleDao.insert(article);
	}

	/**
	 * 所有文章列表
	 */
	public List<Article> findAll() {
		return articleDao.selectAll();
	}

	/**
	 * markdown 文件解析
	 */
	public ArticleVo parseMarkdown(Integer id) {
		Article article = articleDao.selectByPrimaryKey(id);
		
		File mdFile = new File(article.getFilePath());
		
		String htmlStr;
		ArticleVo vo;
		try {
			// 解析 md 文件
			htmlStr = Processor.process(mdFile);
			
			vo = new ArticleVo();
			vo.setTitle(article.getTitle());
			vo.setCategory(article.getCategory());
			vo.setCreateTime(article.getCreateTime());
			vo.setHtmlStr(htmlStr);
			
			return vo;
		} catch (IOException e) {
			logger.info(e.getMessage());
		}
		return null;
	}

	
	/**
	 * 相应所属文章列表
	 */
	public List<Article> findByCategory(Integer category) {
		return articleDao.selectByCategory(category);
	}

	/**
	 * 查询每个月发表文章的数量
	 */
	public List<ArticleVo> findArticleNumPerMonth() {
		return articleDao.selectNumsPerMonth();
	}
	
	/**
	 * 根据年月查询具体的文章信息
	 */
	public List<ArticleVo> findArticleByYearMonth(String yearMonth) {
		return articleDao.selectByYearMonth(yearMonth);
	}
	
}
