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
    public MembersDTO selectMemberById(String userid) {
        try {
            // db 가자
            MembersDTO member = sqlSession.selectOne("com.shinhan.member.selectMemberById", userid);
            // id 없으면 null
            if (member == null) {
            	MembersDTO member1 = new MembersDTO();
            	member1.setMember_is_artist("아이디가 올바르지 않습니다");
                System.out.println("사용자를 찾을 수 없습니다");
                return member1;
            }
            return member;
        } catch (Exception e) {
            System.err.println("사용자 조회 중 오류 발생: " + e.getMessage());
            e.printStackTrace();
            return null;
        }
    }
}
