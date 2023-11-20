package com.kh.eco.product.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.eco.product.model.service.ProductService;
import com.kh.eco.product.model.vo.Cart;
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
	@RequestMapping(value = "product.like", produces="text/html; charset=UTF-8")
	public String like(ProductLike like) {
		if(checkLike(like).equals("Y")) {
			//이미 좋아요 되어있으니까 좋아요를 빼야대
			return productService.removeLike(like)==1? "removed" : "remove failed";
		}else {
			//좋아요를 추가하면 돼
			int result = productService.addLike(like);
			return result>0? "added":"failed to add like";		
		}
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
		String likeCheck = like.getUserNo() !=0 ? checkLike(like) : "N";
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
	@ResponseBody
	@GetMapping(value ="getPrice")
	public String getPrice(int optionNo) {
		String price = productService.getPrice(optionNo);
		return price;
	}
	@ResponseBody
	@GetMapping(value ="product.review", produces="application/json; charset=UTF-8")
	public String ajaxReviewList(int productNo, Model model) {
		return new Gson().toJson(productService.reviewList(productNo));
	}
	@ResponseBody
	@GetMapping(value="getLikes.pr", produces="application/json; charset=UTF-8")
	public String ajaxGetLikes(int userNo) {
		return new Gson().toJson(productService.getLikes(userNo));
	}
	
	@GetMapping("cart")
	public String myCart(int userNo, Model model) {
		model.addAttribute("cartItems", productService.selectCartItems(userNo));
		return "product/cart";
	}
}
