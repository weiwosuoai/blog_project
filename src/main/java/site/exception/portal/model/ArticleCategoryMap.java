package site.exception.portal.model;

import java.io.Serializable;

public class ArticleCategoryMap implements Serializable {
	private static final long serialVersionUID = 925462147249756491L;
	private Integer id;

	private Integer articleId;

	private Integer categoryId;

	public ArticleCategoryMap() {
		super();
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getArticleId() {
		return articleId;
	}

	public void setArticleId(Integer articleId) {
		this.articleId = articleId;
	}

	public Integer getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}
}