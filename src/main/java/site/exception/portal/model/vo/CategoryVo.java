package site.exception.portal.model.vo;

import java.io.Serializable;

import site.exception.portal.model.Category;

public class CategoryVo extends Category implements Serializable {

	private static final long serialVersionUID = 4045499859248810672L;
	/**
	 * 分类发表文章数量
	 */
	private Integer num;

	public Integer getNum() {
		return num;
	}

	public void setNum(Integer num) {
		this.num = num;
	}
}
