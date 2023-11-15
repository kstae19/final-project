package com.kh.eco.user.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.eco.user.model.dao.UserDao;
import com.kh.eco.user.model.vo.User;

@Service
public class UserServiceImpl implements UserService{
	
	@Autowired
	private UserDao userDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public User loginUser(User u) {
		System.out.println(userDao.loginUser(sqlSession, u));
		return userDao.loginUser(sqlSession, u);
	}
}
