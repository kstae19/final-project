package com.kh.eco.book.controller;


import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.kh.eco.book.model.service.BookService;
import com.kh.eco.book.model.vo.Book;
import com.kh.eco.book.model.vo.BookReply;
import com.kh.eco.book.model.vo.BookReport;
import com.kh.eco.common.model.template.Pagination;
import com.kh.eco.common.model.vo.PageInfo;

@Controller
public class BookController {
	
	@Autowired
	public BookService bookService;
	
	public static final String ALADINSERVICEKEY = "ttbrkd_gus_wl1746003";
	
	// 알라딘 api 검색기능 메소드
	public ArrayList<Book> selectBookList(int maxResult, String query, int currentPage) throws IOException{
		String url = "http://www.aladin.co.kr/ttb/api/ItemSearch.aspx";
		url += "?TTBKey=" + ALADINSERVICEKEY;
		url += "&Query=" + URLEncoder.encode(query, "UTF-8");
		url += "&MaxResults=" + maxResult;
		url += "&output=JS";
		url += "&Sort=SalesPoint";
		url += "&Version=20131101";
		url += "&Cover=big";
		url += "&start=" + currentPage;
		
		/*
		 * http://www.aladin.co.kr/ttb/api/ItemSearch.aspx?
		 * ttbkey=ttbrkd_gus_wl1746003
		 * &Query=%ED%99%98%EA%B2%BD
		 * &MaxResults=100
		   &start=1
		   &output=xml
		   &Version=20131101
		   &Cover=big
		 */
		
		URL requestUrl = new URL(url);
		HttpURLConnection urlConnection = (HttpURLConnection)requestUrl.openConnection();
		// 요청방식은 GET방식과 POST방식에 상관없이 요청 가능합니다.
		urlConnection.setRequestMethod("GET");
		BufferedReader br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
		
		// 결과 받기
		String responseText = br.readLine();
		/*
		 * {"title":"환경과 생태 쫌 아는 10대 - 우리, 100년 뒤에도 만날 수 있을까요?",
		 *  "link":"http:\/\/www.aladin.co.kr\/shop\/wproduct.aspx?ItemId=192112209&amp;partner=openAPI&amp;start=api",
		 *  "author":"최원형 (지은이), 방상호 (그림)",
		 *  "pubDate":"2019-05-20",
		 *  "description":"과학 쫌 아는 십대 3권. 현대인이 쉽고도 흔하게 행하는 여덟 가지 소비 장면을 포착하여, 나의 소비가 어느 계층의 누구에게, 어디에 있는 어떤 생물에게 어떻게 영향을 미치는지 다양한 각도에서 살펴보고자 했다.",
		 *  "isbn":"K112635902",
		 *  "isbn13":"9791161727356",
		 *  "itemId":192112209,
		 *  "priceSales":11700,
		 *  "priceStandard":13000,
		 *  "mallType":"BOOK",
		 *  "stockStatus":"",
		 *  "mileage":650,
		 *  "cover":"https:\/\/image.aladin.co.kr\/product\/19211\/22\/cover\/k112635902_1.jpg",
		 *  "categoryId":1143,
		 *  "categoryName":"국내도서>청소년>청소년 수학\/과학",
		 *  "publisher":"풀빛",
		 *  "salesPoint":27027,
		 *  "adult":false,
		 *  "fixedPrice":true,
		 *  "customerReviewRank":10,
		 *  "seriesInfo":{"seriesId":658912,"seriesLink":"http://www.aladin.co.kr/shop/common/wseriesitem.aspx?SRID=658912&amp;partner=openAPI","seriesName":"과학 쫌 아는 십대 3"},
		 *  "subInfo":{}}
		 */
		
		JsonObject totalObj = JsonParser.parseString(responseText).getAsJsonObject();
		JsonArray itemArr = totalObj.getAsJsonArray("item");
		
		ArrayList<Book> bookList = new ArrayList();
		
		for(int i = 0; i < itemArr.size(); i++) {
			JsonObject item = itemArr.get(i).getAsJsonObject();
			
			Book book = new Book();
			
			book.setISBN13(item.get("isbn13").getAsString());
			book.setBookCategory(item.get("categoryName").getAsString());
			book.setBookContent(item.get("description").getAsString());
			book.setBookDate(item.get("pubDate").getAsString());
			book.setBookLink(item.get("link").getAsString());
			book.setBookPublisher(item.get("publisher").getAsString());
			book.setBookTitle(item.get("title").getAsString());
			book.setBookWriter(item.get("author").getAsString());
			book.setBookImg(item.get("cover").getAsString());
			
			bookList.add(book);
		}
		
		br.close();
		urlConnection.disconnect();
		
		return bookList;
	}
	
