package com.shinhan.auth;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shinhan.VO.MembersDTO;
@Repository 
public class AuthSignUpDAO {
    @Autowired
    private SqlSession sqlSession;

	/*
	 * public MembersDTO findMemberById(int id) { return
	 * sqlSession.selectOne("MemberMapper.findMemberById", id); }
	 */

    public int insertMember(MembersDTO member) {
        return sqlSession.insert("com.shinhan.member.insertMember", member);
    }
}
