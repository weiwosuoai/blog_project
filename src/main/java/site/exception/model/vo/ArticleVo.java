package site.exception.model.vo;

import java.io.Serializable;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import site.exception.model.Article;
import site.exception.model.Tag;

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
	 * 文章所属年月
	 */
	private String yearMonth;
	
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

	public String getYearMonth() {
		return yearMonth;
	}

	public void setYearMonth(String yearMonth) {
		this.yearMonth = yearMonth;
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

}
