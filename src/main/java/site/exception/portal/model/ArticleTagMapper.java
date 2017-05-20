package site.exception.portal.model;

import java.io.Serializable;

public class ArticleTagMapper implements Serializable{
    private static final long serialVersionUID = -6854342790465183540L;
    private Integer id;

    private Integer articleId;

    private Integer tagId;

    public ArticleTagMapper(Integer id, Integer articleId, Integer tagId) {
        this.id = id;
        this.articleId = articleId;
        this.tagId = tagId;
    }

    public ArticleTagMapper() {
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

    public Integer getTagId() {
        return tagId;
    }

    public void setTagId(Integer tagId) {
        this.tagId = tagId;
    }
}