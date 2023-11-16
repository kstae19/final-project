package com.kh.eco.common.model.template;

import com.kh.eco.common.model.vo.PageInfo;

public class Pagination {
	
	// static설정으로 다른 영역에서 선언없이 바로 사용가능한 메서드
	public static PageInfo getPageInfo(int listCount, int currentPage, int boardLimit, int pageLimit) {
		int maxPage = (int)Math.ceil((double)listCount / boardLimit);
		int startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		int endPage = startPage + pageLimit - 1;
		
		if(endPage > maxPage) endPage = maxPage;
		
		return new PageInfo(listCount, currentPage, boardLimit, pageLimit, maxPage, startPage, endPage);
	}
	

}
