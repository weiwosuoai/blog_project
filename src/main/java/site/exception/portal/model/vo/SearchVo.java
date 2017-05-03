package site.exception.portal.model.vo;

import java.io.Serializable;

public class SearchVo implements Serializable {
	
	private static final long serialVersionUID = -3434963634918104112L;

	/**
	 * 检索关键字
	 */
	private String q;

	public String getQ() {
		return q;
	}

	public void setQ(String q) {
		this.q = q;
	}
}
