package com.kh.eco.product.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.eco.product.model.service.ProductService;
import com.kh.eco.product.model.vo.Cart;
import com.kh.eco.product.model.vo.Order;
import com.kh.eco.product.model.vo.OrderCart;
import com.kh.eco.product.model.vo.ProductLike;

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
		model.addAttribute("like", likeCheck);
		model.addAttribute("p", productService.selectProduct(like.getProductNo()));
		System.out.println(model.getAttribute("p"));
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
	@PostMapping("orderForm")
	public String orderForm(Order o, Model model) {
		//주문상품 정보에는 상품명, 상품사진, 가격 , 수량
		model.addAttribute("item", productService.getCartItem(o.getOptionNo()));
		model.addAttribute("order", o);		
		return "product/orderForm";
	}
	@PostMapping("listOrderForm")
	public String orderListForm(OrderCart orderCart, Model model) {
		model.addAttribute("items",orderCart);
		System.out.println(model.getAttribute("items"));
		return "product/orderForm";
	}
	@PostMapping("product.order")
	public String orderProduct(Order order, Model model) {
		System.out.println(order);
		int result = productService.orderProduct(order);
		if(result>0) {
			System.out.println("주문 성공");
		}else {
			System.out.println("주문 실패");
		}
		return "redirect:/";
	}
	@GetMapping("orderList")
	public String getOrderList() {
		return "product/orderList";
	}
}
