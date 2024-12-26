package com.shinhan.auth;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.shinhan.VO.MembersDTO;

@Repository
public class AuthInfoUpdateDAO {
	
	private SqlSession sqlSession;
	
	 private static final String namespace = "com.shinhan.member";
	
	// 로그인 ID로 회원 조회
    public MembersDTO getMemberById(Integer memberId) {
        return sqlSession.selectOne(namespace + ".selectMemberByLoginid", memberId);
    }
	
	//회원 정보 업데이트
	public int updateMemberInfo(MembersDTO member) {
		return sqlSession.update(namespace + ".updateMember", member);
	}
	
	// 회원 삭제
    public int deleteMember(Integer memberId) {
        return sqlSession.delete(namespace + ".deleteMemberByid", memberId);
    }

    // 비밀번호 확인
    public String getPasswordById(Integer memberId) {
        return sqlSession.selectOne(namespace + ".getPasswordById", memberId);
    }
	
}
