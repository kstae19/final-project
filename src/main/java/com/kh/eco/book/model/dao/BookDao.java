package com.kh.eco.book.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.eco.book.model.vo.Book;
import com.kh.eco.book.model.vo.BookReply;
import com.kh.eco.book.model.vo.BookReport;
import com.kh.eco.book.model.vo.BookReportReply;
import com.kh.eco.book.model.vo.ReportBlack;
import com.kh.eco.book.model.vo.ReportReplyBlack;

@Repository
public class BookDao {
	
	public ArrayList<Book> countList(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("bookMapper.countList");
	}
	
	public int insertBook(SqlSessionTemplate sqlSession, Book book) {
		return sqlSession.insert("bookMapper.insertBook", book);
	}
	
	public int increaseBook(SqlSessionTemplate sqlSession, String ISBN) {
		return sqlSession.update("bookMapper.increaseBook", ISBN);
	}
	
	public int countBook(SqlSessionTemplate sqlSession, String ISBN) {
		return sqlSession.selectOne("bookMapper.countBook", ISBN);
	}
	
	public int insertBookMark(SqlSessionTemplate sqlSession, HashMap map) {
		return sqlSession.insert("bookMapper.insertBookMark", map);
	}
	
	public int removeBookMark(SqlSessionTemplate sqlSession, HashMap map) {
		return sqlSession.delete("bookMapper.removeBookMark", map);
	}
	
	public int ajaxSelectBookMark(SqlSessionTemplate sqlSession, HashMap map) {
		return sqlSession.selectOne("bookMapper.selectBookMark", map);
	}
	
	public int ajaxInsertBookReply(SqlSessionTemplate sqlSession, HashMap map) {
		return sqlSession.insert("bookMapper.ajaxInsertBookReply", map);
	}
	
	public int ajaxSelectBookReplyCount(SqlSessionTemplate sqlSession, String ISBN13) {
		return sqlSession.selectOne("bookMapper.ajaxSelectBookReplyCount", ISBN13);
	}
	
	public ArrayList<BookReply> ajaxSelectBookReply(SqlSessionTemplate sqlSession, String ISBN13, RowBounds rowBounds){
		return (ArrayList)sqlSession.selectList("bookMapper.ajaxSelectBookReply", ISBN13, rowBounds);
	}
	
	public int ajaxDeleteBookReply(SqlSessionTemplate sqlSession, HashMap map) {
		return sqlSession.delete("bookMapper.ajaxDeleteBookReply", map);
	}
	
	public int ajaxDeleteBookEco(SqlSessionTemplate sqlSession, HashMap map) {
		return sqlSession.delete("bookMapper.ajaxDeleteBookEco", map);
	}
	