	/* 알라딘 api 상품조회 메소드
	public Book bookLookUp(String ISBN) throws IOException {
		String url = "http://www.aladin.co.kr/ttb/api/ItemLookUp.aspx";
		url += "?TTBKey=" + ALADINSERVICEKEY;
		url += "&ItemId=" + ISBN;
		url += "&ItemIdType=ISBN13";
		url += "&Cover=Big";
		url += "&Output=JS";
		url += "&Version=20131101";
		
		URL requestUrl = new URL(url);
		HttpURLConnection urlConnection = (HttpURLConnection)requestUrl.openConnection();
		urlConnection.setRequestMethod("GET");
		BufferedReader br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
		
		// 결과 받기
		String responseText = br.readLine();
		
		JsonObject totalObj = JsonParser.parseString(responseText).getAsJsonObject();
		JsonArray itemArr = totalObj.getAsJsonArray("item");
		/*
		 * {
	      "title": "경험은 어떻게 유전자에 새겨지는가 - 환경과 맥락에 따라 달라지는 유전체에 관한 행동 후성유전학의 놀라운 발견",
	      "link": "http://www.aladin.co.kr/shop/wproduct.aspx?ItemId=324228542&amp;partner=openAPI&amp;start=api",
	      "author": "데이비드 무어 (지은이), 정지인 (옮긴이)",
	      "pubDate": "2023-09-18",
	      "description": "하버드대학교에서 발달·생물심리학 박사 학위를 받은 뒤 피처대학 심리학과 교수로 활동 중인 데이비드 무어가 ‘경이로울 정도로 성장하는’ 후성유전학의 연구와 통찰을 《경험은 어떻게 유전자에 새겨지는가》에 집대성했다.",
	      "isbn": "K102935996",
	      "isbn13": "9791192465111",
	      "itemId": 324228542,
	      "priceSales": 26100,
	      "priceStandard": 29000,
	      "mallType": "BOOK",
	      "stockStatus": "",
	      "mileage": 1450,
	      "cover": "https://image.aladin.co.kr/product/32422/85/cover/k102935996_1.jpg",
	      "categoryId": 51002,
	      "categoryName": "국내도서>과학>기초과학/교양과학",
	      "publisher": "아몬드",
	      "salesPoint": 24560,
	      "adult": false,
	      "fixedPrice": true,
	      "customerReviewRank": 10,
	      "subInfo": {
	        "subTitle": "환경과 맥락에 따라 달라지는 유전체에 관한 행동 후성유전학의 놀라운 발견",
	        "originalTitle": "The Developing Genome: An Introduction to Behavioral Epigenetics (2015년)",
	        "itemPage": 540
      		}
		 
		JsonObject item = itemArr.get(0).getAsJsonObject();
		
		Book book = new Book();
		
		book.setISBN13(item.get("isbn13").getAsString());
		book.setBookCategory(item.get("categoryName").getAsString());
		book.setBookContent(item.get("description").getAsString());
		book.setBookDate(item.get("pubDate").getAsString());
		book.setBookLink(item.get("link").getAsString());
		book.setBookPublisher(item.get("publisher").getAsString());
		book.setBookTitle(item.get("title").getAsString());
		book.setBookWriter(item.get("author").getAsString());
		book.setBookImg(item.get("cover").getAsString());
		
		return book;
	}*/
	
	
	// 메인화면 메소드
	@RequestMapping("book")
	public String bookMain(@RequestParam(value="cPage", defaultValue="1") int currentPage, Model model) throws IOException {
		
		ArrayList<Book> bookList = selectBookList(20, "환경", currentPage);
		// bookList가 아니라 isbn키값을 가지는 hashmap을 만들어서 그걸 db단에서 조회시키면서 새로운 vo를 만들어 키값을 덮어씌...테이블구조를 바꿔야할까
		ArrayList<Book> countList = bookService.countList();
		
		// countList와 bookList의 각 식별값끼리 비교하면서 같을 경우 북리스트에 추가..
		for(int i = 0; i < bookList.size(); i++) {
			for(int n = 0; n < countList.size(); n++) {
				if((bookList.get(i).getISBN13()).equals(countList.get(n).getISBN13())) {
					bookList.get(i).setBookCount(countList.get(n).getBookCount());
				}
			}
		}
		
		PageInfo pi = Pagination.getPageInfo(200, currentPage, 20, 10);
		
		model.addAttribute("bookList", bookList);
		model.addAttribute("pi", pi);
		
		return "book/book/bookList";
	}
	
	
	// 검색 메소드
	@RequestMapping("searchBook.bk")
	public String bookSearch(@RequestParam(value="cPage", defaultValue="1") int currentPage, Model model, String selectBookOption, String searchBookValue) throws IOException {
		
		ArrayList<Book> allList = new ArrayList();
		for(int i = 1; i <= 4; i++) {
			ArrayList<Book> bookList = selectBookList(50, "환경", i);
			for(int n = 0; n < bookList.size(); n++) {
				allList.add(bookList.get(n));
			}
		}
		
		ArrayList<Book> searchList = new ArrayList();
		switch(selectBookOption) {
		case "title" : 
			for(int i = 0; i < allList.size(); i++) {
				if((allList.get(i).getBookTitle()).contains(searchBookValue)) {
					searchList.add(allList.get(i));
				}
			}
			break;
		case "writer" : 
			for(int i = 0; i < allList.size(); i++) {
				if((allList.get(i).getBookWriter()).contains(searchBookValue)) {
					searchList.add(allList.get(i));
				}
			}
			break;
		case "category" : 
			for(int i = 0; i < allList.size(); i++) {
				if((allList.get(i).getBookCategory()).contains(searchBookValue)) {
					searchList.add(allList.get(i));
				}
			}
			break;
		}
		
		ArrayList<Book> countList = bookService.countList();
		// countList와 bookList의 각 식별값끼리 비교하면서 같을 경우 북리스트에 추가..
		for(int i = 0; i < searchList.size(); i++) {
			for(int n = 0; n < countList.size(); n++) {
				if((searchList.get(i).getISBN13()).equals(countList.get(n).getISBN13())) {
					searchList.get(i).setBookCount(countList.get(n).getBookCount());
				}
			}
		}
		
		PageInfo pi = Pagination.getPageInfo(searchList.size(), currentPage, 20, 10);
		// 만약 현재페이지 1 : 0 ~ 19(20)
		// 2 : 20 ~ 39(40)
		// 3 : 40 ~ 59(60)
		// 4 : 60 ~ 79(80)
		int startList = 20 * (currentPage - 1);
		int endList = currentPage * 20;
		if(endList > searchList.size()) {
			endList = searchList.size();
		}
		
		model.addAttribute("bookList", searchList.subList(startList, endList));
		model.addAttribute("pi", pi);
		model.addAttribute("selectBook", selectBookOption);
		model.addAttribute("searchBook", searchBookValue);
		
		return "book/book/bookList";
	}
	
	
	// 상세페이지 메소드(api 조회하지 않게 바꿨지만..)
	@RequestMapping("bookdetail.bk")
	public String bookDetail(String ISBN, Model model, Book book, HttpSession session) throws IOException {
		
		book.setISBN13(ISBN);
		int count = book.getBookCount();
		
		if(count == 0) { // 조회수가 0일때
			int bookCount = bookService.insertBook(book);
			if(bookCount > 0) { // 조회수 추가 성공
				book.setBookCount(bookCount);
				model.addAttribute("b", book);
				return "book/book/bookDetail";
			} else { // 조회수 추가 실패
				session.setAttribute("alert", "조회수 추가 실패");
				return "redirect:book";
			}
		} else { // 조회수가 1 이상일때
			int bookCount = bookService.increaseBook(ISBN);
			if(bookCount > 0) { // 조회수 증가 성공
				int countBook = bookService.countBook(ISBN);
				book.setBookCount(countBook);
				model.addAttribute("b", book);
				return "book/book/bookDetail";
			} else { // 조회수 증가 실패
				session.setAttribute("alert", "조회수 증가 실패");
				return "redirect:book";
			}
		}
	}
	
