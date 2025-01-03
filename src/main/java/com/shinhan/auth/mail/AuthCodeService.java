package com.shinhan.auth.mail;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shinhan.VO.AuthCodeDTO;

@Service
public class AuthCodeService {
	@Autowired
	AuthCodeDAO authCodeDAO;
	
	public boolean insertAuthCode(AuthCodeDTO authcode) {
		int result = authCodeDAO.insertAuthCode(authcode);
		return result > 0; 
	}
	
	public AuthCodeDTO selectByAuth_Method(String method) {
		AuthCodeDTO authCode = authCodeDAO.selectByAuth_Method(method);
		return authCode;
	}

}
