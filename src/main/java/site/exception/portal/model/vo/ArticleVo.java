package site.exception.portal.model.vo;

import java.io.Serializable;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import site.exception.portal.model.Article;
import site.exception.portal.model.Category;
import site.exception.portal.model.Tag;

public class ArticleVo extends Article implements Serializable {
	
	private static final long serialVersionUID = -8232083665413751738L;

	private List<MultipartFile> files;
	
	/**
	 * 文章格式化后 html 内容
	 */
	private String htmlStr;
	
	/**
	 * 首页文章缩略
	 */
	private String shortHtmlStr;
	
	/**
	 * 文章创建时间格式化
	 */
	private String createTimeStr;

	/**
	 * 文章所属年月
	 */
	private String yearMonth;

	/**
	 * 文章所属年
	 */
	private String year;

	/**
	 * 文章所属月
	 */
	private String month;

	/**
	 * 每个月发表文章数量
	 */
	private Integer nums;
	
	/**
	 * 文章内容
	 */
	private String content;
	
	/**
	 * 文章标签
	 */
	private List<Tag> tags;
	
	/**
	 * 文章标签(提交博客表单中的选中的 checkbox 值)
	 */
	private List<String> postTags;
	
	/**
	 * 用户是否登录
	 */
	private boolean isUserLogined;

	/**
	 * 上一篇文章
	 */
	private Article previousArticle;

	/**
	 * 下一篇文章
	 */
	private Article nextArticle;

	/**
	 * 文章所属分类
	 */
	private Category category;

	/**
	 * 标签id
	 */
	private Integer tagId;

	public Integer getTagId() {
		return tagId;
	}

	public void setTagId(Integer tagId) {
		this.tagId = tagId;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public List<MultipartFile> getFiles() {
		return files;
	}

	public void setFiles(List<MultipartFile> files) {
		this.files = files;
	}

	public String getHtmlStr() {
		return htmlStr;
	}

	public void setHtmlStr(String htmlStr) {
		this.htmlStr = htmlStr;
	}

	public String getShortHtmlStr() {
		return shortHtmlStr;
	}

	public void setShortHtmlStr(String shortHtmlStr) {
		this.shortHtmlStr = shortHtmlStr;
	}

	public Integer getNums() {
		return nums;
	}

	public void setNums(Integer nums) {
		this.nums = nums;
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public List<Tag> getTags() {
		return tags;
	}

	public void setTags(List<Tag> tags) {
		this.tags = tags;
	}

	public List<String> getPostTags() {
		return postTags;
	}

	public void setPostTags(List<String> postTags) {
		this.postTags = postTags;
	}

	public String getCreateTimeStr() {
		return createTimeStr;
	}

	public void setCreateTimeStr(String createTimeStr) {
		this.createTimeStr = createTimeStr;
	}

	public boolean isUserLogined() {
		return isUserLogined;
	}

	public void setUserLogined(boolean isUserLogined) {
		this.isUserLogined = isUserLogined;
	}

	public Article getPreviousArticle() {
		return previousArticle;
	}

	public void setPreviousArticle(Article previousArticle) {
		this.previousArticle = previousArticle;
	}

	public Article getNextArticle() {
		return nextArticle;
	}

	public String getYearMonth() {
		return yearMonth;
	}

	public void setYearMonth(String yearMonth) {
		this.yearMonth = yearMonth;
	}

	public void setNextArticle(Article nextArticle) {
		this.nextArticle = nextArticle;
	}
}
