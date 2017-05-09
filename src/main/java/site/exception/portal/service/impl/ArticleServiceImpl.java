package site.exception.portal.service.impl;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import com.github.rjeschke.txtmark.Processor;

import site.exception.portal.dao.IArticleDao;
import site.exception.portal.dao.ITagDao;
import site.exception.portal.model.Article;
import site.exception.portal.model.Tag;
import site.exception.portal.model.vo.ArticleVo;
import site.exception.portal.service.IArticleService;
import site.exception.common.utils.FileUtil;
import site.exception.common.utils.MarkdownUtil;

@Service("articleService")
public class ArticleServiceImpl implements IArticleService {
	
	private static final Log logger = LogFactory.getLog(ArticleServiceImpl.class);
	
	@Resource
	private IArticleDao articleDao;
	@Resource
	private ITagDao tagDao;

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
//		article.setCreateTime(new Date());
		article.setUpdateTime(new Date());
		article.setFileName(fileName);
		article.setFilePath(fileDir + File.separator + fileName);
		article.setCreateUserId(userId);
		
		// 标签相关
		StringBuilder sb = new StringBuilder();
		for (String tagId : vo.getPostTags()) {
			sb.append(",").append(tagId);
		}
		article.setTagIds(sb.toString().substring(1));
		
		return articleDao.insert(article);
	}

	/**
	 * 所有文章列表
	 */
	public List<Article> findAll() {
		return articleDao.selectAll();
	}

	/**
	 * 根据文章 id 查找文章内容
	 */
	public ArticleVo findArticleContentById(Integer id) {
		Article article = articleDao.selectByPrimaryKey(id);
		
		File file = new File(article.getFilePath());
		
		// 先判断文件是否存在
		if (file.exists()) {
			try {
				String mdContent = FileUtil.readFile(article.getFilePath());
				
				ArticleVo vo = new ArticleVo();
				vo.setContent(mdContent);
				
				return vo;
			} catch (Exception e) {
				logger.info(e);
			}
			
		}
		return null;
	}

	/**
	 * 更新 md 文章内容
	 */
	public void updateArticleContent(Integer id, String htmlStr) {
		Article article = articleDao.selectByPrimaryKey(id);
		try {
			String mdStr = MarkdownUtil.htmlStr2MarkdownStr(htmlStr);
			FileUtil.writeString2File(article.getFilePath(), mdStr);
		} catch (Exception e) {
			logger.error(e);
		}
	}

	/**
	 * markdown 文件解析
	 */
	public ArticleVo parseMarkdown(Integer id) {
		List<Article> articleList = articleDao.selectAdjacencyByPrimaryKey(id);

		Article article = articleList.get(0);
		if (article == null)
			return null;

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
			vo.setHtmlStr(htmlStr);
			vo.setBeViewdNum(article.getBeViewdNum());
			// 组合标签信息
			String tagIds = article.getTagIds();
			if (!StringUtils.isEmpty(tagIds)) {
				List<Tag> htmlTagList = new ArrayList<>();
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

			// 上一篇，下一篇文章信息
			if (articleList.size() > 1) { // 存在有上下篇文章的情况
				if (articleList.size() == 2) {
					if (articleList.get(1).getId() < article.getId()) { // 存在上一篇
						vo.setPreviousArticle(articleList.get(1));
					} else { // 存在下一篇
						vo.setNextArticle(articleList.get(1));
					}
				} else if (articleList.size() == 3) { // 同时存在上下篇文章
					vo.setPreviousArticle(articleList.get(1));
					vo.setNextArticle(articleList.get(2));
				}
			}

			return vo;
		} catch (IOException e) {
			logger.error(e);
		}
		return null;
	}

	/**
	 * 删除文章
	 */
	public int delete(Integer id) {
		// 1.先删除文件
		Article article = articleDao.selectByPrimaryKey(id);
		
		File file = new File(article.getFilePath());
		// TODO 目前只是删除 md 文件，若该父文件夹中只存在此 md 文件，则父文件夹一并删除
		if (file.exists()) {
			file.delete();
		}
		// 2.删除记录
		return articleDao.deleteByPrimaryKey(id);
	}

	/**
	 * 相应所属文章列表(根据分类)
	 */
	public List<Article> findByCategory(Integer category) {
		return articleDao.selectByCategory(category);
	}

	/**
	 * 根据检索的关键字模糊查询
	 */
	public List<Article> findByKey(String key) {
		return articleDao.getByKey(key);
	}

	/**
	 * 相应所属文章列表(根据标签)
	 */
	public List<Article> getByTag(Integer tagId) {
		return articleDao.getByTag(tagId);
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

	/**
	 * 文章浏览数增加
	 */
	public int articleViewdIncrementById(Integer id) {
		return articleDao.articleViewdIncrementById(id);
	}
	
}
