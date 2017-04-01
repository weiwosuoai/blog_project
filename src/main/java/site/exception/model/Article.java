package site.exception.model;

import java.io.Serializable;
import java.util.Date;

/**
 * 文章
 * 
 * @author Allen
 * 
 */
public class Article implements Serializable {

	private static final long serialVersionUID = -8019752279471482643L;

	private Integer id;

	private String title;

	private Integer category;

	private String fileName;

	private String filePath;

	private Date createTime;

	private Date updateTime;

	private String remark;

	private Integer createUserId;

	private Integer beViewdNum;
	
	private String tagIds;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title == null ? null : title.trim();
	}

	public Integer getCategory() {
		return category;
	}

	public void setCategory(Integer category) {
		this.category = category;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName == null ? null : fileName.trim();
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath == null ? null : filePath.trim();
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

	public Integer getCreateUserId() {
		return createUserId;
	}

	public void setCreateUserId(Integer createUserId) {
		this.createUserId = createUserId;
	}

	public Integer getBeViewdNum() {
		return beViewdNum;
	}

	public void setBeViewdNum(Integer beViewdNum) {
		this.beViewdNum = beViewdNum;
	}

	public String getTagIds() {
		return tagIds;
	}

	public void setTagIds(String tagIds) {
		this.tagIds = tagIds;
	}

}