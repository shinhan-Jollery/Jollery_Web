package com.shinhan.auth;

import org.apache.ibatis.session.SqlSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shinhan.VO.MembersDTO;
@Repository
public class AuthMemberDAO {
    @Autowired
    private SqlSession sqlSession;
	/*
	 * public MembersDTO findMemberById(int id) { return
	 * sqlSession.selectOne("MemberMapper.findMemberById", id); }
	 */
    public MembersDTO getMemberByLoginId(String member_login_ID) {
        return sqlSession.selectOne("com.shinhan.member.selectMemberById", member_login_ID);
    }
}