	// 독후감 게시판 포워딩 겸 리스트 조회
	@RequestMapping("bookreport")
	public String bookReport(@RequestParam(value="cPage", defaultValue="1") int currentPage, Model model) {
		PageInfo pi = Pagination.getPageInfo(bookService.reportCount(), currentPage, 10, 10);
		model.addAttribute("list", bookService.selectReportList(pi));
		model.addAttribute("pi", pi);
		return "book/book/reportList";
	}
	
	// 독후감 게시판 검색목록 리스트 조회
	@RequestMapping("reportSearch.bk")
	public ModelAndView searchReportList(@RequestParam(value="cPage", defaultValue="1") int currentPage, ModelAndView mv, String reportSearchOption, String reportSearchValue, HttpSession session) {
		
		HashMap<String, String> map = new HashMap();
		map.put("condition", reportSearchOption);
		map.put("keyword", reportSearchValue);
		
		PageInfo pi = Pagination.getPageInfo(bookService.searchReportCount(map), currentPage, 10, 10);
		
		ArrayList<BookReport> list = bookService.searchReportList(map, pi);
		
		if(list != null) { // 리스트 조회 성공
			mv.addObject("list", list).addObject("pi", pi).addObject("condition", reportSearchOption).addObject("keyword", reportSearchValue).setViewName("book/book/reportList");
		} else { // 리스트 조회 실패
			session.setAttribute("failBookAlert", "조회수 증가 실패");
		}
		return mv;
	}
	
