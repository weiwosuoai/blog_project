package site.exception.front.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import site.exception.common.model.Pagination;
import site.exception.front.model.vo.ArticleVo;


public interface IIndexService {
	
	List<ArticleVo> findByPagination(Pagination<ArticleVo> pagination);
	
}
