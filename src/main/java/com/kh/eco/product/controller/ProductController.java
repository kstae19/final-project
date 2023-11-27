package com.kh.eco.product.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.io.File;

import javax.servlet.http.HttpSession;

import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kh.eco.common.model.template.Pagination;
import com.kh.eco.common.model.vo.PageInfo;
import com.kh.eco.product.model.service.ProductService;
import com.kh.eco.product.model.vo.ApproveRequest;
import com.kh.eco.product.model.vo.Cart;
import com.kh.eco.product.model.vo.KakaoPay;
import com.kh.eco.product.model.vo.Order;
import com.kh.eco.product.model.vo.OrderCart;
import com.kh.eco.product.model.vo.ProductLike;
import com.kh.eco.product.model.vo.ProductOption;
import com.kh.eco.product.model.vo.ProductReview;


@Controller
public class ProductController {
	
	@Autowired
	private ProductService productService;
	
	@RequestMapping("product")
	public String productHome(@RequestParam(value="cPage", defaultValue="1") 
								int currentPage,
								@RequestParam(value="orderBy", defaultValue="latest") 
								String orderBy, 
								@RequestParam(value="category", defaultValue="all") 
								String category,
								String keyword, 
								Model model) {
		int count = category.equals("all")? productService.selectProductCount() : productService.selectCategoryCount(category);
		PageInfo pi = Pagination.getPageInfo(productService.selectProductCount(), 
				 							currentPage, 6, 5);
		model.addAttribute("pi", pi);				
		
		HashMap map = new HashMap();
		map.put("orderBy", orderBy);	//정렬 기준
		map.put("category", category);	//상품 종류
		map.put("keyword", keyword);	//검색 키워드
		
		model.addAttribute("map", map);
		model.addAttribute("productList", productService.selectProductList(map, pi));
		
		System.out.println(model.getAttribute("productList"));
		return "product/productHome";
	}
	
	@ResponseBody
	@GetMapping("check.like")
	public String checkLike(ProductLike like) {
		return productService.checkLike(like);
	}
	public int removeLike(ProductLike like) {
		return productService.removeLike(like);
	}	

	
	@GetMapping("product.detail")
	public String showDetail(ProductLike like, Model model) {
		String likeCheck = like.getUserNo() !=0 ? productService.checkLike(like) : "N";
		productService.updateProductCount(like.getProductNo());
		model.addAttribute("like", likeCheck);
		model.addAttribute("p", productService.selectProduct(like.getProductNo()));
		model.addAttribute("images", productService.getImages(like.getProductNo()));
		model.addAttribute("brand", productService.getBrand(like.getProductNo()));
		model.addAttribute("review", productService.getRate(like.getProductNo()));
		return "product/productDetail";
	}
	
	@RequestMapping("product.orderForm")
	public String orderForm() {		
		return "redirect:/";
	}
	
	@GetMapping("cart")
	public String myCart(int userNo, Model model) {
		ArrayList<Cart> cartItems = productService.selectCartItems(userNo);
		model.addAttribute("cartItems", cartItems);
		return "product/cart";
	}
	@RequestMapping("listOrderForm")
	public String orderListForm(OrderCart orderCart, Cart item, Model model) {
		
		ArrayList<Cart> itemList = orderCart.getItemList();
		if(itemList.isEmpty()) {
			ProductOption option = productService.getProductOption(item.getOptionNo());
			item.setOptionName(option.getOptionName());
			item.setPrice(option.getPrice());
			itemList.add(item);
		}
		model.addAttribute("items",orderCart);
		
		int numOfItem = itemList.size();
		int totalPrice = 0;
		for(int i =0 ; i<numOfItem;i++) {
			totalPrice+= itemList.get(i).getPrice()*itemList.get(i).getQty();
		}
		model.addAttribute("shipping", (totalPrice>=40000)? true : false);
		model.addAttribute("numOfItem", numOfItem);
		model.addAttribute("totalPrice", totalPrice);
		return "product/orderForm";
	}
	@PostMapping("product.order")
	public String orderProduct(Order order
								, KakaoPay pay
								, Model model
								, HttpSession session) throws IOException, ParseException {
		session.setAttribute("order", order);
		model.addAttribute("pcUrl", productService.getPcUrl(pay));
		return "product/payReady";
	}
	@ResponseBody
	@RequestMapping(value="pay", produces="html/text; charset=UTF-8")
	public String makePayment(KakaoPay pay) throws IOException, ParseException{
		//TC0ONETIME
		String pcUrl = productService.getPcUrl(pay);
		return pcUrl;
	}
	
	@GetMapping("shoppingList")
	public String getShoppingList(@RequestParam(value="cPage", defaultValue="1") 
								int currentPage, 
								@RequestParam(value="userNo", defaultValue="0") 
								int userNo,
								Model model) {
		PageInfo pi = Pagination.getPageInfo(productService.selectOrderCount(userNo), 
											 currentPage, 4, 3);
		model.addAttribute("pi", pi);	
		ArrayList<Order> orders = productService.getShoppingList(userNo);
		for(Order o : orders) {
			int totalPrice =0;
			o.setItemQty(o.getOrderDetail().size());
			for(Cart c : o.getOrderDetail()) {
				totalPrice+=c.getPrice();
			}
			o.setTotalPrice(totalPrice);
		}
		model.addAttribute("orders", orders);
		return "product/shoppingList";
	}
	@GetMapping("paySuccess")
	public String getSuccessPage(String pg_token, Model model, HttpSession session) throws IOException, ParseException {
		//db에서 방금 추가된 정보들 가져오기
		ApproveRequest approveRequest = productService.getRequestParam();
		approveRequest.setPgToken(pg_token);
		model.addAttribute("itemName", productService.approvePayment(approveRequest, (Order)session.getAttribute("order")));
		session.removeAttribute("order");
		return "product/paySuccess";
	}
	@GetMapping("payReady")
	public String payReady() {
		return "product/payReady";
	}
	@GetMapping("reviewForm")
	public String reviewForm() {
		return "product/reviewForm";
	}
	@PostMapping("insert.review")
	public String insertReview(ProductReview review,
								MultipartFile upfile
								, HttpSession session
								,Model model) {
		String originName = upfile.getOriginalFilename();
		if(!originName.equals("")) {
			review.setOriginName(originName);
			review.setChangeName(saveFile(upfile, session));
		}
		int result = productService.insertReview(review);
		String alertMsg = result>0? "후기 등록 성공":"후기 등록 실패";
		model.addAttribute("alertMsg", alertMsg);

		return "redirect:/";
	}
	public String saveFile(MultipartFile upfile, HttpSession session) {
		String originName = upfile.getOriginalFilename();
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		int ranNum = (int)Math.random()*90000 + 10000;
		String ext =originName.substring(originName.lastIndexOf("."));
		String changeName = currentTime + ranNum + ext;
		String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/");
		try {
			upfile.transferTo(new File(savePath+changeName));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}

		return "resources/uploadFiles/"+changeName;
	}
	
	
}
