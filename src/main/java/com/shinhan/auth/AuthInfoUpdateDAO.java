package com.shinhan.auth;

import java.util.HashMap;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shinhan.VO.MembersDTO;

@Repository
public class AuthInfoUpdateDAO {

	@Autowired
	private SqlSession sqlSession;

	private static final String namespace = "com.shinhan.member";

	public MembersDTO getMemberById(Integer memberId) {
		return sqlSession.selectOne(namespace + ".selectMemberInfo", memberId);
	}

	public int updateMemberInfo(MembersDTO member) {
		return sqlSession.update(namespace + ".updateMember", member);
	}

	public int deleteMember(Integer memberId) {
		return sqlSession.delete(namespace + ".deleteMemberByid", memberId);
	}

	public MembersDTO checkPassword(Integer memberId, String memberPassword) {
		Map<String, Object> params = new HashMap<>();
		params.put("memberId", memberId);
		params.put("memberPassword", memberPassword);
		System.out.println("Params for MyBatis query: " + params);
		return sqlSession.selectOne(namespace + ".checkPassword", params);
	}
	

}