	public int reportCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("bookMapper.reportCount");
	}
	
	public ArrayList<BookReport> selectReportList(SqlSessionTemplate sqlSession, RowBounds rowBounds){
		return (ArrayList)sqlSession.selectList("bookMapper.selectReportList", null, rowBounds);
	}
	
	public int searchReportCount(SqlSessionTemplate sqlSession, HashMap map) {
		return sqlSession.selectOne("bookMapper.searchReportCount", map);
	}
	
	public ArrayList<BookReport> searchReportList(SqlSessionTemplate sqlSession, HashMap map, RowBounds rowBounds){
		return (ArrayList)sqlSession.selectList("bookMapper.searchReportList", map, rowBounds);
	}
	
	public int reportEnrollForm(SqlSessionTemplate sqlSession, BookReport bookReport) {
		return sqlSession.insert("bookMapper.reportEnrollForm", bookReport);
	}
	
	public int countReport(SqlSessionTemplate sqlSession, int rno) {
		return sqlSession.update("bookMapper.countReport", rno);
	}
	
	public BookReport reportDetail(SqlSessionTemplate sqlSession, int rno) {
		return sqlSession.selectOne("bookMapper.reportDetail", rno);
	}
	
	public int reportUpdateForm(SqlSessionTemplate sqlSession, BookReport bookReport) {
		return sqlSession.update("bookMapper.reportUpdateForm", bookReport);
	}
	
	public int reportDelete(SqlSessionTemplate sqlSession, int reportNo) {
		return sqlSession.update("bookMapper.reportDelete", reportNo);
	}
	
	public int reportBlack(SqlSessionTemplate sqlSession, HashMap map) {
		return sqlSession.insert("bookMapper.reportBlack", map);
	}
	
	public int ajaxSelectReportReplyCount(SqlSessionTemplate sqlSession, int reportNo) {
		return sqlSession.selectOne("bookMapper.selectReportReplyCount", reportNo);
	}
	
	public ArrayList<BookReportReply> ajaxSelectReportReply(SqlSessionTemplate sqlSession, int reportNo, RowBounds rowBounds) {
		return (ArrayList)sqlSession.selectList("bookMapper.selectReportReply", reportNo, rowBounds);
	}

	public int ajaxInsertReportReply(SqlSessionTemplate sqlSession, HashMap map) {
		return sqlSession.insert("bookMapper.insertReportReply", map);
	}

	public int ajaxUpdateReportReply(SqlSessionTemplate sqlSession, HashMap map) {
		return sqlSession.update("bookMapper.updateReportReply", map);
	}

	public int ajaxDeleteReportReply(SqlSessionTemplate sqlSession, int replyNo) {
		return sqlSession.delete("bookMapper.deleteReportReply", replyNo);
	}
	
	public int ajaxReplyBlack(SqlSessionTemplate sqlSession, HashMap map) {
		return sqlSession.insert("bookMapper.replyBlack", map);
	}
	
	public int bookmarkCountMyPage(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.selectOne("bookMapper.bookmarkCountMyPage", userNo);
	}
	
	public ArrayList<String> bookmarkMyPage(SqlSessionTemplate sqlSession, int userNo, RowBounds rowBounds){
		return (ArrayList)sqlSession.selectList("bookMapper.bookmarkMyPage", userNo, rowBounds);
	}
	
	public int bookReplyCountMyPage(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.selectOne("bookMapper.bookReplyCountMyPage", userNo);
	}
	
	public ArrayList<Book> bookReplyMyPage(SqlSessionTemplate sqlSession, int userNo, RowBounds rowBounds){
		return (ArrayList)sqlSession.selectList("bookMapper.bookReplyMyPage", userNo, rowBounds);
	}
	
	public int reportCountMyPage(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.selectOne("bookMapper.reportCountMyPage", userNo);
	}
	
	public ArrayList<BookReport> reportMyPage(SqlSessionTemplate sqlSession, int userNo, RowBounds rowBounds){
		return (ArrayList)sqlSession.selectList("bookMapper.reportMyPage", userNo, rowBounds);
	}
	
	public int reportReplyCountMyPage(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.selectOne("bookMapper.reportReplyCountMyPage", userNo);
	}
	
	public ArrayList<BookReportReply> reportReplyMyPage(SqlSessionTemplate sqlSession, int userNo, RowBounds rowBounds){
		return (ArrayList)sqlSession.selectList("bookMapper.reportReplyMyPage", userNo, rowBounds);
	}
	
	public int adminReportBlackCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("bookMapper.adminReportBlackCount");
	}
	
	public ArrayList<ReportBlack> adminReportBlack(SqlSessionTemplate sqlSession, RowBounds rowBounds){
		return (ArrayList)sqlSession.selectList("bookMapper.adminReportBlack", null, rowBounds);
	}
	
	public int adminReportReplyBlackCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("bookMapper.adminReportReplyBlackCount");
	}
	
	public ArrayList<ReportReplyBlack> adminReportReplyBlack(SqlSessionTemplate sqlSession, RowBounds rowBounds){
		return (ArrayList)sqlSession.selectList("bookMapper.adminReportReplyBlack", null, rowBounds);
	}

	public int deleteReportBlack(SqlSessionTemplate sqlSession, int[] array) {
		return sqlSession.update("bookMapper.deleteReportBlack", array);
	}

	public int deleteReplyBlack(SqlSessionTemplate sqlSession, int[] array) {
		return sqlSession.delete("bookMapper.deleteReplyBlack", array);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	

}
