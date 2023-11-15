package com.kh.eco.user.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.eco.user.model.vo.User;

@Repository
public class UserDao {

	public User loginUser(SqlSessionTemplate sqlSession, User u) {
		User user = sqlSession.selectOne("userMapper.loginUser", u);
		System.out.println(user);
		return sqlSession.selectOne("userMapper.loginUser", u);
	}

}
