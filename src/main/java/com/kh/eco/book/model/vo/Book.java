package com.kh.eco.book.model.vo;

import java.util.Objects;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class Book {
	
	private String ISBN13;
	private int bookCount;
	private String bookTitle;
	private String bookWriter;
	private String bookImg;
	private String bookPublisher;
	private String bookContent;
	private String bookDate;
	private String bookCategory;
	private String bookLink;
	
	@Override
	public boolean equals(Object o) {
		if (this == o) return true; // 자기자신과 비교하면 true
		if (o == null || getClass() != o.getClass()) return false; // null값이 들어오거나 다른 클래스가 들어오면 false
		Book book = (Book) o;
		return ISBN13 == book.ISBN13; // 들어온 객체의 ISBN값 비교
	}	
	
	@Override
	public int hashCode() {
		return Objects.hash(ISBN13);
	}
	
}