	// 독후감 게시판 작성페이지 포워딩
	@RequestMapping("reportEnroll.bk")
	public String reportEnroll() {
		return "book/book/reportEnrollForm";
	}
	
	// 독후감 게시판 작성
	@RequestMapping("reportEnrollForm.bk")
	public String reportEnrollForm(BookReport bookReport, HttpSession session) {
		
		if(bookService.reportEnrollForm(bookReport) > 0) { // 작성 성공
			return "redirect:bookreport";
		} else { // 작성 실패
			session.setAttribute("failBookAlert", "게시글 작성 실패");
			return "redirect:bookreport";
		}
		
	}
	 
	// 독후감 게시판 상세조회
	@RequestMapping("reportdetail.bk")
	public String reportDetail(int rno, Model model, HttpSession session) {
		
		if(bookService.countReport(rno) > 0) { // 조회수 증가 성공
			BookReport bookReport = bookService.reportDetail(rno);
			if(bookReport != null) { // 상세조회 성공
				model.addAttribute("br", bookReport);
			} else { // 상세조회 실패
				session.setAttribute("failBookAlert", "상세조회 실패");
			}
		} else { // 조회수 증가 실패
			session.setAttribute("failBookAlert", "상세조회 실패");
		}
		
		return "book/book/reportDetail";
	}
	
	// 독후감 게시글 수정 포워딩
	@RequestMapping("reportUpdate.bk")
	public String reportUpdate(int reportNo, Model model) {
		
		model.addAttribute("br", bookService.reportDetail(reportNo));
		
		return "book/book/reportEnrollForm";
	}
	
	// 독후감 게시글 수정
	@RequestMapping("reportUpdateForm.bk")
	public String reportUpdateForm(BookReport bookReport, HttpSession session) {
		
		if(bookService.reportUpdateForm(bookReport) > 0) { // 수정 성공
			session.setAttribute("successBookAlert", "게시글 수정 성공");
			return "redirect:bookreport";
		} else { // 수정 실패
			session.setAttribute("failBookAlert", "게시글 수정 실패");
			return "redirect:bookreport";
		}
	}
	
	// 독후감 게시글 삭제
	@RequestMapping("reportDelete.bk")
	public String reportDelete(int reportNo, HttpSession session) {
		
		if(bookService.reportDelete(reportNo) > 0) { // 삭제 성공
			session.setAttribute("successBookAlert", "게시글 삭제 성공");
			return "redirect:bookreport";
		} else { // 삭제 실패
			session.setAttribute("failBookAlert", "게시글 삭제 실패");
			return "redirect:bookreport";
		}
	}
	
