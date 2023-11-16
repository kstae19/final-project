package com.kh.eco.product.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.stereotype.Service;

import com.kh.eco.product.model.vo.Brand;
import com.kh.eco.product.model.vo.Product;
import com.kh.eco.product.model.vo.ProductLike;
import com.kh.eco.product.model.vo.ProductReview;

public interface ProductService {
	ArrayList<Product> selectProductList();
	int addLike(HashMap like);
	Product selectProduct(int productNo);
	String getPrice(int optionNo);
	ArrayList<String> getImages(int productNo);
	Brand getBrand(int productNo);
	ProductReview getRate(int productNo);
	ArrayList<ProductReview> reviewList(int productNo);
	ArrayList<ProductLike> getLikes(int userNo);

}
