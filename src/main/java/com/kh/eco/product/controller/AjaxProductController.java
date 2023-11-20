package com.kh.eco.product.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.eco.product.model.service.ProductService;
import com.kh.eco.product.model.vo.Cart;
import com.kh.eco.product.model.vo.ProductLike;

@Controller
public class AjaxProductController {
	@Autowired
	private ProductService productService;
	
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
	@ResponseBody
	@PostMapping(value="update.cart", produces="html/text; charset=UTF-8")
	public String updateQty(Cart cart) {
		return productService.updateQty(cart)>0? "success":"fail";
	}
	@ResponseBody
	@PostMapping(value="add.cart", produces="html/text; charset=UTF-8")
	public String addCart(Cart cart) {
		String result = productService.checkCart(cart);
		if(result == null) {//장바구니에 아이템이 존재하지 않을 때
			return productService.addCart(cart)>0? "added":"failed";
		}else {
			return result;
		}
	}
	@ResponseBody
	@PostMapping(value="remove.item", produces="html/text; charset=UTF-8")
	public String removeItem(Cart cart) {
		if(productService.removeItem(cart)>0) {
			return "completed";
		}else {
			return "failed";
		}
	}
}
