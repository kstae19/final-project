package com.kh.eco.product.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.eco.product.model.dao.ProductDao;
import com.kh.eco.product.model.vo.Product;

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
	public int addLike(HashMap like) {
		return dao.addLike(sqlSession, like);
	}

	@Override
	public Product selectProduct(int productNo) {
		return dao.selectProduct(sqlSession, productNo);
	}

}
