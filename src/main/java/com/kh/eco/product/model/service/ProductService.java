package com.kh.eco.product.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.stereotype.Service;

import com.kh.eco.product.model.vo.Product;

@Service
public interface ProductService {
	ArrayList<Product> selectProductList();
	int addLike(HashMap like);
	Product selectProduct(int productNo);

}
