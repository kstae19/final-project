package com.kh.eco.product.controller;

import java.io.IOException;
import java.util.ArrayList;

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

import com.kh.eco.product.model.service.ProductService;
import com.kh.eco.product.model.vo.ApproveRequest;
import com.kh.eco.product.model.vo.Cart;
import com.kh.eco.product.model.vo.KakaoPay;
import com.kh.eco.product.model.vo.Order;
import com.kh.eco.product.model.vo.OrderCart;
import com.kh.eco.product.model.vo.ProductLike;
import com.kh.eco.product.model.vo.ProductOption;


@Controller
public class ProductController {
	
	@Autowired
	private ProductService productService;
	
	@RequestMapping("product")
	public String productHome(Model model) {
		model.addAttribute("productList", productService.selectProductList());
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
		//String payResult = productService.payResult(pcUrl);
		
		return pcUrl;
	}
	
	@GetMapping("shoppingList")
	public String getShoppingList(@RequestParam(value="userNo", defaultValue="0") int userNo,
									Model model) {
		ArrayList<Order> orders = productService.getShoppingList(userNo);
		for(Order o : orders) {
			int totalPrice =0;
			o.setItemQty(o.getOrderDetail().size());
			for(Cart c : o.getOrderDetail()) {
				totalPrice+=c.getPrice();
			}
			o.setTotalPrice(totalPrice);
			System.out.println(o);
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
	
	
}
