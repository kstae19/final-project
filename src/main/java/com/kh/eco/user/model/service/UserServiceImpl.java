package com.kh.eco.user.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.eco.user.model.dao.UserDao;
import com.kh.eco.user.model.vo.Cert;
import com.kh.eco.user.model.vo.User;

@Service
public class UserServiceImpl implements UserService{
	
	@Autowired
	private UserDao userDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public User loginUser(User u) {
		return userDao.loginUser(sqlSession, u);
	}

	@Override
	public int idCheck(String checkId) {
		return userDao.idCheck(sqlSession, checkId);
	}

	@Override
	public int sendMail(Cert cert) {
		return userDao.insertSecret(sqlSession, cert);
	}

	@Override
	public int vaildate(Cert cert) {
		boolean result = userDao.vaildate(sqlSession, cert);
		/*if(result == true) {
			userDao.deleteCert(sqlSession, cert);
		}*/
		return result == true ? 1 : 0;
	}

	@Override
	public int insertMember(User u) {
		int result = userDao.insertMember(sqlSession, u);

		return result;
	}
}
