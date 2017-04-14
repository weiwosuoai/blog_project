package site.exception.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import site.exception.common.model.Pagination;
import site.exception.model.vo.ArticleVo;


public interface IIndexService {
	
	List<ArticleVo> findByPagination(Pagination<ArticleVo> pagination);
	
}
