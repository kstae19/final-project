package com.kh.eco.user.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.eco.user.model.vo.Cert;
import com.kh.eco.user.model.vo.KakaoUser;
import com.kh.eco.user.model.vo.User;

@Repository
public class UserDao {

	public User loginUser(SqlSessionTemplate sqlSession, User u) {
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

	public int insertMember(SqlSessionTemplate sqlSession, User u) {
		return sqlSession.insert("userMapper.insertMember", u);
	}

	public int selectKakao(SqlSessionTemplate sqlSession, String id) {
		return sqlSession.selectOne("userMapper.selectKakao", id);
	}

	public int insertKakao(SqlSessionTemplate sqlSession, KakaoUser ku) {
		return sqlSession.insert("userMapper.insertKakao", ku);
	}

	public int nameCheck(SqlSessionTemplate sqlSession, User u) {
		return sqlSession.selectOne("userMapper.nameCheck", u);
	}

	public int nameIdCheck(SqlSessionTemplate sqlSession, User u) {
		return sqlSession.selectOne("userMapper.nameIdCheck", u);
	}
	
	public String findId(SqlSessionTemplate sqlSession, User u) {
		return sqlSession.selectOne("userMapper.findId", u);
	}

	public int findPwd(SqlSessionTemplate sqlSession, User u) {
		return sqlSession.update("userMapper.findPwd", u);
	}



}
