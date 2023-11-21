package com.kh.eco.product.model.service;

import java.util.ArrayList;

import com.kh.eco.product.model.vo.Brand;
import com.kh.eco.product.model.vo.Cart;
import com.kh.eco.product.model.vo.Order;
import com.kh.eco.product.model.vo.Product;
import com.kh.eco.product.model.vo.ProductLike;
import com.kh.eco.product.model.vo.ProductReview;

public interface ProductService {
	ArrayList<Product> selectProductList();
	int addLike(ProductLike like);
	Product selectProduct(int productNo);
	String getPrice(int optionNo);
	ArrayList<String> getImages(int productNo);
	Brand getBrand(int productNo);
	ProductReview getRate(int productNo);
	ArrayList<ProductReview> reviewList(int productNo);
	ArrayList<ProductLike> getLikes(int userNo);
	String checkLike(ProductLike like);
	int removeLike(ProductLike like);
	ArrayList<Cart> selectCartItems(int userNo);
	int updateQty(Cart cart);
	int addCart(Cart cart);
	String checkCart(Cart cart);
	int removeItem(Cart cart);
	Cart getCartItem(int optionNo);
	int orderProduct(Order order);
}
