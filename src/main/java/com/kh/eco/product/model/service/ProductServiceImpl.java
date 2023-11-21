package com.kh.eco.product.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.eco.product.model.dao.ProductDao;
import com.kh.eco.product.model.vo.Brand;
import com.kh.eco.product.model.vo.Cart;
import com.kh.eco.product.model.vo.Order;
import com.kh.eco.product.model.vo.OrderItem;
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

	@Override
	public int updateQty(Cart cart) {
		return dao.updateQty(sqlSession, cart);
	}

	@Override
	public int addCart(Cart cart) {
		return dao.addCart(sqlSession, cart);
	}

	@Override
	public String checkCart(Cart cart) {
		return dao.checkCart(sqlSession, cart);
	}

	@Override
	public int removeItem(Cart cart) {
		return dao.removeItem(sqlSession, cart);
	}

	@Override
	public Cart getCartItem(int optionNo) {
		return dao.getCartItem(sqlSession, optionNo);
	}

	@Override
	public int orderProduct(Order order) {
		int orderResult = dao.insertOrder(sqlSession, order);
		int itemResult =1;
		int cartResult = 1;
		System.out.println("주문 넣기 : " +orderResult);
		if(orderResult>0) {
			//itemResult = dao.insertOrderItems(sqlSession, order);
			for(int i=0; i< order.getItems().size(); i++) {
				itemResult *= dao.insertOrderItem(sqlSession, order.getItems().get(i));
			}
			System.out.println("주문에 아이템 추가하기 : " + itemResult);
			if(itemResult>0) {
				for(OrderItem item : order.getItems()) {
					Cart cart = new Cart();
					cart.setUserNo(order.getUserNo());
					cart.setOptionNo(item.getOptionNo());
					if(checkCart(cart)!=null) {
						cartResult *= removeItem(cart);
						System.out.println("카트 삭제하기 : "+ cartResult);					
					}
					
				}
			}
		}
		return orderResult*itemResult*cartResult;
	}

}
