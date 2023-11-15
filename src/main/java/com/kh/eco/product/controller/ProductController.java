package com.kh.eco.product.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.eco.product.model.service.ProductService;
import com.kh.eco.product.model.vo.Product;

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
		int result = productService.addLike(like);
		if(result>0) {			
			return "안녕안녕";
		}else {
			return "좋아요 못눌름";
		}
	}
	@GetMapping("product.detail")
	public String showDetail(int productNo, Model model) {
		Product p = productService.selectProduct(productNo);
		System.out.println(p);
		model.addAttribute("p", p);
		return "product/productDetail";
	}
	@RequestMapping("product.orderForm")
	public String orderForm() {
		
		return "redirect:/";
	}
}
