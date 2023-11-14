package com.kh.eco.product.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.eco.product.model.vo.Product;

@Repository
public class ProductDao {
		
	public ArrayList<Product> selectProductList(SqlSession sqlSession){
		return (ArrayList)sqlSession.selectList("productMapper.selectProductList");
	}
	public int addLike(SqlSession sqlSession, HashMap like) {
		return sqlSession.insert("productMapper.addLike", like);
	}

}
