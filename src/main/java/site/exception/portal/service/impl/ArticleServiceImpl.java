package site.exception.portal.service.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.annotation.Resource;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import com.github.rjeschke.txtmark.Processor;

import site.exception.common.model.Pagination;
import site.exception.portal.dao.IArticleCategoryMapDao;
import site.exception.portal.dao.IArticleDao;
import site.exception.portal.dao.IArticleTagMapDao;
import site.exception.portal.dao.ITagDao;
import site.exception.portal.model.*;
import site.exception.portal.model.vo.ArticleCategoryMapVo;
import site.exception.portal.model.vo.ArticleVo;
import site.exception.portal.service.IArticleService;
import site.exception.common.utils.MarkdownUtil;

@Service("articleService")
public class ArticleServiceImpl implements IArticleService {

	private static final Log logger = LogFactory.getLog(ArticleServiceImpl.class);

	@Resource
	private IArticleDao articleDao;
	@Resource
	private ITagDao tagDao;
	@Resource
	private IArticleTagMapDao articleTagMapperDao;
	@Resource
	private IArticleCategoryMapDao articleCategoryMapperDao;

	@Override
	public PageInfo findByPagination(int pageNum, int pageSize) {
		PageHelper.startPage(pageNum, pageSize);
		List<Article> articles = articleDao.selectAll();

		// 用 PageInfo 对结果进行包装
		PageInfo<ArticleVo> pageInfo = new PageInfo(articles);

		List<ArticleVo> articleVoList = new ArrayList<>();
		for (Article article : articles) {

			String htmlStr;
			ArticleVo vo;
			try {
				vo = new ArticleVo();
				vo.setId(article.getId());
				vo.setTitle(article.getTitle());
				vo.setCreateTime(article.getCreateTime());
				vo.setCreateUserId(article.getCreateUserId());
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
				vo.setCreateTimeStr(sdf.format(article.getCreateTime()));
				vo.setBeViewdNum(article.getBeViewdNum());

				// 提取 markdown 中第一张图片
//				Pattern pattern = Pattern.compile("\\]\\((.*?(?<=png|gif|jpg))");
				Pattern pattern = Pattern.compile("\\]\\:.*?(?<=png|gif|jpg)");
				Matcher matcher = pattern.matcher(article.getContent());
				if (matcher.find()) {
					vo.setFirstImg(matcher.group(0).substring(2));
				}
				// 缩略内容
				vo.setShortHtmlStr(MarkdownUtil.parse2ShortStr(article.getContent()));
				// 标签信息
				article.setCreateUserId(1);
				vo.setTags(tagDao.selectByArticleId(article));

				articleVoList.add(vo);
			} catch (Exception e) {
				logger.error(e);
			}
		}

		pageInfo.setList(articleVoList);
		return pageInfo;
	}

	/**
	 * 上传文章保存
	 */
	@Override
	public int save(ArticleVo vo, Integer userId) {
		try {
			// TODO 待添加事务
			// 1.添加文章记录
			Article article = new Article();
			article.setTitle(vo.getTitle());
			article.setCreateUserId(userId);
			article.setContent(vo.getContent());

			articleDao.insert(article);

			// 2.添加文章和分类的映射记录
			ArticleCategoryMap mapperAc = new ArticleCategoryMap();
			mapperAc.setArticleId(article.getId());
			mapperAc.setCategoryId(vo.getCategory().getId());
			articleCategoryMapperDao.insert(mapperAc);

			// 3.添加文章和标签的映射记录
			ArticleTagMapper mapperAt = new ArticleTagMapper();
			for (String tagId : vo.getPostTags()) {
				mapperAt.setArticleId(article.getId());
				mapperAt.setTagId(Integer.valueOf(tagId));
				articleTagMapperDao.insert(mapperAt);
			}
			return 1;
		} catch (Exception e) {
			logger.error(e);
		}
		return 0;
	}

	/**
	 * 所有文章列表
	 */
	@Override
	public List<Article> findAll() {
		return articleDao.selectAll();
	}