	// 독후감 게시글 신고
	@RequestMapping("reportBlack.bk")
	public String reportBlack(int reportNo, String userId, int userNo, HttpSession session) {
		
		HashMap<String, Object> map = new HashMap();
		map.put("reportNo", reportNo);
		map.put("userId", userId);
		map.put("userNo", userNo);
		
		if(bookService.reportBlack(map) > 0) {
			session.setAttribute("successBookAlert", "게시글 신고 성공");
			return "redirect:bookreport";
		} else { // 신고 실패
			session.setAttribute("failBookAlert", "게시글 신고 실패");
			return "redirect:bookreport";
		}
	}
	
	// 도서 마이페이지 포워딩
	@RequestMapping("bookmypage")
	public String BookMyPage() {
		return "book/mypage/bookMyPage";
	}
	
	// 독후감 게시판 마이페이지 포워딩
	@RequestMapping("reportmypage")
	public String ReportMyPage() {
		return "book/mypage/reportMyPage";
	}
	
	// 독서캘린더 마이페이지 포워딩
	
	
	// 신고게시판 포워딩
	
	
	
	
	
	
	
	
	
	/* 환경사전 api
	@RequestMapping("ecodictionary")
	public String ecoDictionary() throws IOException {
		String clientId = "vzhAW8vm_5bAc_CGqL5k"; //애플리케이션 클라이언트 아이디
        String clientSecret = "S3pHBtYEka"; //애플리케이션 클라이언트 시크릿

        String text = null;
        try {
            text = URLEncoder.encode("환경", "UTF-8");
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException("검색어 인코딩 실패",e);
        }

	    String apiURL = "https://openapi.naver.com/v1/search/encyc.json"; // JSON 결과
	    apiURL += "?query=" + text;  
	    apiURL += "&sort=sim";
	    apiURL += "&display=100";
	    apiURL += "&start=1";
	    //String apiURL = "https://openapi.naver.com/v1/search/blog.xml?query="+ text; // XML 결과
	
	    Map<String, String> requestHeaders = new HashMap<>();
	    requestHeaders.put("X-Naver-Client-Id", clientId);
	    requestHeaders.put("X-Naver-Client-Secret", clientSecret);
	    String responseBody = get(apiURL,requestHeaders);
	    
	    System.out.println(responseBody);
	    
	    return "book/book/ecoList";
	}
	// 네이버 api 메소드
	private static String get(String apiUrl, Map<String, String> requestHeaders){
	    HttpURLConnection con = connect(apiUrl);
	    try {
	        con.setRequestMethod("GET");
	        for(Map.Entry<String, String> header :requestHeaders.entrySet()) {
	            con.setRequestProperty(header.getKey(), header.getValue());
	        }
	        int responseCode = con.getResponseCode();
	        if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 호출
	            return readBody(con.getInputStream());
	        } else { // 오류 발생
	            return readBody(con.getErrorStream());
	        }
	    } catch (IOException e) {
	        throw new RuntimeException("API 요청과 응답 실패", e);
	    } finally {
	        con.disconnect();
	    }
	}
	// 네이버 api 메소드
	private static HttpURLConnection connect(String apiUrl){
	    try {
	        URL url = new URL(apiUrl);
	        return (HttpURLConnection)url.openConnection();
	    } catch (MalformedURLException e) {
	        throw new RuntimeException("API URL이 잘못되었습니다. : " + apiUrl, e);
	    } catch (IOException e) {
	        throw new RuntimeException("연결이 실패했습니다. : " + apiUrl, e);
	    }
	}
	// 네이버 api 메소드
	private static String readBody(InputStream body){
	    InputStreamReader streamReader = new InputStreamReader(body);
	
	    try (BufferedReader lineReader = new BufferedReader(streamReader)) {
	        StringBuilder responseBody = new StringBuilder();
	        String line;
	        while ((line = lineReader.readLine()) != null) {
	            responseBody.append(line);
	        }
	        return responseBody.toString();
	    } catch (IOException e) {
	        throw new RuntimeException("API 응답을 읽는 데 실패했습니다.", e);
	    }
	}*/

}
