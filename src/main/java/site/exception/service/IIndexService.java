package site.exception.service;

import java.util.List;

import site.exception.model.vo.ArticleVo;


public interface IIndexService {
	
	List<ArticleVo> findIndexInfo();
	
}
