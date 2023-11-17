package com.kh.eco.product.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.eco.product.model.dao.ProductDao;
import com.kh.eco.product.model.vo.Brand;
import com.kh.eco.product.model.vo.Cart;
import com.kh.eco.product.model.vo.Product;
import com.kh.eco.product.model.vo.ProductLike;
import com.kh.eco.product.model.vo.ProductReview;

@Service
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	private ProductDao dao;
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public ArrayList<Product> selectProductList() {
		return dao.selectProductList(sqlSession);
	}

	@Override
	public int addLike(ProductLike like) {
		return dao.addLike(sqlSession, like);
	}

	@Override
	public Product selectProduct(int productNo) {
		return dao.selectProduct(sqlSession, productNo);
	}

	@Override
	public String getPrice(int optionNo) {
		return dao.getPrice(sqlSession, optionNo);
	}

	@Override
	public ArrayList<String> getImages(int productNo) {
		return dao.getImages(sqlSession, productNo);
	}

	@Override
	public Brand getBrand(int productNo) {
		return dao.getBrand(sqlSession, productNo);
	}

	@Override
	public ProductReview getRate(int productNo) {
		return dao.getRate(sqlSession, productNo);
	}

	@Override
	public ArrayList<ProductReview> reviewList(int productNo) {
		return dao.reviewList(sqlSession, productNo);
	}
	public ArrayList<ProductLike> getLikes(int userNo) {
		return dao.getLikes(sqlSession, userNo);
	}

	@Override
	public String checkLike(ProductLike like) {
		return dao.checkLike(sqlSession, like)!=null? "Y":"N";
	}

	@Override
	public int removeLike(ProductLike like) {
		return dao.removeLike(sqlSession, like);
	}

	@Override
	public ArrayList<Cart> selectCartItems(int userNo) {
		return dao.selectCartItems(sqlSession, userNo);
	}

}
