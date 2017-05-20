package site.exception.portal.model.vo;

import site.exception.portal.model.ArticleCategoryMap;

import java.io.Serializable;

public class ArticleCategoryMapVo extends ArticleCategoryMap implements Serializable {

	private static final long serialVersionUID = -7659034113261867893L;
	/**
	 * 分类名
	 */
	private String name;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
}
