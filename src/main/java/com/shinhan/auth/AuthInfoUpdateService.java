package com.shinhan.auth;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shinhan.VO.MembersDTO;

@Service
public class AuthInfoUpdateService {
	@Autowired
	private AuthInfoUpdateDAO authInfoUpdateDAO;

	public MembersDTO getMemberInfo(Integer memberId) {
		return authInfoUpdateDAO.getMemberById(memberId);
	}

	public boolean updateMemberInfo(MembersDTO member) {
		return authInfoUpdateDAO.updateMemberInfo(member) > 0;
	}

	public boolean deleteMember(Integer memberId) {
		return authInfoUpdateDAO.deleteMember(memberId) > 0;
	}

	public MembersDTO checkPassword(Integer memberId, String memberPassword) {
		System.out.println("checkPassword - memberId: " + memberId + ", password: " + memberPassword);

		MembersDTO result = authInfoUpdateDAO.checkPassword(memberId, memberPassword);

		System.out.println("Password check result from DAO: " + result);
		return result;
	}

}