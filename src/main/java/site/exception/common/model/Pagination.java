package site.exception.common.model;

import java.io.Serializable;
import java.util.List;

/**
 * 分页
 * 
 * @CreatTime 2017年4月13日 上午11:46:26
 * @author Allen
 * 
 */
public class Pagination<T> implements Serializable {

	/** serialVersionUID **/
	private static final long serialVersionUID = 7466708644237396772L;

	/** 每页显示多少条记录 **/
	private int pageSize;

	/** 当前所在页码 **/
	private int pageNum;

	/** 总记录数 **/
	private int totalRecord;

	/** 总页数 **/
	private int totalPage;

	/** 显示的数据 **/
	private List<T> recordList;
	
	/** 每页起始行 **/
	private int offset;

	/** Constructor **/
	public Pagination() {
		super();
	}

	public Pagination(int pageSize, int currentPage, int totalRecord,
			int totalPage, List<T> recordList) {
		super();
		this.pageSize = pageSize;
		this.pageNum = currentPage;
		this.totalRecord = totalRecord;
		this.totalPage = totalPage;
		this.recordList = recordList;
	}

	public void setOffset() {
		this.offset = (this.pageNum - 1) * this.pageSize;
	}

	/**
	 * 返回下一页数据的起始行
	 * 
	 * @return
	 */
	public int getOffset() {
		return offset;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getTotalRecord() {
		return totalRecord;
	}

	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public List<T> getDataList() {
		return recordList;
	}

	public void setDataList(List<T> dataList) {
		this.recordList = dataList;
	}

}