	/**
	 * 根据文章 id 查找文章内容
	 */
	@Override
	public ArticleVo findArticleContentById(Integer id) {
//		Article article = articleDao.selectByPrimaryKey(id);
//
//		File file = new File(article.getFilePath());
//
//		// 先判断文件是否存在
//		if (file.exists()) {
//			try {
//				String mdContent = FileUtil.readFile(article.getFilePath());
//
//				ArticleVo vo = new ArticleVo();
//				vo.setContent(mdContent);
//
//				return vo;
//			} catch (Exception e) {
//				logger.info(e);
//			}
//
//		}
		return null;
	}

	/**
	 * 更新 md 文章内容
	 */
	@Override
	public void updateArticleContent(Integer id, String htmlStr) {
		Article article = articleDao.selectByPrimaryKey(id);
		try {
			String mdStr = MarkdownUtil.htmlStr2MarkdownStr(htmlStr);
//			FileUtil.writeString2File(article.getFilePath(), mdStr);
		} catch (Exception e) {
			logger.error(e);
		}
	}

	/**
	 * markdown 文件解析
	 */
	@Override
	public ArticleVo parseMarkdown(Integer id) {
		List<Article> articleList = articleDao.selectAdjacencyByPrimaryKey(id);

		Article article = articleList.get(0);

		if (article == null)
			return null;

		String htmlStr;
		ArticleVo vo;
		try {
			// 解析 md 文件
			htmlStr = Processor.process(article.getContent());

			vo = new ArticleVo();
			vo.setId(article.getId());
			vo.setTitle(article.getTitle());
			vo.setCreateUserId(article.getCreateUserId());

			// 分类信息
			ArticleCategoryMapVo mapper = articleCategoryMapperDao.selectByArticleId(article.getId());
			Category category = new Category();
			category.setId(mapper.getCategoryId());
			category.setName(mapper.getName());
			vo.setCategory(category);

			vo.setCreateTime(article.getCreateTime());
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			vo.setCreateTimeStr(sdf.format(article.getCreateTime()));
			vo.setHtmlStr(htmlStr);
			vo.setBeViewdNum(article.getBeViewdNum());
			// 标签信息
			vo.setTags(tagDao.selectByArticleId(article));

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
		} catch (Exception e) {
			logger.error(e);
		}
		return null;
	}

	/**
	 * 删除文章
	 */
	@Override
	public int delete(Integer id) {
		// 删除记录
		return articleDao.deleteByPrimaryKey(id);
	}

	/**
	 * 相应所属文章列表(根据分类)
	 */
	@Override
	public List<Article> findByCategory(ArticleVo vo) {
		return articleDao.selectByCategory(vo);
	}

	/**
	 * 根据检索的关键字模糊查询
	 */
	@Override
	public List<Article> findByKey(String key) {
		return articleDao.getByKey(key);
	}

	/**
	 * 相应所属文章列表(根据标签)
	 */
	@Override
	public List<Article> getArticleListByTag(ArticleVo vo) {
		return articleDao.getArticleListByTag(vo);
	}



	/**
	 * 查询每个月发表文章的数量
	 */
	@Override
	public List<ArticleVo> findArticleNumPerMonth() {
		List<ArticleVo> list = articleDao.selectNumsPerMonth();
		// 提取年月字符串信息
		for (ArticleVo vo : list) {
			String yearMonth = vo.getYearMonth();
			vo.setYear(yearMonth.substring(0, 4));
			vo.setMonth(yearMonth.substring(5, 7));
		}
		return list;
	}

	/**
	 * 根据年月查询具体的文章信息
	 */
	@Override
	public List<ArticleVo> findArticleByYearMonth(String year, String month) {
		return articleDao.selectByYearMonth(year + month);
	}

	/**
	 * 文章浏览数增加
	 */
	@Override
	public int articleViewdIncrementById(Integer id) {
		return articleDao.articleViewdIncrementById(id);
	}

}
