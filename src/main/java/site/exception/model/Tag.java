package site.exception.model;

import java.io.Serializable;
import java.util.Date;

/**
 * 标签
 * 
 * @CreatTime 2017年3月31日 下午12:08:32
 * @author Allen
 * 
 */
public class Tag implements Serializable {
	
	private static final long serialVersionUID = 2302669565940697228L;

	private Integer id;

	private String name;

	private Date createTime;

	private Date updateTime;

	private String remark;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name == null ? null : name.trim();
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark == null ? null : remark.trim();
	}
}