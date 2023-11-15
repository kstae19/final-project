package com.kh.eco.product.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.eco.product.model.vo.Brand;
import com.kh.eco.product.model.vo.Product;
import com.kh.eco.product.model.vo.ProductReview;

@Repository
public class ProductDao {
		
	public ArrayList<Product> selectProductList(SqlSession sqlSession){
		return (ArrayList)sqlSession.selectList("productMapper.selectProductList");
	}
	public int addLike(SqlSession sqlSession, HashMap like) {
		return sqlSession.insert("productMapper.addLike", like);
	}
	public Product selectProduct(SqlSession sqlSession, int productNo) {
		return sqlSession.selectOne("productMapper.selectProduct", productNo);
	}
	public String getPrice(SqlSession sqlSession, int optionNo) {
		return sqlSession.selectOne("productMapper.getPrice", optionNo);
	}
	public ArrayList<String> getImages(SqlSessionTemplate sqlSession, int productNo) {
		return (ArrayList)sqlSession.selectList("productMapper.getImages", productNo);
	}
	public Brand getBrand(SqlSessionTemplate sqlSession, int productNo) {
		return sqlSession.selectOne("productMapper.getBrand", productNo);
	}
	public ProductReview getRate(SqlSessionTemplate sqlSession, int productNo) {
		return sqlSession.selectOne("productMapper.getRate", productNo);
	}
	public ArrayList<ProductReview> reviewList(SqlSessionTemplate sqlSession, int productNo) {
		return (ArrayList)sqlSession.selectList("productMapper.reviewList", productNo);
	}

}
