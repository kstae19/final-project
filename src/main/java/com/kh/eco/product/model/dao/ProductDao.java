package com.kh.eco.product.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.eco.product.model.vo.Brand;
import com.kh.eco.product.model.vo.Cart;
import com.kh.eco.product.model.vo.Order;
import com.kh.eco.product.model.vo.OrderItem;
import com.kh.eco.product.model.vo.Product;
import com.kh.eco.product.model.vo.ProductLike;
import com.kh.eco.product.model.vo.ProductReview;

@Repository
public class ProductDao {
		
	public ArrayList<Product> selectProductList(SqlSession sqlSession){
		return (ArrayList)sqlSession.selectList("productMapper.selectProductList");
	}
	public int addLike(SqlSession sqlSession, ProductLike like) {
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
	public ArrayList<ProductLike> getLikes(SqlSessionTemplate sqlSession, int userNo) {
		return (ArrayList)sqlSession.selectList("productMapper.getLikes", userNo);
	}
	//좋아요 되어있는 상품인지 확인
	public String checkLike(SqlSessionTemplate sqlSession, ProductLike like) {
		return sqlSession.selectOne("productMapper.checkLike", like);
	}
	public int removeLike(SqlSessionTemplate sqlSession, ProductLike like) {
		return sqlSession.delete("productMapper.removeLike", like);
	}
	public ArrayList<Cart> selectCartItems(SqlSessionTemplate sqlSession, int userNo){
		return (ArrayList)sqlSession.selectList("productMapper.selectCartItems", userNo);
	}
	public int updateQty(SqlSessionTemplate sqlSession, Cart cart) {
		return sqlSession.update("productMapper.updateQty", cart);
	}
	public int addCart(SqlSessionTemplate sqlSession, Cart cart) {
		return sqlSession.insert("productMapper.addCart", cart);
	}
	public String checkCart(SqlSessionTemplate sqlSession, Cart cart) {
		return sqlSession.selectOne("productMapper.checkCart", cart);
	}
	public int removeItem(SqlSessionTemplate sqlSession, Cart cart) {
		return sqlSession.delete("productMapper.removeItem", cart);
	}
	public Cart getCartItem(SqlSessionTemplate sqlSession, int optionNo) {
		return sqlSession.selectOne("productMapper.getCartItem", optionNo);
	}
	public int insertOrder(SqlSessionTemplate sqlSession, Order order) {
		return sqlSession.insert("productMapper.insertOrder", order);
	}
	public int insertOrderItem(SqlSessionTemplate sqlSession, Order order) {
		return sqlSession.insert("productMapper.insertOrderItem", order);
	}
	public int insertOrderItem(SqlSessionTemplate sqlSession, OrderItem item) {
		return sqlSession.insert("productMapper.insertOrderItems", item);
	}
//	public int insertOrderItems(SqlSessionTemplate sqlSession, Order order) {
//		return sqlSession.insert("productMapper.insertOrderItems", order);
//	}

}
