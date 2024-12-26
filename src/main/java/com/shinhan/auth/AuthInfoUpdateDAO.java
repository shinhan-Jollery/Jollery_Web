package com.shinhan.auth;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.shinhan.VO.MembersDTO;

@Repository
public class AuthInfoUpdateDAO {
	
	private SqlSession sqlSession;
	
	 private static final String namespace = "com.shinhan.member";
	
	// �α��� ID�� ȸ�� ��ȸ
    public MembersDTO getMemberById(Integer memberId) {
        return sqlSession.selectOne(namespace + ".selectMemberByLoginid", memberId);
    }
	
	//ȸ�� ���� ������Ʈ
	public int updateMemberInfo(MembersDTO member) {
		return sqlSession.update(namespace + ".updateMember", member);
	}
	
	// ȸ�� ����
    public int deleteMember(Integer memberId) {
        return sqlSession.delete(namespace + ".deleteMemberByid", memberId);
    }

    // ��й�ȣ Ȯ��
    public String getPasswordById(Integer memberId) {
        return sqlSession.selectOne(namespace + ".getPasswordById", memberId);
    }
	
}
