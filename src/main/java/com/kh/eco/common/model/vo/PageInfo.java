package com.kh.eco.common.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class PageInfo {
	
	private int listCount; // 요소 전체 개수
	private int currentPage; // 현재 페이지
	private int boardLimit; // 한 페이지에서 보이는 게시글의 개수
	private int pageLimit; // 페이징버튼의 개수
	
	private int maxPage;
	private int startPage;
	private int endPage;
	
}
