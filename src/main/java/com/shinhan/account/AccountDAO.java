package com.shinhan.account;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shinhan.VO.AccountsDTO;

@Repository
public class AccountDAO {

	@Autowired
	private SqlSession sqlSession;
	
	private static final String namespace = "com.shinhan.account";

	public AccountsDTO findByMemberId(Integer memberId) {
		try{
			return sqlSession.selectOne(namespace + ".findByMemberId", memberId);
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public int insertAccount(AccountsDTO account) {
		return sqlSession.insert(namespace + ".insertAccount", account);
	}
	
	public int updateAccount(AccountsDTO account) {
		return sqlSession.update(namespace + ".updateAccount", account);
	}
	
	public int deleteAccount(Integer memberId) {
		return sqlSession.delete(namespace + ".deleteAccount", memberId);
	}
}
