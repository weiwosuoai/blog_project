package site.exception.portal.model;

import java.io.Serializable;
import java.util.Date;

/**
 * 文章
 *
 * @author Allen
 */
public class Article implements Serializable {

    private static final long serialVersionUID = -8019752279471482643L;

    private Integer id;

    private String title;

    private Date createTime;

    private Date updateTime;

    private String remark;

    private Integer createUserId;

    private Integer beViewdNum;

    private String content;

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

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}