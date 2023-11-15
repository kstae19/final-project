package com.kh.eco.user.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.eco.user.model.vo.Cert;
import com.kh.eco.user.model.vo.User;

@Repository
public class UserDao {

	public User loginUser(SqlSessionTemplate sqlSession, User u) {
		User user = sqlSession.selectOne("userMapper.loginUser", u);
		System.out.println(user);
		return sqlSession.selectOne("userMapper.loginUser", u);
	}

	public int idCheck(SqlSessionTemplate sqlSession, String checkId) {
		return sqlSession.selectOne("userMapper.idCheck", checkId);
	}

	public int insertSecret(SqlSessionTemplate sqlSession, Cert cert) {
		return sqlSession.insert("userMapper.insertSecret", cert);
	}

	public boolean vaildate(SqlSessionTemplate sqlSession, Cert cert) {
		Cert result = sqlSession.selectOne("userMapper.vaildate", cert);
		return result != null;
	}

	public void deleteCert(SqlSessionTemplate sqlSession, Cert cert) {
		sqlSession.delete("userMapper.deleteCert", cert);
	}

}
