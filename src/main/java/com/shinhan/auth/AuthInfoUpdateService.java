package com.shinhan.auth;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shinhan.VO.MembersDTO;

@Service
public class AuthInfoUpdateService {
	@Autowired
	private AuthInfoUpdateDAO authInfoUpdateDAO;
	
	// ȸ�� ���� ��ȸ
    public MembersDTO getMemberInfo(Integer memberId) {
        return authInfoUpdateDAO.getMemberById(memberId);
    }
	
	// ȸ�� ���� ������Ʈ
    public boolean updateMemberInfo(MembersDTO member) {
        return authInfoUpdateDAO.updateMemberInfo(member) > 0;
    }

    // ȸ�� ����
    public boolean deleteMember(Integer memberId) {
        return authInfoUpdateDAO.deleteMember(memberId) > 0;
    }

    // ��й�ȣ Ȯ��
    public boolean checkPassword(Integer memberId, String password) {
        String savedPassword = authInfoUpdateDAO.getPasswordById(memberId);
        return savedPassword != null && savedPassword.equals(password);
    }

}
