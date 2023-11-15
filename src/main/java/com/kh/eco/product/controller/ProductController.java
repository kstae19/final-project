package com.kh.eco.product.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.eco.product.model.service.ProductService;
import com.kh.eco.product.model.vo.ProductReview;

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
	public String like(int productNo, @RequestParam(value="userNo", defaultValue="1") int userNo) {
		HashMap like = new HashMap();
		like.put("productNo", productNo);
		like.put("userNo", userNo);
		System.out.println("유저넘버 넘어왔나 ? :"+userNo);
		int result = productService.addLike(like);
		if(result>0) {			
			return "ne";
		}else {
			return "aniyo";
		}
	}
	@GetMapping("product.detail")
	public String showDetail(int productNo, Model model) {
		model.addAttribute("p", productService.selectProduct(productNo));
		model.addAttribute("images", productService.getImages(productNo));
		model.addAttribute("brand", productService.getBrand(productNo));
		model.addAttribute("review", productService.getRate(productNo));
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
	@GetMapping("product.review")
	public String reviewList(int productNo, Model model) {
		ArrayList<ProductReview> reviews = productService.reviewList(productNo);
		model.addAttribute("reviews", reviews);
		return "product/productReview";
	}
}
