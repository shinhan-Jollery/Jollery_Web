package com.shinhan.auth;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shinhan.VO.MembersDTO;

@Service
public class AuthInfoUpdateService {
	@Autowired
	private AuthInfoUpdateDAO authInfoUpdateDAO;
	
	// 회원 정보 조회
    public MembersDTO getMemberInfo(Integer memberId) {
        return authInfoUpdateDAO.getMemberById(memberId);
    }
	
	// 회원 정보 업데이트
    public boolean updateMemberInfo(MembersDTO member) {
        return authInfoUpdateDAO.updateMemberInfo(member) > 0;
    }

    // 회원 삭제
    public boolean deleteMember(Integer memberId) {
        return authInfoUpdateDAO.deleteMember(memberId) > 0;
    }

    // 비밀번호 확인
    public boolean checkPassword(Integer memberId, String password) {
        String savedPassword = authInfoUpdateDAO.getPasswordById(memberId);
        return savedPassword != null && savedPassword.equals(password);
    }

}
