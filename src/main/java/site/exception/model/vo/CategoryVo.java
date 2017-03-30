package site.exception.model.vo;

import site.exception.model.Category;

public class CategoryVo extends Category {

	/**
	 * 分类发表文章数量
	 */
	private Integer nums;

	public Integer getNums() {
		return nums;
	}

	public void setNums(Integer nums) {
		this.nums = nums;
	}

}
