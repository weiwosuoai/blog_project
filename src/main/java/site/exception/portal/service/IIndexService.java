package site.exception.portal.service;

import java.util.List;

import site.exception.common.model.Pagination;
import site.exception.portal.model.vo.ArticleVo;


public interface IIndexService {
	
	List<ArticleVo> findByPagination(Pagination<ArticleVo> pagination);
	
}
